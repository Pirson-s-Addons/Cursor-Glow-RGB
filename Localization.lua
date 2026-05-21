local addonName, addon = ...

local L = setmetatable({}, {
    __index = function(t, k)
        return k
    end
})

local locale = GetLocale()

-- ==========================================
-- ENGLISH (enUS / enGB) - Default
-- ==========================================
L["OPTIONS_TITLE"] = "RGB Cursor Options"
L["COLOR_PICKER"] = "Color Picker"
L["ENABLE_GLOW"] = "Enable Effect"
L["GLOW_STYLE"] = "Effect Style"
L["SIZE"] = "Size"
L["BLUE"] = "Blue"
L["CYAN"] = "Cyan"
L["GREEN"] = "Green"
L["LIME"] = "Lime"
L["YELLOW"] = "Yellow"
L["ORANGE"] = "Orange"
L["RED"] = "Red"
L["PINK"] = "Pink"
L["PURPLE"] = "Purple"
L["MAGENTA"] = "Magenta"
L["WHITE"] = "White"
L["RGB"] = "RGB"
L["CUSTOM"] = "Custom"

-- Headers & Tooltips
L["GEN_HEADER"] = "General Configuration"
L["STYLE_HEADER"] = "Appearance & Styles"
L["TT_ENABLE"] = "Enable or disable the effect aura around your cursor."
L["TT_COLOR"] = "Select a custom color for the aura."
L["TT_STYLE"] = "Choose the texture and animation style of the effect."
L["TT_SIZE"] = "Adjust the size of the effect aura."
L["OFFSET_X"] = "X Offset"
L["OFFSET_Y"] = "Y Offset"
L["TT_OFFSET_X"] = "Adjust the horizontal position of the aura relative to the cursor."
L["TT_OFFSET_Y"] = "Adjust the vertical position of the aura relative to the cursor."
L["RESET_BUTTON"] = "Default Values"
L["TT_RESET"] = "Reset all settings to their default values."
L["HIDE_LEFT"] = "Hide on Left Click"
L["HIDE_RIGHT"] = "Hide on Right Click"
L["TT_HIDE_LEFT"] = "Hide the effect when the left mouse button is held down."
L["TT_HIDE_RIGHT"] = "Hide the effect when the right mouse button is held down."

-- ==========================================
-- ESPAÑOL (esES / esMX)
-- ==========================================
if locale == "esES" or locale == "esMX" then
    L["OPTIONS_TITLE"] = "Opciones de RGB Cursor"
    L["COLOR_PICKER"] = "Selector de Color"
    L["ENABLE_GLOW"] = "Activar Efecto"
    L["GLOW_STYLE"] = "Estilo de Efecto"
    L["SIZE"] = "Tamaño"
    L["BLUE"] = "Azul"
    L["CYAN"] = "Cian"
    L["GREEN"] = "Verde"
    L["LIME"] = "Lima"
    L["YELLOW"] = "Amarillo"
    L["ORANGE"] = "Naranja"
    L["RED"] = "Rojo"
    L["PINK"] = "Rosa"
    L["PURPLE"] = "Púrpura"
    L["MAGENTA"] = "Magenta"
    L["WHITE"] = "Blanco"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Personalizado"

    -- Headers & Tooltips
    L["GEN_HEADER"] = "Configuración General"
    L["STYLE_HEADER"] = "Apariencia y Estilos"
    L["TT_ENABLE"] = "Activa o desactiva el aura del efecto alrededor del cursor."
    L["TT_COLOR"] = "Selecciona un color personalizado para el aura."
    L["TT_STYLE"] = "Elige la textura y el estilo de animación del efecto."
    L["TT_SIZE"] = "Ajusta el tamaño del aura del efecto."
    L["OFFSET_X"] = "Desplazamiento X"
    L["OFFSET_Y"] = "Desplazamiento Y"
    L["TT_OFFSET_X"] = "Ajusta la posición horizontal del aura respecto al cursor."
    L["TT_OFFSET_Y"] = "Ajusta la posición vertical del aura respecto al cursor."
    L["RESET_BUTTON"] = "Valores por defecto"
    L["TT_RESET"] = "Reinicia todos los ajustes a sus valores iniciales."
    L["HIDE_LEFT"] = "Ocultar al hacer Click Izquierdo"
    L["HIDE_RIGHT"] = "Ocultar al hacer Click Derecho"
    L["TT_HIDE_LEFT"] = "Oculta el efecto cuando se mantiene pulsado el botón izquierdo del ratón."
    L["TT_HIDE_RIGHT"] = "Oculta el efecto cuando se mantiene pulsado el botón derecho del ratón."

