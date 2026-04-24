-- Упрощенный скрипт для AOT: Revolution
local player = game.Players.LocalPlayer
local char = player.Character or player.CharacterAdded:Wait()

-- 1. Уведомление о запуске
game:GetService("StarterGui"):SetCore("SendNotification", {
    Title = "AOT SCRIPT";
    Text = "Скрипт активирован!";
    Duration = 5;
})

-- 2. Увеличение скорости (WalkSpeed)
char.Humanoid.WalkSpeed = 120

-- 3. Авто-удары (Kill Aura)
-- Этот цикл будет бить каждые 0.2 секунды
_G.AOT_ATTACK = true
spawn(function()
    while _G.AOT_ATTACK do
        local VirtualUser = game:GetService("VirtualUser")
        VirtualUser:CaptureController()
        VirtualUser:ClickButton1(Vector2.new(851, 158))
        wait(0.2)
    end
end)


