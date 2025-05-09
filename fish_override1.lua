-- Variabili per tenere traccia dello stato
local isActive = false
local guiVisible = true

-- Creazione della GUI
local player = game.Players.LocalPlayer
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = player.PlayerGui

-- Frame della GUI
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0.3, 0, 0.4, 0)
frame.Position = UDim2.new(0.35, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.BackgroundTransparency = 0.5
frame.Parent = screenGui

-- Tasto di chiusura
local closeButton = Instance.new("TextButton")
closeButton.Size = UDim2.new(0, 100, 0, 50)
closeButton.Position = UDim2.new(0.5, -50, 0, -60)
closeButton.Text = "Chiudi"
closeButton.Parent = frame
closeButton.MouseButton1Click:Connect(function()
    screenGui.Enabled = false
    guiVisible = false
end)

-- Menu a tendina per la selezione del pesce
local dropDown = Instance.new("TextButton")
dropDown.Size = UDim2.new(0, 200, 0, 50)
dropDown.Position = UDim2.new(0.5, -100, 0, 20)
dropDown.Text = "Seleziona Pesce"
dropDown.Parent = frame

local optionFrame = Instance.new("Frame")
optionFrame.Size = UDim2.new(0, 200, 0, 500)  -- Espanso per aggiungere tutti i pesci
optionFrame.Position = UDim2.new(0.5, -100, 0, 80)
optionFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
optionFrame.BackgroundTransparency = 0.7
optionFrame.Visible = false
optionFrame.Parent = frame

-- Lista dei pesci (Aggiunta della tua lista)
local fishList = {
    -- Roslit Volcano
    "Roslit Volcano", "Ember Snapper", "Volcanic Geode", "Obsidian Salmon", "Obsidian Swordfish",
    -- Snowcap Island
    "Herring", "Arctic Char", "Glacier Pike", "Pond Emperor", "Glacierfish",
    -- Mushgrove Swamp
    "Swamp Bass", "Bowfin", "Marsh Gar", "Alligator",
    -- The Ocean
    "Haddock", "Mackerel", "Sea Bass",
    -- Terrapin Island
    "Smallmouth Bass", "White Bass", "Golden Smallmouth Bass",
    -- Brine Pool
    "Gazerfish", "Globe Jellyfish", "Eyefestation",
    -- Desolate Deep
    "Skate Tuna", "Phantom Ray", "Cockatoo Squid",
    -- Forsaken Shores
    "Shortfin Mako Shark", "Galleon Goliath", "Shipwreck Barracuda", "Captain’s Goldfish",
    -- The Depths
    "Deep-Sea Hatchetfish", "Deep-Sea Dragonfish",
    -- Frightful Pool (Evento Halloween)
    "Candy Fish", "Skelefish",
    -- Evento LEGO
    "Lego Fish",
    -- Pesci Rari e Mitici
    "Phantom Megalodon", "Megalodon", "Ancient Megalodon"
}

-- Creazione dei bottoni per ogni pesce
for i, fish in ipairs(fishList) do
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(1, 0, 0, 30)
    button.Position = UDim2.new(0, 0, (i-1) * 0.05, 0)
    button.Text = fish
    button.Parent = optionFrame
    button.MouseButton1Click:Connect(function()
        print("Pesce selezionato: " .. fish)
        optionFrame.Visible = false
    end)
end

dropDown.MouseButton1Click:Connect(function()
    optionFrame.Visible = not optionFrame.Visible  -- Toggle menu a tendina
end)

-- Funzione per aprire/chiudere la GUI con il tasto F
game:GetService("UserInputService").InputBegan:Connect(function(input)
    if input.KeyCode == Enum.KeyCode.F then  -- Cambia F con qualsiasi altro tasto che vuoi usare
        guiVisible = not guiVisible
        screenGui.Enabled = guiVisible
    end
end)

-- La GUI si apre automaticamente quando lo script è lanciato
print("Script avviato! Premi F per aprire/chiudere la GUI.")