-- ==========================================
-- DEUTSCH (deDE)
-- ==========================================
elseif locale == "deDE" then
    L["OPTIONS_TITLE"] = "RGB Cursor Optionen"
    L["COLOR_PICKER"] = "Farbauswahl"
    L["ENABLE_GLOW"] = "Effekt aktivieren"
    L["GLOW_STYLE"] = "Effektstil"
    L["SIZE"] = "Größe"
    L["BLUE"] = "Blau"
    L["CYAN"] = "Cyan"
    L["GREEN"] = "Grün"
    L["LIME"] = "Limette"
    L["YELLOW"] = "Gelb"
    L["ORANGE"] = "Orange"
    L["RED"] = "Rot"
    L["PINK"] = "Rosa"
    L["PURPLE"] = "Lila"
    L["MAGENTA"] = "Magenta"
    L["WHITE"] = "Weiß"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Benutzerdefiniert"

-- ==========================================
-- FRANÇAIS (frFR)
-- ==========================================
elseif locale == "frFR" then
    L["OPTIONS_TITLE"] = "Options de RGB Cursor"
    L["COLOR_PICKER"] = "Sélecteur de couleur"
    L["ENABLE_GLOW"] = "Activer l'effet"
    L["GLOW_STYLE"] = "Style d'effet"
    L["SIZE"] = "Taille"
    L["BLUE"] = "Bleu"
    L["CYAN"] = "Cyan"
    L["GREEN"] = "Vert"
    L["LIME"] = "Citron vert"
    L["YELLOW"] = "Jaune"
    L["ORANGE"] = "Orange"
    L["RED"] = "Rouge"
    L["PINK"] = "Rose"
    L["PURPLE"] = "Violet"
    L["MAGENTA"] = "Magenta"
    L["WHITE"] = "Blanc"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Personnalisé"

-- ==========================================
-- ITALIANO (itIT)
-- ==========================================
elseif locale == "itIT" then
    L["OPTIONS_TITLE"] = "Opzioni RGB Cursor"
    L["COLOR_PICKER"] = "Selettore colore"
    L["ENABLE_GLOW"] = "Abilita effetto"
    L["GLOW_STYLE"] = "Stile effetto"
    L["SIZE"] = "Dimensione"
    L["BLUE"] = "Blu"
    L["CYANO"] = "Ciano"
    L["GREEN"] = "Verde"
    L["LIME"] = "Lime"
    L["YELLOW"] = "Giallo"
    L["ORANGE"] = "Arancione"
    L["RED"] = "Rosso"
    L["PINK"] = "Rosa"
    L["PURPLE"] = "Viola"
    L["MAGENTA"] = "Magenta"
    L["WHITE"] = "Bianco"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Personalizzato"

-- ==========================================
-- PORTUGUÊS (ptBR)
-- ==========================================
elseif locale == "ptBR" then
    L["OPTIONS_TITLE"] = "Opções do RGB Cursor"
    L["COLOR_PICKER"] = "Seletor de cores"
    L["ENABLE_GLOW"] = "Ativar efeito"
    L["GLOW_STYLE"] = "Estilo de efeito"
    L["SIZE"] = "Tamanho"
    L["BLUE"] = "Azul"
    L["CYAN"] = "Ciano"
    L["GREEN"] = "Verde"
    L["LIME"] = "Lima"
    L["YELLOW"] = "Amarelo"
    L["ORANGE"] = "Laranja"
    L["RED"] = "Vermelho"
    L["PINK"] = "Rosa"
    L["PURPLE"] = "Roxo"
    L["MAGENTA"] = "Magenta"
    L["WHITE"] = "Branco"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Personalizado"

