local CheckQuestSecret = {}

CheckQuestSecret.Version = "1.0.0"
CheckQuestSecret.Codes = {}
CheckQuestSecret.Data = {}
CheckQuestSecret.Functions = {}

local function Register(code, data, fn)
	CheckQuestSecret.Codes[#CheckQuestSecret.Codes + 1] = code
	CheckQuestSecret.Data[code] = data
	CheckQuestSecret.Functions[code] = fn
end

local function MakeSecret(code, info)
	Register(code, info, function()
		return info
	end)
end

MakeSecret("QuestSecret01", {
	Name = "The Gorilla King",
	Type = "Boss",
	Sea = 1,
	LevelMin = 20,
	LevelMax = 30,
	Mob = "The Gorilla King",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-1408.34, 78.73, -452.51),
	SpawnCFrame = CFrame.new(-1408.34, 78.73, -452.51),
})

MakeSecret("QuestSecret02", {
	Name = "Bobby",
	Type = "Boss",
	Sea = 1,
	LevelMin = 55,
	LevelMax = 70,
	Mob = "Bobby",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-1145.8, 15.2, 3950.1),
	SpawnCFrame = CFrame.new(-1145.8, 15.2, 3950.1),
})

MakeSecret("QuestSecret03", {
	Name = "The Saw",
	Type = "Boss",
	Sea = 1,
	LevelMin = 100,
	LevelMax = 120,
	Mob = "The Saw",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-690.5, 15.5, 1580.2),
	SpawnCFrame = CFrame.new(-690.5, 15.5, 1580.2),
})

MakeSecret("QuestSecret04", {
	Name = "Yeti",
	Type = "Boss",
	Sea = 1,
	LevelMin = 110,
	LevelMax = 130,
	Mob = "Yeti",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(1124.2, 131.39, -1664.3),
	SpawnCFrame = CFrame.new(1124.2, 131.39, -1664.3),
})

MakeSecret("QuestSecret05", {
	Name = "Mob Leader",
	Type = "Boss",
	Sea = 1,
	LevelMin = 120,
	LevelMax = 140,
	Mob = "Mob Leader",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-2840.5, 7.5, 5350.2),
	SpawnCFrame = CFrame.new(-2840.5, 7.5, 5350.2),
})

MakeSecret("QuestSecret06", {
	Name = "Vice Admiral",
	Type = "Boss",
	Sea = 1,
	LevelMin = 130,
	LevelMax = 150,
	Mob = "Vice Admiral",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-4800.5, 20.5, 4300.2),
	SpawnCFrame = CFrame.new(-4800.5, 20.5, 4300.2),
})

MakeSecret("QuestSecret07", {
	Name = "Warden",
	Type = "Boss",
	Sea = 1,
	LevelMin = 220,
	LevelMax = 240,
	Mob = "Warden",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(5200.5, 20.5, 700.2),
	SpawnCFrame = CFrame.new(5200.5, 20.5, 700.2),
})

MakeSecret("QuestSecret08", {
	Name = "Chief Warden",
	Type = "Boss",
	Sea = 1,
	LevelMin = 230,
	LevelMax = 250,
	Mob = "Chief Warden",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(5200.5, 20.5, 700.2),
	SpawnCFrame = CFrame.new(5200.5, 20.5, 700.2),
})

MakeSecret("QuestSecret09", {
	Name = "Swan",
	Type = "Boss",
	Sea = 1,
	LevelMin = 240,
	LevelMax = 260,
	Mob = "Swan",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(5300.5, 20.5, 850.2),
	SpawnCFrame = CFrame.new(5300.5, 20.5, 850.2),
})

MakeSecret("QuestSecret10", {
	Name = "Magma Admiral",
	Type = "Boss",
	Sea = 1,
	LevelMin = 350,
	LevelMax = 370,
	Mob = "Magma Admiral",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-5600.5, 18.5, 8500.2),
	SpawnCFrame = CFrame.new(-5600.5, 18.5, 8500.2),
})

