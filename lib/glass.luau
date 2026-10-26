-- glass.luau
-- Glassmorphism panels for Roblox that hold up at every graphics level.
--
--   local Glass = loadstring(game:HttpGet("https://raw.githubusercontent.com/whodunitwww/wraith-hub/main/lib/glass.luau"))()
--   local panel = Glass.new({ Parent = screenGui, Size = UDim2.fromOffset(360, 240) })
--   label.Parent = panel.Content
--   panel:SetVisible(false) -- fades out; true fades back in
--   panel:Destroy()
--
-- Layers, bottom to top:
--   Shadow    soft and faint, outside the edge only, heavier underneath
--   Backdrop  Graphics 8+: real blur of the 3D world behind the panel, from Glass-material
--             shapes stuck to the camera plus a DepthOfFieldEffect (the trick Fluent uses).
--             Roblox doesn't render that below 8, so there the panel paints a fake blur
--             instead: it raycasts a grid through itself, shades each hit (sun, shadows,
--             ambient, fog, atmosphere, colour correction) and draws the colours as a smooth
--             field - which is what a heavy blur looks like. On Automatic graphics, where a
--             normal script can't tell which it'll get, it does both.
--   Tint      theme colour; thicker over bright scenes so text stays readable
--   Surface   a fixed sheen, a soft glow under the cursor while it's over the panel, and film grain
--   Edge      top highlight and a border lit from above, turning toward the cursor over the panel
--   Content   your UI
--
-- GUI behind the panel is never blurred: Roblox has no way to do that.

local AssetService = game:GetService("AssetService")
local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local Glass = {}

-- Glass + DepthOfField only blurs from engine level 16 (of 21) up, which is 8 on the menu slider.
local ACRYLIC_MIN_LEVEL = 16
local ACRYLIC_MIN_SLIDER = 8
-- How far in front of the camera the blur shapes sit; anything nearer would draw over them.
local PLANE_DISTANCE = 0.001

local GRAIN_IMAGE = "rbxassetid://9968344227"

-- Fake blur: a SAMPLE_COLUMNS x SAMPLE_ROWS grid of cells, each the average of rays spread
-- evenly over it in a fixed 3x3 pattern, so it's a box blur of what's behind. A pass only
-- re-traces RAYS_PER_PASS of each cell's rays and keeps the rest, so the picture holds perfectly
-- still when nothing moves and catches up within a few passes when something does.
local SAMPLE_COLUMNS = 7
local SAMPLE_ROWS = 5
local FIELD_SIZE = Vector2.new(SAMPLE_COLUMNS, SAMPLE_ROWS)
local RAYS_PER_PASS = 3
local BACKDROP_STRIPS = 40 -- only without EditableImage
local SAMPLE_RATE = 20
local IDLE_SAMPLE_RATE = 4 -- real blur showing: only sampled to judge how bright the scene is
local MAX_RAY = 2000

