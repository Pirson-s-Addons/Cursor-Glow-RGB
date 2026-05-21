--========================================================
-- RGBCursor.lua
--========================================================

local addonName, addon = ...
_G.RGBCursor = addon

--------------------------------------------------
-- DEFAULT SETTINGS
--------------------------------------------------
local defaults = {
    size = 28,

    color = {
        r = 1,
        g = 1,
        b = 1,
        a = 0.8
    },

    customColor = {
        r = 1,
        g = 1,
        b = 1,
        a = 0.8
    },

    offsetX = 12,
    offsetY = -12,

    style = "Blue",

    glowEnabled = true,
    hideOnLeftClick = false,
    hideOnRightClick = true,
}
addon.defaults = defaults

--------------------------------------------------
-- STYLES
--------------------------------------------------
local glowTex = "Interface\\AddOns\\RGBCursor\\img\\cursor_glow"

addon.styles = {

    ["Blue"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 0, g = 0.6, b = 1 }
    },

    ["Cyan"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 0, g = 1, b = 1 }
    },

    ["Green"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 0, g = 1, b = 0 }
    },

    ["Lime"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 0.5, g = 1, b = 0 }
    },

    ["Yellow"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 1, g = 1, b = 0 }
    },

    ["Orange"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 1, g = 0.5, b = 0 }
    },

    ["Red"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 1, g = 0, b = 0 }
    },

    ["Pink"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 1, g = 0.4, b = 0.7 }
    },

    ["Purple"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 0.6, g = 0, b = 1 }
    },

    ["Magenta"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 1, g = 0, b = 1 }
    },

    ["White"] = {
        tex = glowTex,
        mode = "static",
        color = { r = 1, g = 1, b = 1 }
    },

    --------------------------------------------------
    -- RGB ANIMATION
    --------------------------------------------------
    ["RGB"] = {
        tex = glowTex,
        mode = "rgb"
    },

    --------------------------------------------------
    -- CUSTOM COLOR
    --------------------------------------------------
    ["Custom"] = {
        tex = glowTex,
        mode = "custom"
    },
}

local db
local frame
local texture

--------------------------------------------------
-- INIT
--------------------------------------------------
function addon:Initialize()
    RGBCursorDB = RGBCursorDB or {}
    db = RGBCursorDB

    for k, v in pairs(defaults) do
        if db[k] == nil then
            if type(v) == "table" then
                db[k] = {}

                for tk, tv in pairs(v) do
                    db[k][tk] = tv
                end
            else
                db[k] = v
            end
        end
    end

    if not addon.styles[db.style] then
        db.style = "Blue"
    end

    self.db = db
    self:CreateUI()
end

--------------------------------------------------
-- CREATE UI
--------------------------------------------------
function addon:CreateUI()
    if frame then
        return
    end

    frame = CreateFrame("Frame", "RGBCursorGlowFrame", UIParent)

    frame:SetSize(db.size, db.size)
    frame:SetFrameStrata("TOOLTIP")
    frame:SetFrameLevel(9999)

    texture = frame:CreateTexture(nil, "BACKGROUND")
    texture:SetAllPoints(frame)

    texture:SetBlendMode("ADD")

    self:Update()

    frame:Show()

    frame:SetScript("OnUpdate", function()
        local shouldHide = (addon.db.hideOnLeftClick and IsMouseButtonDown("LeftButton")) or (addon.db.hideOnRightClick and IsMouseButtonDown("RightButton"))
        if shouldHide then
            texture:Hide()
        else
            texture:Show()
            local x, y = GetCursorPosition()
            local scale = UIParent:GetEffectiveScale()

            frame:ClearAllPoints()
            frame:SetPoint(
                "CENTER",
                UIParent,
                "BOTTOMLEFT",
                (x / scale) + db.offsetX,
                (y / scale) + db.offsetY
            )
        end

        addon:Update()
    end)
end

--------------------------------------------------
-- UPDATE
--------------------------------------------------
function addon:Update()
    if not frame then
        return
    end

    frame:SetSize(db.size, db.size)

    local styleData = addon.styles[db.style]
        or addon.styles["Blue"]

    texture:SetTexture(styleData.tex)

    --------------------------------------------------
    -- GLOW DISABLED
    --------------------------------------------------
    if not db.glowEnabled then
        texture:SetVertexColor(1, 1, 1, 0)
        return
    end

    local mode = styleData.mode or "static"

    --------------------------------------------------
    -- STATIC COLOR
    --------------------------------------------------
    if mode == "static" then
        local c = styleData.color

        texture:SetVertexColor(
            c.r,
            c.g,
            c.b,
            db.color.a
        )

        --------------------------------------------------
        -- RGB MODE
        --------------------------------------------------
    elseif mode == "rgb" then
        local t = GetTime() * 2.5

        local r = math.sin(t) * 0.5 + 0.5
        local g = math.sin(t + 2) * 0.5 + 0.5
        local b = math.sin(t + 4) * 0.5 + 0.5

        texture:SetVertexColor(
            r,
            g,
            b,
            db.color.a
        )

        --------------------------------------------------
        -- CUSTOM COLOR
        --------------------------------------------------
    elseif mode == "custom" then
        local c = db.customColor or {
            r = 1,
            g = 1,
            b = 1,
            a = 0.8
        }

        texture:SetVertexColor(
            c.r,
            c.g,
            c.b,
            c.a
        )
    end
end

--------------------------------------------------
-- EVENTS
--------------------------------------------------
local eventFrame = CreateFrame("Frame")

eventFrame:RegisterEvent("ADDON_LOADED")

eventFrame:SetScript("OnEvent", function(_, _, arg1)
    if arg1 == addonName then
        addon:Initialize()
    end
end)

--------------------------------------------------
-- SLASH COMMANDS
--------------------------------------------------
SLASH_RGBC1 = "/rgbc"
SLASH_RGBC2 = "/rgbcursor"

SlashCmdList["RGBC"] = function()
    if addon.OpenOptions then
        addon:OpenOptions()
    end
end
