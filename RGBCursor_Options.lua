--========================================================
-- RGBCursor_Options.lua
--========================================================

local addonName, addon = ...
local L = addon.L

-- Helper for tooltips
local function AddTooltip(frame, text)
    if not text then return end
    frame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(text, nil, nil, nil, nil, true)
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", function(self)
        GameTooltip:Hide()
    end)
end

--------------------------------------------------
-- OPEN COLOR PICKER
--------------------------------------------------
local function OpenColorPicker()
    local c = addon.db.customColor or { r = 1, g = 1, b = 1, a = 0.8 }

    local function UpdateColor()
        local r, g, b
        if ColorPickerFrame.Content and ColorPickerFrame.Content.ColorPicker then
            r, g, b = ColorPickerFrame.Content.ColorPicker:GetColorRGB()
        else
            r, g, b = ColorPickerFrame:GetColorRGB()
        end

        addon.db.customColor = { r = r, g = g, b = b, a = 0.8 }
        addon.db.style = "Custom"
        addon:Update()

        -- Update dropdown text if visible
        if RGBCursorStyleDropdown then
            UIDropDownMenu_SetText(RGBCursorStyleDropdown, L["CUSTOM"])
        end
    end

    if ColorPickerFrame.SetupColorPickerAndShow then
        ColorPickerFrame:SetupColorPickerAndShow({
            r = c.r,
            g = c.g,
            b = c.b,
            opacity = 1 - c.a,
            swatchFunc = UpdateColor,
            opacityFunc = UpdateColor,
            cancelFunc = UpdateColor,
            hasOpacity = true,
        })
    else
        ColorPickerFrame.func = UpdateColor
        ColorPickerFrame.opacityFunc = UpdateColor
        ColorPickerFrame.cancelFunc = UpdateColor
        ColorPickerFrame.hasOpacity = true
        ColorPickerFrame.opacity = 1 - c.a
        ColorPickerFrame:SetColorRGB(c.r, c.g, c.b)
        ColorPickerFrame:Show()
    end
end

