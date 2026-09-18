--========================================================
-- Compat.lua
--========================================================
-- El addon esta escrito contra la API moderna. Aqui vive TODO lo que hace falta
-- para que el mismo codigo arranque en un cliente viejo de servidor privado:
-- 2.4.3 (TBC), 3.3.5a (WotLK), 4.3.4 (Cata), 5.4.8 (MoP), 6.2.4 (WoD),
-- 7.3.5 (Legion), 8.3.7 (BfA) y 9.2.5 (Shadowlands). Mismas ramas que
-- Core/Compat.lua de WoWTranslator, que estan contrastadas con el codigo de
-- interfaz de Blizzard de cada version.
--
-- Fuera de este fichero, una regla para no romper 2.4.3: nada de
-- :SetSize(w, h), que no existe; se usa addon.SetSize.
--
-- Carga EL PRIMERO: monta el namespace que recogen los demas ficheros.
--
-- Regla al tocar esto: detectar la FUNCION, no la version del cliente. Solo se
-- mira la version donde no hay nada que detectar (una firma que cambio).

local ADDON_NAME, addon = ...

--------------------------------------------------
-- NAMESPACE
--------------------------------------------------
-- Clientes < 3.0 cargan los ficheros sin argumentos: el namespace es el global
-- RGBCursor y cada fichero lo recoge en la segunda linea de su cabecera.
addon = addon or RGBCursor or {}
RGBCursor = addon
addon.NAME = ADDON_NAME or "RGBCursor"

-- OJO: los Classic de CurseForge (1.15, 2.5, 3.4, 3.80, 4.4, 5.5) y Forever
-- (1.60) tienen version mayor baja pero interfaz MODERNA. Una condicion por
-- version tiene que apuntar a la version exacta que cambio, nunca a un rango.
local MAJOR, MINOR = string.match((GetBuildInfo()), "^(%d+)%.(%d+)")
MAJOR, MINOR = tonumber(MAJOR) or 99, tonumber(MINOR) or 0

--------------------------------------------------
-- WIDGETS
--------------------------------------------------

-- Region:SetSize no existe en 2.4.3.
function addon.SetSize(region, w, h)
    region:SetWidth(w)
    region:SetHeight(h)
end

-- Texture:SetColorTexture llega en 7.0. Antes, SetTexture con cuatro numeros
-- hacia lo mismo (y en los clientes modernos esa forma ya no existe).
function addon.SetSolidColor(texture, r, g, b, a)
    if texture.SetColorTexture then
        texture:SetColorTexture(r, g, b, a)
    else
        texture:SetTexture(r, g, b, a)
    end
end

-- ScrollFrame:SetScrollChild no se puede dar por hecho en 2.4.3 (alli el hijo
-- se declara en XML). Sin el, el contenido se cuelga del marco: se ve, aunque
-- no haga scroll, en vez de romper la creacion del panel.
function addon.SetScrollChild(scrollFrame, child)
    if scrollFrame.SetScrollChild then
        scrollFrame:SetScrollChild(child)
    else
        child:SetParent(scrollFrame)
        child:SetPoint("TOPLEFT", scrollFrame, "TOPLEFT")
    end
end

-- En 2.4.3, UIDropDownMenu_SetWidth y UIDropDownMenu_SetText recibian el marco
-- el ULTIMO; 3.0 lo paso delante (y 2.5 Classic ya lo lleva delante).
-- Uso: DropDown(UIDropDownMenu_SetText, marco, texto)
function addon.DropDown(func, frame, value)
    if MAJOR == 2 and MINOR < 5 then return func(value, frame) end
    return func(frame, value)
end

-- C_AddOns.GetAddOnMetadata llega en 10.1; el global de siempre ya no existe.
function addon.GetVersion()
    local get = (C_AddOns and C_AddOns.GetAddOnMetadata) or GetAddOnMetadata
    return get(addon.NAME, "Version")
end

--------------------------------------------------
-- PANEL DE OPCIONES
--------------------------------------------------
-- Settings llega en 10.0. Antes, InterfaceOptions_AddCategory, que identifica
-- la categoria por el nombre del panel.
local hasSettings = (Settings and Settings.RegisterCanvasLayoutCategory) and true or false

function addon.RegisterCategory(panel)
    if hasSettings then
        local category = Settings.RegisterCanvasLayoutCategory(panel, panel.name)
        Settings.RegisterAddOnCategory(category)
        addon.categoryID = category:GetID()
        return
    end

    InterfaceOptions_AddCategory(panel)
    addon.categoryID = panel.name
end

function addon.OpenConfig()
    if not addon.categoryID then return end

    if hasSettings then
        Settings.OpenToCategory(addon.categoryID)
        return
    end

    -- 2.4.3 solo trae OpenToFrame; desde 3.x, OpenToCategory. Fallo conocido
    -- del cliente antiguo: la primera llamada solo abre el marco, la segunda
    -- es la que selecciona la categoria.
    local open = InterfaceOptionsFrame_OpenToCategory or InterfaceOptionsFrame_OpenToFrame
    open(addon.categoryID)
    open(addon.categoryID)
end
