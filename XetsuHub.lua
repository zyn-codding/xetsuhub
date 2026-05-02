-- =====================================================
-- 🔥 XETSHUB UNIVERSAL (ULTRA KECIL + TOMBOL JELAS) 🔥
-- Bisa dipakai di semua game Roblox
-- Developer: @comicrdj2
-- Fitur: Fly+Speed, Noclip, ESP Box+Nama, Aimlock Kepala+FOV
-- =====================================================

-- ========== VARIABEL GLOBAL ==========
local plr = game.Players.LocalPlayer
local mouse = plr:GetMouse()
local run = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local cam = workspace.CurrentCamera
local coreGui = game:GetService("CoreGui")

local function getChar()
    return plr.Character or plr.CharacterAdded:wait()
end

-- ========== HAPUS GUI LAMA JIKA ADA ==========
if coreGui:FindFirstChild("XetsuHub") then
    coreGui:FindFirstChild("XetsuHub"):Destroy()
end

-- ========== GUI UTAMA (ULTRA KECIL + KIRI BAWAH) ==========
local gui = Instance.new("ScreenGui")
gui.Name = "XetsuHub"
gui.Parent = coreGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 260, 0, 360)           -- UKURAN PALING KECIL
frame.Position = UDim2.new(0, 10, 1, -370)       -- KIRI BAWAH
frame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
frame.BorderSizePixel = 0
frame.ClipsDescendants = true
frame.Parent = gui

-- ========== DRAG AREA (SELURUH HEADER) ==========
local dragArea = Instance.new("Frame")
dragArea.Size = UDim2.new(1, 0, 0, 40)
dragArea.BackgroundTransparency = 1
dragArea.BorderSizePixel = 0
dragArea.Parent = frame

local function enableDrag()
    local dragging = false
    local dragStart, startPos
    
    dragArea.InputBegan:Connect(function(input)
        if input.UserInputType == Enum.UserInputType.MouseButton1 then
            dragging = true
            dragStart = input.Position
            startPos = frame.Position
            input.Changed:Connect(function()
                if input.UserInputState == Enum.UserInputState.End then
                    dragging = false
                end
            end)
        end
    end)
    
    dragArea.InputChanged:Connect(function(input)
        if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
            local delta = input.Position - dragStart
            frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
        end
    end)
end
enableDrag()

-- ========== HEADER (tampilan visual) ==========
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -70, 0, 20)
title.Position = UDim2.new(0, 6, 0, 4)
title.Text = "XETSHUB 🔥"
title.TextColor3 = Color3.fromRGB(255, 80, 80)
title.BackgroundTransparency = 1
title.Font = Enum.Font.GothamBold
title.TextSize = 14
title.TextXAlignment = Enum.TextXAlignment.Left
title.Parent = dragArea

local devLabel = Instance.new("TextLabel")
devLabel.Size = UDim2.new(1, -70, 0, 14)
devLabel.Position = UDim2.new(0, 6, 0, 23)
devLabel.Text = "@comicrdj2"
devLabel.TextColor3 = Color3.fromRGB(180, 180, 180)
devLabel.BackgroundTransparency = 1
devLabel.Font = Enum.Font.Gotham
devLabel.TextSize = 8
devLabel.TextXAlignment = Enum.TextXAlignment.Left
devLabel.Parent = dragArea

-- Grip visual (opsional)
local grip = Instance.new("Frame")
grip.Size = UDim2.new(0, 14, 0, 20)
grip.Position = UDim2.new(0, 2, 0, 10)
grip.BackgroundColor3 = Color3.fromRGB(60, 60, 80)
grip.BorderSizePixel = 0
grip.Parent = dragArea

local gripLine1 = Instance.new("Frame")
gripLine1.Size = UDim2.new(0, 8, 0, 1)
gripLine1.Position = UDim2.new(0.5, -4, 0, 5)
gripLine1.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
gripLine1.BorderSizePixel = 0
gripLine1.Parent = grip

