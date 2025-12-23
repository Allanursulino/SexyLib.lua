--[[
    EXEMPLO COMPLETO DE USO DA LIBRARY
    
    Estrutura:
    1. Window (Janela Principal)
    2. Categories (Categorias para organização)
    3. Pages (Páginas/Tabs)
    4. Sections (Seções dentro das páginas)
    5. Elements (Elementos dentro das seções)
    
    Elementos disponíveis:
    - Toggle (com Settings opcional)
    - Slider
    - Dropdown
    - Listbox
    - Textbox
    - Keybind
    - Button
    - Label (com Colorpicker opcional)
    - Colorpicker
]]

-- ============================================
-- CARREGAMENTO DA LIBRARY
-- ============================================
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SEU_USUARIO/SEU_REPO/main/library.lua"))()

-- ============================================
-- CONFIGURAÇÃO INICIAL
-- ============================================

-- Criar janela principal
local Window = Library:Window({
    Name = "Nome do Hub",
    SubName = "Descrição/Versão",
    Logo = "117671492334453" -- Ícone para mobile/desktop
})

-- Criar lista de keybinds (mostra keybinds ativos)
local KeybindList = Library:KeybindList("Keybinds Ativos")

-- Controle de visibilidade do KeybindList
KeybindList:SetVisibility(true) -- ou false

-- ============================================
-- CRIANDO CATEGORIAS (Opcional - para organização visual)
-- ============================================
Window:Category("Combat & Player")
Window:Category("Visual & ESP")
Window:Category("Misc & Settings")

-- ============================================
-- CRIANDO PÁGINAS
-- ============================================

-- Página 1: Combat
local CombatPage = Window:Page({
    Name = "Combat",
    Icon = "138827881557940",
    Columns = 2 -- 1 ou 2 colunas
})

-- Página 2: Visual
local VisualPage = Window:Page({
    Name = "Visual",
    Icon = "100050851789190",
    Columns = 2
})

-- Página 3: Player
local PlayerPage = Window:Page({
    Name = "Player",
    Icon = "134236649319095",
    Columns = 2
})

-- Página 4: Misc
local MiscPage = Window:Page({
    Name = "Misc",
    Icon = "103180437044643",
    Columns = 2
})

-- ============================================
-- PÁGINA DE COMBAT - SEÇÃO AIMBOT
-- ============================================
local AimbotSection = CombatPage:Section({
    Name = "Aimbot",
    Description = "Sistema de mira automática",
    Icon = "123944728972740",
    Side = 1 -- 1 = Esquerda, 2 = Direita
})

-- Toggle principal do Aimbot
local AimbotToggle = AimbotSection:Toggle({
    Name = "Aimbot Enabled",
    Flag = "AimbotEnabled",
    Default = false,
    Callback = function(Value)
        print("Aimbot:", Value)
        -- Seu código de aimbot aqui
    end
})

-- Settings do Aimbot (abre menu ao clicar no ícone de engrenagem)
local AimbotSettings = AimbotToggle:Settings(400)

-- Slider dentro das settings
AimbotSettings:Slider({
    Name = "Smoothness",
    Flag = "AimbotSmooth",
    Min = 0,
    Max = 1,
    Default = 0.5,
    Decimals = 0.01,
    Suffix = "",
    Callback = function(Value)
        print("Smoothness:", Value)
    end
})

AimbotSettings:Slider({
    Name = "Max Distance",
    Flag = "AimbotDistance",
    Min = 0,
    Max = 1000,
    Default = 500,
    Decimals = 1,
    Suffix = " studs",
    Callback = function(Value)
        print("Distance:", Value)
    end
})

-- Colorpicker dentro das settings
AimbotSettings:Label("FOV Color"):Colorpicker({
    Flag = "AimbotFOVColor",
    Default = Color3.fromRGB(255, 255, 255),
    Alpha = 0.3,
    Callback = function(Color, Alpha)
        print("FOV Color:", Color, "Alpha:", Alpha)
    end
})

-- Slider fora das settings
AimbotSection:Slider({
    Name = "FOV Size",
    Flag = "AimbotFOV",
    Min = 0,
    Max = 500,
    Default = 100,
    Decimals = 1,
    Suffix = " px",
    Callback = function(Value)
        print("FOV:", Value)
    end
})