-- ==========================================
-- RUSSIAN (ruRU)
-- ==========================================
elseif locale == "ruRU" then
    L["OPTIONS_TITLE"] = "Настройки RGB Cursor"
    L["COLOR_PICKER"] = "Выбор цвета"
    L["ENABLE_GLOW"] = "Включить эффект"
    L["GLOW_STYLE"] = "Стиль эффекта"
    L["SIZE"] = "Размер"
    L["BLUE"] = "Синий"
    L["CYAN"] = "Циан"
    L["GREEN"] = "Зеленый"
    L["LIME"] = "Лайм"
    L["YELLOW"] = "Желтый"
    L["ORANGE"] = "Оранжевый"
    L["RED"] = "Красный"
    L["PINK"] = "Розовый"
    L["PURPLE"] = "Фиолетовый"
    L["MAGENTA"] = "Пурпурный"
    L["WHITE"] = "Белый"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Свой цвет"

-- ==========================================
-- KOREAN (koKR)
-- ==========================================
elseif locale == "koKR" then
    L["OPTIONS_TITLE"] = "RGB Cursor 설정"
    L["COLOR_PICKER"] = "색상 선택"
    L["ENABLE_GLOW"] = "효과 활성화"
    L["GLOW_STYLE"] = "효과 스타일"
    L["SIZE"] = "크기"
    L["BLUE"] = "파란색"
    L["CYAN"] = "청록색"
    L["GREEN"] = "초록색"
    L["LIME"] = "라임색"
    L["YELLOW"] = "노란색"
    L["ORANGE"] = "오렌지색"
    L["RED"] = "빨간색"
    L["PINK"] = "분홍색"
    L["PURPLE"] = "보라색"
    L["MAGENTA"] = "마젠타"
    L["WHITE"] = "흰색"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "사용자 지정"

-- ==========================================
-- CHINESE (zhCN)
-- ==========================================
elseif locale == "zhCN" then
    L["OPTIONS_TITLE"] = "RGB Cursor 选项"
    L["COLOR_PICKER"] = "颜色选择"
    L["ENABLE_GLOW"] = "启用效果"
    L["GLOW_STYLE"] = "效果样式"
    L["SIZE"] = "大小"
    L["BLUE"] = "蓝色"
    L["CYAN"] = "青色"
    L["GREEN"] = "绿色"
    L["LIME"] = "石灰色"
    L["YELLOW"] = "黄色"
    L["ORANGE"] = "橙色"
    L["RED"] = "红色"
    L["PINK"] = "粉红色"
    L["PURPLE"] = "紫色"
    L["MAGENTA"] = "洋红色"
    L["WHITE"] = "白色"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "自定义"

-- ==========================================
-- CHINESE TRADITIONAL (zhTW)
-- ==========================================
elseif locale == "zhTW" then
    L["OPTIONS_TITLE"] = "RGB Cursor 選項"
    L["COLOR_PICKER"] = "顏色選擇"
    L["ENABLE_GLOW"] = "啟用效果"
    L["GLOW_STYLE"] = "效果樣式"
    L["SIZE"] = "大小"
    L["BLUE"] = "藍色"
    L["CYAN"] = "青色"
    L["GREEN"] = "綠色"
    L["LIME"] = "石灰色"
    L["YELLOW"] = "黃色"
    L["ORANGE"] = "橙色"
    L["RED"] = "紅色"
    L["PINK"] = "粉紅色"
    L["PURPLE"] = "紫色"
    L["MAGENTA"] = "洋紅色"
    L["WHITE"] = "白色"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "自定義"

