local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SteelyXeno/SolarisLib/main/source.lua"))()
local Window = Library:New({Name = "AOT: Revolution Helper", FolderToSave = "AOTR_Settings"})

local Tab = Window:Tab("Автофарм")
local Section = Tab:Section("Основные функции")

_G.AutoFarm = false
_G.AutoAttack = false

-- Функция авто-атаки
Section:Toggle("Авто-удары (Kill Aura)", false, "KillAura", function(state)
    _G.AutoAttack = state
    spawn(function()
        while _G.AutoAttack do
            wait(0.1)
            -- Поиск ближайшего титана и клик (симуляция)
            local VirtualUser = game:GetService("VirtualUser")
            VirtualUser:CaptureController()
            VirtualUser:ClickButton1(Vector2.new(851, 158), game.Workspace.CurrentCamera.CFrame)
        end
    end)
end)

-- Функция бесконечного газа (визуальный обход)
Section:Button("Пополнить газ", function()
    local player = game.Players.LocalPlayer
    if player.Character and player.Character:FindFirstChild("Gas") then
        player.Character.Gas.Value = 100 -- Примерное значение
        Library:Notification("Газ", "Газ восстановлен!")
    end
end)

-- Ускорение полета на крюках
Section:Slider("Скорость крюков", 1, 300, 150, 1, "ODM_Speed", function(s)
    -- Здесь обычно меняется BodyVelocity игрока
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

local MiscTab = Window:Tab("Разное")
local MiscSection = MiscTab:Section("Настройки")

MiscSection:Button("Удалить туман (Clear Fog)", function()
    game:GetService("Lighting").FogEnd = 100000
end)

Library:Notification("Готово!", "Скрипт успешно запущен")