MakeSecret("QuestSecret11", {
	Name = "Fishman Lord",
	Type = "Boss",
	Sea = 1,
	LevelMin = 425,
	LevelMax = 450,
	Mob = "Fishman Lord",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(61300.5, 20.5, 1600.2),
	SpawnCFrame = CFrame.new(61300.5, 20.5, 1600.2),
})

MakeSecret("QuestSecret12", {
	Name = "Wysper",
	Type = "Boss",
	Sea = 1,
	LevelMin = 500,
	LevelMax = 520,
	Mob = "Wysper",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-7900.5, 5500.5, -400.2),
	SpawnCFrame = CFrame.new(-7900.5, 5500.5, -400.2),
})

MakeSecret("QuestSecret13", {
	Name = "Thunder God",
	Type = "Boss",
	Sea = 1,
	LevelMin = 575,
	LevelMax = 600,
	Mob = "Thunder God",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-7123.22, 5632.79, 131.76),
	SpawnCFrame = CFrame.new(-7123.22, 5632.79, 131.76),
})

MakeSecret("QuestSecret14", {
	Name = "Cyborg",
	Type = "Boss",
	Sea = 1,
	LevelMin = 650,
	LevelMax = 675,
	Mob = "Cyborg",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(5600.5, 100.5, 4000.2),
	SpawnCFrame = CFrame.new(5600.5, 100.5, 4000.2),
})

MakeSecret("QuestSecret15", {
	Name = "Ice Admiral",
	Type = "Boss",
	Sea = 1,
	LevelMin = 700,
	LevelMax = 720,
	Mob = "Ice Admiral",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(1347.71, 37.37, -1325.64),
	SpawnCFrame = CFrame.new(1347.71, 37.37, -1325.64),
})

MakeSecret("QuestSecret16", {
	Name = "Greybeard",
	Type = "Boss",
	Sea = 1,
	LevelMin = 750,
	LevelMax = 800,
	Mob = "Greybeard",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-4800.5, 20.5, 4300.2),
	SpawnCFrame = CFrame.new(-4800.5, 20.5, 4300.2),
})

MakeSecret("QuestSecret17", {
	Name = "Diamond",
	Type = "Boss",
	Sea = 2,
	LevelMin = 750,
	LevelMax = 800,
	Mob = "Diamond",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-1500.5, 50.5, -300.2),
	SpawnCFrame = CFrame.new(-1500.5, 50.5, -300.2),
})

MakeSecret("QuestSecret18", {
	Name = "Jeremy",
	Type = "Boss",
	Sea = 2,
	LevelMin = 850,
	LevelMax = 900,
	Mob = "Jeremy",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(2000.5, 50.5, 800.2),
	SpawnCFrame = CFrame.new(2000.5, 50.5, 800.2),
})

MakeSecret("QuestSecret19", {
	Name = "Orbitus",
	Type = "Boss",
	Sea = 2,
	LevelMin = 925,
	LevelMax = 975,
	Mob = "Orbitus",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-300.5, 50.5, 500.2),
	SpawnCFrame = CFrame.new(-300.5, 50.5, 500.2),
})

MakeSecret("QuestSecret20", {
	Name = "Don Swan",
	Type = "Boss",
	Sea = 2,
	LevelMin = 1000,
	LevelMax = 1050,
	Mob = "Don Swan",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(2280.5, 15.5, 905.2),
	SpawnCFrame = CFrame.new(2280.5, 15.5, 905.2),
})

MakeSecret("QuestSecret21", {
	Name = "Smoke Admiral",
	Type = "Boss",
	Sea = 2,
	LevelMin = 1150,
	LevelMax = 1200,
	Mob = "Smoke Admiral",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-2880.5, 15.5, -250.2),
	SpawnCFrame = CFrame.new(-2880.5, 15.5, -250.2),
})

MakeSecret("QuestSecret22", {
	Name = "Awakened Ice Admiral",
	Type = "Boss",
	Sea = 2,
	LevelMin = 1200,
	LevelMax = 1250,
	Mob = "Awakened Ice Admiral",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(6400.5, 300.5, -7000.2),
	SpawnCFrame = CFrame.new(6400.5, 300.5, -7000.2),
})

