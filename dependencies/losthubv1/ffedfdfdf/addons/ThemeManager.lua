local cloneref = (cloneref or clonereference or function(instance: any)
    return instance
end)
local clonefunction = (clonefunction or copyfunction or function(func) 
    return func 
end)

local HttpService: HttpService = cloneref(game:GetService("HttpService"))
local isfolder, isfile, listfiles = isfolder, isfile, listfiles

if typeof(clonefunction) == "function" then
    -- Fix is_____ functions for shitsploits, those functions should never error, only return a boolean.

    local
        isfolder_copy,
        isfile_copy,
        listfiles_copy = clonefunction(isfolder), clonefunction(isfile), clonefunction(listfiles)

    local isfolder_success, isfolder_error = pcall(function()
        return isfolder_copy("test" .. tostring(math.random(1000000, 9999999)))
    end)

    if isfolder_success == false or typeof(isfolder_error) ~= "boolean" then
        isfolder = function(folder)
            local success, data = pcall(isfolder_copy, folder)
            return (if success then data else false)
        end

        isfile = function(file)
            local success, data = pcall(isfile_copy, file)
            return (if success then data else false)
        end

        listfiles = function(folder)
            local success, data = pcall(listfiles_copy, folder)
            return (if success then data else {})
        end
    end
end

