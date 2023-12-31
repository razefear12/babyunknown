-- New example script written by wally
-- You can suggest changes with a pull request or something
local wanted = {"Kamado","Agatsuma","Rengoku","Uzui","Tomioka","Tokito","Hashibira","Soyama"}

local repo = 'https://raw.githubusercontent.com/razefear12/babyunknown/main/'

local Library = loadstring(game:HttpGet(repo .. 'ui/LinoriaUI.lua'))()
local ThemeManager = loadstring(game:HttpGet(repo .. 'ui/ThemeManager.lua'))()
local SaveManager = loadstring(game:HttpGet(repo .. 'ui/SaveManager.lua'))()

local isNoclipEnabled = false -- Флаг, указывающий, включен ли режим noclip
local isAntiFallEnabled = false -- Флаг, указывающий, включен ли режим anti fall

local Window = Library:CreateWindow({
    -- Set Center to true if you want the menu to appear in the center
    -- Set AutoShow to true if you want the menu to appear when it is created
    -- Position and Size are also valid options here
    -- but you do not need to define them unless you are changing them :)

    Title = 'Project Slayers (Premium)',
    Center = true, 
    AutoShow = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}


local LeftGroupBox = Tabs.Main:AddLeftGroupbox('/// Progress Player ///')

--Player
local breathingProg = LeftGroupBox:AddLabel("Breathing Progress : ".. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[2].Value) * 100) .. '%')
local DemonProg = LeftGroupBox:AddLabel("Demon Progress : ".. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[2].Value) * 100) .. '%')
--Demon Update
local function DemonProgRe()
    DemonProg:Set("Demon Progress : " .. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[2].Value) * 100) .. '%')
end
game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].DemonProgress[1].Changed:Connect(DemonProgRe)
--Breathing Update
local function BreathingRe()
    breathingProg:Set("Breathing Progress : ".. math.floor((game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Value / game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[2].Value) * 100) .. '%')
end
game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].BreathingProgress[1].Changed:Connect(BreathingRe)

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('/// Player Buffs ///')


-- Tabboxes are a tiny bit different, but here's a basic example:
--[[

local TabBox = Tabs.Main:AddLeftTabbox() -- Add Tabbox on left side

local Tab1 = TabBox:AddTab('Tab 1')
local Tab2 = TabBox:AddTab('Tab 2')

-- You can now call AddToggle, etc on the tabs you added to the Tabbox
]]

-- Groupbox:AddToggle
-- Arguments: Index, Options
LeftGroupBox:AddToggle('Misc', {
    Text = 'Auto Loot Chest',
    Default = false, -- Default value (true / false)
})


Toggles.Misc:OnChanged(function(value)
    getgenv().AutoCollectChest = value
end)


-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Misc:SetValue(false)

LeftGroupBox:AddToggle('Misc', {
    Text = 'Inf Stamina',
    Default = false, -- Default value (true / false)
})

Toggles.Misc:OnChanged(function(t)
    getgenv().InfStamina = t
end)


-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Misc:SetValue(false)

LeftGroupBox:AddToggle('Misc', {
    Text = 'Inf Breathing',
    Default = false, -- Default value (true / false)
})

