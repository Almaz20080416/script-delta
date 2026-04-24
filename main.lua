
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/SteelyXeno/SolarisLib/main/source.lua"))()
local Window = Library:New({Name = "AOT: Revolution Helper", FolderToSave = "AOTR_Settings"})

local Tab = Window:Tab("Автофарм")
local Section = Tab:Section("Основные функции")

_G.AutoAttack = false

-- Функция авто-атаки
Section:Toggle("Авто-удары (Kill Aura)", false, "KillAura", function(state)
    _G.AutoAttack = state
    if state then
        spawn(function()
            while _G.AutoAttack do
                local VirtualUser = game:GetService("VirtualUser")
                VirtualUser:CaptureController()
                VirtualUser:ClickButton1(Vector2.new(851, 158))
                task.wait(0.1)
            end
        end)
    end
end)

-- Ускорение бега
Section:Slider("Скорость бега", 16, 300, 100, 1, "Speed", function(s)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = s
end)

-- Удаление тумана
local MiscTab = Window:Tab("Разное")
local MiscSection = MiscTab:Section("Настройки")
MiscSection:Button("Удалить туман", function()
    game:GetService("Lighting").FogEnd = 100000
end)

Library:Notification("Загрузка", "Скрипт успешно запущен!")