-- ==========================================
-- POLSKI (plPL)
-- ==========================================
elseif locale == "plPL" then
    L["OPTIONS_TITLE"] = "Opcje RGB Cursor"
    L["COLOR_PICKER"] = "Wybór koloru"
    L["ENABLE_GLOW"] = "Włącz efekt"
    L["GLOW_STYLE"] = "Styl efektu"
    L["SIZE"] = "Rozmiar"
    L["BLUE"] = "Niebieski"
    L["CYAN"] = "Cyjan"
    L["GREEN"] = "Zielony"
    L["LIME"] = "Limonkowy"
    L["YELLOW"] = "Żółty"
    L["ORANGE"] = "Pomarańczowy"
    L["RED"] = "Czerwony"
    L["PINK"] = "Różowy"
    L["PURPLE"] = "Fioletowy"
    L["MAGENTA"] = "Magenta"
    L["WHITE"] = "Biały"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Własny"

-- ==========================================
-- SVENSKA (svSE)
-- ==========================================
elseif locale == "svSE" then
    L["OPTIONS_TITLE"] = "RGB Cursor inställningar"
    L["COLOR_PICKER"] = "Färgval"
    L["ENABLE_GLOW"] = "Aktivera effekt"
    L["GLOW_STYLE"] = "Effekt-stil"
    L["SIZE"] = "Storlek"
    L["BLUE"] = "Blå"
    L["CYAN"] = "Cyan"
    L["GREEN"] = "Grön"
    L["LIME"] = "Lime"
    L["YELLOW"] = "Gul"
    L["ORANGE"] = "Orange"
    L["RED"] = "Röd"
    L["PINK"] = "Rosa"
    L["PURPLE"] = "Lila"
    L["MAGENTA"] = "Magenta"
    L["WHITE"] = "Vit"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Anpassad"

-- ==========================================
-- NORSK (noNO)
-- ==========================================
elseif locale == "noNO" then
    L["OPTIONS_TITLE"] = "RGB Cursor-innstillinger"
    L["COLOR_PICKER"] = "Fargevelger"
    L["ENABLE_GLOW"] = "Aktiver effekt"
    L["GLOW_STYLE"] = "Effektstil"
    L["SIZE"] = "Størrelse"
    L["BLUE"] = "Blå"
    L["CYAN"] = "Cyan"
    L["GREEN"] = "Grønn"
    L["LIME"] = "Lime"
    L["YELLOW"] = "Gul"
    L["ORANGE"] = "Oransje"
    L["RED"] = "Rød"
    L["PINK"] = "Rosa"
    L["PURPLE"] = "Lilla"
    L["MAGENTA"] = "Magenta"
    L["WHITE"] = "Hvit"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Tilpasset"

-- ==========================================
-- TURKISH (trTR)
-- ==========================================
elseif locale == "trTR" then
    L["OPTIONS_TITLE"] = "RGB Cursor Seçenekleri"
    L["COLOR_PICKER"] = "Renk Seçici"
    L["ENABLE_GLOW"] = "Efekti Etkinleştir"
    L["GLOW_STYLE"] = "Efekt Stili"
    L["SIZE"] = "Boyut"
    L["BLUE"] = "Mavi"
    L["CYAN"] = "Camgöbeği"
    L["GREEN"] = "Yeşil"
    L["LIME"] = "Limon"
    L["YELLOW"] = "Sarı"
    L["ORANGE"] = "Turuncu"
    L["RED"] = "Kırmızı"
    L["PINK"] = "Pembe"
    L["PURPLE"] = "Mor"
    L["MAGENTA"] = "Macenta"
    L["WHITE"] = "Beyaz"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Özel"

-- ==========================================
-- JAPANESE (jaJP)
-- ==========================================
elseif locale == "jaJP" then
    L["OPTIONS_TITLE"] = "RGB Cursor 設定"
    L["COLOR_PICKER"] = "カラーピッカー"
    L["ENABLE_GLOW"] = "エフェクトを有効にする"
    L["GLOW_STYLE"] = "エフェクトスタイル"
    L["SIZE"] = "サイズ"
    L["BLUE"] = "青"
    L["CYAN"] = "シアン"
    L["GREEN"] = "緑"
    L["LIME"] = "ライム"
    L["YELLOW"] = "黄色"
    L["ORANGE"] = "オレンジ"
    L["RED"] = "赤"
    L["PINK"] = "ピンク"
    L["PURPLE"] = "紫"
    L["MAGENTA"] = "マゼンタ"
    L["WHITE"] = "白"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "カスタム"

