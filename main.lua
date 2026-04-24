local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "AOT: Revolution Helper",
   LoadingTitle = "Загрузка скрипта...",
   LoadingSubtitle = "by Almaz",
   ConfigurationSaving = {
      Enabled = true,
      FolderName = "AOTR_Settings",
      FileName = "MainConfig"
   }
})

local Tab = Window:CreateTab("Автофарм", 4483362458) -- Иконка фарм

_G.AutoAttack = false

Tab:CreateToggle({
   Name = "Авто-удары (Kill Aura)",
   CurrentValue = false,
   Flag = "KillAura",
   Callback = function(Value)
      _G.AutoAttack = Value
      if Value then
         spawn(function()
            while _G.AutoAttack do
               local VirtualUser = game:GetService("VirtualUser")
               VirtualUser:CaptureController()
               VirtualUser:ClickButton1(Vector2.new(851, 158))
               task.wait(0.1)
            end
         end)
      end
   end,
})

Tab:CreateSlider({
   Name = "Скорость бега/полета",
   Range = {16, 300},
   Increment = 1,
   Suffix = "Speed",
   CurrentValue = 100,
   Flag = "SpeedSlider",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

local MiscTab = Window:CreateTab("Разное", 4483345998)

MiscTab:CreateButton({
   Name = "Удалить туман",
   Callback = function()
      game:GetService("Lighting").FogEnd = 100000
      Rayfield:Notify({Title = "Успех", Content = "Туман удален!"})
   end,
})

Rayfield:Notify({Title = "Готово!", Content = "Скрипт успешно запущен!"})