Toggles.Misc:OnChanged(function(t)
    getgenv().InfBreathing = t
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Misc:SetValue(false)

LeftGroupBox:AddToggle('Misc', {
    Text = 'Anti SunDamage (Only Demon)',
    Default = false, -- Default value (true / false)
})

Toggles.Misc:OnChanged(function()
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Sun_Damage.Disabled = true
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Misc:SetValue(false)

LeftGroupBox:AddToggle('Misc', {
    Text = 'Kamado Heal (Only Demon)',
    Default = false, -- Default value (true / false)
})

Toggles.Misc:OnChanged(function(t)
    kamadonhealon = t
    if not t then
        kamadonhealon = false
        kamadonhealoff = true
    end
    game:GetService("ReplicatedStorage").Remotes.heal_tang123asd:FireServer(kamadonhealon)
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Misc:SetValue(false)

local godmodeakazabda1 = "skil_ting_asd"
local godmodeakazabda2 = game:GetService("Players").LocalPlayer
local godmodeakazabda3 = "akaza_bda_compass_needle"
local godmodeakazabda4 = 1
local isGodModeEnabled = false
local godModeLoop


local function startGodMode()
    if isGodModeEnabled then
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(godmodeakazabda1, godmodeakazabda2, godmodeakazabda3, godmodeakazabda4)
        wait(1.5)
        startGodMode()
    end
end

LeftGroupBox:AddToggle('Misc', {
    Text = 'Akaza BDA Demon (God Mode)',
    Default = false, -- Default value (true / false)
})

Toggles.Misc:OnChanged(function(t)
    isGodModeEnabled = t
    if isGodModeEnabled then
        startGodMode()
    elseif godModeLoop then
        godModeLoop:Disconnect()
    end
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Misc:SetValue(false)

LeftGroupBox:AddToggle('Misc', {
    Text = 'Dmg Buff (All Race)',
    Default = false, -- Default value (true / false)
})

local wardrumsbuffon = true
local wardrumsbuffoff = false

Toggles.Misc:OnChanged(function(t)
    wardrumsbuffon = t
    if not t then
        wardrumsbuffon = false
        wardrumsbuffoff = true
    end
    while wardrumsbuffon do
    game:GetService("ReplicatedStorage").Remotes.war_Drums_remote:FireServer(wardrumsbuffon)
    wait(2)
    end
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Misc:SetValue(false)


local RightGroupBox = Tabs.Main:AddRightGroupbox('⚔️ | Kill Aura | ⚔️')

RightGroupBox:AddLabel('/// Select Weapon ///')

local WeaponSelector = {"Combat", "Sword", "Claw", "Scythe", "Fans"} -- Обновленный список оружия
local selectedOption = WeaponSelector[1] -- Значение по умолчанию
local isToggleEnabled = false -- Переменная для отслеживания состояния переключателя

local SelectWeapon = RightGroupBox:AddDropdown('SelectWeapon', {
    Values = { 'Combat', 'Sword', 'Claw', 'Scythe', 'Fans' },
    Default = 1,
    Multi = false,

    Tooltip = 'Select killaura weapon',
})

SelectWeapon:OnChanged(function(option)
    selectedOption = option
end)

SelectWeapon:SetValue('Combat')


RightGroupBox:AddLabel('/// KillAura ///')

local KillAuraToggle = RightGroupBox:AddToggle('Killaura', {
    Text = 'Kill Aura 1',
    Default = false,
    Tooltip = 'Kill aura | 1.25 second 5 hits',
})

KillAuraToggle:OnChanged(function(t)
    isToggleEnabled = t
    if t then
        local weapon

        if selectedOption == 'Combat' then
            weapon = "fist_combat"
        elseif selectedOption == 'Sword' then
            weapon = "Sword_Combat_Slash"
        elseif selectedOption == 'Claw' then
            weapon = "claw_Combat_Slash"
        elseif selectedOption == 'Scythe' then
            weapon = "Scythe_Combat_Slash"
        elseif selectedOption == 'Fans' then
            weapon = "fans_combat_slash"
        end

        local args1 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 919,
            [9] = 99999
        }
        local args2 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 1,
            [9] = 99999
        }

        local args3 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 2,
            [9] = 99999
        }

        local args4 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 3,
            [9] = 99999
        }

        local args5 = {
            [1] = weapon,
            [2] = game:GetService("Players").LocalPlayer,
            [3] = game:GetService("Players").LocalPlayer.Character,
            [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
            [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
            [6] = 4,
            [9] = 99999
        }

        while isToggleEnabled do
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args2, 1, 9))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args3, 1, 9))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args4, 1, 9))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(args5, 1, 9))
            game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S_:InvokeServer(unpack(args1, 1, 9))
   
            wait(1.25)
        end
    end
end)

KillAuraToggle:SetValue(false)


local KillAura2Toggle = RightGroupBox:AddToggle('Killaura', {
    Text = 'Kill Aura 2',
    Default = false,
    Tooltip = 'Kill aura | 2.00 second 16 hits',
})