-- Dropdown
AimbotSection:Dropdown({
    Name = "Target Part",
    Flag = "AimbotPart",
    Items = {"Head", "Torso", "HumanoidRootPart", "Random"},
    Default = "Head",
    Multi = false,
    Size = 125,
    OptionHolderSize = 125,
    Callback = function(Value)
        print("Target Part:", Value)
    end
})

-- Keybind
AimbotSection:Keybind({
    Name = "Aimbot Key",
    Flag = "AimbotKey",
    Default = Enum.KeyCode.E,
    Mode = "Hold", -- "Toggle", "Hold", "Always"
    Callback = function(IsActive)
        print("Aimbot Key Active:", IsActive)
    end
})

-- ============================================
-- PÁGINA DE COMBAT - SEÇÃO TRIGGERBOT
-- ============================================
local TriggerbotSection = CombatPage:Section({
    Name = "Triggerbot",
    Description = "Disparo automático",
    Icon = "123944728972740",
    Side = 2
})

TriggerbotSection:Toggle({
    Name = "Enabled",
    Flag = "TriggerbotEnabled",
    Default = false,
    Callback = function(Value)
        print("Triggerbot:", Value)
    end
})

TriggerbotSection:Slider({
    Name = "Delay",
    Flag = "TriggerbotDelay",
    Min = 0,
    Max = 1,
    Default = 0.1,
    Decimals = 0.01,
    Suffix = "s",
    Callback = function(Value)
        print("Delay:", Value)
    end
})

-- ============================================
-- PÁGINA VISUAL - SEÇÃO ESP
-- ============================================
local ESPSection = VisualPage:Section({
    Name = "ESP",
    Description = "Visualização de jogadores",
    Icon = "100050851789190",
    Side = 1
})

local ESPToggle = ESPSection:Toggle({
    Name = "ESP Enabled",
    Flag = "ESPEnabled",
    Default = false,
    Callback = function(Value)
        print("ESP:", Value)
    end
})

local ESPSettings = ESPToggle:Settings(500)

-- Múltiplos sliders e colorpickers nas settings
ESPSettings:Slider({
    Name = "Max Distance",
    Flag = "ESPDistance",
    Min = 0,
    Max = 5000,
    Default = 2000,
    Decimals = 1,
    Suffix = " studs",
    Callback = function(Value)
        print("ESP Distance:", Value)
    end
})

ESPSettings:Label("Box Color"):Colorpicker({
    Flag = "ESPBoxColor",
    Default = Color3.fromRGB(255, 0, 0),
    Alpha = 1,
    Callback = function(Color, Alpha)
        print("Box Color:", Color)
    end
})

ESPSettings:Label("Name Color"):Colorpicker({
    Flag = "ESPNameColor",
    Default = Color3.fromRGB(255, 255, 255),
    Alpha = 1,
    Callback = function(Color, Alpha)
        print("Name Color:", Color)
    end
})

ESPSettings:Label("Health Color"):Colorpicker({
    Flag = "ESPHealthColor",
    Default = Color3.fromRGB(0, 255, 0),
    Alpha = 1,
    Callback = function(Color, Alpha)
        print("Health Color:", Color)
    end
})

-- Dropdown multi-seleção
ESPSection:Dropdown({
    Name = "ESP Components",
    Flag = "ESPComponents",
    Items = {"Box", "Name", "Health", "Distance", "Weapon"},
    Default = {"Box", "Name"},
    Multi = true, -- Permite múltipla seleção
    Size = 150,
    OptionHolderSize = 150,
    Callback = function(Value)
        print("Components:", Value)
    end
})

-- ============================================
-- PÁGINA VISUAL - SEÇÃO CHAMS
-- ============================================
local ChamsSection = VisualPage:Section({
    Name = "Chams",
    Description = "Destaque de jogadores",
    Icon = "100050851789190",
    Side = 2
})

ChamsSection:Toggle({
    Name = "Enabled",
    Flag = "ChamsEnabled",
    Default = false,
    Callback = function(Value)
        print("Chams:", Value)
    end
})

ChamsSection:Label("Visible Color"):Colorpicker({
    Flag = "ChamsVisibleColor",
    Default = Color3.fromRGB(0, 255, 0),
    Alpha = 0.5,
    Callback = function(Color, Alpha)
        print("Visible Color:", Color)
    end
})

ChamsSection:Label("Hidden Color"):Colorpicker({
    Flag = "ChamsHiddenColor",
    Default = Color3.fromRGB(255, 0, 0),
    Alpha = 0.5,
    Callback = function(Color, Alpha)
        print("Hidden Color:", Color)
    end
})