MakeSecret("QuestSecret23", {
	Name = "Tide Keeper",
	Type = "Boss",
	Sea = 2,
	LevelMin = 1350,
	LevelMax = 1400,
	Mob = "Tide Keeper",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-3050.5, 15.5, -9720.2),
	SpawnCFrame = CFrame.new(-3050.5, 15.5, -9720.2),
})

MakeSecret("QuestSecret24", {
	Name = "Darkbeard",
	Type = "Boss",
	Sea = 2,
	LevelMin = 1000,
	LevelMax = 1500,
	Mob = "Darkbeard",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(3700.5, 15.5, -3000.2),
	SpawnCFrame = CFrame.new(3700.5, 15.5, -3000.2),
})

MakeSecret("QuestSecret25", {
	Name = "Cursed Captain",
	Type = "Boss",
	Sea = 2,
	LevelMin = 1300,
	LevelMax = 1400,
	Mob = "Cursed Captain",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(900.5, 120.5, 33000.2),
	SpawnCFrame = CFrame.new(900.5, 120.5, 33000.2),
})

MakeSecret("QuestSecret26", {
	Name = "Order",
	Type = "Boss",
	Sea = 2,
	LevelMin = 1400,
	LevelMax = 1500,
	Mob = "Order",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-3000.5, 15.5, -5000.2),
	SpawnCFrame = CFrame.new(-3000.5, 15.5, -5000.2),
})

MakeSecret("QuestSecret27", {
	Name = "Stone",
	Type = "Boss",
	Sea = 3,
	LevelMin = 1550,
	LevelMax = 1600,
	Mob = "Stone",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-1000.5, 40.5, 5000.2),
	SpawnCFrame = CFrame.new(-1000.5, 40.5, 5000.2),
})

MakeSecret("QuestSecret28", {
	Name = "Hydra Leader",
	Type = "Boss",
	Sea = 3,
	LevelMin = 1575,
	LevelMax = 1650,
	Mob = "Hydra Leader",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(5200.5, 600.5, 300.2),
	SpawnCFrame = CFrame.new(5200.5, 600.5, 300.2),
})

MakeSecret("QuestSecret29", {
	Name = "Kilo Admiral",
	Type = "Boss",
	Sea = 3,
	LevelMin = 1750,
	LevelMax = 1800,
	Mob = "Kilo Admiral",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(2800.5, 100.5, -7000.2),
	SpawnCFrame = CFrame.new(2800.5, 100.5, -7000.2),
})

MakeSecret("QuestSecret30", {
	Name = "Captain Elephant",
	Type = "Boss",
	Sea = 3,
	LevelMin = 1800,
	LevelMax = 1850,
	Mob = "Captain Elephant",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-13400.5, 400.5, -7800.2),
	SpawnCFrame = CFrame.new(-13400.5, 400.5, -7800.2),
})

MakeSecret("QuestSecret31", {
	Name = "Beautiful Pirate",
	Type = "Boss",
	Sea = 3,
	LevelMin = 1900,
	LevelMax = 1950,
	Mob = "Beautiful Pirate",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(5300.5, 20.5, 1100.2),
	SpawnCFrame = CFrame.new(5300.5, 20.5, 1100.2),
})

MakeSecret("QuestSecret32", {
	Name = "Cake Queen",
	Type = "Boss",
	Sea = 3,
	LevelMin = 2100,
	LevelMax = 2200,
	Mob = "Cake Queen",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
	SpawnCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
})

MakeSecret("QuestSecret33", {
	Name = "Dough King",
	Type = "Boss",
	Sea = 3,
	LevelMin = 2200,
	LevelMax = 2300,
	Mob = "Dough King",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
	SpawnCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
})

MakeSecret("QuestSecret34", {
	Name = "Longma",
	Type = "Boss",
	Sea = 3,
	LevelMin = 2000,
	LevelMax = 2100,
	Mob = "Longma",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-10000.5, 300.5, -10000.2),
	SpawnCFrame = CFrame.new(-10000.5, 300.5, -10000.2),
})

