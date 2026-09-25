--========================================================
-- UI/About.lua
--========================================================
-- Igual que en WoW Translator: la entrada raiz del addon en Opciones presenta
-- el addon (logo, version, autor, enlaces y comandos) y los ajustes cuelgan de
-- ella como subcategoria (UI/Options.lua).
--
-- Tambien corre en 2.4.3: nada de :SetSize (addon.SetSize).

local _, addon = ...
addon = addon or RGBCursor -- clientes < 3.0 no pasan argumentos
local L = addon.L

local MARGIN_X = 16
local BRAND = "|cffd597ff"
local GOLD = "|cffffff00"
local HEADER = "|cffC47FF3"
local LOGO = "Interface\\AddOns\\RGBCursor\\img\\logo-rgbcursor"
local GITHUB_URL = "https://github.com/Pirson-s-Addons/Cursor-Glow-RGB"
local CURSEFORGE_URL = "https://www.curseforge.com/wow/addons/cursor-glow-rgb"

local function AddTooltip(frame, text)
    frame:SetScript("OnEnter", function(self)
        GameTooltip:SetOwner(self, "ANCHOR_RIGHT")
        GameTooltip:SetText(text, nil, nil, nil, nil, true)
        GameTooltip:Show()
    end)
    frame:SetScript("OnLeave", function() GameTooltip:Hide() end)
end

local function SectionHeader(panel, y, text)
    local fs = panel:CreateFontString(nil, "ARTWORK", "GameFontNormal")
    fs:SetPoint("TOPLEFT", MARGIN_X, y)
    fs:SetText(HEADER .. text .. "|r")
    return y - 26
end

-- Un addon no puede abrir un enlace ni escribir en el portapapeles: la caja
-- deja la URL seleccionada para que el jugador pulse Ctrl+C.
local function UrlBox(panel, y, label, url)
    local caption = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    caption:SetPoint("TOPLEFT", MARGIN_X, y)
    caption:SetText(label)

    local box = CreateFrame("EditBox", nil, panel, "InputBoxTemplate")
    addon.SetSize(box, 326, 20)
    box:SetPoint("TOPLEFT", MARGIN_X + 120, y + 4)
    box:SetAutoFocus(false)
    box:SetTextColor(1, 1, 1)
    box:SetText(url)
    box:SetCursorPosition(0)
    -- Cualquier edicion se descarta: la caja esta solo para copiar de ella
    box:SetScript("OnEditFocusGained", function(self) self:HighlightText() end)
    box:SetScript("OnTextChanged", function(self)
        if self:GetText() ~= url then self:SetText(url) end
    end)
    box:SetScript("OnEscapePressed", function(self) self:ClearFocus() end)
    box:SetScript("OnEnterPressed", function(self) self:ClearFocus() end)

    local select = CreateFrame("Button", nil, panel, "UIPanelButtonTemplate")
    addon.SetSize(select, 84, 20)
    select:SetPoint("LEFT", box, "RIGHT", 10, 0)
    select:SetText(L["SELECT"])
    select:SetScript("OnClick", function()
        box:SetFocus()
        box:HighlightText()
    end)
    AddTooltip(select, L["TT_SELECT"])

    return y - 32
end

function addon.CreateAbout()
    local panel = CreateFrame("Frame", "RGBCursorAbout", UIParent)
    panel.name = "|T" .. LOGO .. ":16:16|t  " .. BRAND .. "RGB Cursor|r"
    addon.SetSize(panel, 615, 580)
    panel:Hide() -- nace oculto: si no, el Show() al abrir la categoria no dispara OnShow

    local logo = panel:CreateTexture(nil, "ARTWORK")
    addon.SetSize(logo, 128, 128)
    logo:SetPoint("TOPLEFT", MARGIN_X + 8, -16)
    logo:SetTexture(LOGO)

    local name = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalHuge")
    name:SetPoint("TOPLEFT", logo, "TOPRIGHT", 20, -18)
    name:SetText(BRAND .. "RGB Cursor|r")

    local version = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    version:SetPoint("TOPLEFT", name, "BOTTOMLEFT", 0, -10)
    version:SetText(GOLD .. L["VERSION"] .. "|r " .. (addon.GetVersion() or "?"))

    local author = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlight")
    author:SetPoint("TOPLEFT", version, "BOTTOMLEFT", 0, -6)
    author:SetText(GOLD .. L["AUTHOR"] .. "|r " .. (addon.GetMetadata("Author") or "Pirson"))

    local desc = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    desc:SetPoint("TOPLEFT", MARGIN_X, -160)
    desc:SetWidth(560)
    desc:SetJustifyH("LEFT")
    desc:SetText(L["ABOUT_DESC"])

    local y = SectionHeader(panel, -200, L["LINKS"])
    y = UrlBox(panel, y, "GitHub", GITHUB_URL)
    y = UrlBox(panel, y, "CurseForge", CURSEFORGE_URL)
    y = SectionHeader(panel, y - 14, L["COMMANDS"])

    local cmd = panel:CreateFontString(nil, "ARTWORK", "GameFontNormalSmall")
    cmd:SetPoint("TOPLEFT", MARGIN_X + 8, y)
    cmd:SetText(GOLD .. "/rgbc|r")

    local text = panel:CreateFontString(nil, "ARTWORK", "GameFontHighlightSmall")
    text:SetPoint("TOPLEFT", MARGIN_X + 160, y)
    text:SetWidth(400)
    text:SetJustifyH("LEFT")
    text:SetText(L["CMD_OPEN"])

    return addon.RegisterCategory(panel)
end