-- ============================================
-- PÁGINA PLAYER - SEÇÃO MOVEMENT
-- ============================================
local MovementSection = PlayerPage:Section({
    Name = "Movement",
    Description = "Modificações de movimento",
    Icon = "134236649319095",
    Side = 1
})

MovementSection:Toggle({
    Name = "Speed Enabled",
    Flag = "SpeedEnabled",
    Default = false,
    Callback = function(Value)
        print("Speed:", Value)
    end
})

MovementSection:Slider({
    Name = "Speed Value",
    Flag = "SpeedValue",
    Min = 16,
    Max = 500,
    Default = 16,
    Decimals = 1,
    Suffix = "",
    Callback = function(Value)
        print("Speed Value:", Value)
    end
})

MovementSection:Toggle({
    Name = "Jump Power",
    Flag = "JumpEnabled",
    Default = false,
    Callback = function(Value)
        print("Jump:", Value)
    end
})

MovementSection:Slider({
    Name = "Jump Value",
    Flag = "JumpValue",
    Min = 50,
    Max = 500,
    Default = 50,
    Decimals = 1,
    Suffix = "",
    Callback = function(Value)
        print("Jump Value:", Value)
    end
})

MovementSection:Toggle({
    Name = "Fly",
    Flag = "FlyEnabled",
    Default = false,
    Callback = function(Value)
        print("Fly:", Value)
    end
})

MovementSection:Keybind({
    Name = "Fly Key",
    Flag = "FlyKey",
    Default = Enum.KeyCode.X,
    Mode = "Toggle",
    Callback = function(IsActive)
        print("Fly Active:", IsActive)
    end
})

-- ============================================
-- PÁGINA PLAYER - SEÇÃO CHARACTER
-- ============================================
local CharacterSection = PlayerPage:Section({
    Name = "Character",
    Description = "Modificações do personagem",
    Icon = "134236649319095",
    Side = 2
})

CharacterSection:Toggle({
    Name = "God Mode",
    Flag = "GodMode",
    Default = false,
    Callback = function(Value)
        print("God Mode:", Value)
    end
})

CharacterSection:Toggle({
    Name = "Infinite Stamina",
    Flag = "InfiniteStamina",
    Default = false,
    Callback = function(Value)
        print("Infinite Stamina:", Value)
    end
})

CharacterSection:Button({
    Name = "Reset Character",
    Icon = "123456789",
    Callback = function()
        print("Reset!")
        -- game.Players.LocalPlayer.Character:BreakJoints()
    end
})

CharacterSection:Button({
    Name = "Remove Accessories",
    Callback = function()
        print("Remove Accessories!")
    end
})

-- ============================================
-- PÁGINA MISC - SEÇÃO UTILITIES
-- ============================================
local UtilitiesSection = MiscPage:Section({
    Name = "Utilities",
    Description = "Utilidades gerais",
    Icon = "103180437044643",
    Side = 1
})

-- Textbox
UtilitiesSection:Textbox({
    Flag = "CustomWalkSpeed",
    Placeholder = "WalkSpeed",
    Default = "16",
    Numeric = true, -- Aceita apenas números
    Finished = true, -- Callback apenas ao apertar Enter
    Callback = function(Value)
        print("Custom WalkSpeed:", Value)
    end
})

-- Listbox com pesquisa
local WhitelistBox = UtilitiesSection:Listbox({
    Flag = "Whitelist",
    Items = {},
    Default = nil,
    Size = 200,
    Multi = true,
    Callback = function(Value)
        print("Whitelist:", Value)
    end
})

-- Adicionar jogadores dinamicamente
for _, player in pairs(game.Players:GetPlayers()) do
    WhitelistBox:Add(player.Name)
end

-- Atualizar quando jogador entrar
game.Players.PlayerAdded:Connect(function(player)
    WhitelistBox:Add(player.Name)
end)

-- Remover quando jogador sair
game.Players.PlayerRemoving:Connect(function(player)
    WhitelistBox:Remove(player.Name)
end)

-- Label com status
local StatusLabel = UtilitiesSection:Label("Status: Idle")

-- Atualizar label
task.spawn(function()
    while true do
        wait(1)
        StatusLabel:SetText("Status: Active - " .. os.date("%H:%M:%S"))
    end
end)