local ThemeManager = {
    Folder = "Obsidian",
    Library = nil,
    AppliedToTab = false,
    DefaultTheme = "Default",
    BuiltInThemes = {
        ["Default"] = { 1, { FontColor = "ebebeb", MainColor = "191919", AccentColor = "ffffff", BackgroundColor = "0f0f0f", OutlineColor = "282828", FontFace = "BuilderSans" } },
        ["BBot"] = { 2, { FontColor = "ffffff", MainColor = "1e1e1e", AccentColor = "7e48a3", BackgroundColor = "232323", OutlineColor = "141414" } },
        ["Fatality"] = { 3, { FontColor = "ffffff", MainColor = "1e1842", AccentColor = "c50754", BackgroundColor = "191335", OutlineColor = "3c355d" } },
        ["Jester"] = { 4, { FontColor = "ffffff", MainColor = "242424", AccentColor = "db4467", BackgroundColor = "1c1c1c", OutlineColor = "373737" } },
        ["Mint"] = { 5, { FontColor = "ffffff", MainColor = "242424", AccentColor = "3db488", BackgroundColor = "1c1c1c", OutlineColor = "373737" } },
        ["Tokyo Night"] = { 6, { FontColor = "ffffff", MainColor = "191925", AccentColor = "6759b3", BackgroundColor = "16161f", OutlineColor = "323232" } },
        ["Ubuntu"] = { 7, { FontColor = "ffffff", MainColor = "3e3e3e", AccentColor = "e2581e", BackgroundColor = "323232", OutlineColor = "191919" } },
        ["Quartz"] = { 8, { FontColor = "ffffff", MainColor = "232330", AccentColor = "426e87", BackgroundColor = "1d1b26", OutlineColor = "27232f" } },
        ["Nord"] = { 9, { FontColor = "eceff4", MainColor = "3b4252", AccentColor = "88c0d0", BackgroundColor = "2e3440", OutlineColor = "4c566a" } },
        ["Dracula"] = { 10, { FontColor = "f8f8f2", MainColor = "44475a", AccentColor = "ff79c6", BackgroundColor = "282a36", OutlineColor = "6272a4" } },
        ["Monokai"] = { 11, { FontColor = "f8f8f2", MainColor = "272822", AccentColor = "f92672", BackgroundColor = "1e1f1c", OutlineColor = "49483e" } },
        ["Gruvbox"] = { 12, { FontColor = "ebdbb2", MainColor = "3c3836", AccentColor = "fb4934", BackgroundColor = "282828", OutlineColor = "504945" } },
        ["Solarized"] = { 13, { FontColor = "839496", MainColor = "073642", AccentColor = "cb4b16", BackgroundColor = "002b36", OutlineColor = "586e75" } },
        ["Catppuccin"] = { 14, { FontColor = "d9e0ee", MainColor = "302d41", AccentColor = "f5c2e7", BackgroundColor = "1e1e2e", OutlineColor = "575268" } },
        ["One Dark"] = { 15, { FontColor = "abb2bf", MainColor = "282c34", AccentColor = "c678dd", BackgroundColor = "21252b", OutlineColor = "5c6370" } },
        ["Cyberpunk"] = { 16, { FontColor = "f9f9f9", MainColor = "262335", AccentColor = "00ff9f", BackgroundColor = "1a1a2e", OutlineColor = "413c5e" } },
        ["Oceanic Next"] = { 17, { FontColor = "d8dee9", MainColor = "1b2b34", AccentColor = "6699cc", BackgroundColor = "16232a", OutlineColor = "343d46" } },
        ["Material"] = { 18, { FontColor = "eeffff", MainColor = "212121", AccentColor = "82aaff", BackgroundColor = "151515", OutlineColor = "424242" } },
        ["Discord"] = { 19, { FontColor = "ffffff", MainColor = "1a1a1e", AccentColor = "5865f2", BackgroundColor = "1a1a1e", OutlineColor = "292a2d" } },
        ["Obsidian Classic"] = { 20, { FontColor = "ffffff", MainColor = "191919", AccentColor = "7d55ff", BackgroundColor = "0f0f0f", OutlineColor = "282828", FontFace = "Code" } },
        ["Obsidian Modern"] = { 21, { FontColor = "f0f0ed", MainColor = "1d1f1d", AccentColor = "c2cf4b", BackgroundColor = "0c0e0d", OutlineColor = "2d302d", FontFace = "BuilderSans" } }
    },
    Fonts = {
		"Antique",
		"Arcade",
		"Arial",
		"ArialBold",
		"Bodoni",
		"BuilderSans",
		"Cartoon",
		"Code",
		"Fantasy",
		"Garamond",
		"Gotham",
		"GothamBlack",
		"GothamBold",
		"GothamMedium",
		"Highway",
		"JosefinSans",
		"Jura",
		"Legacy",
		"LuckiestGuy",
		"Merriweather",
		"Nunito",
		"Roboto",
		"RobotoCondensed",
		"RobotoMono",
		"SciFi",
		"SourceSans",
		"SourceSansBold",
		"SourceSansItalic",
		"Ubuntu"
	}
}
do
    local ThemeFields = {
        "FontColor",
        "MainColor",
        "AccentColor",
        "BackgroundColor",
        "OutlineColor",
    }

    local function ParseThemeColor(Value)
        if typeof(Value) == "Color3" then
            return Value
        end
        if typeof(Value) ~= "string" then
            return nil
        end

        local Hex = Value:gsub("^#", "")
        if not Hex:match("^%x%x%x%x%x%x$") then
            return nil
        end

        local Success, Color = pcall(Color3.fromHex, Hex)
        return Success and Color or nil
    end

    local function ParseFontFace(Value)
        if typeof(Value) == "EnumItem" then
            return Value.EnumType == Enum.Font and Value or nil
        end
        if typeof(Value) ~= "string" or Value == "" then
            return nil
        end

        local Success, FontFace = pcall(function()
            return Enum.Font[Value]
        end)
        if not Success or typeof(FontFace) ~= "EnumItem" or FontFace.EnumType ~= Enum.Font then
            return nil
        end

        return FontFace
    end

    local function GetJsonBaseName(path)
        local name = path:match("[^/\\]+$") or path
        return name:sub(1, -6)
    end

    function ThemeManager:SetLibrary(library)
        self.Library = library
    end

    function ThemeManager:SetStartupTheme(theme)
        assert(self.Library, "Must set ThemeManager.Library first!")
        assert(typeof(theme) == "string" and theme ~= "", "Expected a non-empty theme name.")

        self.DefaultTheme = theme
        return self:ApplyTheme(theme)
    end

    --// Folders \\--
    function ThemeManager:GetPaths()
        local paths = {}

        local parts = self.Folder:split("/")
        for idx = 1, #parts do
            paths[#paths + 1] = table.concat(parts, "/", 1, idx)
        end

        paths[#paths + 1] = self.Folder .. "/themes"

        return paths
    end

    function ThemeManager:BuildFolderTree()
        local paths = self:GetPaths()

        for i = 1, #paths do
            local str = paths[i]
            if isfolder(str) then
                continue
            end
            makefolder(str)
        end
    end

    function ThemeManager:CheckFolderTree()
        if isfolder(self.Folder) then
            return
        end
        self:BuildFolderTree()

        task.wait(0.1)
    end

    function ThemeManager:SetFolder(folder)
        self.Folder = folder
        self:BuildFolderTree()
    end

    --// Apply, Update theme \\--
    function ThemeManager:ApplyTheme(theme)
        if typeof(theme) ~= "string" or theme == "" then
            return false, "invalid theme name"
        end

        local customThemeData = self:GetCustomTheme(theme)
        local data = customThemeData or self.BuiltInThemes[theme]

        if not data then
            return false, "theme not found"
        end

        local scheme = customThemeData or data[2]
        if typeof(scheme) ~= "table" then
            return false, "invalid theme data"
        end

        local ParsedColors = {}
        for _, field in ThemeFields do
            local Value = scheme[field]
            if Value ~= nil then
                local Color = ParseThemeColor(Value)
                if not Color then
                    return false, string.format("invalid color for %s", field)
                end

                ParsedColors[field] = Color
            end
        end

        local FontFace
        if scheme.FontFace ~= nil then
            FontFace = ParseFontFace(scheme.FontFace)
            if not FontFace then
                return false, "invalid font face"
            end
        end

        local AppliedScheme = {}
        for field, Color in ParsedColors do
            AppliedScheme[field] = Color

            if self.Library.Options and self.Library.Options[field] then
                self.Library.Options[field]:SetValueRGB(Color)
            end
        end

        if FontFace then
            AppliedScheme.Font = FontFace

            if self.Library.Options and self.Library.Options.FontFace then
                self.Library.Options.FontFace:SetValue(FontFace.Name)
            end
        end

        if self.Library.ApplyScheme then
            self.Library:ApplyScheme(AppliedScheme)
        else
            for field, Value in AppliedScheme do
                self.Library.Scheme[field] = Value
            end
            self.Library:UpdateColorsUsingRegistry()
        end

        self:ThemeUpdate()
        return true
    end

    function ThemeManager:ThemeUpdate()
        local SchemeUpdate = {}
        for i, field in ThemeFields do
            if self.Library.Options and self.Library.Options[field] then
                SchemeUpdate[field] = self.Library.Options[field].Value
            end
        end

        if self.Library.ApplyScheme then
            self.Library:ApplyScheme(SchemeUpdate)
        else
            for field, Value in SchemeUpdate do
                self.Library.Scheme[field] = Value
            end
            self.Library:UpdateColorsUsingRegistry()
        end
    end

    --// Get, Load, Save, Delete, Export, Import, Refresh \\--
    function ThemeManager:GetCustomTheme(file)
        if typeof(file) ~= "string" or file == "" then
            return nil
        end

        local path = self.Folder .. "/themes/" .. file .. ".json"
        if not isfile(path) then
            return nil
        end

        local readSuccess, data = pcall(readfile, path)
        if not readSuccess then
            return nil
        end

        local success, decoded = pcall(HttpService.JSONDecode, HttpService, data)

        if not success then
            return nil
        end

        return decoded
    end

    function ThemeManager:LoadDefault()
        local theme = "Default"
        local content
        local defaultPath = self.Folder .. "/themes/default.txt"
        if isfile(defaultPath) then
            local readSuccess, result = pcall(readfile, defaultPath)
            if readSuccess then
                content = result
            end
        end

        local isDefault = true
        if content then
            if self.BuiltInThemes[content] then
                theme = content
            elseif self:GetCustomTheme(content) then
                theme = content
                isDefault = false
            end
        elseif self.BuiltInThemes[self.DefaultTheme] then
            theme = self.DefaultTheme
        end

        if isDefault then
            self.Library.Options.ThemeManager_ThemeList:SetValue(theme)
        else
            self:ApplyTheme(theme)
        end
    end

    function ThemeManager:SaveDefault(theme)
        if typeof(theme) ~= "string" or theme == "" then
            return false, "invalid theme name"
        end

        local success = pcall(writefile, self.Folder .. "/themes/default.txt", theme)
        return success, success and nil or "failed to write default theme"
    end

    function ThemeManager:SetDefaultTheme(theme)
        assert(self.Library, "Must set ThemeManager.Library first!")
        assert(not self.AppliedToTab, "Cannot set default theme after applying ThemeManager to a tab!")

        theme = typeof(theme) == "table" and theme or {}

        local FinalTheme = {}
        local LibraryScheme = {}
        local CurrentScheme = self.Library.Scheme or {}
        local BuiltInDefault = self.BuiltInThemes["Default"][2]

        for field, Value in CurrentScheme do
            LibraryScheme[field] = Value
        end

        for _, field in ThemeFields do
            local Color = ParseThemeColor(theme[field])
                or ParseThemeColor(CurrentScheme[field])
                or ParseThemeColor(BuiltInDefault[field])
                or Color3.fromRGB(0, 0, 0)

            FinalTheme[field] = Color:ToHex()
            LibraryScheme[field] = Color
        end

        local CurrentFontFace
        for _, FontName in self.Fonts do
            local Candidate = ParseFontFace(FontName)
            if Candidate and CurrentScheme.Font and Font.fromEnum(Candidate) == CurrentScheme.Font then
                CurrentFontFace = Candidate
                break
            end
        end

        local FontFace = ParseFontFace(theme.FontFace)
            or CurrentFontFace
            or ParseFontFace(BuiltInDefault.FontFace)
            or Enum.Font.BuilderSans
        FinalTheme.FontFace = FontFace.Name
        LibraryScheme.Font = Font.fromEnum(FontFace)

        table.clear(self.Library.Scheme)
        for field, Value in LibraryScheme do
            self.Library.Scheme[field] = Value
        end
        self.BuiltInThemes["Default"] = { 1, FinalTheme }

        if self.Library.ApplyScheme then
            self.Library:ApplyScheme({})
        else
            self.Library:UpdateColorsUsingRegistry()
        end
    end

    function ThemeManager:SaveCustomTheme(file)
        if typeof(file) ~= "string" or file:gsub(" ", "") == "" then
            return false, "invalid file name"
        end

        local theme = {}
        for _, field in ThemeFields do
            theme[field] = self.Library.Options[field].Value:ToHex()
        end
        theme["FontFace"] = self.Library.Options["FontFace"].Value

        local EncodedSuccess, Encoded = pcall(HttpService.JSONEncode, HttpService, theme)
        if not EncodedSuccess then
            return false, "failed to encode theme"
        end

        local WriteSuccess = pcall(writefile, self.Folder .. "/themes/" .. file .. ".json", Encoded)
        if not WriteSuccess then
            return false, "failed to write theme"
        end

        return true
    end

    function ThemeManager:Delete(name)
        if not name then
            return false, "no config file is selected"
        end

        local file = self.Folder .. "/themes/" .. name .. ".json"
        if not isfile(file) then
            return false, "invalid file"
        end

        local success = pcall(delfile, file)
        if not success then
            return false, "delete file error"
        end

        return true
    end

    function ThemeManager:ExportTheme(name)
        if not name then
            return false, "no theme file is selected"
        end

        ThemeManager:CheckFolderTree()

        local file = self.Folder .. "/themes/" .. name .. ".json"

        if not isfile(file) then
            return false, "invalid file"
        end

        local success, content = pcall(readfile, file)
        if not success then
            return false, "failed to read file"
        end

        return true, content
    end

    function ThemeManager:ImportTheme(themeData)
        if typeof(themeData) ~= "string" or themeData == "" then
            return false, "no theme data provided"
        end

        local success, decoded = pcall(HttpService.JSONDecode, HttpService, themeData)
        if not success or typeof(decoded) ~= "table" then
            return false, "invalid JSON data"
        end

        local ParsedColors = {}
        for _, field in ThemeFields do
            local value = decoded[field]
            if value ~= nil then
                local Color = ParseThemeColor(value)
                if not Color then
                    return false, string.format("invalid color for %s", field)
                end

                ParsedColors[field] = Color
            end
        end

        local FontFace
        if decoded.FontFace ~= nil then
            FontFace = ParseFontFace(decoded.FontFace)
            if not FontFace then
                return false, "invalid font face"
            end
        end

        for field, Color in ParsedColors do
            self.Library.Scheme[field] = Color

            if self.Library.Options and self.Library.Options[field] then
                self.Library.Options[field]:SetValueRGB(Color)
            end
        end

        if FontFace then
            self.Library:SetFont(FontFace)

            if self.Library.Options and self.Library.Options.FontFace then
                self.Library.Options.FontFace:SetValue(FontFace.Name)
            end
        end

        self:ThemeUpdate()

        return true
    end

    function ThemeManager:ReloadCustomThemes()
        local list = listfiles(self.Folder .. "/themes")

        local out = {}
        for i = 1, #list do
            local file = list[i]
            if file:sub(-5) == ".json" then
                table.insert(out, GetJsonBaseName(file))
            end
        end

        return out
    end

    --// GUI \\--
    function ThemeManager:CreateOptions(groupbox)
        local CurrentFontName = "BuilderSans"
        for _, FontName in self.Fonts do
            local FontFace = ParseFontFace(FontName)
            if FontFace and Font.fromEnum(FontFace) == self.Library.Scheme.Font then
                CurrentFontName = FontName
                break
            end
        end

        groupbox:AddLabel("Background Color"):AddColorPicker("BackgroundColor", { Default = self.Library.Scheme.BackgroundColor })
        groupbox:AddLabel("Main Color"):AddColorPicker("MainColor", { Default = self.Library.Scheme.MainColor })
        groupbox:AddLabel("Accent Color"):AddColorPicker("AccentColor", { Default = self.Library.Scheme.AccentColor })
        groupbox:AddLabel("Outline Color"):AddColorPicker("OutlineColor", { Default = self.Library.Scheme.OutlineColor })
        groupbox:AddLabel("Font Color"):AddColorPicker("FontColor", { Default = self.Library.Scheme.FontColor })
        groupbox:AddToggle("BackgroundImageEnabled", { Text = "Background Image", Default = self.Library.Scheme.BackgroundImageEnabled })
        groupbox:AddInput("BackgroundImage", { Text = "Background Image:", Default = self.Library.Scheme.BackgroundImage or "" })
        groupbox:AddToggle("WindowGlow", { Text = "Window Glow",  Default = self.Library.Scheme.WindowGlow })
        groupbox:AddDropdown("FontFace", { Text = "Font Face:", Default = CurrentFontName, Values = self.Fonts })

        local ThemesArray = {}
        for Name, Theme in pairs(self.BuiltInThemes) do
            table.insert(ThemesArray, Name)
        end

        table.sort(ThemesArray, function(a, b)
            return self.BuiltInThemes[a][1] < self.BuiltInThemes[b][1]
        end)

        groupbox:AddDivider()

        groupbox:AddDropdown("ThemeManager_ThemeList", { Text = "Theme List:", Values = ThemesArray, Default = 1 })
        groupbox:AddButton("Set as Default", function()
            local success, err = self:SaveDefault(self.Library.Options.ThemeManager_ThemeList.Value)
            if not success then
                self.Library:Notify({
                    Title = "Error",
                    Description = "Failed to set default theme: " .. err .. ".",
                    Icon = "circle-x"
                })
                return
            end

            self.Library:Notify({
                Title = "Success",
                Description = string.format("Set default theme to %q", self.Library.Options.ThemeManager_ThemeList.Value),
                Time = 3,
                Icon = "circle-check"
            })
        end)

        self.Library.Options.ThemeManager_ThemeList:OnChanged(function()
            self:ApplyTheme(self.Library.Options.ThemeManager_ThemeList.Value)
        end)

        groupbox:AddDivider()

        groupbox:AddInput("ThemeManager_CustomThemeName", { Text = "Custom Theme Name:" })
        groupbox:AddButton("Create Theme", function()
            local name = self.Library.Options.ThemeManager_CustomThemeName.Value

            if name:gsub(" ", "") == "" then
                self.Library:Notify({
                    Title = "Warning",
                    Description = "Invalid theme name (empty).",
                    Time = 3,
                    Icon = "triangle-alert"
                })
                return
            end

            local success, err = self:SaveCustomTheme(name)
            if not success then
                self.Library:Notify({
                    Title = "Error",
                    Description = "Failed to create theme: " .. err .. ".",
                    Icon = "circle-x"
                })
                return
            end

            self.Library:Notify({
                Title = "Success",
                Description = string.format("Created theme %q", name),
                Time = 3,
                Icon = "circle-check"
            })
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)

        groupbox:AddDivider()

        groupbox:AddDropdown(
            "ThemeManager_CustomThemeList",
            { Text = "Custom Themes:", Values = self:ReloadCustomThemes(), AllowNull = true, Default = 1 }
        )
        groupbox:AddButton("Load", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            local success, err = self:ApplyTheme(name)
            if not success then
                self.Library:Notify({
                    Title = "Error",
                    Description = "Failed to load theme: " .. err .. ".",
                    Icon = "circle-x"
                })
                return
            end

            self.Library:Notify({
                Title = "Success",
                Description = string.format("Loaded theme %q", name),
                Time = 3,
                Icon = "circle-check"
            })
        end):AddButton("Overwrite", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            local success, err = self:SaveCustomTheme(name)
            if not success then
                self.Library:Notify({
                    Title = "Error",
                    Description = "Failed to overwrite theme: " .. err .. ".",
                    Icon = "circle-x"
                })
                return
            end

            self.Library:Notify({
                Title = "Success",
                Description = string.format("Overwrote theme %q", name),
                Time = 3,
                Icon = "circle-check"
            })
        end)
        groupbox:AddButton({ Text = "Delete", DoubleClick = true, Func = function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            local success, err = self:Delete(name)
            if not success then
                self.Library:Notify({
                    Title = "Error",
                    Description = "Failed to delete theme: " .. err .. ".",
                    Icon = "circle-x"
                })
                return
            end

            self.Library:Notify({
                Title = "Success",
                Description = string.format("Deleted theme %q", name),
                Time = 3,
                Icon = "circle-check"
            })
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end }):AddButton("Export", function()
            local name = self.Library.Options.ThemeManager_CustomThemeList.Value

            if not name then
                self.Library:Notify({
                    Title = "Warning",
                    Description = "No theme selected.",
                    Time = 3,
                    Icon = "triangle-alert"
                })
                return
            end

            local success, data = self:ExportTheme(name)
            if not success then
                self.Library:Notify({
                    Title = "Error",
                    Description = "Failed to export theme: " .. data .. ".",
                    Time = 3,
                    Icon = "circle-x"
                })
                return
            end

            setclipboard(data)

            self.Library:Notify({
                Title = "Success",
                Description = string.format("Exported theme %q to clipboard.", name),
                Time = 3,
                Icon = "circle-check"
            })
        end)
        groupbox:AddButton("Refresh List", function()
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end)
        groupbox:AddDivider()
        groupbox:AddInput("ThemeManager_ImportThemeData", { Text = "Import Theme:" })
        groupbox:AddButton("Import Theme", function()
            local data = self.Library.Options.ThemeManager_ImportThemeData.Value

            if data:gsub(" ", "") == "" then
                self.Library:Notify({
                    Title = "Warning",
                    Description = "No theme data provided.",
                    Time = 3,
                    Icon = "triangle-alert"
                })
                return
            end

            local success, err = self:ImportTheme(data)
            if not success then
                self.Library:Notify({
                    Title = "Error",
                    Description = "Failed to import theme: " .. err .. ".",
                    Time = 3,
                    Icon = "circle-x"
                })
                return
            end

            self.Library:Notify({
                Title = "Success",
                Description = "Imported theme.",
                Time = 3,
                Icon = "circle-check"
            })
        end)
        groupbox:AddDivider()
        groupbox:AddButton("Set Default", function()
            if
                self.Library.Options.ThemeManager_CustomThemeList.Value ~= nil
                and self.Library.Options.ThemeManager_CustomThemeList.Value ~= ""
            then
                local success, err = self:SaveDefault(self.Library.Options.ThemeManager_CustomThemeList.Value)
                if not success then
                    self.Library:Notify({
                        Title = "Error",
                        Description = "Failed to set default theme: " .. err .. ".",
                        Icon = "circle-x"
                    })
                    return
                end

                self.Library:Notify({
                    Title = "Success",
                    Description = string.format("Set default theme to %q", self.Library.Options.ThemeManager_CustomThemeList.Value),
                    Time = 3,
                    Icon = "circle-check"
                })
            end
        end):AddButton({ Text = "Reset Default", DoubleClick = true, Func = function()
            local success = pcall(delfile, self.Folder .. "/themes/default.txt")
            if not success then
                self.Library:Notify({
                    Title = "Error",
                    Description = "Failed to reset default: delete file error.",
                    Icon = "circle-x"
                })
                return
            end

            self.Library:Notify({
                    Title = "Success",
                    Description = "Set default theme to nothing",
                    Time = 3,
                    Icon = "circle-check"
                })
            self.Library.Options.ThemeManager_CustomThemeList:SetValues(self:ReloadCustomThemes())
            self.Library.Options.ThemeManager_CustomThemeList:SetValue(nil)
        end })

        self:LoadDefault()
        self.AppliedToTab = true

        local function UpdateTheme()
            self:ThemeUpdate()
        end

        self.Library.Options.BackgroundColor:OnChanged(UpdateTheme)
        self.Library.Options.MainColor:OnChanged(UpdateTheme)
        self.Library.Options.AccentColor:OnChanged(UpdateTheme)
        self.Library.Options.OutlineColor:OnChanged(UpdateTheme)
        self.Library.Options.FontColor:OnChanged(UpdateTheme)
        self.Library.Toggles.BackgroundImageEnabled:OnChanged(function(Value)
            self.Library:SetBackgroundImageEnabled(Value)
            self.Library:UpdateColorsUsingRegistry()
        end)
        self.Library.Toggles.WindowGlow:OnChanged(function(Value)
            self.Library:SetGlow(Value)
            self.Library:UpdateColorsUsingRegistry()
        end)
        self.Library.Options.BackgroundImage:OnChanged(function(Value)
            self.Library:SetBackgroundImage(Value)
            self.Library:UpdateColorsUsingRegistry()
        end)
        self.Library.Options.FontFace:OnChanged(function(Value)
            local FontFace = ParseFontFace(Value)
            if FontFace then
                self.Library:SetFont(FontFace)
                self.Library:UpdateColorsUsingRegistry()
            end
        end)
    end

    function ThemeManager:CreateGroupBox(tab)
        assert(self.Library, "Must set ThemeManager.Library first!")
        return tab:AddLeftGroupbox("Themes", "paintbrush")
    end

    function ThemeManager:AddThemeOptions(tab)
        assert(self.Library, "Must set ThemeManager.Library first!")
        local groupbox = self:CreateGroupBox(tab)
        self:CreateOptions(groupbox)
    end

    function ThemeManager:ApplyToGroupbox(groupbox)
        assert(self.Library, "Must set ThemeManager.Library first!")
        self:CreateOptions(groupbox)
    end

    ThemeManager:BuildFolderTree()
end

getgenv().ObsidianThemeManager = ThemeManager
return ThemeManager
