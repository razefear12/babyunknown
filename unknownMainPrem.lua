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

    Title = 'UnknownHub | Project Slayers 👺 (Premium)',
    Center = true, 
    AutoShow = true,
})

-- You do not have to set your tabs & groups up this way, just a prefrence.
local Tabs = {
    -- Creates a new tab titled Main
    Main = Window:AddTab('Main'), 
    ['UI Settings'] = Window:AddTab('UI Settings'),
}

-- Groupbox and Tabbox inherit the same functions
-- except Tabboxes you have to call the functions on a tab (Tabbox:AddTab(name))
local LeftGroupBox = Tabs.Main:AddLeftGroupbox('💪 | Player Buffs | 💪')


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

Toggles.Misc:OnChanged(function()
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Stamina.Disabled = true
    wait(0.5)
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Stamina.Disabled = false
    wait(0.5)
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Stamina.Disabled = true
end)


-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Misc:SetValue(false)

LeftGroupBox:AddToggle('Misc', {
    Text = 'Inf Breathing',
    Default = false, -- Default value (true / false)
})

Toggles.Misc:OnChanged(function()
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Breathing.Disabled = true
    wait(0.5)
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Breathing.Disabled = false
    wait(0.5)
    game:GetService("Players").LocalPlayer.PlayerScripts.Small_Scripts.Gameplay.Breathing.Disabled = true
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
    Text = 'Kamado Heal (Only Demon)',
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
LeftGroupBox:AddToggle('Farming', {
    Text = 'Auto All Bosses',
    Default = false, -- Default value (true / false)
})

Toggles.Farming:OnChanged(function(value)
    getgenv().AllBosses = value
end)

-- This should print to the console: "My toggle state changed! New value: false"
Toggles.Farming:SetValue(false)


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


 -- Farm Method
spawn(function()
    while wait() do
        pcall(function()
            SkillActive = AutoUseSkills and (FarmBoss and NearestMobs) or AutoUseSkills and (FarmQuest and NearestMobs) or AutoUseSkills and (FarmMob and NearestMobs) or AutoUseSkills and (AllBosses and NearestMobs)
            if FarmMethod == "Above" then
                FarmModes = CFrame.new(0,getgenv().Distance,0) * CFrame.Angles(math.rad(-90),0,0) 
            elseif FarmMethod == "Below" then
                FarmModes = CFrame.new(0,-getgenv().Distance,0) * CFrame.Angles(math.rad(90),0,0)
            elseif FarmMethod == "Behind" then
                FarmModes = CFrame.new(0,0,getgenv().Distance)
            end
            for i,v in pairs(LP.PlayerGui.MainGuis.Items.Scroll:GetChildren()) do
                Insert = true
                if v.ClassName == "Frame" and v.Name ~= "Health Elixir" and v.Name ~= "Health Regen Elixir" and v.Name ~= "Stamina Elixir" and v.Name ~= "Bandage" then
                    for i,v2 in pairs(invTable) do if v2 == v.Name then Insert = false end end
                    if Insert == true then table.insert(invTable, v.Name) end
                end
            end
        end)
    end
end)

-- No Clip
spawn(function()
    game:GetService("RunService").Stepped:Connect(function()
        if getgenv().AllBosses or TPtoVillage or TPtoTrainer or getgenv().GotoMuzan or FarmBoss then
            for _, v in pairs(game:GetService("Players").LocalPlayer.Character:GetDescendants()) do
                if v:IsA("BasePart") then
                    v.CanCollide = false    
                end
                if v:IsA("Humanoid") then
                    v:ChangeState(11)
                end
            end
        end
    end)
end)

local BossesTable = {"Slasher", "Nomay Bandit Boss", "Rengoku", "Inosuke","Renpeke","Muichiro Tokito","Enme","Swampy","Akeza"}
local BossCFTable = {
    ["Nomay Bandit Boss"] = CFrame.new(3519, 673, -1898),
    ["Slasher"] = CFrame.new(950, 487, -1353),
    Rengoku = CFrame.new(3651, 673, -345),
    Inosuke = CFrame.new(1618, 300, -417),
    Akaza = CFrame.new(1970, 556, -142),
    Renpeke = CFrame.new(-1193, 601, -558),
    ["Muichiro Tokito"] = CFrame.new(4431, 673, -440),
    Enme = CFrame.new(1577, 483, -681),
    Swampy = CFrame.new(-1301, 601, -283),
}

local LP = game.Players.LocalPlayer

local function GetHuman()
    local humanoid = LP.Character
    humanoid = humanoid and (humanoid:FindFirstChild("Humanoid") or humanoid:FindFirstChildWhichIsA("Humanoid"))
    return humanoid or workspace.CurrentCamera.CameraSubject
end

local GramxProjectFloat = tostring(math.random(0, 100000))
local TweenFloatVelocity = Vector3.new(0,0,0)

function CreateTweenFloat()
    local BV = LP.Character.HumanoidRootPart:FindFirstChild(GramxProjectFloat) or Instance.new("BodyVelocity")
    BV.Parent = LP.Character.HumanoidRootPart
    BV.Name = GramxProjectFloat
    BV.MaxForce = Vector3.new(100000, 100000, 100000)
    BV.Velocity = TweenFloatVelocity
end

local function GetDistance(Endpoint)
    if typeof(Endpoint) == "Instance" or typeof(Endpoint) == "CFrame" then
        Endpoint = Vector3.new(Endpoint.Position.X, LP.Character.HumanoidRootPart.Position.Y, Endpoint.Position.Z)
    end
    local Magnitude = (Endpoint - LP.Character.HumanoidRootPart.Position).Magnitude
    return Magnitude
end

local function Tween(Endpoint)
    if typeof(Endpoint) == "Instance" then
        Endpoint = Endpoint.CFrame
    end
    local TweenFunc = {}
    local Distance = GetDistance(Endpoint)
    local TweenInfo = game:GetService("TweenService"):Create(LP.Character.HumanoidRootPart, TweenInfo.new(Distance/getgenv().tweenspeed, Enum.EasingStyle.Linear), {CFrame = Endpoint * CFrame.fromAxisAngle(Vector3.new(1,0,0), math.rad(0))})
    TweenInfo:Play()
    function TweenFunc:Cancel()
        TweenInfo:Cancel()
        return false
    end
    if Distance <= 100 then
        LP.Character.HumanoidRootPart.CFrame = Endpoint
        TweenInfo:Cancel()
        return false
    end
    return TweenFunc
end

local antifall3

-- AutoFarm All Bosses
spawn(function()
    while wait() do
        pcall(function()
            if getgenv().AllBosses then
                if not LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    antifall3 = Instance.new("BodyVelocity", LP.Character.HumanoidRootPart)
                    antifall3.Velocity = Vector3.new(0, 0, 0)
                    antifall3.MaxForce = Vector3.new(9e9, 9e9, 9e9)
                elseif LP.Character.HumanoidRootPart:FindFirstChild("BodyVelocity") then
                    for i,v in pairs(game:GetService("Workspace").Mobs:GetDescendants()) do
                        if table.find(BossesTable, v.Name) and v:IsA("Model") and v:FindFirstChild("Humanoid") then
                            if v.Humanoid.Health > 0 then
                                repeat wait()
                                    local bossCFrame = BossCFTable[v.Name] -- Get the boss's CFrame from the BossCFTable
                                    if GetDistance(bossCFrame) < 25 and GetDistance(bossCFrame) < 150 then
                                        if TweenFa then
                                            TweenFa:Cancel()
                                            wait(0.1)
                                        end
                                        LP.Character.HumanoidRootPart.CFrame = bossCFrame
                                    else
                                        TweenFa = Tween(bossCFrame)
                                    end
                                    if v.Humanoid.Health > 0 and v:FindFirstChild("Humanoid") and v:FindFirstChild("HumanoidRootPart") and GetDistance(bossCFrame) < 10 then
                                        NearestMobs = true
                                    elseif v.Humanoid.Health <= 0 or not v:FindFirstChild("Humanoid") and GetDistance(bossCFrame) > 10 then
                                        NearestMobs = false
                                    end
                                until not getgenv().AllBosses or not v.Parent or v.Humanoid.Health <= 0 or not v:IsDescendantOf(workspace)
                                NearestMobs = false
                            end
                        end
                    end
                end
            else
                antifall3:Destroy()
            end
            if getgenv().AllBosses == false then
                if TweenFa then
                    TweenFa:Cancel()
                end
            end
        end)
    end
end)


-- Groupbox:AddButton
-- Arguments: Text, Callback

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

--[[
LeftGroupBox:AddLabel('Keybind'):AddKeyPicker('KeyPicker', {
    -- SyncToggleState only works with toggles. 
    -- It allows you to make a keybind which has its state synced with its parent toggle

    -- Example: Keybind which you use to toggle flyhack, etc.
    -- Changing the toggle disables the keybind state and toggling the keybind switches the toggle state

    Default = 'MB2', -- String as the name of the keybind (MB1, MB2 for mouse buttons)  
    SyncToggleState = false, 


    -- You can define custom Modes but I have never had a use for it.
    Mode = 'Toggle', -- Modes: Always, Toggle, Hold

    Text = 'Auto lockpick safes', -- Text to display in the keybind menu
    NoUI = false, -- Set to true if you want to hide from the Keybind menu,
})

-- OnClick is only fired when you press the keybind and the mode is Toggle
-- Otherwise, you will have to use Keybind:GetState()
Options.KeyPicker:OnClick(function()
    print('Keybind clicked!', Options.KeyPicker.Value)
end)

task.spawn(function()
    while true do
        wait(1)

        -- example for checking if a keybind is being pressed
        local state = Options.KeyPicker:GetState()
        if state then
            print('KeyPicker is being held down')
        end

        if Library.Unloaded then break end
    end
end)

Options.KeyPicker:SetValue({ 'MB2', 'Toggle' }) -- Sets keybind to MB2, mode to Hold
]]

-- Library functions
-- Sets the watermark visibility
Library:SetWatermarkVisibility(true)

-- Sets the watermark text
Library:SetWatermark('This is a really long watermark to text the resizing')

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