KillAura2Toggle:OnChanged(function(t)
    isToggleEnabled = t -- Обновляем состояние переключателя
    if t then
     local weapon

     if selectedOption == "Combat" then
        weapon = "fist_combat"
    elseif selectedOption == "Sword" then
        weapon = "Sword_Combat_Slash"
    elseif selectedOption == "Claw" then
        weapon = "claw_Combat_Slash"
    elseif selectedOption == "Scythe" then
        weapon = "Scythe_Combat_Slash"
    elseif selectedOption == "Fans" then
        weapon = "fans_combat_slash"
    end
    
    local oh1 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh2 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh3 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh4 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh5 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh6 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh7 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh8 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh9 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh10 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh11 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh12 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh13 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh14 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    local oh15 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = 919,
        [7] = "ground_slash"
    }
    local oh16 = {
        [1] = weapon,
        [2] = game:GetService("Players").LocalPlayer,
        [3] = game:GetService("Players").LocalPlayer.Character,
        [4] = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,
        [5] = game:GetService("Players").LocalPlayer.Character.Humanoid,
        [6] = math.huge,
        [7] = "ground_slash"
    }

    while isToggleEnabled do -- Добавляем проверку состояния переключателя в условие цикла
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh1, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh2, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh3, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh4, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh5, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh6, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh7, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh8, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh9, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh10, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh11, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh12, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh13, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh14, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh15, 1, 9))
        game:GetService("ReplicatedStorage").Remotes.To_Server.Handle_Initiate_S:FireServer(unpack(oh16, 1, 9))

        wait(2) -- Добавляем задержку в 1 секунду перед следующей итерацией цикла
    end
end
end)

-- This should print to the console: "My toggle state changed! New value: false"
KillAura2Toggle:SetValue(false)


local RightGroupBox = Tabs.Main:AddRightGroupbox('🎮 | Auto Skills | 🎮')

local Autoskills = RightGroupBox:AddToggle('Autoskills', {
    Text = 'Use Skills',
    Default = false,
})

--Auto Skills
Autoskills:OnChanged(function(t)
    getgenv().AutoUseSkills = t
end)

Autoskills:SetValue(false)

local AutoskillsZ = RightGroupBox:AddToggle('Autoskills', {
    Text = 'Z',
    Default = false,
})

AutoskillsZ:OnChanged(function(t)
    getgenv().Z = t
end)

AutoskillsZ:SetValue(false)

local AutoskillsX = RightGroupBox:AddToggle('Autoskills', {
    Text = 'X',
    Default = false,
})

AutoskillsX:OnChanged(function(t)
    getgenv().X = t
end)

AutoskillsX:SetValue(false)

local AutoskillsC = RightGroupBox:AddToggle('Autoskills', {
    Text = 'C',
    Default = false,
})

AutoskillsC:OnChanged(function(t)
    getgenv().C = t
end)

AutoskillsC:SetValue(false)

local AutoskillsV = RightGroupBox:AddToggle('Autoskills', {
    Text = 'V',
    Default = false,
})

AutoskillsV:OnChanged(function(t)
    getgenv().V = t
end)

AutoskillsV:SetValue(false)

local AutoskillsB = RightGroupBox:AddToggle('Autoskills', {
    Text = 'B',
    Default = false,
})

AutoskillsB:OnChanged(function(t)
    getgenv().B = t
end)

AutoskillsB:SetValue(false)

local AutoskillsN = RightGroupBox:AddToggle('Autoskills', {
    Text = 'N',
    Default = false,
})

AutoskillsN:OnChanged(function(t)
    getgenv().N = t
end)

AutoskillsN:SetValue(false)


-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('🤖 | Auto Farm | 🤖')


-- Tabboxes are a tiny bit different, but here's a basic example:
--[[

local TabBox = Tabs.Main:AddLeftTabbox() -- Add Tabbox on left side

local Tab1 = TabBox:AddTab('Tab 1')
local Tab2 = TabBox:AddTab('Tab 2')

-- You can now call AddToggle, etc on the tabs you added to the Tabbox
]]

-- Groupbox:AddToggle
-- Arguments: Index, Options
Toggles.Farming = LeftGroupBox:AddToggle('Farming', {
    Text = 'Auto All Bosses',
    Default = false, -- Default value (true / false)
})

