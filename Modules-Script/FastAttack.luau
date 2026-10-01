local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local RE_RegisterAttack = Net:WaitForChild("RE/RegisterAttack")
local RE_RegisterHit = Net:WaitForChild("RE/RegisterHit")

local capturedChild, RemoteId = nil, nil

local function tryCapture(parent)
	if not parent then return end
	for _, item in ipairs(parent:GetChildren()) do
		if item:IsA("RemoteEvent") then
			local attr = item:GetAttribute("Id")
			if attr then
				RemoteId, capturedChild = attr, item
				return true
			end
		end
	end
	return false
end

for _, name in ipairs({ "Util", "Common", "Remotes", "Assets", "FX" }) do
	local c = ReplicatedStorage:FindFirstChild(name)
	if c then
		tryCapture(c)
		c.ChildAdded:Connect(function(ch)
			if ch:IsA("RemoteEvent") and ch:GetAttribute("Id") then
				RemoteId, capturedChild = ch:GetAttribute("Id"), ch
			end
		end)
	end
end

getgenv().FastAttack = getgenv().FastAttack or {}
local CFG = getgenv().FastAttack

CFG.Enabled = CFG.Enabled ~= false
CFG.Range = CFG.Range or 90
CFG.AttackPlayers = CFG.AttackPlayers == true
CFG.AttackMobs = CFG.AttackMobs ~= false
CFG.MultiHitCount = CFG.MultiHitCount or 3
CFG.MultiHitDelay = CFG.MultiHitDelay or 0.02
CFG.LoopDelay = CFG.LoopDelay or 0.01
CFG.MeleeDelay = CFG.MeleeDelay or 0.12
CFG.UseObfuscated = CFG.UseObfuscated ~= false
CFG.VisualActivate = CFG.VisualActivate ~= false
CFG.Paralyze = CFG.Paralyze ~= false
CFG.ParalyzeTick = CFG.ParalyzeTick or 0.01
CFG.DarkMode = CFG.DarkMode ~= false
CFG.Seriality = CFG.Seriality ~= false
CFG.DarkTick = CFG.DarkTick or 0.05

CFG.HitboxLimbs = CFG.HitboxLimbs or {
	"RightLowerArm", "RightUpperArm", "LeftLowerArm", "LeftUpperArm",
	"RightHand", "LeftHand", "RightLowerLeg", "LeftLowerLeg",
	"RightUpperLeg", "LeftUpperLeg", "RightFoot", "LeftFoot",
	"Head", "Torso", "HumanoidRootPart", "UpperTorso", "LowerTorso",
}

local function isAlive(m)
	local h = m and m:FindFirstChildOfClass("Humanoid")
	return h and h.Health > 0
end