-- Offsets inside a cell, in an order that keeps consecutive passes spread out.
local SUBSAMPLES = {}
for _, k in ipairs({ 4, 0, 8, 2, 6, 1, 7, 3, 5 }) do
	table.insert(SUBSAMPLES, Vector2.new((k % 3 + 0.5) / 3 - 0.5, (k // 3 + 0.5) / 3 - 0.5))
end
local MAX_LAYERS = 6 -- see-through surfaces a ray looks past

local SHADOW_RINGS = 12 -- only without EditableImage
local SHADOW_SPREAD = 24
local GLOW_RINGS = 8
-- Where the light rests: above the top-left, as a direction in half-sizes of the panel from its centre.
local REST_LIGHT = Vector2.new(-0.45, -1)
local GLOW_ALPHA = 0.05
local GLOW_SIZE = 0.9 -- of the panel's shorter side
local SCREEN_BLUR_SIZE = 10
local HYBRID_FIELD = 0.55

local LUMA = Vector3.new(0.2126, 0.7152, 0.0722)
-- Roblox's default sky, measured off a Baseplate at 2pm.
local SKY_HORIZON = Vector3.new(0.75, 0.84, 0.9)
local SKY_ZENITH = Vector3.new(0.36, 0.6, 0.84)
local SKY_NIGHT = Vector3.new(0.04, 0.06, 0.12)
local SUN_GLARE = Vector3.new(1, 0.97, 0.9)
local SUNSET_LIGHT = Vector3.new(1, 0.82, 0.62)
local MOON_LIGHT = Vector3.new(0.7, 0.8, 1)

export type Theme = {
	Tint: Color3,
	TintAlpha: number,
	Grain: number,
	GrainColor: Color3,
	Shadow: number,
	Text: Color3,
	SubText: Color3,
}

Glass.Themes = {
	Dark = {
		Tint = Color3.fromRGB(14, 14, 20),
		TintAlpha = 0.34,
		Grain = 0.05,
		GrainColor = Color3.new(1, 1, 1),
		Shadow = 0.22,
		Text = Color3.fromRGB(240, 240, 245),
		SubText = Color3.fromRGB(175, 175, 190),
	} :: Theme,
	Light = {
		Tint = Color3.fromRGB(250, 250, 253),
		TintAlpha = 0.4,
		Grain = 0.05,
		GrainColor = Color3.new(0, 0, 0),
		Shadow = 0.12,
		Text = Color3.fromRGB(20, 20, 28),
		SubText = Color3.fromRGB(70, 70, 85),
	} :: Theme,
	-- Dark with a faint violet cast, for Wraith Hub.
	Wraith = {
		Tint = Color3.fromRGB(16, 13, 28),
		TintAlpha = 0.4,
		Grain = 0.05,
		GrainColor = Color3.new(1, 1, 1),
		Shadow = 0.24,
		Text = Color3.fromRGB(244, 244, 248),
		SubText = Color3.fromRGB(166, 166, 182),
	} :: Theme,
}

export type Tier = "Acrylic" | "Hybrid" | "Fallback"

export type Options = {
	Parent: Instance?,
	Size: UDim2?,
	Position: UDim2?,
	AnchorPoint: Vector2?,
	CornerRadius: number?,
	Theme: string?,
	BlurStrength: number?, -- 0-1, real blur only
	ScreenBlur: boolean?, -- below graphics 8, also blur the whole 3D view while shown (for modals)
}

-- Helpers -------------------------------------------------------------------

local function create(className: string, props: { [string]: any }, children: { Instance }?): any
	local instance = Instance.new(className)
	for key, value in pairs(props) do
		if key ~= "Parent" then
			instance[key] = value
		end
	end
	for _, child in ipairs(children or {}) do
		child.Parent = instance
	end
	instance.Parent = props.Parent
	return instance
end

local function corner(radius: number): UICorner
	return create("UICorner", { CornerRadius = UDim.new(0, radius) })
end

local function approach(current: number, target: number, speed: number, dt: number): number
	return current + (target - current) * (1 - math.exp(-speed * dt))
end

local function smoothstep(edge0: number, edge1: number, x: number): number
	local t = math.clamp((x - edge0) / (edge1 - edge0), 0, 1)
	return t * t * (3 - 2 * t)
end

local function vec(color: Color3): Vector3
	return Vector3.new(color.R, color.G, color.B)
end

-- Transparency for each of `layers` stacked copies so they add up to `alpha` where all overlap.
local function layerTransparency(alpha: number, layers: number): number
	return (1 - math.clamp(alpha, 0, 1)) ^ (1 / layers)
end

-- Not every game or client allows EditableImage, so this returns nil when it can't make one.
local function editableImage(size: Vector2, write: (buffer) -> ()): (any?, any?)
	local ok, image, content = pcall(function()
		local image = AssetService:CreateEditableImage({ Size = size })
		local pixels = buffer.create(size.X * size.Y * 4)
		write(pixels)
		image:WritePixelsBuffer(Vector2.zero, size, pixels)
		return image, Content.fromObject(image)
	end)
	if ok and image then
		return image, content
	end
	return nil, nil
end

local glowImage, glowContent
local function glowTexture(): any?
	if glowImage == nil then
		local size = 64
		glowImage, glowContent = editableImage(Vector2.new(size, size), function(pixels)
			for y = 0, size - 1 do
				for x = 0, size - 1 do
					local dx, dy = (x + 0.5) / size * 2 - 1, (y + 0.5) / size * 2 - 1
					local alpha = (1 - math.min(dx * dx + dy * dy, 1)) ^ 2
					local i = (y * size + x) * 4
					buffer.writeu8(pixels, i, 255)
					buffer.writeu8(pixels, i + 1, 255)
					buffer.writeu8(pixels, i + 2, 255)
					buffer.writeu8(pixels, i + 3, math.floor(alpha * 255 + 0.5))
				end
			end
		end)
		glowImage = glowImage or false
	end
	return glowContent
end

-- A rounded rectangle's shadow as a 9-slice image, sliced at the returned pixel. It's clear
-- inside the shape (the panel is see-through, so nothing dark may sit under it), fades to
-- nothing SHADOW_SPREAD px out, and is lighter along the top than the bottom.
local shadowTextures = {}
local function shadowTexture(radius: number): (any?, number)
	local r = math.floor(radius + 0.5)
	local sliceAt = SHADOW_SPREAD + r
	if shadowTextures[r] == nil then
		local n = sliceAt * 2 + 2
		local image, content = editableImage(Vector2.new(n, n), function(pixels)
			for y = 0, n - 1 do
				for x = 0, n - 1 do
					-- Signed distance to a rounded square, 2r + 2 wide, in the middle.
					local qx = math.abs(x + 0.5 - n / 2) - 1
					local qy = math.abs(y + 0.5 - n / 2) - 1
					local d = Vector2.new(math.max(qx, 0), math.max(qy, 0)).Magnitude + math.min(math.max(qx, qy), 0) - r
					local fade = (1 - math.clamp(d / SHADOW_SPREAD, 0, 1)) ^ 2.5
					local edge = math.clamp(d + 0.5, 0, 1) -- antialiased, and nothing inside
					local weight = 0.5 + 0.5 * y / (n - 1)
					buffer.writeu8(pixels, (y * n + x) * 4 + 3, math.floor(fade * edge * weight * 255 + 0.5))
				end
			end
		end)
		shadowTextures[r] = if image then { image = image, content = content } else false
	end
	local texture = shadowTextures[r]
	return if texture then texture.content else nil, sliceAt
end

-- Graphics level ------------------------------------------------------------

-- Executors can read the engine's level directly; normal scripts only get the menu slider,
-- which says nothing when it's on Automatic.
function Glass.getTier(): Tier
	local ok, level = pcall(function()
		return settings().Rendering.QualityLevel
	end)
	if ok and level ~= Enum.QualityLevel.Automatic then
		return if level.Value >= ACRYLIC_MIN_LEVEL then "Acrylic" else "Fallback"
	end
	local slider = UserSettings().GameSettings.SavedQualityLevel.Value -- 0 = Automatic
	if slider == 0 then
		return "Hybrid"
	end
	return if slider >= ACRYLIC_MIN_SLIDER then "Acrylic" else "Fallback"
end

-- Fake blur: colour of the world along a ray ---------------------------------

type Grade = { brightness: number, contrast: number, saturation: number, tint: Vector3 }

type Environment = {
	sun: Vector3,
	light: Vector3,
	lightColor: Vector3,
	ambient: Vector3,
	day: number,
	shadows: boolean,
	exposure: number,
	fogStart: number,
	fogEnd: number,
	fogColor: Vector3,
	haze: number,
	hazeColor: Vector3,
	horizon: Vector3,
	zenith: Vector3,
	clouds: number,
	grades: { Grade },
}

local rayParams = RaycastParams.new()
rayParams.FilterType = Enum.RaycastFilterType.Exclude
local shadowParams = RaycastParams.new()
shadowParams.FilterType = Enum.RaycastFilterType.Exclude
shadowParams.IgnoreWater = true

local function readEnvironment(camera: Camera): Environment
	local sun = Lighting:GetSunDirection()
	local day = smoothstep(-0.1, 0.2, sun.Y)
	local atmosphere = Lighting:FindFirstChildOfClass("Atmosphere")
	local clouds = workspace.Terrain:FindFirstChildOfClass("Clouds")

	local grades = {}
	for _, parent in ipairs({ Lighting, camera }) do
		for _, effect in ipairs(parent:GetChildren()) do
			if effect:IsA("ColorCorrectionEffect") and effect.Enabled then
				table.insert(grades, {
					brightness = effect.Brightness,
					contrast = effect.Contrast,
					saturation = effect.Saturation,
					tint = vec(effect.TintColor),
				})
			end
		end
	end

	local horizon, zenith = SKY_HORIZON, SKY_ZENITH
	if atmosphere then
		horizon = horizon:Lerp(vec(atmosphere.Color), 0.7)
		zenith = zenith:Lerp(vec(atmosphere.Color), 0.3)
	end

	-- Fitted on the Baseplate: sunlit plastic renders at ~1.05x its colour, shaded at ~0.6x.
	local strength = 0.275 * Lighting.Brightness * (0.15 + 0.85 * day)
	local tone = if sun.Y > -0.05 then SUNSET_LIGHT:Lerp(Vector3.one, smoothstep(0, 0.35, sun.Y)) else MOON_LIGHT
	return {
		sun = sun,
		light = if sun.Y > -0.05 then sun else Lighting:GetMoonDirection(),
		lightColor = tone * strength,
		ambient = vec(Lighting.Ambient) * 0.35 + vec(Lighting.OutdoorAmbient) * 0.85,
		day = day,
		shadows = Lighting.GlobalShadows,
		exposure = 2 ^ Lighting.ExposureCompensation,
		fogStart = Lighting.FogStart,
		fogEnd = Lighting.FogEnd,
		fogColor = vec(Lighting.FogColor),
		haze = if atmosphere then atmosphere.Density else 0,
		hazeColor = if atmosphere then vec(atmosphere.Color) else SKY_HORIZON,
		horizon = horizon,
		zenith = zenith,
		clouds = if clouds and clouds.Enabled then clouds.Cover else 0,
		grades = grades,
	}
end

local function skyColor(env: Environment, direction: Vector3): Vector3
	local up = math.clamp(direction.Y, 0, 1)
	local color = env.horizon:Lerp(env.zenith, up ^ 0.6)
	color = color:Lerp(Vector3.one * 0.9, env.clouds * 0.5)
	color = SKY_NIGHT:Lerp(color, env.day)
	local glare = math.max(direction:Dot(env.sun), 0) ^ 24 * env.day
	color = color:Lerp(SUN_GLARE, glare * 0.8)
	if env.fogEnd < 5000 then
		color = color:Lerp(env.fogColor, math.clamp(1 - up * 4, 0, 1) * 0.9)
	end
	return color
end

-- Base colour, how see-through it is, and whether it glows (and so skips lighting).
local function surface(result: RaycastResult): (Vector3, number, boolean)
	local hit = result.Instance
	local terrain = workspace.Terrain
	if hit == terrain then
		if result.Material == Enum.Material.Water then
			return vec(terrain.WaterColor), terrain.WaterTransparency, false
		end
		local ok, color = pcall(terrain.GetMaterialColor, terrain, result.Material)
		return if ok then vec(color) else Vector3.new(0.4, 0.45, 0.3), 0, false
	end
	if not hit:IsA("BasePart") then
		return Vector3.one * 0.5, 0, false
	end
	local transparency = 1 - (1 - hit.Transparency) * (1 - hit.LocalTransparencyModifier)
	local color = vec(hit.Color)
	if hit.Material == Enum.Material.Neon then
		return color, transparency, true
	elseif hit.Material == Enum.Material.ForceField then
		return color, math.max(transparency, 0.85), true
	end
	-- Textures multiply the colour by an image we can't read; assume they darken it a bit.
	if (hit:IsA("MeshPart") and hit.TextureID ~= "") or hit:FindFirstChildOfClass("SurfaceAppearance") then
		color *= 0.75
	end
	return color, transparency, false
end

local function shade(env: Environment, albedo: Vector3, position: Vector3, normal: Vector3): Vector3
	local diffuse = math.max(normal:Dot(env.light), 0)
	if diffuse > 0 and env.shadows then
		local blocker = workspace:Raycast(position + normal * 0.05, env.light * 400, shadowParams)
		local part = blocker and blocker.Instance
		if part and part:IsA("BasePart") and part.CastShadow and part.Transparency < 0.5 then
			diffuse = 0
		end
	end
	return albedo * (env.ambient + env.lightColor * diffuse) * env.exposure
end

local function haze(env: Environment, color: Vector3, distance: number): Vector3
	if env.fogEnd > env.fogStart then
		color = color:Lerp(env.fogColor, math.clamp((distance - env.fogStart) / (env.fogEnd - env.fogStart), 0, 1))
	end
	if env.haze > 0 then
		color = color:Lerp(env.hazeColor, (1 - math.exp(-distance * env.haze * 0.0035)) * 0.85)
	end
	return color
end

-- Approximates ColorCorrectionEffects so the fake blur matches the game's colour grading.
local function grade(env: Environment, color: Vector3): Vector3
	for _, g in ipairs(env.grades) do
		color += Vector3.one * g.brightness
		color = (color - Vector3.one * 0.5) * (1 + g.contrast) + Vector3.one * 0.5
		local luma = color:Dot(LUMA)
		color = Vector3.one * luma + (color - Vector3.one * luma) * (1 + g.saturation)
		color *= g.tint
	end
	return Vector3.new(math.clamp(color.X, 0, 1), math.clamp(color.Y, 0, 1), math.clamp(color.Z, 0, 1))
end

local function trace(env: Environment, origin: Vector3, direction: Vector3): Vector3
	local color = Vector3.zero
	local weight = 1
	local travelled = 0
	for _ = 1, MAX_LAYERS do
		local result = workspace:Raycast(origin, direction * (MAX_RAY - travelled), rayParams)
		if not result then
			break
		end
		travelled += result.Distance
		local albedo, transparency, glows = surface(result)
		local lit = if glows then albedo else shade(env, albedo, result.Position, result.Normal)
		color += haze(env, lit, travelled) * weight * (1 - transparency)
		weight *= transparency
		if weight < 0.05 then
			return grade(env, color)
		end
		origin = result.Position + direction * 0.02
	end
	return grade(env, color + skyColor(env, direction) * weight)
end

-- Shared effects --------------------------------------------------------------

local Panel = {}
Panel.__index = Panel

local panels = {}
local shared = {
	tier = Glass.getTier() :: Tier,
	preferredTransparency = 1,
	reducedMotion = false,
	pollClock = 0,
	depthOfField = nil :: DepthOfFieldEffect?,
	screenBlur = nil :: BlurEffect?,
	muted = {} :: { [DepthOfFieldEffect]: boolean },
	renderName = "",
	heartbeat = nil :: RBXScriptConnection?,
}

local function ownEffect(className: string, name: string): any
	local effect = create(className, { Name = name, Parent = Lighting })
	effect:SetAttribute("GlassEffect", true)
	return effect
end

local function ensureEffects()
	if not (shared.depthOfField and shared.depthOfField.Parent) then
		shared.depthOfField = ownEffect("DepthOfFieldEffect", "GlassBlur")
		shared.depthOfField.FarIntensity = 0
		shared.depthOfField.InFocusRadius = 0.1
		shared.depthOfField.NearIntensity = 0
	end
	if not (shared.screenBlur and shared.screenBlur.Parent) then
		shared.screenBlur = ownEffect("BlurEffect", "GlassScreenBlur")
		shared.screenBlur.Size = 0
		shared.screenBlur.Enabled = false
	end
end

-- A game's own depth of field would fight ours, so it's switched off while any panel exists.
local function muteDepthOfField(camera: Camera?)
	for _, parent in ipairs({ Lighting, camera }) do
		for _, effect in ipairs(parent and parent:GetChildren() or {}) do
			if effect:IsA("DepthOfFieldEffect") and effect.Enabled and not effect:GetAttribute("GlassEffect") then
				shared.muted[effect] = true
				effect.Enabled = false
			end
		end
	end
end

local function poll(camera: Camera)
	shared.tier = Glass.getTier()
	pcall(function()
		shared.preferredTransparency = GuiService.PreferredTransparency
		shared.reducedMotion = GuiService.ReducedMotionEnabled
	end)
	muteDepthOfField(camera)
end

local function render(dt: number)
	local camera = workspace.CurrentCamera
	if not camera then
		return
	end
	shared.pollClock -= dt
	if shared.pollClock <= 0 then
		shared.pollClock = 1
		poll(camera)
	end
	ensureEffects()

	local blur, screenBlur = 0, 0
	for _, panel in ipairs(panels) do
		panel:_render(dt, camera)
		blur = math.max(blur, panel._blur)
		screenBlur = math.max(screenBlur, panel._screenBlur)
	end
	shared.depthOfField.NearIntensity = blur
	shared.screenBlur.Size = screenBlur
	shared.screenBlur.Enabled = screenBlur > 0.1
end

local function sample(dt: number)
	local camera = workspace.CurrentCamera
	if not camera then
		return
	end
	local env
	for _, panel in ipairs(panels) do
		panel._sampleClock -= dt
		if panel._showing and panel._sampleClock <= 0 then
			panel._sampleClock = 1 / (if panel._field > 0.01 then SAMPLE_RATE else IDLE_SAMPLE_RATE)
			env = env or readEnvironment(camera)
			panel:_sample(camera, env)
		end
	end
end

local function start()
	poll(workspace.CurrentCamera)
	ensureEffects()
	-- Right after the camera moves, so the blur shapes never lag a frame behind it.
	shared.renderName = "GlassRender" .. HttpService:GenerateGUID(false)
	RunService:BindToRenderStep(shared.renderName, Enum.RenderPriority.Camera.Value + 1, render)
	shared.heartbeat = RunService.Heartbeat:Connect(sample)
end

local function stop()
	RunService:UnbindFromRenderStep(shared.renderName)
	if shared.heartbeat then
		shared.heartbeat:Disconnect()
	end
	for _, effect in ipairs({ shared.depthOfField, shared.screenBlur }) do
		if effect then
			effect:Destroy()
		end
	end
	shared.depthOfField, shared.screenBlur = nil, nil
	for effect in pairs(shared.muted) do
		if effect.Parent then
			effect.Enabled = true
		end
	end
	table.clear(shared.muted)
end

-- Panel -------------------------------------------------------------------------

local function glassPart(meshType: Enum.MeshType): (Part, SpecialMesh)
	local part = create("Part", {
		Name = "GlassBlur",
		Material = Enum.Material.Glass,
		Transparency = 1,
		Color = Color3.new(0, 0, 0),
		Size = Vector3.one,
		Anchored = true,
		CanCollide = false,
		CanQuery = false,
		CanTouch = false,
		CastShadow = false,
		Locked = true,
	})
	return part, create("SpecialMesh", { MeshType = meshType, Parent = part })
end

local function toWorld(camera: Camera, point: Vector2): Vector3
	local ray = camera:ScreenPointToRay(point.X, point.Y)
	return ray.Origin + ray.Direction * PLANE_DISTANCE
end

-- Whether the panel can be seen, and whether it's on a ScreenGui (the only place real blur fits).
local function visibility(gui: GuiObject): (boolean, boolean)
	local node: Instance? = gui
	while node do
		if node:IsA("GuiObject") then
			if not node.Visible then
				return false, false
			end
		elseif node:IsA("LayerCollector") then
			return node.Enabled, node:IsA("ScreenGui")
		end
		node = node.Parent
	end
	return false, false
end

-- Product of every UIScale from the panel up to its ScreenGui.
local function guiScale(gui: GuiObject): number
	local scale = 1
	local node: Instance? = gui
	while node and not node:IsA("LayerCollector") do
		local uiScale = node:FindFirstChildOfClass("UIScale")
		if uiScale then
			scale *= uiScale.Scale
		end
		node = node.Parent
	end
	return scale
end

function Glass.new(options: Options?)
	local opts: Options = options or {}
	local theme = Glass.Themes[opts.Theme or "Dark"]
	assert(theme, "Glass: unknown theme " .. tostring(opts.Theme))
	local radius = opts.CornerRadius or 16
	local full = UDim2.fromScale(1, 1)

	local self = setmetatable({}, Panel)
	self.Theme = theme
	self._radius = radius
	self._blurStrength = opts.BlurStrength or 1
	self._screenBlurEnabled = opts.ScreenBlur == true
	self._visible = true
	self._opacity = 0
	self._field = if shared.tier == "Fallback" then 1 elseif shared.tier == "Hybrid" then HYBRID_FIELD else 0
	self._hover = 0
	self._pointer = nil :: Vector2? -- the cursor in panel pixels, last seen over the panel
	self._lightDir = REST_LIGHT
	self._blur = 0
	self._screenBlur = 0
	self._showing = false
	self._sampleClock = 0
	self._sampled = false
	self._backdropLuma = 0.4
	self._glowSize = Vector2.zero
	self._parts = {} :: { Part }
	self._meshes = {} :: { SpecialMesh }

	local root = create("Frame", {
		Name = "Glass",
		Size = opts.Size or UDim2.fromOffset(360, 240),
		Position = opts.Position or UDim2.fromScale(0.5, 0.5),
		AnchorPoint = opts.AnchorPoint or Vector2.new(0.5, 0.5),
		BackgroundTransparency = 1,
	})
	self.Frame = root
	self._scale = create("UIScale", { Parent = root })

	-- Soft shadow outside the edge. Without EditableImage, faint strokes bunched toward the edge
	-- stand in for it; each is wider than the last, so they add up to a falloff.
	local shadow, sliceAt = shadowTexture(radius)
	if shadow then
		self._shadowImage = create("ImageLabel", {
			Name = "Shadow",
			Position = UDim2.fromOffset(-SHADOW_SPREAD, -SHADOW_SPREAD),
			Size = UDim2.new(1, SHADOW_SPREAD * 2, 1, SHADOW_SPREAD * 2),
			BackgroundTransparency = 1,
			ImageContent = shadow,
			ImageColor3 = Color3.new(0, 0, 0),
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(sliceAt, sliceAt, sliceAt + 2, sliceAt + 2),
			ZIndex = 1,
			Parent = root,
		})
	else
		self._shadow = {}
		for i = 1, SHADOW_RINGS do
			local stroke = create("UIStroke", {
				Thickness = math.max(SHADOW_SPREAD * (i / SHADOW_RINGS) ^ 2, 1),
				Color = Color3.new(0, 0, 0),
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			}, { create("UIGradient", { Rotation = 90, Transparency = NumberSequence.new(0.45, 0) }) })
			create("Frame", { Size = full, BackgroundTransparency = 1, ZIndex = 1, Parent = root }, { corner(radius), stroke })
			table.insert(self._shadow, stroke)
		end
	end

	-- Fake blur. A tiny EditableImage stretched over the panel smooths the samples exactly
	-- (bilinear filtering) and UICorner rounds it; without EditableImage, gradient strips do it.
	self._backdrop = create("Frame", { Name = "Backdrop", Size = full, BackgroundTransparency = 1, ZIndex = 2, Parent = root })
	self._fieldPixels = buffer.create(SAMPLE_COLUMNS * SAMPLE_ROWS * 4)
	self._fieldImage, self._fieldContent = editableImage(FIELD_SIZE, function() end)
	if self._fieldImage then
		self._fieldLabel = create("ImageLabel", {
			Size = full,
			BackgroundTransparency = 1,
			ImageContent = self._fieldContent,
			Parent = self._backdrop,
		}, { corner(radius) })
	else
		self:_buildStrips(radius)
	end
	self._samples, self._display, self._rays, self._cursor = {}, {}, {}, 0
	for row = 1, SAMPLE_ROWS do
		self._samples[row] = table.create(SAMPLE_COLUMNS, Vector3.one * 0.4)
		self._display[row] = table.create(SAMPLE_COLUMNS, Vector3.one * 0.4)
		self._rays[row] = {}
		for column = 1, SAMPLE_COLUMNS do
			self._rays[row][column] = table.create(#SUBSAMPLES, Vector3.one * 0.4)
		end
	end

	self._tint = create("Frame", { Name = "Tint", Size = full, BorderSizePixel = 0, ZIndex = 3, Parent = root }, { corner(radius) })

	self._sheen = create("UIGradient", {})
	create("Frame", {
		Name = "Sheen",
		Size = full,
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		ZIndex = 4,
		Parent = root,
	}, { corner(radius), self._sheen })

	-- Cursor glow: a generated radial texture, or stacked discs without EditableImage.
	-- ClipsDescendants clips to the rectangle, not the rounded corners, but the sliver that
	-- shows past them is too faint to see.
	self._specular = create("Frame", {
		Name = "Specular",
		Size = full,
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		ZIndex = 5,
		Parent = root,
	})
	self._glow = {}
	local glow = glowTexture()
	self._glowIsImage = glow ~= nil
	for _ = 1, if glow then 1 else GLOW_RINGS do
		local props = { AnchorPoint = Vector2.new(0.5, 0.5), BorderSizePixel = 0, Parent = self._specular }
		if glow then
			props.BackgroundTransparency = 1
			props.ImageContent = glow
			table.insert(self._glow, create("ImageLabel", props))
		else
			props.BackgroundColor3 = Color3.new(1, 1, 1)
			table.insert(self._glow, create("Frame", props, { create("UICorner", { CornerRadius = UDim.new(0.5, 0) }) }))
		end
	end

	self._grain = create("ImageLabel", {
		Name = "Grain",
		Size = full,
		BackgroundTransparency = 1,
		Image = GRAIN_IMAGE,
		ScaleType = Enum.ScaleType.Tile,
		TileSize = UDim2.fromOffset(128, 128),
		ZIndex = 6,
		Parent = root,
	}, { corner(radius) })

	-- The top edge catching light, like a bevel.
	self._highlight = create("Frame", {
		Name = "Highlight",
		Position = UDim2.fromOffset(radius, 1),
		Size = UDim2.new(1, -radius * 2, 0, 1),
		BackgroundColor3 = Color3.new(1, 1, 1),
		BorderSizePixel = 0,
		ZIndex = 7,
		Parent = root,
	}, {
		create("UIGradient", {
			Transparency = NumberSequence.new({
				NumberSequenceKeypoint.new(0, 1),
				NumberSequenceKeypoint.new(0.3, 0),
				NumberSequenceKeypoint.new(0.7, 0),
				NumberSequenceKeypoint.new(1, 1),
			}),
		}),
	})

	self._border = create("UIGradient", {})
	create("Frame", { Name = "Border", Size = full, BackgroundTransparency = 1, ZIndex = 8, Parent = root }, {
		corner(radius),
		create("UIStroke", {
			Color = Color3.new(1, 1, 1),
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
		}, { self._border }),
	})

	self.Content = create("Frame", {
		Name = "Content",
		Size = full,
		BackgroundTransparency = 1,
		ZIndex = 9,
		Parent = root,
	})

	self:_applyTheme()
	root.Destroying:Connect(function()
		self:Destroy()
	end)
	root.Parent = opts.Parent

	table.insert(panels, self)
	if #panels == 1 then
		start()
	end
	return self
end

function Panel:_applyTheme()
	self._tint.BackgroundColor3 = self.Theme.Tint
	self._grain.ImageColor3 = self.Theme.GrainColor
end

function Panel:_ensureParts(camera: Camera)
	if #self._parts == 0 then
		-- Rounded blur: a horizontal and a vertical bar make a cross, and a disc fills each corner.
		for i = 1, 6 do
			local part, mesh = glassPart(if i <= 2 then Enum.MeshType.Brick else Enum.MeshType.Cylinder)
			self._parts[i], self._meshes[i] = part, mesh
		end
	end
	for _, part in ipairs(self._parts) do
		if part.Parent ~= camera then
			part.Parent = camera
		end
	end
end

function Panel:_hideParts()
	for _, part in ipairs(self._parts) do
		part.Transparency = 1
	end
end

function Panel:_placeParts(camera: Camera, position: Vector2, size: Vector2)
	-- 1px in from the edge so blur never peeks past the border.
	position += Vector2.one
	size -= Vector2.new(2, 2)
	local r = math.clamp(self._radius - 1, 0, math.min(size.X, size.Y) / 2)
	local cf = camera.CFrame
	local parts, meshes = self._parts, self._meshes

	local function rect(i: number, p: Vector2, s: Vector2)
		local topLeft, topRight, bottomRight = toWorld(camera, p), toWorld(camera, p + Vector2.new(s.X, 0)), toWorld(camera, p + s)
		parts[i].CFrame = CFrame.fromMatrix((topLeft + bottomRight) / 2, cf.XVector, cf.YVector, cf.ZVector)
		meshes[i].Scale = Vector3.new((topRight - topLeft).Magnitude, (topRight - bottomRight).Magnitude, 0)
		parts[i].Transparency = 0.98
	end
	-- Cylinders run along X, so X points at the camera to face it as a disc.
	local function disc(i: number, center: Vector2)
		local middle, edge = toWorld(camera, center), toWorld(camera, center + Vector2.new(r, 0))
		local diameter = (edge - middle).Magnitude * 2
		parts[i].CFrame = CFrame.fromMatrix(middle, cf.ZVector, cf.YVector)
		meshes[i].Scale = Vector3.new(0, diameter, diameter)
		parts[i].Transparency = 0.98
	end

	if r < 1 then
		rect(1, position, size)
		for i = 2, 6 do
			parts[i].Transparency = 1
		end
		return
	end
	rect(1, position + Vector2.new(0, r), Vector2.new(size.X, size.Y - r * 2))
	rect(2, position + Vector2.new(r, 0), Vector2.new(size.X - r * 2, size.Y))
	disc(3, position + Vector2.new(r, r))
	disc(4, position + Vector2.new(size.X - r, r))
	disc(5, position + Vector2.new(r, size.Y - r))
	disc(6, position + size - Vector2.new(r, r))
end

function Panel:_render(dt: number, camera: Camera)
	local root = self.Frame
	local shown, onScreenGui = visibility(root)
	local tier = shared.tier
	local snap = shared.reducedMotion

	local opacityTarget = if self._visible and shown then 1 else 0
	self._opacity = if snap then opacityTarget else approach(self._opacity, opacityTarget, 12, dt)
	local o = self._opacity
	self._showing = o > 0.005
	if not self._showing then
		self._sampled = false
	end
	self.Content.Visible = self._visible and o > 0.5
	self._scale.Scale = if snap then 1 else 0.97 + 0.03 * o

	local fieldTarget = if tier == "Fallback" then 1 elseif tier == "Hybrid" then HYBRID_FIELD else 0
	self._field = approach(self._field, fieldTarget, 6, dt)

	local position, size = root.AbsolutePosition, root.AbsoluteSize
	if size.X < 1 or size.Y < 1 then
		self._blur, self._screenBlur = 0, 0
		self:_hideParts()
		return
	end

	-- The cursor lights the panel only while it's over it: a soft glow right under it, and the
	-- stretch of border nearest it. Otherwise the light rests above the top-left corner.
	local mouse = UserInputService:GetMouseLocation() - GuiService:GetGuiInset() - position
	local inside = UserInputService.MouseEnabled
		and not snap
		and mouse.X >= 0
		and mouse.Y >= 0
		and mouse.X <= size.X
		and mouse.Y <= size.Y
	if inside then
		self._pointer = mouse
	end
	self._hover = approach(self._hover, if inside then 1 else 0, 10, dt)
	local hover = self._hover

	-- Real blur.
	local acrylic = tier ~= "Fallback" and onScreenGui and self._showing
	if acrylic then
		self:_ensureParts(camera)
		self:_placeParts(camera, position, size)
	else
		self:_hideParts()
	end
	self._blur = if acrylic then self._blurStrength * o else 0

	-- Opt-in, below graphics 8: blur the whole 3D view while the panel is up, like a modal.
	local screenBlur = self._screenBlurEnabled and tier == "Fallback" and onScreenGui
	self._screenBlur = if screenBlur then o * SCREEN_BLUR_SIZE else 0

	-- Fake blur.
	local fieldAlpha = self._field * o
	self._backdrop.Visible = fieldAlpha > 0.005 and self._sampled
	if self._backdrop.Visible then
		self:_easeBackdrop(dt)
	end
	if self._fieldLabel then
		self._fieldLabel.ImageTransparency = 1 - fieldAlpha
	else
		for _, frame in ipairs(self._fieldFrames) do
			frame.BackgroundTransparency = 1 - fieldAlpha
		end
	end

	-- Tint gets thicker when the scene behind is bright (dark theme) or dark (light theme).
	local theme = self.Theme
	local luma = self._backdropLuma
	local adapt = if theme.Tint.R < 0.5 then (luma - 0.35) * 0.55 else (0.65 - luma) * 0.55
	local tintAlpha = theme.TintAlpha + math.clamp(adapt, 0, 0.25) + (if tier == "Fallback" then 0.06 else 0)
	-- Players can ask for less see-through UI in Roblox's settings.
	local tintTransparency = (1 - tintAlpha) * shared.preferredTransparency
	self._tint.BackgroundTransparency = 1 - (1 - tintTransparency) * o

	-- Where the light comes from, in half-sizes of the panel from its centre. Over the panel it
	-- swings toward the cursor; the rest direction keeps a little weight so it doesn't spin round
	-- when the cursor crosses the middle.
	local half = size / 2
	local lightTarget = REST_LIGHT
	if self._pointer then
		lightTarget = REST_LIGHT * math.max(1 - hover, 0.15) + (self._pointer - half) / half * hover
	end
	self._lightDir = self._lightDir:Lerp(lightTarget, 1 - math.exp(-20 * dt))
	-- UIGradient rotation is in pixels, so directions go back to pixels to get the angle.
	local function angleFrom(direction: Vector2): number
		local d = direction * half
		return math.deg(math.atan2(-d.Y, -d.X))
	end
	-- How far toward an edge the light has swung; near the middle no edge is singled out.
	local reach = math.min(self._lightDir.Magnitude, 1)

	-- The sheen is the sky reflecting off the glass, so it stays put.
	self._sheen.Rotation = angleFrom(REST_LIGHT)
	self._sheen.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1 - 0.06 * o),
		NumberSequenceKeypoint.new(0.6, 1),
		NumberSequenceKeypoint.new(1, 1),
	})

	self._border.Rotation = angleFrom(self._lightDir)
	self._border.Transparency = NumberSequence.new({
		NumberSequenceKeypoint.new(0, 1 - (0.38 + 0.1 * hover * reach) * o),
		NumberSequenceKeypoint.new(0.5, 1 - 0.12 * o),
		NumberSequenceKeypoint.new(1, 1 - 0.2 * o),
	})
	self._highlight.BackgroundTransparency = 1 - 0.3 * o

	-- Painted blur is flatter than real blur, so the glow stands out more on it and is turned down.
	local glowAlpha = GLOW_ALPHA * hover * o * (if tier == "Fallback" then 0.7 else 1)
	self._specular.Visible = glowAlpha > 0.002 and self._pointer ~= nil
	if self._specular.Visible then
		-- Offsets inside the panel get multiplied by any UIScale above it, so screen pixels are
		-- divided by that first or the glow drifts off the cursor whenever the panel is scaled.
		local scale = guiScale(root)
		local glowSize = math.min(size.X, size.Y) * GLOW_SIZE / scale
		if glowSize ~= self._glowSize.X then
			self._glowSize = Vector2.new(glowSize, glowSize)
			for i, glow in ipairs(self._glow) do
				local d = if self._glowIsImage then glowSize else glowSize * i / GLOW_RINGS
				glow.Size = UDim2.fromOffset(d, d)
			end
		end
		local glowAt = UDim2.fromOffset(self._pointer.X / scale, self._pointer.Y / scale)
		for _, glow in ipairs(self._glow) do
			glow.Position = glowAt
			if self._glowIsImage then
				glow.ImageTransparency = 1 - glowAlpha
			else
				glow.BackgroundTransparency = layerTransparency(glowAlpha, GLOW_RINGS)
			end
		end
	end

	self._grain.ImageTransparency = 1 - (theme.Grain + (if tier == "Fallback" then 0.02 else 0)) * o
	if self._shadowImage then
		self._shadowImage.ImageTransparency = 1 - theme.Shadow * o
	else
		local shadowTransparency = layerTransparency(theme.Shadow * o, SHADOW_RINGS)
		for _, stroke in ipairs(self._shadow) do
			stroke.Transparency = shadowTransparency
		end
	end
end

function Panel:_sample(camera: Camera, env: Environment)
	local position, size = self.Frame.AbsolutePosition, self.Frame.AbsoluteSize
	if size.X < 1 or size.Y < 1 then
		return
	end
	-- The first pass after showing traces every ray so it doesn't start from stale colours.
	local count = if self._sampled then RAYS_PER_PASS else #SUBSAMPLES
	local lumaSum = 0
	for row = 1, SAMPLE_ROWS do
		for column = 1, SAMPLE_COLUMNS do
			local rays = self._rays[row][column]
			for n = 1, count do
				local k = (self._cursor + n - 1) % #SUBSAMPLES + 1
				local u = (column - 0.5 + SUBSAMPLES[k].X) / SAMPLE_COLUMNS
				local v = (row - 0.5 + SUBSAMPLES[k].Y) / SAMPLE_ROWS
				local ray = camera:ScreenPointToRay(position.X + u * size.X, position.Y + v * size.Y)
				rays[k] = trace(env, ray.Origin, ray.Direction)
			end
			local sum = Vector3.zero
			for _, color in ipairs(rays) do
				sum += color
			end
			local average = sum / #SUBSAMPLES
			self._samples[row][column] = average
			lumaSum += average:Dot(LUMA)
		end
	end
	self._cursor = (self._cursor + count) % #SUBSAMPLES
	self._backdropLuma = lumaSum / (SAMPLE_ROWS * SAMPLE_COLUMNS)
	if not self._sampled then
		for row = 1, SAMPLE_ROWS do
			self._display[row] = table.clone(self._samples[row])
		end
		self:_paintBackdrop()
	end
	self._sampled = true
end

-- Glides what's drawn toward the latest samples every frame, so catching up after the camera
-- or panel moves is smooth instead of stepping at the sample rate.
function Panel:_easeBackdrop(dt: number)
	local k = 1 - math.exp(-25 * dt)
	local moved = 0
	for row = 1, SAMPLE_ROWS do
		local shown, target = self._display[row], self._samples[row]
		for column = 1, SAMPLE_COLUMNS do
			local delta = target[column] - shown[column]
			moved = math.max(moved, math.abs(delta.X), math.abs(delta.Y), math.abs(delta.Z))
			shown[column] += delta * k
		end
	end
	if moved > 1 / 512 then
		self:_paintBackdrop()
	end
end

-- Without EditableImage: horizontal gradient strips down the middle, and at the top and bottom
-- a rounded frame twice the corner radius tall, clipped to its outer half so only its rounded
-- corners show.
function Panel:_buildStrips(radius: number)
	local white = Color3.new(1, 1, 1)
	self._strips, self._fieldFrames = {}, {}
	local function cap(top: boolean): UIGradient
		local gradient = create("UIGradient", {})
		local frame = create("Frame", {
			Position = UDim2.fromOffset(0, if top then 0 else -radius),
			Size = UDim2.new(1, 0, 0, radius * 2),
			BackgroundColor3 = white,
			BorderSizePixel = 0,
		}, { corner(radius), gradient })
		create("Frame", {
			Position = if top then UDim2.new() else UDim2.new(0, 0, 1, -radius),
			Size = UDim2.new(1, 0, 0, radius),
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Parent = self._backdrop,
		}, { frame })
		table.insert(self._fieldFrames, frame)
		return gradient
	end
	self._capTop, self._capBottom = cap(true), cap(false)
	for i = 1, BACKDROP_STRIPS do
		local gradient = create("UIGradient", {})
		local offset = radius - 2 * radius * (i - 1) / BACKDROP_STRIPS
		table.insert(self._fieldFrames, create("Frame", {
			Position = UDim2.new(0, 0, (i - 1) / BACKDROP_STRIPS, offset),
			Size = UDim2.new(1, 0, 1 / BACKDROP_STRIPS, 1 - 2 * radius / BACKDROP_STRIPS), -- 1px overlap hides seams
			BackgroundColor3 = white,
			BorderSizePixel = 0,
			Parent = self._backdrop,
		}, { gradient }))
		self._strips[i] = gradient
	end
end

-- Colours across the panel at height v (0 = top, 1 = bottom), blending the sample rows around it.
function Panel:_rowAt(v: number): ColorSequence
	local y = math.clamp(v * SAMPLE_ROWS - 0.5, 0, SAMPLE_ROWS - 1)
	local above = math.min(math.floor(y), SAMPLE_ROWS - 2)
	local t = y - above
	local top, bottom = self._display[above + 1], self._display[above + 2]
	local keypoints = table.create(SAMPLE_COLUMNS + 2)
	for column = 1, SAMPLE_COLUMNS do
		local c = top[column]:Lerp(bottom[column], t)
		keypoints[column + 1] = ColorSequenceKeypoint.new((column - 0.5) / SAMPLE_COLUMNS, Color3.new(c.X, c.Y, c.Z))
	end
	keypoints[1] = ColorSequenceKeypoint.new(0, keypoints[2].Value)
	keypoints[SAMPLE_COLUMNS + 2] = ColorSequenceKeypoint.new(1, keypoints[SAMPLE_COLUMNS + 1].Value)
	return ColorSequence.new(keypoints)
end

function Panel:_paintBackdrop()
	if self._fieldImage then
		local pixels = self._fieldPixels
		for row = 1, SAMPLE_ROWS do
			for column = 1, SAMPLE_COLUMNS do
				local c = self._display[row][column]
				local i = ((row - 1) * SAMPLE_COLUMNS + column - 1) * 4
				buffer.writeu8(pixels, i, math.floor(c.X * 255 + 0.5))
				buffer.writeu8(pixels, i + 1, math.floor(c.Y * 255 + 0.5))
				buffer.writeu8(pixels, i + 2, math.floor(c.Z * 255 + 0.5))
				buffer.writeu8(pixels, i + 3, 255)
			end
		end
		self._fieldImage:WritePixelsBuffer(Vector2.zero, FIELD_SIZE, pixels)
		return
	end
	local height = self.Frame.AbsoluteSize.Y
	local r = self._radius
	local inner = math.max(height - r * 2, 0)
	self._capTop.Color = self:_rowAt(r / 2 / height)
	self._capBottom.Color = self:_rowAt(1 - r / 2 / height)
	for i, gradient in ipairs(self._strips) do
		gradient.Color = self:_rowAt((r + inner * (i - 0.5) / BACKDROP_STRIPS) / height)
	end
end

function Panel:SetVisible(visible: boolean)
	self._visible = visible
end

function Panel:SetTheme(name: string)
	self.Theme = assert(Glass.Themes[name], "Glass: unknown theme " .. tostring(name))
	self:_applyTheme()
end

function Panel:GetTier(): Tier
	return shared.tier
end

function Panel:Destroy()
	if self._destroyed then
		return
	end
	self._destroyed = true
	local index = table.find(panels, self)
	if index then
		table.remove(panels, index)
	end
	for _, part in ipairs(self._parts) do
		part:Destroy()
	end
	if self._fieldImage then
		self._fieldImage:Destroy()
	end
	self.Frame:Destroy()
	if #panels == 0 then
		stop()
	end
end

return Glass