Toggles.Farming:OnChanged(function(t)
    isToggleMobsTweenEnabled = t -- Обновляем состояние переключателя
    if t then
        local currentMobFolder = nil -- Переменная для хранения текущей папки моба
        local currentMobName = "" -- Переменная для хранения текущего названия моба
        local attackingMob = nil -- Переменная для хранения ссылки на текущего атакуемого моба

        local noclipE       = false
        local antifall      = false

        local function noclip()
            for i, v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") and v.CanCollide == true then
                    v.CanCollide = false
                    game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                end
            end
        end

        local function TweenToTarget(CFgo)
            local tween_s = game:GetService("TweenService")
            local info = TweenInfo.new((game.Players.LocalPlayer.Character.HumanoidRootPart.Position - CFgo.Position).Magnitude / 400, Enum.EasingStyle.Linear)
            local tween = tween_s:Create(game.Players.LocalPlayer.Character.HumanoidRootPart, info, {CFrame = CFgo})
        
            if not game.Players.LocalPlayer.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                antifall = Instance.new("BodyVelocity", game.Players.LocalPlayer.Character.HumanoidRootPart)
                antifall.Velocity = Vector3.new(0,0,0)
                noclipE = game:GetService("RunService").Stepped:Connect(noclip)
                tween:Play()
                noclip() -- Добавлен вызов функции noclip() после создания BodyVelocity
            end
        
            tween.Completed:Connect(function()
                antifall:Destroy()
                noclipE:Disconnect()
            end)
        end

        local mobsFolder = workspace.Mobs

        local function AttackMob(mob)
            -- Добавьте свой код атаки для моба
        end

        local function FarmMobs()
            local mobFolder = mobsFolder:FindFirstChild(currentMobName)
            if mobFolder and mobFolder:IsA("Folder") then
                for _, mob in pairs(mobFolder:GetChildren()) do
                    if mob:IsA("Model") then
                        if mob:FindFirstChild("HumanoidRootPart") and mob:FindFirstChild("Humanoid") and mob.Humanoid.Health > 0 then
                            if attackingMob and attackingMob.Parent and attackingMob.Parent.Name == currentMobName then
                                -- Продолжаем атаку текущего моба
                                TweenToTarget(attackingMob.HumanoidRootPart.CFrame)
                                AttackMob(attackingMob)
                            else
                                -- Убиваем текущего моба и переходим к следующему
                                attackingMob = mob
                                TweenToTarget(mob.HumanoidRootPart.CFrame)
                                AttackMob(mob)
                                break -- Прерываем цикл после убийства текущего моба
                            end
                        end
                    end
                end
            end
        end

        local plr = game.Players.LocalPlayer
        local rs = game:GetService("RunService").RenderStepped
        local Start = true

        spawn(function()
            while rs:wait() do
                if Start then
                    local newMobFolder = mobsFolder:FindFirstChild(currentMobName)
                    if newMobFolder then
                        FarmMobs()
                    else
                        -- Папка моба исчезла, нужно определить новую папку и имя моба
                        local newMobFolder = mobsFolder:GetChildren()[1]
                        if newMobFolder then
                            currentMobName = newMobFolder.Name
                            FarmMobs()
                        end
                    end
                end
            end
        end)
    end
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Farming:SetValue(false)




--Functions

--Inf Breathing/Stam
spawn(function()
    while task.wait() do
        if getgenv().InfStamina then
            getrenv()._G.AddStamina("gpthebest", 50)
        end
    end
end)

spawn(function()
    while task.wait() do
        if getgenv().InfBreathing then
            getrenv()._G.AddBreath("gpthebest", 50)
        end
    end
end)


--Collect Chest

        spawn(function()
            while task.wait() do
            if AutoCollectChest then
            for _, v in pairs(game:GetService("Workspace").Debree:GetChildren()) do
            if v.Name == "Loot_Chest" then
            for _, c in pairs(v:FindFirstChild("Drops"):GetChildren()) do
            if game:GetService("ReplicatedStorage")["Player_Data"][game.Players.LocalPlayer.Name].Inventory.Items:FindFirstChild(c.Name) then
            local args = { [1] = c.Name }
            v["Add_To_Inventory"]:InvokeServer(unpack(args))
            delay(0.5, function() c:Destroy() end)
            else
            local args = { [1] = c.Name }
            v["Add_To_Inventory"]:InvokeServer(unpack(args))
            delay(0.5, function() c:Destroy() end)
            end
            end
            end
            end
            end
            end
            end)


            --Skills
spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().Z and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("Z")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)


spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().X and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("X")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().C and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("C")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().V and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("V")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().B and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("B")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

spawn(function()
    while task.wait() do
        pcall(function()
            if SkillActive then
                if AutoUseSkills and getgenv().N and not UsingSkill then
                    for i = 1,7 do
                        UsingSkill = true
                        SkillBind("N")
                    end              
                    UsingSkill = false
                end
            end
        end)
    end
end)

local MyButton = LeftGroupBox:AddButton('Button', function()
    print('You clicked a button!')
end)

-- Button:AddButton
-- Arguments: Text, Callback
-- Adds a sub button to the side of the main button

local MyButton2 = MyButton:AddButton('Sub button', function()
    print('You clicked a sub button!')
end)

-- Button:AddTooltip
-- Arguments: ToolTip

MyButton:AddTooltip('This is a button')
MyButton2:AddTooltip('This is a sub button')

-- NOTE: You can chain the button methods!
--[[
    EXAMPLE: 

    LeftGroupBox:AddButton('Kill all', Functions.KillAll):AddTooltip('This will kill everyone in the game!')
        :AddButton('Kick all', Functions.KickAll):AddTooltip('This will kick everyone in the game!')
]]

-- Groupbox:AddLabel
-- Arguments: Text, DoesWrap
LeftGroupBox:AddLabel('This is a label')
LeftGroupBox:AddLabel('This is a label\n\nwhich wraps its text!', true)

-- Groupbox:AddDivider
-- Arguments: None
LeftGroupBox:AddDivider()

-- Groupbox:AddSlider
-- Arguments: Idx, Options
LeftGroupBox:AddSlider('MySlider', {
    Text = 'This is my slider!',

    -- Text, Default, Min, Max, Rounding must be specified.
    -- Rounding is the number of decimal places for precision.

    -- Example:
    -- Rounding 0 - 5
    -- Rounding 1 - 5.1
    -- Rounding 2 - 5.15
    -- Rounding 3 - 5.155

    Default = 0,
    Min = 0,
    Max = 5,
    Rounding = 1,

    Compact = false, -- If set to true, then it will hide the label
})

-- Options is a table added to getgenv() by the library
-- You index Options with the specified index, in this case it is 'MySlider'
-- To get the value of the slider you do slider.Value

local Number = Options.MySlider.Value
Options.MySlider:OnChanged(function()
    print('MySlider was changed! New value:', Options.MySlider.Value)
end)

-- This should print to the console: "MySlider was changed! New value: 3"
Options.MySlider:SetValue(3)

-- Groupbox:AddInput
-- Arguments: Idx, Info
LeftGroupBox:AddInput('MyTextbox', {
    Default = 'My textbox!',
    Numeric = false, -- true / false, only allows numbers
    Finished = false, -- true / false, only calls callback when you press enter

    Text = 'This is a textbox',
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the textbox

    Placeholder = 'Placeholder text', -- placeholder text when the box is empty
    -- MaxLength is also an option which is the max length of the text
})

Options.MyTextbox:OnChanged(function()
    print('Text updated. New text:', Options.MyTextbox.Value)
end)

-- Groupbox:AddDropdown
-- Arguments: Idx, Info

LeftGroupBox:AddDropdown('MyDropdown', {
    Values = { 'This', 'is', 'a', 'dropdown' },
    Default = 1, -- number index of the value / string
    Multi = false, -- true / false, allows multiple choices to be selected

    Text = 'A dropdown',
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the textbox
})

Options.MyDropdown:OnChanged(function()
    print('Dropdown got changed. New value:', Options.MyDropdown.Value)
end)

