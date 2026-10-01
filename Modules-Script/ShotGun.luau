local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local LocalPlayer = Players.LocalPlayer
local Net = ReplicatedStorage:WaitForChild("Modules"):WaitForChild("Net")
local RS_Remotes = ReplicatedStorage:WaitForChild("Remotes")

local RE_ShootGunEvent = Net:WaitForChild("RE/ShootGunEvent")
local RE_RegisterAttack = Net:FindFirstChild("RE/RegisterAttack")
local RE_RegisterHit = Net:FindFirstChild("RE/RegisterHit")
local GunValidator = RS_Remotes:WaitForChild("Validator2")

local SUCCESS_SHOOT, SHOOT_FUNCTION = pcall(function()
	return getupvalue(require(ReplicatedStorage.Controllers.CombatController).Attack, 9)
end)

getgenv().ShotGun = getgenv().ShotGun or {}
local CFG = getgenv().ShotGun

CFG.Enabled = CFG.Enabled ~= false
CFG.Range = CFG.Range or 90
CFG.AttackPlayers = CFG.AttackPlayers == true
CFG.AttackMobs = CFG.AttackMobs ~= false
CFG.LoopDelay = CFG.LoopDelay or 0.01
CFG.GunMaxTargets = CFG.GunMaxTargets or 4
CFG.ResetCooldown = CFG.ResetCooldown ~= false
CFG.Paralyze = CFG.Paralyze ~= false
CFG.ParalyzeTick = CFG.ParalyzeTick or 0.01
CFG.DarkMode = CFG.DarkMode ~= false
CFG.Seriality = CFG.Seriality ~= false
CFG.DarkTick = CFG.DarkTick or 0.05

local function GetValidator2()
	if not SUCCESS_SHOOT or not SHOOT_FUNCTION then
		return math.random(1, 99999999), 1
	end

	local v53 = getupvalue(SHOOT_FUNCTION, 13)
	local v54 = getupvalue(SHOOT_FUNCTION, 14)
	local v55 = getupvalue(SHOOT_FUNCTION, 15)
	local v56 = getupvalue(SHOOT_FUNCTION, 16)
	local v57 = getupvalue(SHOOT_FUNCTION, 17)
	local v58 = getupvalue(SHOOT_FUNCTION, 18)
	local v59 = getupvalue(SHOOT_FUNCTION, 19)

	local v93 = v53 * v54
	local v96 = (v55 * v54 + v53 * v56) % v57
	v96 = (v96 * v57 + v93) % v58
	v55 = math.floor(v96 / v57)
	v53 = v96 - v55 * v57
	v59 = v59 + 1

	setupvalue(SHOOT_FUNCTION, 13, v53)
	setupvalue(SHOOT_FUNCTION, 15, v55)
	setupvalue(SHOOT_FUNCTION, 19, v59)

	return math.floor(v96 / v58 * 16777215), v59
end

local function isAlive(m)
	local h = m and m:FindFirstChildOfClass("Humanoid")
	return h and h.Health > 0
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

local function clearAllCooldowns(tool)
	if not (CFG.ResetCooldown and tool) then return end
	pcall(function()
		for _, v in ipairs(tool:GetDescendants()) do
			if v:IsA("NumberValue") then
				local n = v.Name:lower()
				if n:find("cooldown") or n:find("cd") or n:find("reload") then
					v.Value = 0
				end
			end
		end
	end)
end

local function attackGun(char, tool, targets)
	for _, t in ipairs(targets) do paralyzeMob(t) end
	clearAllCooldowns(tool)

	local gunTargets = {}
	local primaryPos = nil
	local primaryHead = nil

	for i = 1, math.min(CFG.GunMaxTargets, #targets) do
		local hrp = targets[i]:FindFirstChild("HumanoidRootPart")
		if hrp and isAlive(targets[i]) then
			gunTargets[#gunTargets + 1] = hrp
			if not primaryPos then
				primaryPos = hrp.Position
				primaryHead = targets[i]:FindFirstChild("Head") or hrp
			end
		end
	end

	if #gunTargets == 0 then return end

	pcall(function()
		tool:SetAttribute("LocalTotalShots", (tool:GetAttribute("LocalTotalShots") or 0) + 1)
	end)

	pcall(function()
		GunValidator:FireServer(GetValidator2())
	end)

	pcall(function()
		RE_ShootGunEvent:FireServer(primaryPos, gunTargets)
	end)

	if CFG.DarkMode or CFG.Seriality or _G.Seriality then
		pcall(function()
			if RE_RegisterAttack and RE_RegisterHit and primaryHead then
				local cfg = {}
				for _, hrp in ipairs(gunTargets) do
					cfg[#cfg + 1] = { hrp.Parent, hrp }
				end
				RE_RegisterAttack:FireServer(0)
				RE_RegisterHit:FireServer(primaryHead, cfg)
			end
		end)
	end

	pcall(function()
		tool:Activate()
		if firesignal and tool.Activated then firesignal(tool.Activated) end
	end)
end

task.spawn(function()
	while task.wait(CFG.LoopDelay) do
		if not CFG.Enabled then continue end
		local char = LocalPlayer.Character
		if not char or not isAlive(char) then continue end
		local tool = char:FindFirstChildOfClass("Tool")
		if not tool then continue end
		if tool.ToolTip ~= "Gun" then continue end
		local targets = collectTargets(char)
		if #targets > 0 then pcall(attackGun, char, tool, targets) end
	end
end)

task.spawn(function()
	while task.wait(CFG.ParalyzeTick) do
		if not CFG.Enabled or not CFG.Paralyze then continue end
		local char = LocalPlayer.Character
		if not char then continue end
		local tool = char:FindFirstChildOfClass("Tool")
		if not tool or tool.ToolTip ~= "Gun" then continue end
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
		if not tool or tool.ToolTip ~= "Gun" then continue end
		local targets = collectTargets(char)
		if #targets > 0 then pcall(attackGun, char, tool, targets) end
	end
end)

return getgenv().ShotGun