local gripLine2 = Instance.new("Frame")
gripLine2.Size = UDim2.new(0, 8, 0, 1)
gripLine2.Position = UDim2.new(0.5, -4, 0, 9)
gripLine2.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
gripLine2.BorderSizePixel = 0
gripLine2.Parent = grip

local gripLine3 = Instance.new("Frame")
gripLine3.Size = UDim2.new(0, 8, 0, 1)
gripLine3.Position = UDim2.new(0.5, -4, 0, 13)
gripLine3.BackgroundColor3 = Color3.fromRGB(150, 150, 150)
gripLine3.BorderSizePixel = 0
gripLine3.Parent = grip

-- Tombol Collapse (-) DIPERBESAR BIAR KELIATAN
local collapseBtn = Instance.new("TextButton")
collapseBtn.Size = UDim2.new(0, 32, 0, 26)
collapseBtn.Position = UDim2.new(1, -68, 0, 7)
collapseBtn.Text = "−"
collapseBtn.TextColor3 = Color3.fromRGB(255,255,255)
collapseBtn.BackgroundColor3 = Color3.fromRGB(70,70,90)
collapseBtn.BorderSizePixel = 0
collapseBtn.Font = Enum.Font.GothamBold
collapseBtn.TextSize = 20
collapseBtn.Parent = dragArea

-- Tombol Close (X) DIPERBESAR
local closeBtn = Instance.new("TextButton")
closeBtn.Size = UDim2.new(0, 32, 0, 26)
closeBtn.Position = UDim2.new(1, -34, 0, 7)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.fromRGB(255,255,255)
closeBtn.BackgroundColor3 = Color3.fromRGB(200,0,0)
closeBtn.BorderSizePixel = 0
closeBtn.Font = Enum.Font.GothamBold
closeBtn.TextSize = 16
closeBtn.Parent = dragArea

-- Powered By label
local poweredLabel = Instance.new("TextLabel")
poweredLabel.Size = UDim2.new(1, -60, 0, 16)
poweredLabel.Position = UDim2.new(0, 6, 0, 20)
poweredLabel.Text = "Powered By : @comicrdj2"
poweredLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
poweredLabel.BackgroundTransparency = 1
poweredLabel.Font = Enum.Font.Gotham
poweredLabel.TextSize = 8
poweredLabel.TextXAlignment = Enum.TextXAlignment.Left
poweredLabel.Visible = false
poweredLabel.Parent = dragArea

-- ========== CONTENT FRAME ==========
local contentFrame = Instance.new("ScrollingFrame")
contentFrame.Size = UDim2.new(1, 0, 1, -40)
contentFrame.Position = UDim2.new(0, 0, 0, 40)
contentFrame.BackgroundColor3 = Color3.fromRGB(20, 20, 30)
contentFrame.BorderSizePixel = 0
contentFrame.CanvasSize = UDim2.new(0, 0, 0, 450)
contentFrame.ScrollBarThickness = 4
contentFrame.Parent = frame

local listLayout = Instance.new("UIListLayout")
listLayout.Parent = contentFrame
listLayout.Padding = UDim.new(0, 4)
listLayout.SortOrder = Enum.SortOrder.LayoutOrder

-- ========== FUNGSI COLLAPSE ==========
local isCollapsed = false
local function toggleCollapse()
    isCollapsed = not isCollapsed
    if isCollapsed then
        frame.Size = UDim2.new(0, 260, 0, 40)
        contentFrame.Visible = false
        title.Visible = false
        devLabel.Visible = false
        grip.Visible = false
        poweredLabel.Visible = true
        collapseBtn.Text = "+"
    else
        frame.Size = UDim2.new(0, 260, 0, 360)
        contentFrame.Visible = true
        title.Visible = true
        devLabel.Visible = true
        grip.Visible = true
        poweredLabel.Visible = false
        collapseBtn.Text = "−"
    end
end
collapseBtn.MouseButton1Click:Connect(toggleCollapse)
closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- ========== 1. FLY ==========
local flyActive = false
local flySpeed = 100
local bodyVel = nil
local flyConnection = nil