MakeSecret("QuestSecret35", {
	Name = "Soul Reaper",
	Type = "Boss",
	Sea = 3,
	LevelMin = 2100,
	LevelMax = 2200,
	Mob = "Soul Reaper",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-9500.5, 140.5, 5500.2),
	SpawnCFrame = CFrame.new(-9500.5, 140.5, 5500.2),
})

MakeSecret("QuestSecret36", {
	Name = "rip_indra True Form",
	Type = "Boss",
	Sea = 3,
	LevelMin = 2200,
	LevelMax = 2500,
	Mob = "rip_indra True Form",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-5300.5, 400.5, -7000.2),
	SpawnCFrame = CFrame.new(-5300.5, 400.5, -7000.2),
})

MakeSecret("QuestSecret37", {
	Name = "Tyrant of the Skies",
	Type = "Boss",
	Sea = 3,
	LevelMin = 2300,
	LevelMax = 2500,
	Mob = "Tyrant of the Skies",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(7000.5, 500.5, -500.2),
	SpawnCFrame = CFrame.new(7000.5, 500.5, -500.2),
})

MakeSecret("QuestSecret38", {
	Name = "Volcano Golem 1",
	Type = "Golem",
	Sea = 3,
	LevelMin = 0,
	LevelMax = 9999,
	Mob = "Golem",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-550.5, 50.5, 5200.2),
	SpawnCFrame = CFrame.new(-550.5, 50.5, 5200.2),
	Island = "Volcano",
})

MakeSecret("QuestSecret39", {
	Name = "Volcano Golem 2",
	Type = "Golem",
	Sea = 3,
	LevelMin = 0,
	LevelMax = 9999,
	Mob = "Golem",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-600.5, 50.5, 5300.2),
	SpawnCFrame = CFrame.new(-600.5, 50.5, 5300.2),
	Island = "Volcano",
})

MakeSecret("QuestSecret40", {
	Name = "Volcano Golem 3",
	Type = "Golem",
	Sea = 3,
	LevelMin = 0,
	LevelMax = 9999,
	Mob = "Golem",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-650.5, 50.5, 5400.2),
	SpawnCFrame = CFrame.new(-650.5, 50.5, 5400.2),
	Island = "Volcano",
})

MakeSecret("QuestSecret41", {
	Name = "Saber Expert",
	Type = "Boss",
	Sea = 1,
	LevelMin = 200,
	LevelMax = 250,
	Mob = "Saber Expert",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-1450.5, 30.5, -50.2),
	SpawnCFrame = CFrame.new(-1450.5, 30.5, -50.2),
})

MakeSecret("QuestSecret42", {
	Name = "Cake Prince",
	Type = "Boss",
	Sea = 3,
	LevelMin = 2100,
	LevelMax = 2300,
	Mob = "Cake Prince",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
	SpawnCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
})

MakeSecret("QuestSecret43", {
	Name = "Dough King Spawn",
	Type = "Boss",
	Sea = 3,
	LevelMin = 2200,
	LevelMax = 2500,
	Mob = "Dough King",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
	SpawnCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
})

MakeSecret("QuestSecret44", {
	Name = "Mythological Pirate",
	Type = "SecretNPC",
	Sea = 3,
	LevelMin = 1800,
	LevelMax = 1900,
	Mob = "Mythological Pirate",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-13510, 584, -6987),
	SpawnCFrame = CFrame.new(-13510, 584, -6987),
})

MakeSecret("QuestSecret45", {
	Name = "Forest Pirate",
	Type = "SecretNPC",
	Sea = 3,
	LevelMin = 1800,
	LevelMax = 1900,
	Mob = "Forest Pirate",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(-13446, 413, -7760),
	SpawnCFrame = CFrame.new(-13446, 413, -7760),
})