local function getHitbox(m)
	for _ = 1, 6 do
		local name = CFG.HitboxLimbs[math.random(#CFG.HitboxLimbs)]
		local part = m:FindFirstChild(name)
		if part and part:IsA("BasePart") then return part end
	end
	return m:FindFirstChild("HumanoidRootPart") or m:FindFirstChild("Head")
end

local function collectTargets(char)
	local root = char:FindFirstChild("HumanoidRootPart")
	if not root then return {} end
	local pos = root.Position
	local list = {}

	local function scan(folder)
		if not folder then return end
		for _, e in ipairs(folder:GetChildren()) do
			if e ~= char and isAlive(e) then
				local rp = e:FindFirstChild("HumanoidRootPart")
				if rp and (rp.Position - pos).Magnitude <= CFG.Range then
					list[#list + 1] = e
				end
			end
		end
	end

	if CFG.AttackMobs then scan(workspace:FindFirstChild("Enemies")) end
	if CFG.AttackPlayers then scan(workspace:FindFirstChild("Characters")) end
	return list
end

local function buildConfig(targets)
	local cfg = {}
	for _, e in ipairs(targets) do
		local part = getHitbox(e)
		if part then cfg[#cfg + 1] = { e, part } end
	end
	return cfg
end

local function fireStandard(targets)
	local cfg = buildConfig(targets)
	if #cfg == 0 then return end
	local primary = cfg[1][1]:FindFirstChild("Head") or cfg[1][1]:FindFirstChild("HumanoidRootPart")
	if not primary then return end
	RE_RegisterAttack:FireServer(0)
	RE_RegisterHit:FireServer(primary, cfg)
end

local function fireObfuscated(targets)
	if not (CFG.UseObfuscated and capturedChild and RemoteId) then return end
	local cfg = buildConfig(targets)
	if #cfg == 0 then return end
	local primary = cfg[1][1]:FindFirstChild("Head") or cfg[1][1]:FindFirstChild("HumanoidRootPart")
	if not primary then return end
	pcall(function()
		RE_RegisterAttack:FireServer()
		local key1 = string.gsub("RE/RegisterHit", ".", function(ch)
			return string.char(bit32.bxor(string.byte(ch), math.floor(workspace:GetServerTimeNow() / 10 % 10) + 1))
		end)
		local seed = Net.seed:InvokeServer() * 2
		local key2 = bit32.bxor(RemoteId + 909090, seed)
		cloneref(capturedChild):FireServer(key1, key2, primary, cfg)
	end)
end

local function fireDark(targets)
	local cfg = buildConfig(targets)
	if #cfg == 0 then return end
	local primary = cfg[1][2] or cfg[1][1]:FindFirstChild("Head") or cfg[1][1]:FindFirstChild("HumanoidRootPart")
	if not primary then return end
	pcall(function()
		RE_RegisterAttack:FireServer(0)
		RE_RegisterHit:FireServer(primary, cfg)
	end)
	if getgenv().AttackFunction then
		pcall(getgenv().AttackFunction, CFG.Range)
	end
end

local paralyzedMobs = {}

local function paralyzeMob(mob)
	if not CFG.Paralyze or not mob or not mob.Parent then return end
	local hrp = mob:FindFirstChild("HumanoidRootPart")
	local hum = mob:FindFirstChildOfClass("Humanoid")
	if not hrp or not hum then return end

	local stored = paralyzedMobs[mob]
	local lockedPos = stored and stored.pos or hrp.Position
	if not stored then
		paralyzedMobs[mob] = { pos = lockedPos }
	end

	pcall(function()
		if setnetworkowner then setnetworkowner(mob, false) end
	end)

	pcall(function()
		hrp.Velocity = Vector3.zero
		hrp.AssemblyLinearVelocity = Vector3.zero
		hrp.AssemblyAngularVelocity = Vector3.zero
		hrp.CFrame = CFrame.new(lockedPos, lockedPos + hrp.CFrame.LookVector)
	end)

	pcall(function()
		hum.WalkSpeed = 0
		hum.JumpPower = 0
		hum.JumpHeight = 0
		hum.AutoRotate = false
	end)

	pcall(function()
		local bp = hrp:FindFirstChild("BringLock")
		if not bp then
			bp = Instance.new("BodyPosition")
			bp.Name = "BringLock"
			bp.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
			bp.P = 200000
			bp.D = 1000
			bp.Position = lockedPos
			bp.Parent = hrp
		else
			bp.Position = lockedPos
		end

		local bg = hrp:FindFirstChild("BringGyro")
		if not bg then
			bg = Instance.new("BodyGyro")
			bg.Name = "BringGyro"
			bg.MaxTorque = Vector3.new(math.huge, math.huge, math.huge)
			bg.P = 200000
			bg.D = 1000
			bg.CFrame = CFrame.new(lockedPos, lockedPos + hrp.CFrame.LookVector)
			bg.Parent = hrp
		else
			bg.CFrame = CFrame.new(lockedPos, lockedPos + hrp.CFrame.LookVector)
		end
	end)
end

local function clearParalyze(mob)
	if not mob then return end
	local hrp = mob:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	pcall(function()
		if hrp:FindFirstChild("BringLock") then hrp.BringLock:Destroy() end
		if hrp:FindFirstChild("BringGyro") then hrp.BringGyro:Destroy() end
	end)
	paralyzedMobs[mob] = nil
end

local function attackMelee(char, tool, targets)
	for _, t in ipairs(targets) do paralyzeMob(t) end

	if CFG.DarkMode or CFG.Seriality or _G.Seriality then
		fireDark(targets)
	end

	for i = 1, CFG.MultiHitCount do
		task.spawn(function()
			fireStandard(targets)
			fireObfuscated(targets)
		end)
		if i < CFG.MultiHitCount then task.wait(CFG.MultiHitDelay) end
	end

	if CFG.VisualActivate and tool then
		pcall(function() tool:Activate() end)
	end

	pcall(function()
		game:GetService("VirtualUser"):CaptureController()
		game:GetService("VirtualUser"):ClickButton1(Vector2.new(-1, 1))
	end)
end

local function attackFruit(char, tool, targets)
	for _, t in ipairs(targets) do paralyzeMob(t) end

	local remote = tool:FindFirstChild("LeftClickRemote")
	if remote then
		local root = char:FindFirstChild("HumanoidRootPart")
		local trp = targets[1]:FindFirstChild("HumanoidRootPart")
		if root and trp then
			local dir = (trp.Position - root.Position).Unit
			pcall(function() remote:FireServer(dir, 1) end)
		end
	end

	if CFG.DarkMode or CFG.Seriality or _G.Seriality then
		fireDark(targets)
	end
end

local lastMelee = 0

task.spawn(function()
	while task.wait(CFG.LoopDelay) do
		if not CFG.Enabled then continue end
		if _G.Seriality == false and CFG.Seriality == false and not CFG.DarkMode then
		end
		local char = LocalPlayer.Character
		if not char or not isAlive(char) then continue end
		local tool = char:FindFirstChildOfClass("Tool")
		if not tool then continue end
		local tip = tool.ToolTip
		local now = os.clock()

		if tip == "Melee" or tip == "Sword" then
			if now - lastMelee >= CFG.MeleeDelay then
				local targets = collectTargets(char)
				if #targets > 0 then
					lastMelee = now
					pcall(attackMelee, char, tool, targets)
				end
			end
		elseif tip == "Blox Fruit" then
			local targets = collectTargets(char)
			if #targets > 0 then pcall(attackFruit, char, tool, targets) end
		end
	end
end)

task.spawn(function()
	while task.wait(CFG.ParalyzeTick) do
		if not CFG.Enabled or not CFG.Paralyze then continue end
		local char = LocalPlayer.Character
		if not char then continue end
		local tool = char:FindFirstChildOfClass("Tool")
		if not tool then continue end
		local tip = tool.ToolTip
		if tip ~= "Melee" and tip ~= "Sword" and tip ~= "Blox Fruit" then continue end
		local targets = collectTargets(char)
		for _, t in ipairs(targets) do paralyzeMob(t) end
		for mob in pairs(paralyzedMobs) do
			if not mob.Parent or not isAlive(mob) then
				clearParalyze(mob)
			end
		end
	end
end)

task.spawn(function()
	while task.wait(CFG.DarkTick) do
		if not CFG.Enabled then continue end
		if not (CFG.DarkMode or CFG.Seriality or _G.Seriality == true) then continue end
		local char = LocalPlayer.Character
		if not char or not isAlive(char) then continue end
		local tool = char:FindFirstChildOfClass("Tool")
		if not tool then continue end
		local tip = tool.ToolTip
		if tip ~= "Melee" and tip ~= "Sword" and tip ~= "Blox Fruit" then continue end
		local targets = collectTargets(char)
		if #targets > 0 then
			pcall(fireDark, targets)
			if tip == "Blox Fruit" then
				pcall(attackFruit, char, tool, targets)
			end
		end
	end
end)

getgenv().AttackSys = getgenv().AttackSys or {}
getgenv().AttackSys.Enabled = CFG.Seriality
_G.Seriality = _G.Seriality ~= false

return getgenv().FastAttack