local flyBtn = Instance.new("TextButton")
flyBtn.Size = UDim2.new(0.9, 0, 0, 30)
flyBtn.Text = "✈️ FLY (F) - OFF"
flyBtn.TextColor3 = Color3.fromRGB(255,255,255)
flyBtn.BackgroundColor3 = Color3.fromRGB(45,45,60)
flyBtn.BorderSizePixel = 0
flyBtn.Font = Enum.Font.Gotham
flyBtn.TextSize = 11
flyBtn.Parent = contentFrame

local speedLabel = Instance.new("TextLabel")
speedLabel.Size = UDim2.new(0.9, 0, 0, 14)
speedLabel.Text = "🚀 SPEED: " .. flySpeed
speedLabel.TextColor3 = Color3.fromRGB(255,255,255)
speedLabel.BackgroundColor3 = Color3.fromRGB(35,35,45)
speedLabel.BorderSizePixel = 0
speedLabel.Font = Enum.Font.Gotham
speedLabel.TextSize = 9
speedLabel.Parent = contentFrame

local speedSlider = Instance.new("TextButton")
speedSlider.Size = UDim2.new(0.9, 0, 0, 24)
speedSlider.Text = "50|100|150|200|300"
speedSlider.TextColor3 = Color3.fromRGB(255,255,255)
speedSlider.BackgroundColor3 = Color3.fromRGB(55,55,70)
speedSlider.BorderSizePixel = 0
speedSlider.Font = Enum.Font.Gotham
speedSlider.TextSize = 9
speedSlider.Parent = contentFrame

local speedValues = {50, 100, 150, 200, 300}
local speedIndex = 2
flySpeed = speedValues[speedIndex]
speedLabel.Text = "🚀 SPEED: " .. flySpeed
speedSlider.MouseButton1Click:Connect(function()
    speedIndex = speedIndex % #speedValues + 1
    flySpeed = speedValues[speedIndex]
    speedLabel.Text = "🚀 SPEED: " .. flySpeed
end)

flyBtn.MouseButton1Click:Connect(function()
    flyActive = not flyActive
    flyBtn.Text = flyActive and "✈️ FLY (F) - ON ✅" or "✈️ FLY (F) - OFF"
    flyBtn.BackgroundColor3 = flyActive and Color3.fromRGB(0,120,0) or Color3.fromRGB(45,45,60)
    
    if flyActive then
        local root = getChar():FindFirstChild("HumanoidRootPart")
        if root then
            bodyVel = Instance.new("BodyVelocity")
            bodyVel.MaxForce = Vector3.new(100000,100000,100000)
            bodyVel.Parent = root
            if flyConnection then flyConnection:Disconnect() end
            flyConnection = run.RenderStepped:Connect(function()
                if not flyActive or not getChar() then
                    if bodyVel then bodyVel:Destroy() end
                    return
                end
                local move = Vector3.new()
                if uis:IsKeyDown(Enum.KeyCode.W) then move = move + Vector3.new(0,0,-flySpeed) end
                if uis:IsKeyDown(Enum.KeyCode.S) then move = move + Vector3.new(0,0,flySpeed) end
                if uis:IsKeyDown(Enum.KeyCode.A) then move = move + Vector3.new(-flySpeed,0,0) end
                if uis:IsKeyDown(Enum.KeyCode.D) then move = move + Vector3.new(flySpeed,0,0) end
                if uis:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0,flySpeed,0) end
                if uis:IsKeyDown(Enum.KeyCode.LeftShift) then move = move + Vector3.new(0,-flySpeed,0) end
                move = cam.CFrame:VectorToWorldSpace(move)
                if bodyVel then bodyVel.Velocity = move end
            end)
        end
    else
        if bodyVel then bodyVel:Destroy() end
        if flyConnection then flyConnection:Disconnect() end
    end
end)