Options.MyDropdown:SetValue('This')

-- Multi dropdowns
LeftGroupBox:AddDropdown('MyMultiDropdown', {
    -- Default is the numeric index (e.g. "This" would be 1 since it if first in the values list)
    -- Default also accepts a string as well

    -- Currently you can not set multiple values with a dropdown

    Values = { 'This', 'is', 'a', 'dropdown' },
    Default = 1, 
    Multi = true, -- true / false, allows multiple choices to be selected

    Text = 'A dropdown',
    Tooltip = 'This is a tooltip', -- Information shown when you hover over the textbox
})

Options.MyMultiDropdown:OnChanged(function()
    -- print('Dropdown got changed. New value:', )
    print('Multi dropdown got changed:')
    for key, value in next, Options.MyMultiDropdown.Value do
        print(key, value) -- should print something like This, true
    end
end)

Options.MyMultiDropdown:SetValue({
    This = true,
    is = true,
})

-- Label:AddColorPicker
-- Arguments: Idx, Info

-- You can also ColorPicker & KeyPicker to a Toggle as well

LeftGroupBox:AddLabel('Color'):AddColorPicker('ColorPicker', {
    Default = Color3.new(0, 1, 0), -- Bright green
    Title = 'Some color', -- Optional. Allows you to have a custom color picker title (when you open it)
})

Options.ColorPicker:OnChanged(function()
    print('Color changed!', Options.ColorPicker.Value)
end)

Options.ColorPicker:SetValueRGB(Color3.fromRGB(0, 255, 140))

Library.KeybindFrame.Visible = false; -- todo: add a function for this

Library:OnUnload(function()
    print('Unloaded!')
    Library.Unloaded = true
end)

-- UI Settings
local MenuGroup = Tabs['UI Settings']:AddLeftGroupbox('Menu')

-- I set NoUI so it does not show up in the keybinds menu
MenuGroup:AddButton('Unload', function() Library:Unload() end)
MenuGroup:AddLabel('Menu bind'):AddKeyPicker('MenuKeybind', { Default = 'End', NoUI = true, Text = 'Menu keybind' }) 

Library.ToggleKeybind = Options.MenuKeybind -- Allows you to have a custom keybind for the menu

-- Addons:
-- SaveManager (Allows you to have a configuration system)
-- ThemeManager (Allows you to have a menu theme system)

-- Hand the library over to our managers
ThemeManager:SetLibrary(Library)
SaveManager:SetLibrary(Library)

-- Ignore keys that are used by ThemeManager. 
-- (we dont want configs to save themes, do we?)
SaveManager:IgnoreThemeSettings() 

-- Adds our MenuKeybind to the ignore list 
-- (do you want each config to have a different menu key? probably not.)
SaveManager:SetIgnoreIndexes({ 'MenuKeybind' }) 

-- use case for doing it this way: 
-- a script hub could have themes in a global folder
-- and game configs in a separate folder per game
ThemeManager:SetFolder('UnknownHub')
SaveManager:SetFolder('UnknownHub/lua')

-- Builds our config menu on the right side of our tab
SaveManager:BuildConfigSection(Tabs['UI Settings']) 

-- Builds our theme menu (with plenty of built in themes) on the left side
-- NOTE: you can also call ThemeManager:ApplyToGroupbox to add it to a specific groupbox
ThemeManager:ApplyToTab(Tabs['UI Settings'])

-- You can use the SaveManager:LoadAutoloadConfig() to load a config 
-- which has been marked to be one that auto loads!

-- Library functions
-- Sets the watermark visibility
Library:SetWatermarkVisibility(true)

-- Create a function to format time
local function FormatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor(seconds / 60) % 60
    local remainingSeconds = seconds % 60

    return string.format('%d seconds', remainingSeconds)
end

-- Create a function to update the timer
local function UpdateTimer()
    local timer = 0

    while true do
        -- Update the timer
        timer = timer + 1

        -- Update the watermark text with the timer value
        Library:SetWatermark('UnknownHub\n' .. FormatTime(timer))

        -- Wait for 1 second
        wait(1)
    end
end

-- Start updating the timer
UpdateTimer()