-- ============================================
-- PÁGINA MISC - SEÇÃO AUTO FARM
-- ============================================
local AutoFarmSection = MiscPage:Section({
    Name = "Auto Farm",
    Description = "Automação de farm",
    Icon = "103180437044643",
    Side = 2
})

AutoFarmSection:Toggle({
    Name = "Auto Farm Enabled",
    Flag = "AutoFarm",
    Default = false,
    Callback = function(Value)
        print("Auto Farm:", Value)
        -- Seu código de auto farm
    end
})

AutoFarmSection:Dropdown({
    Name = "Farm Method",
    Flag = "FarmMethod",
    Items = {"Method 1", "Method 2", "Method 3"},
    Default = "Method 1",
    Multi = false,
    Size = 125,
    Callback = function(Value)
        print("Method:", Value)
    end
})

AutoFarmSection:Slider({
    Name = "Farm Delay",
    Flag = "FarmDelay",
    Min = 0,
    Max = 5,
    Default = 0.5,
    Decimals = 0.1,
    Suffix = "s",
    Callback = function(Value)
        print("Delay:", Value)
    end
})

-- ============================================
-- PÁGINA DE SETTINGS (Sistema de Configs)
-- ============================================
local SettingsPage = Library:CreateSettingsPage(Window, KeybindList)

-- O sistema de configs já está pronto:
-- - Create (criar config)
-- - Delete (deletar config)
-- - Load (carregar config)
-- - Save (salvar config)
-- - Refresh (atualizar lista)

-- ============================================
-- ACESSANDO VALORES DAS FLAGS
-- ============================================

-- Ler valores
print(Library.Flags["AimbotEnabled"]) -- boolean
print(Library.Flags["AimbotFOV"]) -- number
print(Library.Flags["AimbotPart"]) -- string
print(Library.Flags["ESPComponents"]) -- table (se Multi = true)
print(Library.Flags["ESPBoxColor"]) -- table: {Color, Alpha, HexValue, Transparency}

-- Alterar valores programaticamente
Library.SetFlags["AimbotEnabled"](true)
Library.SetFlags["AimbotFOV"](200)
Library.SetFlags["SpeedValue"](100)

-- ============================================
-- SISTEMA DE NOTIFICAÇÕES
-- ============================================
Library:Notification({
    Title = "Script Loaded",
    Description = "Hub carregado com sucesso!",
    Duration = 5,
    Icon = "73789337996373"
})

-- Notificação com cor customizada
Library:Notification({
    Title = "Warning",
    Description = "Atenção! Algo aconteceu.",
    Duration = 3,
    Icon = "73789337996373",
    IconColor = {
        Start = Color3.fromRGB(255, 200, 0),
        End = Color3.fromRGB(255, 100, 0)
    }
})

-- ============================================
-- CONTROLE DE VISIBILIDADE
-- ============================================

-- Esconder/Mostrar elementos
AimbotToggle:SetVisibility(false) -- Esconde
AimbotToggle:SetVisibility(true) -- Mostra

-- Minimizar seção
AimbotSection:ToggleBackground()

-- ============================================
-- SISTEMA DE TEMAS/CORES
-- ============================================

-- Mudar cor do accent (destaque)
Library:ChangeTheme("Accent", Color3.fromRGB(100, 200, 255))
Library:ChangeTheme("AccentGradient", Color3.fromRGB(50, 150, 200))

-- Mudar transparência do fundo
Library.Flags["BackgroundTransparency"] = 0.5
Window:SetTransparency()

-- ============================================
-- INICIALIZAR A INTERFACE
-- ============================================
Window:Init()

-- ============================================
-- DESCARREGAR SCRIPT (Cleanup)
-- ============================================

-- Para descarregar completamente:
-- Library:Unload()

-- ============================================
-- EXEMPLO DE LOOP DE AIMBOT
-- ============================================
--[[
task.spawn(function()
    while true do
        task.wait()
        
        if Library.Flags["AimbotEnabled"] then
            local fov = Library.Flags["AimbotFOV"]
            local targetPart = Library.Flags["AimbotPart"]
            local smoothness = Library.Flags["AimbotSmooth"]
            
            -- Seu código de aimbot aqui
            print("Aimbot rodando com FOV:", fov)
        end
    end
end)
]]

print("✅ Script carregado com sucesso!")
print("📋 Total de flags criadas:", #Library.Flags)