-- ========== 2. NOCLIP ==========
local noclipActive = false
local noclipBtn = Instance.new("TextButton")
noclipBtn.Size = UDim2.new(0.9, 0, 0, 30)
noclipBtn.Text = "🧱 NOCLIP (N) - OFF"
noclipBtn.TextColor3 = Color3.fromRGB(255,255,255)
noclipBtn.BackgroundColor3 = Color3.fromRGB(45,45,60)
noclipBtn.BorderSizePixel = 0
noclipBtn.Font = Enum.Font.Gotham
noclipBtn.TextSize = 11
noclipBtn.Parent = contentFrame
noclipBtn.MouseButton1Click:Connect(function()
    noclipActive = not noclipActive
    noclipBtn.Text = noclipActive and "🧱 NOCLIP (N) - ON ✅" or "🧱 NOCLIP (N) - OFF"
    noclipBtn.BackgroundColor3 = noclipActive and Color3.fromRGB(0,120,0) or Color3.fromRGB(45,45,60)
    
    run.Stepped:Connect(function()
        if noclipActive and getChar() then
            for _, part in pairs(getChar():GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = false end
            end
        elseif getChar() then
            for _, part in pairs(getChar():GetDescendants()) do
                if part:IsA("BasePart") then part.CanCollide = true end
            end
        end
    end)
end)

-- ========== 3. ESP BOX + NAMA ==========
local espActive = false
local espObjects = {}

local espBtn = Instance.new("TextButton")
espBtn.Size = UDim2.new(0.9, 0, 0, 30)
espBtn.Text = "📦 ESP BOX + NAMA - OFF"
espBtn.TextColor3 = Color3.fromRGB(255,255,255)
espBtn.BackgroundColor3 = Color3.fromRGB(45,45,60)
espBtn.BorderSizePixel = 0
espBtn.Font = Enum.Font.Gotham
espBtn.TextSize = 11
espBtn.Parent = contentFrame

local function clearESP()
    for _, obj in pairs(espObjects) do
        if obj and obj.Parent then obj:Destroy() end
    end
    espObjects = {}
end

local function updateESP()
    if not espActive then return end
    clearESP()
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= plr and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
            local rootPart = p.Character.HumanoidRootPart
            local highlight = Instance.new("Highlight")
            highlight.FillColor = Color3.fromRGB(255, 70, 70)
            highlight.OutlineColor = Color3.fromRGB(255,255,255)
            highlight.FillTransparency = 0.6
            highlight.Parent = p.Character
            table.insert(espObjects, highlight)
            
            local billboard = Instance.new("BillboardGui")
            billboard.Size = UDim2.new(0, 130, 0, 28)
            billboard.StudsOffset = Vector3.new(0, 2, 0)
            billboard.AlwaysOnTop = true
            billboard.Parent = rootPart
            
            local nameLabel = Instance.new("TextLabel")
            nameLabel.Size = UDim2.new(1, 0, 1, 0)
            nameLabel.BackgroundTransparency = 1
            nameLabel.Text = p.Name
            nameLabel.TextColor3 = Color3.fromRGB(255,255,255)
            nameLabel.TextStrokeTransparency = 0.2
            nameLabel.TextScaled = true
            nameLabel.Font = Enum.Font.GothamBold
            nameLabel.Parent = billboard
            table.insert(espObjects, billboard)
        end
    end
end

espBtn.MouseButton1Click:Connect(function()
    espActive = not espActive
    espBtn.Text = espActive and "📦 ESP - ON ✅" or "📦 ESP - OFF"
    espBtn.BackgroundColor3 = espActive and Color3.fromRGB(0,120,0) or Color3.fromRGB(45,45,60)
    if espActive then
        updateESP()
        spawn(function()
            while espActive do
                updateESP()
                task.wait(1)
            end
        end)
    else
        clearESP()
    end
end)

-- ========== 4. AIMLOCK KEPALA + FOV ==========
local aimlockActive = false
local aimlockFOV = 50

local aimlockBtn = Instance.new("TextButton")
aimlockBtn.Size = UDim2.new(0.9, 0, 0, 30)
aimlockBtn.Text = "🎯 AIMLOCK - OFF"
aimlockBtn.TextColor3 = Color3.fromRGB(255,255,255)
aimlockBtn.BackgroundColor3 = Color3.fromRGB(45,45,60)
aimlockBtn.BorderSizePixel = 0
aimlockBtn.Font = Enum.Font.Gotham
aimlockBtn.TextSize = 11
aimlockBtn.Parent = contentFrame

aimlockBtn.MouseButton1Click:Connect(function()
    aimlockActive = not aimlockActive
    aimlockBtn.Text = aimlockActive and "🎯 AIMLOCK - ON ✅" or "🎯 AIMLOCK - OFF"
    aimlockBtn.BackgroundColor3 = aimlockActive and Color3.fromRGB(0,120,0) or Color3.fromRGB(45,45,60)
end)

local fovLabel = Instance.new("TextLabel")
fovLabel.Size = UDim2.new(0.9, 0, 0, 14)
fovLabel.Text = "🎯 FOV: " .. aimlockFOV .. "%"
fovLabel.TextColor3 = Color3.fromRGB(255,255,255)
fovLabel.BackgroundColor3 = Color3.fromRGB(35,35,45)
fovLabel.BorderSizePixel = 0
fovLabel.Font = Enum.Font.Gotham
fovLabel.TextSize = 9
fovLabel.Parent = contentFrame

local fovSlider = Instance.new("TextButton")
fovSlider.Size = UDim2.new(0.9, 0, 0, 24)
fovSlider.Text = "1%|25%|50%|75%|100%"
fovSlider.TextColor3 = Color3.fromRGB(255,255,255)
fovSlider.BackgroundColor3 = Color3.fromRGB(55,55,70)
fovSlider.BorderSizePixel = 0
fovSlider.Font = Enum.Font.Gotham
fovSlider.TextSize = 9
fovSlider.Parent = contentFrame

local fovValues = {1, 25, 50, 75, 100}
local fovIndex = 3
aimlockFOV = fovValues[fovIndex]
fovLabel.Text = "🎯 FOV: " .. aimlockFOV .. "%"
fovSlider.MouseButton1Click:Connect(function()
    fovIndex = fovIndex % #fovValues + 1
    aimlockFOV = fovValues[fovIndex]
    fovLabel.Text = "🎯 FOV: " .. aimlockFOV .. "%"
end)

local function getFOVPixel()
    local halfScreen = cam.ViewportSize.X / 2
    return (aimlockFOV / 100) * halfScreen
end

local function getHeadPosition(character)
    if character and character:FindFirstChild("Head") then
        return character.Head.Position
    elseif character and character:FindFirstChild("HumanoidRootPart") then
        return character.HumanoidRootPart.Position + Vector3.new(0, 1.5, 0)
    end
    return nil
end

run.RenderStepped:Connect(function()
    if not aimlockActive then return end
    local closest = nil
    local closestDist = math.huge
    local fovPx = getFOVPixel()
    local center = cam.ViewportSize / 2
    
    for _, p in pairs(game.Players:GetPlayers()) do
        if p ~= plr and p.Character and p.Character:FindFirstChild("Humanoid") and p.Character.Humanoid.Health > 0 then
            local headPos = getHeadPosition(p.Character)
            if headPos then
                local screenPoint, onScreen = cam:WorldToScreenPoint(headPos)
                if onScreen then
                    local dist = (Vector2.new(screenPoint.X, screenPoint.Y) - center).magnitude
                    if dist < fovPx and dist < closestDist then
                        closest = headPos
                        closestDist = dist
                    end
                end
            end
        end
    end
    if closest then
        cam.CFrame = CFrame.new(cam.CFrame.Position, closest)
    end
end)

-- ========== UPDATE CANVAS SIZE ==========
task.wait(0.2)
local count = 0
for _, child in pairs(contentFrame:GetChildren()) do
    if child:IsA("TextButton") or child:IsA("TextLabel") or child:IsA("TextBox") then
        count = count + 1
    end
end
contentFrame.CanvasSize = UDim2.new(0, 0, 0, count * 34 + 40)

print("✅ XETSHUB UNIVERSAL LOADED | @comicrdj2")
