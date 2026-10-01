local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

local t = Players.LocalPlayer
local S = Players
local CombatUtil = require(ReplicatedStorage.Modules.CombatUtil)
local Net = require(ReplicatedStorage.Modules.Net)
local RegisterAttack = ReplicatedStorage.Modules.Net:WaitForChild("RE/RegisterAttack")
local RegisterHit = Net:RemoteEvent("RegisterHit", true)

getgenv().AttackAnm = getgenv().AttackAnm or {}
local CFG = getgenv().AttackAnm
CFG.Enabled = CFG.Enabled ~= false
CFG.NoAnimation = CFG.NoAnimation ~= false
CFG.Range = CFG.Range or 80
CFG.IncludePlayers = CFG.IncludePlayers == true

local HitLimbs = {
	RightUpperArm = true,
	RightLowerArm = true,
	RightHand = true,
	RightUpperLeg = true,
	RightLowerLeg = true,
	RightFoot = true,
	LeftUpperArm = true,
	LeftLowerArm = true,
	LeftHand = true,
	LeftUpperLeg = true,
	LeftLowerLeg = true,
	LeftFoot = true,
	UpperTorso = true,
	LowerTorso = true,
	Head = true,
}

local comboIndex = 0
local animPlaying = false
local lastAnim = nil
local animSpeed = 1

local function getPartsInRange(model, origin, range)
	local list = {}
	for _, part in pairs(model:GetChildren()) do
		if part:IsA("BasePart") and (part.Position - origin).Magnitude <= range then
			table.insert(list, part)
		end
	end
	return list
end

local function getEntities(includePlayers)
	local list = {}
	for _, e in pairs(Workspace:WaitForChild("Enemies"):GetChildren()) do
		table.insert(list, e)
	end
	if includePlayers then
		for _, e in pairs(Workspace:WaitForChild("Characters"):GetChildren()) do
			table.insert(list, e)
		end
	end
	return list
end

getgenv().getBladeHits = function(char, origins, range, includePlayers)
	local hits = {}
	for _, entity in pairs(getEntities(includePlayers)) do
		if entity:IsDescendantOf(Workspace) and entity ~= char and entity:FindFirstChild("HumanoidRootPart") then
			local hrp = entity.HumanoidRootPart
			local useRange = S:GetPlayerFromCharacter(entity) and range / 1.5 or range
			local points = { hrp.Position }
			if hrp.Size.Y > 5 then
				table.insert(points, (hrp.CFrame * CFrame.new(0, -hrp.Size.Y * 1.5 + 3, 0)).Position)
			end
			for _, point in pairs(points) do
				if (point - origins[1].Position).Magnitude < 10 + useRange + hrp.Size.X / 2 then
					for _, part in pairs(getPartsInRange(entity, origins[1].Position, useRange + hrp.Size.X / 2)) do
						table.insert(hits, part)
					end
					break
				end
			end
		end
	end
	return hits
end

local function AttackAOE(range, includePlayers)
	local results = {}
	local seen = {}
	local char = t.Character
	if not char or not char:FindFirstChild("HumanoidRootPart") then return nil end
	local origins = { char.HumanoidRootPart }
	for _, part in getgenv().getBladeHits(char, origins, range or CFG.Range, includePlayers) do
		local rig = CombatUtil:GetRigOfHitPart(part)
		if rig and not seen[rig] and HitLimbs[part.Name] and CombatUtil:IsVulnerable(rig) then
			local summoner = rig:FindFirstChild("Summoner")
			local mySummon = char:FindFirstChild("Summoner")
			if
				rig ~= char
				and (not mySummon or rig ~= mySummon.Value.Character)
				and (
					not S:GetPlayerFromCharacter(char)
					or not summoner
					or summoner.Value ~= S:GetPlayerFromCharacter(char)
				)
			then
				table.insert(results, { rig, part })
				seen[rig] = true
			end
		end
	end
	return #results > 0 and results or nil
end

local function attackMelee(range)
	local tool = t.Character and t.Character:FindFirstChildOfClass("Tool")
	if not tool then return end
	local hits = AttackAOE(range, CFG.IncludePlayers)
	if not hits then return end

	local humanoid = t.Character:FindFirstChildOfClass("Humanoid")
	local root = humanoid and humanoid.RootPart
	local rootParent = root and root.Parent
	local animCache = CombatUtil:GetMovesetAnimCache(humanoid)
	if not animCache then return end

	local weaponName = CombatUtil:GetWeaponName(tool)
	local weaponData = CombatUtil:GetWeaponData(weaponName)
	local weaponType, moveset = weaponData.WeaponType, weaponData.Moveset
	if not CombatUtil:CanAttack(rootParent, weaponType) then return end

	comboIndex += 1
	if comboIndex > #moveset.Basic then
		comboIndex = 1
	end

	local anim = animCache[CombatUtil:GetPureWeaponName(weaponName) .. "-basic" .. comboIndex]
	if not anim then return end

	RegisterAttack:FireServer(anim.Length / (anim:GetAttribute("SpeedMult") or 1))
	RegisterHit:FireServer(table.remove(hits, 1)[2], hits)
	anim:Play(0.1, 1, 1 * (anim:GetAttribute("SpeedMult") or 1))
	animPlaying = true
	task.delay(anim.Length / (anim:GetAttribute("SpeedMult") or 1) * animSpeed, function()
		animPlaying = false
	end)
	lastAnim = anim
	table.clear(hits)
end

local function attackNoAnim(range)
	local hits = AttackAOE(range, CFG.IncludePlayers)
	if not hits then return end
	RegisterAttack:FireServer(0)
	RegisterHit:FireServer(table.remove(hits, 1)[2], hits)
	table.clear(hits)
end

getgenv().AttackFunction = function(range)
	if not CFG.Enabled then return end
	local char = t.Character
	if not char then return end
	local stun = char:FindFirstChild("Stun")
	if stun and stun.Value ~= 0 then return end

	local noAnim = CFG.NoAnimation
	if getgenv().Settings and getgenv().Settings["Attack No Animation "] ~= nil then
		noAnim = getgenv().Settings["Attack No Animation "]
	end

	if not noAnim then
		attackMelee(range or CFG.Range)
	else
		attackNoAnim(range or CFG.Range)
	end
end

getgenv().AttackFunctionSuper = function()
	if not CFG.Enabled then return end
	local char = t.Character
	if not char then return end
	local stun = char:FindFirstChild("Stun")
	if stun and stun.Value ~= 0 then return end
	attackNoAnim(80)
end

getgenv().AttackAOE = AttackAOE
getgenv().attackMelee = attackMelee

return getgenv().AttackAnm