-- ==========================================
-- ARABIC (arSA)
-- ==========================================
elseif locale == "arSA" then
    L["OPTIONS_TITLE"] = "خيارات RGB Cursor"
    L["COLOR_PICKER"] = "مختار الألوان"
    L["ENABLE_GLOW"] = "تمكين التأثير"
    L["GLOW_STYLE"] = "نمط التأثير"
    L["SIZE"] = "الحجم"
    L["BLUE"] = "أزرق"
    L["CYAN"] = "سماوي"
    L["GREEN"] = "أخضر"
    L["LIME"] = "ليموني"
    L["YELLOW"] = "أصفر"
    L["ORANGE"] = "برتقالي"
    L["RED"] = "أحمر"
    L["PINK"] = "وردي"
    L["PURPLE"] = "أرجواني"
    L["MAGENTA"] = "ماجنتا"
    L["WHITE"] = "أبيض"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "مخصص"

-- ==========================================
-- HINDI (hiIN)
-- ==========================================
elseif locale == "hiIN" then
    L["OPTIONS_TITLE"] = "RGB Cursor विकल्प"
    L["COLOR_PICKER"] = "रंग चयनकर्ता"
    L["ENABLE_GLOW"] = "प्रभाव सक्षम करें"
    L["GLOW_STYLE"] = "प्रभाव शैली"
    L["SIZE"] = "आकार"
    L["BLUE"] = "नीला"
    L["CYAN"] = "सियान"
    L["GREEN"] = "हरा"
    L["LIME"] = "चूना"
    L["YELLOW"] = "पीला"
    L["ORANGE"] = "नारंगी"
    L["RED"] = "लाल"
    L["PINK"] = "गुलाबी"
    L["PURPLE"] = "बैंगनी"
    L["MAGENTA"] = "मैजेंटा"
    L["WHITE"] = "सफेद"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "कस्टम"

-- ==========================================
-- THAI (thTH)
-- ==========================================
elseif locale == "thTH" then
    L["OPTIONS_TITLE"] = "ตัวเลือก RGB Cursor"
    L["COLOR_PICKER"] = "ตัวเลือกสี"
    L["ENABLE_GLOW"] = "เปิดใช้งานเอฟเฟกต์"
    L["GLOW_STYLE"] = "สไตล์เอฟเฟกต์"
    L["SIZE"] = "ขนาด"
    L["BLUE"] = "น้ำเงิน"
    L["CYAN"] = "ไซแอน"
    L["GREEN"] = "เขียว"
    L["LIME"] = "มะนาว"
    L["YELLOW"] = "เหลือง"
    L["ORANGE"] = "ส้ม"
    L["RED"] = "แดง"
    L["PINK"] = "ชมพู"
    L["PURPLE"] = "ม่วง"
    L["MAGENTA"] = "มาเจนตา"
    L["WHITE"] = "ขาว"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "กำหนดเอง"

-- ==========================================
-- VIETNAMESE (viVN)
-- ==========================================
elseif locale == "viVN" then
    L["OPTIONS_TITLE"] = "Tùy chọn RGB Cursor"
    L["COLOR_PICKER"] = "Trình chọn màu"
    L["ENABLE_GLOW"] = "Bật hiệu ứng"
    L["GLOW_STYLE"] = "Kiểu hiệu ứng"
    L["SIZE"] = "Kích thước"
    L["BLUE"] = "Xanh dương"
    L["CYAN"] = "Xanh lơ"
    L["GREEN"] = "Xanh lá"
    L["LIME"] = "Xanh chanh"
    L["YELLOW"] = "Vàng"
    L["ORANGE"] = "Cam"
    L["RED"] = "Đỏ"
    L["PINK"] = "Hồng"
    L["PURPLE"] = "Tím"
    L["MAGENTA"] = "Đỏ thẫm"
    L["WHITE"] = "Trắng"
    L["RGB"] = "RGB"
    L["CUSTOM"] = "Tùy chỉnh"

end

addon.L = L