MakeSecret("QuestSecret46", {
	Name = "Ghost",
	Type = "SecretNPC",
	Sea = 3,
	LevelMin = 0,
	LevelMax = 9999,
	Mob = "Ghost",
	NpcName = "None",
	NpcCFrame = nil,
	MobCFrame = CFrame.new(5251, 5, 1111),
	SpawnCFrame = CFrame.new(5251, 5, 1111),
})

MakeSecret("QuestSecret47", {
	Name = "Elite Pirate Hunter NPC",
	Type = "SecretNPC",
	Sea = 3,
	LevelMin = 1500,
	LevelMax = 9999,
	Mob = "None",
	NpcName = "Elite Hunter",
	NpcCFrame = CFrame.new(-12000.5, 300.5, -10000.2),
	MobCFrame = nil,
	SpawnCFrame = CFrame.new(-12000.5, 300.5, -10000.2),
})

MakeSecret("QuestSecret48", {
	Name = "Bartilo Quest NPC",
	Type = "SecretNPC",
	Sea = 2,
	LevelMin = 850,
	LevelMax = 950,
	Mob = "None",
	NpcName = "Bartilo",
	NpcCFrame = CFrame.new(-456.28, 73.02, 299.89),
	MobCFrame = nil,
	SpawnCFrame = CFrame.new(-456.28, 73.02, 299.89),
})

MakeSecret("QuestSecret49", {
	Name = "Trevor Rainbow Quest",
	Type = "SecretNPC",
	Sea = 2,
	LevelMin = 1000,
	LevelMax = 1200,
	Mob = "None",
	NpcName = "Trevor",
	NpcCFrame = CFrame.new(-288.5, 15.5, -250.2),
	MobCFrame = nil,
	SpawnCFrame = CFrame.new(-288.5, 15.5, -250.2),
})

MakeSecret("QuestSecret50", {
	Name = "Advanced Fruit Dealer",
	Type = "SecretNPC",
	Sea = 3,
	LevelMin = 0,
	LevelMax = 9999,
	Mob = "None",
	NpcName = "Advanced Fruit Dealer",
	NpcCFrame = CFrame.new(-1250.5, 15.5, 5650.2),
	MobCFrame = nil,
	SpawnCFrame = CFrame.new(-1250.5, 15.5, 5650.2),
})

function CheckQuestSecret.GetByCode(code)
	return CheckQuestSecret.Functions[code]
end

function CheckQuestSecret.GetData(code)
	return CheckQuestSecret.Data[code]
end

function CheckQuestSecret.GetAllCodes()
	return CheckQuestSecret.Codes
end

function CheckQuestSecret.GetByType(typeName)
	local list = {}
	for code, data in pairs(CheckQuestSecret.Data) do
		if data.Type == typeName then
			table.insert(list, {Code = code, Data = data})
		end
	end
	return list
end

function CheckQuestSecret.GetBySea(sea)
	local list = {}
	for code, data in pairs(CheckQuestSecret.Data) do
		if data.Sea == sea then
			table.insert(list, {Code = code, Data = data})
		end
	end
	return list
end

function CheckQuestSecret.GetBosses()
	return CheckQuestSecret.GetByType("Boss")
end

function CheckQuestSecret.GetGolems()
	return CheckQuestSecret.GetByType("Golem")
end

function CheckQuestSecret.GetSecretNPCs()
	return CheckQuestSecret.GetByType("SecretNPC")
end

function CheckQuestSecret.GetByMob(mobName)
	local list = {}
	for code, data in pairs(CheckQuestSecret.Data) do
		if data.Mob == mobName then
			table.insert(list, {Code = code, Data = data})
		end
	end
	return list
end

function CheckQuestSecret.GetSpawnCFrame(code)
	local data = CheckQuestSecret.Data[code]
	return data and data.SpawnCFrame or nil
end

function CheckQuestSecret.GetMobCFrame(code)
	local data = CheckQuestSecret.Data[code]
	return data and data.MobCFrame or nil
end

function CheckQuestSecret.GetNpcCFrame(code)
	local data = CheckQuestSecret.Data[code]
	return data and data.NpcCFrame or nil
end

return CheckQuestSecret