--------------------------------------------------
-- CREATE OPTIONS UI
--------------------------------------------------
local function CreateOptions()
    local panelName = "|TInterface\\AddOns\\RGBCursor\\img\\logo-rgbcursor:16:16|t  |cffd597ffRGB Cursor|r"
    local panel = CreateFrame("Frame", "RGBCursorOptions", UIParent)
    panel.name = panelName
    panel:SetSize(615, 580)

    -- SCROLL CONTAINER
    local scrollFrame = CreateFrame("ScrollFrame", "RGBC_ConfigScrollFrame", panel, "UIPanelScrollFrameTemplate")
    scrollFrame:SetPoint("TOPLEFT", 8, -4)
    scrollFrame:SetPoint("BOTTOMRIGHT", -28, 4)

    local scrollChild = CreateFrame("Frame", "RGBC_ConfigScrollChild", scrollFrame)
    scrollChild:SetSize(580, 1)
    scrollFrame:SetScrollChild(scrollChild)

    local currentY = -16
    local marginX = 16

    -- TITLE
    local title = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormalLarge")
    title:SetPoint("TOPLEFT", marginX, currentY)
    title:SetText(L["OPTIONS_TITLE"] or "RGB Cursor Options")

    -- LOGO
    local logo = scrollChild:CreateTexture(nil, "ARTWORK")
    logo:SetSize(110, 110)
    logo:SetPoint("TOPRIGHT", scrollChild, "TOPRIGHT", -10, -5)
    logo:SetTexture("Interface\\AddOns\\RGBCursor\\img\\logo-rgbcursor")

    local version = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    version:SetPoint("TOP", logo, "BOTTOM", 0, -2)
    version:SetText("v" .. (C_AddOns.GetAddOnMetadata(addonName, "Version") or "1.00"))

    currentY = currentY - 40

    -- 1. SECTION: GENERAL
    local genHeader = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    genHeader:SetPoint("TOPLEFT", marginX, currentY)
    genHeader:SetText("|cffC47FF3" .. (L["GEN_HEADER"] or "General Configuration") .. "|r")
    currentY = currentY - 25

    -- Enable Checkbutton
    local glowCheck = CreateFrame("CheckButton", "RGBC_EnableCB", scrollChild, "InterfaceOptionsCheckButtonTemplate")
    glowCheck:SetPoint("TOPLEFT", marginX, currentY)
    _G[glowCheck:GetName() .. "Text"]:SetText(L["ENABLE_GLOW"])
    glowCheck:SetChecked(addon.db.glowEnabled)
    glowCheck:SetScript("OnClick", function(self)
        addon.db.glowEnabled = self:GetChecked()
        addon:Update()
    end)
    AddTooltip(glowCheck, L["TT_ENABLE"])

    currentY = currentY - 30

    -- Hide on Left Click Checkbutton
    local hideLeftCheck = CreateFrame("CheckButton", "RGBC_HideLeftCB", scrollChild, "InterfaceOptionsCheckButtonTemplate")
    hideLeftCheck:SetPoint("TOPLEFT", marginX, currentY)
    _G[hideLeftCheck:GetName() .. "Text"]:SetText(L["HIDE_LEFT"])
    hideLeftCheck:SetChecked(addon.db.hideOnLeftClick)
    hideLeftCheck:SetScript("OnClick", function(self)
        addon.db.hideOnLeftClick = self:GetChecked()
    end)
    AddTooltip(hideLeftCheck, L["TT_HIDE_LEFT"])

    currentY = currentY - 30

    -- Hide on Right Click Checkbutton
    local hideRightCheck = CreateFrame("CheckButton", "RGBC_HideRightCB", scrollChild, "InterfaceOptionsCheckButtonTemplate")
    hideRightCheck:SetPoint("TOPLEFT", marginX, currentY)
    _G[hideRightCheck:GetName() .. "Text"]:SetText(L["HIDE_RIGHT"])
    hideRightCheck:SetChecked(addon.db.hideOnRightClick)
    hideRightCheck:SetScript("OnClick", function(self)
        addon.db.hideOnRightClick = self:GetChecked()
    end)
    AddTooltip(hideRightCheck, L["TT_HIDE_RIGHT"])

    currentY = currentY - 40

    -- Size Slider
    local sizeSlider = CreateFrame("Slider", "RGBCursorSizeSlider", scrollChild, "OptionsSliderTemplate")
    sizeSlider:SetPoint("TOPLEFT", marginX + 10, currentY)
    sizeSlider:SetWidth(400)
    sizeSlider:SetMinMaxValues(1, 100)
    sizeSlider:SetValueStep(1)
    sizeSlider:SetValue(addon.db.size)

    _G[sizeSlider:GetName() .. "Text"]:SetText((L["SIZE"] or "Size") .. ": " .. addon.db.size)
    _G[sizeSlider:GetName() .. "Low"]:SetText("1")
    _G[sizeSlider:GetName() .. "High"]:SetText("100")

    sizeSlider:SetScript("OnValueChanged", function(self, value)
        addon.db.size = math.floor(value)
        _G[self:GetName() .. "Text"]:SetText((L["SIZE"] or "Size") .. ": " .. addon.db.size)
        addon:Update()
    end)
    AddTooltip(sizeSlider, L["TT_SIZE"])

    currentY = currentY - 50

    -- Offset X Slider
    local offsetXSlider = CreateFrame("Slider", "RGBCursorOffsetXSlider", scrollChild, "OptionsSliderTemplate")
    offsetXSlider:SetPoint("TOPLEFT", marginX + 10, currentY)
    offsetXSlider:SetWidth(400)
    offsetXSlider:SetMinMaxValues(-100, 100)
    offsetXSlider:SetValueStep(1)
    offsetXSlider:SetValue(addon.db.offsetX)

    _G[offsetXSlider:GetName() .. "Text"]:SetText((L["OFFSET_X"] or "X Offset") .. ": " .. addon.db.offsetX)
    _G[offsetXSlider:GetName() .. "Low"]:SetText("-100")
    _G[offsetXSlider:GetName() .. "High"]:SetText("100")

    offsetXSlider:SetScript("OnValueChanged", function(self, value)
        addon.db.offsetX = math.floor(value)
        _G[self:GetName() .. "Text"]:SetText((L["OFFSET_X"] or "X Offset") .. ": " .. addon.db.offsetX)
        addon:Update()
    end)
    AddTooltip(offsetXSlider, L["TT_OFFSET_X"])

    currentY = currentY - 50

    -- Offset Y Slider
    local offsetYSlider = CreateFrame("Slider", "RGBCursorOffsetYSlider", scrollChild, "OptionsSliderTemplate")
    offsetYSlider:SetPoint("TOPLEFT", marginX + 10, currentY)
    offsetYSlider:SetWidth(400)
    offsetYSlider:SetMinMaxValues(-100, 100)
    offsetYSlider:SetValueStep(1)
    offsetYSlider:SetValue(addon.db.offsetY)

    _G[offsetYSlider:GetName() .. "Text"]:SetText((L["OFFSET_Y"] or "Y Offset") .. ": " .. addon.db.offsetY)
    _G[offsetYSlider:GetName() .. "Low"]:SetText("-100")
    _G[offsetYSlider:GetName() .. "High"]:SetText("100")

    offsetYSlider:SetScript("OnValueChanged", function(self, value)
        addon.db.offsetY = math.floor(value)
        _G[self:GetName() .. "Text"]:SetText((L["OFFSET_Y"] or "Y Offset") .. ": " .. addon.db.offsetY)
        addon:Update()
    end)
    AddTooltip(offsetYSlider, L["TT_OFFSET_Y"])

    currentY = currentY - 60

    -- Separator
    local line1 = scrollChild:CreateTexture(nil, "ARTWORK")
    line1:SetSize(580, 1)
    line1:SetPoint("TOPLEFT", marginX, currentY)
    line1:SetColorTexture(1, 1, 1, 0.1)
    currentY = currentY - 20

    -- 2. SECTION: STYLE & COLOR
    local styleHeader = scrollChild:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    styleHeader:SetPoint("TOPLEFT", marginX, currentY)
    styleHeader:SetText("|cffC47FF3" .. (L["STYLE_HEADER"] or "Appearance & Styles") .. "|r")
    currentY = currentY - 30

    -- Dropdown
    local dropdown = CreateFrame("Frame", "RGBCursorStyleDropdown", scrollChild, "UIDropDownMenuTemplate")
    dropdown:SetPoint("TOPLEFT", marginX - 15, currentY)
    UIDropDownMenu_SetWidth(dropdown, 200)
    AddTooltip(dropdown, L["TT_STYLE"])

    UIDropDownMenu_Initialize(dropdown, function()
        local list = {}
        for k in pairs(addon.styles) do table.insert(list, k) end
        table.sort(list)

        for _, name in ipairs(list) do
            local info = UIDropDownMenu_CreateInfo()
            info.text = L[name:upper()] or name
            info.checked = (addon.db.style == name)
            info.func = function()
                addon.db.style = name
                addon:Update()
                UIDropDownMenu_SetText(dropdown, L[name:upper()] or name)
                CloseDropDownMenus()
            end
            UIDropDownMenu_AddButton(info)
        end
    end)
    UIDropDownMenu_SetText(dropdown, L[addon.db.style:upper()] or addon.db.style)

    -- Custom Color Button
    local colorBtn = CreateFrame("Button", "RGBC_ColorBtn", scrollChild, "UIPanelButtonTemplate")
    colorBtn:SetPoint("LEFT", dropdown, "RIGHT", 10, 2)
    colorBtn:SetSize(180, 26)
    colorBtn:SetText(L["COLOR_PICKER"])
    colorBtn:SetScript("OnClick", function()
        OpenColorPicker()
    end)
    AddTooltip(colorBtn, L["TT_COLOR"])

    currentY = currentY - 50

    -- Separator
    local line2 = scrollChild:CreateTexture(nil, "ARTWORK")
    line2:SetSize(580, 1)
    line2:SetPoint("TOPLEFT", marginX, currentY)
    line2:SetColorTexture(1, 1, 1, 0.1)
    currentY = currentY - 20

    -- Defaults Button
    local resetBtn = CreateFrame("Button", "RGBC_ResetBtn", scrollChild, "UIPanelButtonTemplate")
    resetBtn:SetPoint("TOPLEFT", marginX, currentY)
    resetBtn:SetSize(180, 26)
    resetBtn:SetText(L["RESET_BUTTON"])
    resetBtn:SetScript("OnClick", function()
        -- Reset DB
        for k, v in pairs(addon.defaults) do
            if type(v) == "table" then
                addon.db[k] = {}
                for tk, tv in pairs(v) do
                    addon.db[k][tk] = tv
                end
            else
                addon.db[k] = v
            end
        end
        addon:Update()

        -- Refresh UI elements
        RGBC_EnableCB:SetChecked(addon.db.glowEnabled)
        RGBC_HideLeftCB:SetChecked(addon.db.hideOnLeftClick)
        RGBC_HideRightCB:SetChecked(addon.db.hideOnRightClick)
        RGBCursorSizeSlider:SetValue(addon.db.size)
        RGBCursorOffsetXSlider:SetValue(addon.db.offsetX)
        RGBCursorOffsetYSlider:SetValue(addon.db.offsetY)
        UIDropDownMenu_SetText(RGBCursorStyleDropdown, L[addon.db.style:upper()] or addon.db.style)
    end)
    AddTooltip(resetBtn, L["TT_RESET"])

    currentY = currentY - 50
    scrollChild:SetSize(580, math.abs(currentY))

    -- Register
    local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
    Settings.RegisterAddOnCategory(category)
    addon.optionsPanel = panel
end

--------------------------------------------------
-- OPEN OPTIONS
--------------------------------------------------
function addon:OpenOptions()
    local panelName = "|TInterface\\AddOns\\RGBCursor\\img\\logo-rgbcursor:16:16|t  |cffd597ffRGBCursor|r"
    if Settings and Settings.OpenToCategory then
        Settings.OpenToCategory(panelName)
    else
        InterfaceOptionsFrame_OpenToCategory("RGBCursor")
    end
end

--------------------------------------------------
-- INIT
--------------------------------------------------
local loader = CreateFrame("Frame")
loader:RegisterEvent("PLAYER_LOGIN")
loader:SetScript("OnEvent", function()
    C_Timer.After(1, function()
        if addon.db then
            CreateOptions()
        end
    end)
end)
