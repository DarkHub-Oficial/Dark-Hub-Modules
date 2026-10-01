local CheckQuest = {}

CheckQuest.Version = "1.0.0"
CheckQuest.Codes = {}
CheckQuest.Data = {}
CheckQuest.Functions = {}

local function Register(code, data, fn)
	CheckQuest.Codes[#CheckQuest.Codes + 1] = code
	CheckQuest.Data[code] = data
	CheckQuest.Functions[code] = fn
end

local function MakeQuest(code, info)
	Register(code, info, function()
		return info
	end)
end

MakeQuest("QuestInvoke01", {
	Name = "Bandit Quest 1",
	LevelMin = 1,
	LevelMax = 9,
	Sea = 1,
	QuestName = "BanditQuest1",
	QuestId = 1,
	Mob = "Bandit",
	Amount = 5,
	NpcName = "Bandit Quest Giver",
	NpcCFrame = CFrame.new(1059.37, 15.95, 1550.55),
	MobCFrame = CFrame.new(1190.5, 15.9, 1590.2),
})

MakeQuest("QuestInvoke02", {
	Name = "Bandit Quest 2",
	LevelMin = 10,
	LevelMax = 14,
	Sea = 1,
	QuestName = "BanditQuest1",
	QuestId = 2,
	Mob = "Bandit",
	Amount = 8,
	NpcName = "Bandit Quest Giver",
	NpcCFrame = CFrame.new(1059.37, 15.95, 1550.55),
	MobCFrame = CFrame.new(1190.5, 15.9, 1590.2),
})

MakeQuest("QuestInvoke03", {
	Name = "Jungle Quest 1",
	LevelMin = 15,
	LevelMax = 29,
	Sea = 1,
	QuestName = "JungleQuest",
	QuestId = 1,
	Mob = "Monkey",
	Amount = 8,
	NpcName = "Jungle Quest Giver",
	NpcCFrame = CFrame.new(-1598.08, 36.85, 153.14),
	MobCFrame = CFrame.new(-1602.5, 36.5, 145.2),
})

MakeQuest("QuestInvoke04", {
	Name = "Jungle Quest 2",
	LevelMin = 30,
	LevelMax = 39,
	Sea = 1,
	QuestName = "JungleQuest",
	QuestId = 2,
	Mob = "Gorilla",
	Amount = 8,
	NpcName = "Jungle Quest Giver",
	NpcCFrame = CFrame.new(-1598.08, 36.85, 153.14),
	MobCFrame = CFrame.new(-1408.34, 78.73, -452.51),
})

MakeQuest("QuestInvoke05", {
	Name = "Buggy Quest 1",
	LevelMin = 40,
	LevelMax = 59,
	Sea = 1,
	QuestName = "BuggyQuest1",
	QuestId = 1,
	Mob = "Pirate",
	Amount = 8,
	NpcName = "Pirate Quest Giver",
	NpcCFrame = CFrame.new(-1140.5, 4.75, 3827.3),
	MobCFrame = CFrame.new(-1210.2, 4.8, 3910.5),
})

MakeQuest("QuestInvoke06", {
	Name = "Buggy Quest 2",
	LevelMin = 60,
	LevelMax = 74,
	Sea = 1,
	QuestName = "BuggyQuest1",
	QuestId = 2,
	Mob = "Brute",
	Amount = 8,
	NpcName = "Pirate Quest Giver",
	NpcCFrame = CFrame.new(-1140.5, 4.75, 3827.3),
	MobCFrame = CFrame.new(-1145.8, 15.2, 3950.1),
})

MakeQuest("QuestInvoke07", {
	Name = "Desert Quest 1",
	LevelMin = 75,
	LevelMax = 89,
	Sea = 1,
	QuestName = "DesertQuest",
	QuestId = 1,
	Mob = "Desert Bandit",
	Amount = 8,
	NpcName = "Desert Quest Giver",
	NpcCFrame = CFrame.new(932.33, 5.89, 4201.55),
	MobCFrame = CFrame.new(994.14, 63.02, 4489.64),
})

MakeQuest("QuestInvoke08", {
	Name = "Desert Quest 2",
	LevelMin = 90,
	LevelMax = 99,
	Sea = 1,
	QuestName = "DesertQuest",
	QuestId = 2,
	Mob = "Desert Officer",
	Amount = 8,
	NpcName = "Desert Quest Giver",
	NpcCFrame = CFrame.new(932.33, 5.89, 4201.55),
	MobCFrame = CFrame.new(1541.54, 68.32, 4237),
})

MakeQuest("QuestInvoke09", {
	Name = "Snow Quest 1",
	LevelMin = 100,
	LevelMax = 119,
	Sea = 1,
	QuestName = "SnowQuest",
	QuestId = 1,
	Mob = "Snow Bandit",
	Amount = 8,
	NpcName = "Villager Quest Giver",
	NpcCFrame = CFrame.new(1399.01, 78.02, -1308.67),
	MobCFrame = CFrame.new(1424.86, 108.74, -1442.61),
})

MakeQuest("QuestInvoke10", {
	Name = "Snow Quest 2",
	LevelMin = 120,
	LevelMax = 149,
	Sea = 1,
	QuestName = "SnowQuest",
	QuestId = 2,
	Mob = "Snowman",
	Amount = 8,
	NpcName = "Villager Quest Giver",
	NpcCFrame = CFrame.new(1399.01, 78.02, -1308.67),
	MobCFrame = CFrame.new(1124.2, 131.39, -1664.3),
})

MakeQuest("QuestInvoke11", {
	Name = "Marine Fortress Quest 1",
	LevelMin = 150,
	LevelMax = 174,
	Sea = 1,
	QuestName = "MarineQuest2",
	QuestId = 1,
	Mob = "Marine",
	Amount = 8,
	NpcName = "Marine Quest Giver",
	NpcCFrame = CFrame.new(-4698.67, 5.88, 4225.06),
	MobCFrame = CFrame.new(-4937.68, 53.03, 4005.29),
})

MakeQuest("QuestInvoke12", {
	Name = "Marine Fortress Quest 2",
	LevelMin = 175,
	LevelMax = 189,
	Sea = 1,
	QuestName = "MarineQuest2",
	QuestId = 2,
	Mob = "Marine Chief",
	Amount = 8,
	NpcName = "Marine Quest Giver",
	NpcCFrame = CFrame.new(-4698.67, 5.88, 4225.06),
	MobCFrame = CFrame.new(-4806.84, 52.46, 4211.69),
})

MakeQuest("QuestInvoke13", {
	Name = "Sky Quest 1",
	LevelMin = 190,
	LevelMax = 249,
	Sea = 1,
	QuestName = "SkyQuest",
	QuestId = 1,
	Mob = "Sky Bandit",
	Amount = 8,
	NpcName = "Sky Quest Giver",
	NpcCFrame = CFrame.new(-4841.34, 717.66, -2623.5),
	MobCFrame = CFrame.new(-5217.33, 338.73, -1076.08),
})

MakeQuest("QuestInvoke14", {
	Name = "Sky Quest 2",
	LevelMin = 250,
	LevelMax = 274,
	Sea = 1,
	QuestName = "SkyQuest",
	QuestId = 2,
	Mob = "Dark Master",
	Amount = 8,
	NpcName = "Sky Quest Giver",
	NpcCFrame = CFrame.new(-4841.34, 717.66, -2623.5),
	MobCFrame = CFrame.new(-5280.43, 554.4, -460.71),
})

MakeQuest("QuestInvoke15", {
	Name = "Prison Quest 1",
	LevelMin = 275,
	LevelMax = 299,
	Sea = 1,
	QuestName = "PrisonerQuest",
	QuestId = 1,
	Mob = "Prisoner",
	Amount = 8,
	NpcName = "Prison Quest Giver",
	NpcCFrame = CFrame.new(5207.38, 19.54, 737.71),
	MobCFrame = CFrame.new(5055.35, 61.95, 568.15),
})

MakeQuest("QuestInvoke16", {
	Name = "Prison Quest 2",
	LevelMin = 300,
	LevelMax = 324,
	Sea = 1,
	QuestName = "PrisonerQuest",
	QuestId = 2,
	Mob = "Dangerous Prisoner",
	Amount = 8,
	NpcName = "Prison Quest Giver",
	NpcCFrame = CFrame.new(5207.38, 19.54, 737.71),
	MobCFrame = CFrame.new(5329.45, 101.94, 815.1),
})

MakeQuest("QuestInvoke17", {
	Name = "Colosseum Quest 1",
	LevelMin = 325,
	LevelMax = 374,
	Sea = 1,
	QuestName = "ColosseumQuest",
	QuestId = 1,
	Mob = "Toga Warrior",
	Amount = 8,
	NpcName = "Colosseum Quest Giver",
	NpcCFrame = CFrame.new(-1344.21, 12.48, -2931.21),
	MobCFrame = CFrame.new(-1259.77, 66.86, -3239.91),
})

MakeQuest("QuestInvoke18", {
	Name = "Colosseum Quest 2",
	LevelMin = 375,
	LevelMax = 399,
	Sea = 1,
	QuestName = "ColosseumQuest",
	QuestId = 2,
	Mob = "Gladiator",
	Amount = 8,
	NpcName = "Colosseum Quest Giver",
	NpcCFrame = CFrame.new(-1344.21, 12.48, -2931.21),
	MobCFrame = CFrame.new(-1114.21, 63.02, -3028.41),
})

MakeQuest("QuestInvoke19", {
	Name = "Magma Quest 1",
	LevelMin = 400,
	LevelMax = 449,
	Sea = 1,
	QuestName = "MagmaQuest",
	QuestId = 1,
	Mob = "Military Soldier",
	Amount = 8,
	NpcName = "Magma Quest Giver",
	NpcCFrame = CFrame.new(-5314.39, 18.47, 8480.15),
	MobCFrame = CFrame.new(-5251.93, 54.36, 8555.36),
})

MakeQuest("QuestInvoke20", {
	Name = "Magma Quest 2",
	LevelMin = 450,
	LevelMax = 474,
	Sea = 1,
	QuestName = "MagmaQuest",
	QuestId = 2,
	Mob = "Military Spy",
	Amount = 8,
	NpcName = "Magma Quest Giver",
	NpcCFrame = CFrame.new(-5314.39, 18.47, 8480.15),
	MobCFrame = CFrame.new(-5725, 123.22, 8827.37),
})

MakeQuest("QuestInvoke21", {
	Name = "Fishman Quest 1",
	LevelMin = 475,
	LevelMax = 524,
	Sea = 1,
	QuestName = "FishmanQuest",
	QuestId = 1,
	Mob = "Fishman Warrior",
	Amount = 8,
	NpcName = "Fishman Quest Giver",
	NpcCFrame = CFrame.new(61122.75, 18.5, 1568.5),
	MobCFrame = CFrame.new(61150.2, 18.5, 1600.3),
})

MakeQuest("QuestInvoke22", {
	Name = "Fishman Quest 2",
	LevelMin = 525,
	LevelMax = 549,
	Sea = 1,
	QuestName = "FishmanQuest",
	QuestId = 2,
	Mob = "Fishman Commando",
	Amount = 8,
	NpcName = "Fishman Quest Giver",
	NpcCFrame = CFrame.new(61122.75, 18.5, 1568.5),
	MobCFrame = CFrame.new(61200.5, 18.5, 1650.8),
})

MakeQuest("QuestInvoke23", {
	Name = "Sky Island 3 Quest 1",
	LevelMin = 550,
	LevelMax = 624,
	Sea = 1,
	QuestName = "SkyQuest2",
	QuestId = 1,
	Mob = "God's Guard",
	Amount = 8,
	NpcName = "Sky Island 3 Quest Giver",
	NpcCFrame = CFrame.new(-4877.31, 927.39, -1033.1),
	MobCFrame = CFrame.new(-4227.48, 1148.14, -574.85),
})

MakeQuest("QuestInvoke24", {
	Name = "Sky Island 3 Quest 2",
	LevelMin = 625,
	LevelMax = 649,
	Sea = 1,
	QuestName = "SkyQuest2",
	QuestId = 2,
	Mob = "Shanda",
	Amount = 8,
	NpcName = "Sky Island 3 Quest Giver",
	NpcCFrame = CFrame.new(-4877.31, 927.39, -1033.1),
	MobCFrame = CFrame.new(-5951.79, 5516.56, 1746.4),
})

MakeQuest("QuestInvoke25", {
	Name = "Fountain Quest 1",
	LevelMin = 650,
	LevelMax = 674,
	Sea = 1,
	QuestName = "FountainQuest",
	QuestId = 1,
	Mob = "Galley Pirate",
	Amount = 8,
	NpcName = "Fountain Quest Giver",
	NpcCFrame = CFrame.new(5260.73, 76.08, 4088.11),
	MobCFrame = CFrame.new(5425.04, 102.55, 3952.78),
})

MakeQuest("QuestInvoke26", {
	Name = "Fountain Quest 2",
	LevelMin = 675,
	LevelMax = 699,
	Sea = 1,
	QuestName = "FountainQuest",
	QuestId = 2,
	Mob = "Galley Captain",
	Amount = 8,
	NpcName = "Fountain Quest Giver",
	NpcCFrame = CFrame.new(5260.73, 76.08, 4088.11),
	MobCFrame = CFrame.new(5378.99, 111.34, 4682.25),
})

MakeQuest("QuestInvoke27", {
	Name = "Area 1 Quest 1",
	LevelMin = 700,
	LevelMax = 724,
	Sea = 2,
	QuestName = "Area1Quest",
	QuestId = 1,
	Mob = "Raider",
	Amount = 8,
	NpcName = "Area 1 Quest Giver",
	NpcCFrame = CFrame.new(-424.4, 73.2, 1836.8),
	MobCFrame = CFrame.new(-450.2, 73.5, 1900.1),
})

MakeQuest("QuestInvoke28", {
	Name = "Area 1 Quest 2",
	LevelMin = 725,
	LevelMax = 774,
	Sea = 2,
	QuestName = "Area1Quest",
	QuestId = 2,
	Mob = "Mercenary",
	Amount = 8,
	NpcName = "Area 1 Quest Giver",
	NpcCFrame = CFrame.new(-424.4, 73.2, 1836.8),
	MobCFrame = CFrame.new(-500.5, 73.8, 1950.3),
})

MakeQuest("QuestInvoke29", {
	Name = "Area 2 Quest 1",
	LevelMin = 775,
	LevelMax = 799,
	Sea = 2,
	QuestName = "Area2Quest",
	QuestId = 1,
	Mob = "Swan Pirate",
	Amount = 8,
	NpcName = "Area 2 Quest Giver",
	NpcCFrame = CFrame.new(968.5, 121.5, 3300.2),
	MobCFrame = CFrame.new(1000.2, 121.8, 3350.5),
})

MakeQuest("QuestInvoke30", {
	Name = "Area 2 Quest 2",
	LevelMin = 800,
	LevelMax = 874,
	Sea = 2,
	QuestName = "Area2Quest",
	QuestId = 2,
	Mob = "Factory Staff",
	Amount = 8,
	NpcName = "Area 2 Quest Giver",
	NpcCFrame = CFrame.new(968.5, 121.5, 3300.2),
	MobCFrame = CFrame.new(1050.5, 125.2, 3400.8),
})

MakeQuest("QuestInvoke31", {
	Name = "Marine Quest 1",
	LevelMin = 875,
	LevelMax = 899,
	Sea = 2,
	QuestName = "MarineQuest3",
	QuestId = 1,
	Mob = "Marine Lieutenant",
	Amount = 8,
	NpcName = "Marine Quest Giver",
	NpcCFrame = CFrame.new(-2440.5, 73.2, -3215.8),
	MobCFrame = CFrame.new(-2500.2, 73.5, -3250.1),
})

MakeQuest("QuestInvoke32", {
	Name = "Marine Quest 2",
	LevelMin = 900,
	LevelMax = 949,
	Sea = 2,
	QuestName = "MarineQuest3",
	QuestId = 2,
	Mob = "Marine Captain",
	Amount = 8,
	NpcName = "Marine Quest Giver",
	NpcCFrame = CFrame.new(-2440.5, 73.2, -3215.8),
	MobCFrame = CFrame.new(-2550.5, 73.8, -3300.3),
})

MakeQuest("QuestInvoke33", {
	Name = "Zombie Quest 1",
	LevelMin = 950,
	LevelMax = 974,
	Sea = 2,
	QuestName = "ZombieQuest",
	QuestId = 1,
	Mob = "Zombie",
	Amount = 8,
	NpcName = "Zombie Quest Giver",
	NpcCFrame = CFrame.new(-5490.5, 48.5, -650.2),
	MobCFrame = CFrame.new(-5550.2, 48.8, -700.5),
})

MakeQuest("QuestInvoke34", {
	Name = "Zombie Quest 2",
	LevelMin = 975,
	LevelMax = 999,
	Sea = 2,
	QuestName = "ZombieQuest",
	QuestId = 2,
	Mob = "Vampire",
	Amount = 8,
	NpcName = "Zombie Quest Giver",
	NpcCFrame = CFrame.new(-5490.5, 48.5, -650.2),
	MobCFrame = CFrame.new(-5600.5, 49.2, -750.8),
})

MakeQuest("QuestInvoke35", {
	Name = "Snow Mountain Quest 1",
	LevelMin = 1000,
	LevelMax = 1049,
	Sea = 2,
	QuestName = "SnowMountainQuest",
	QuestId = 1,
	Mob = "Snow Trooper",
	Amount = 8,
	NpcName = "Snow Mountain Quest Giver",
	NpcCFrame = CFrame.new(604.5, 401.5, -5370.2),
	MobCFrame = CFrame.new(650.2, 401.8, -5400.5),
})

MakeQuest("QuestInvoke36", {
	Name = "Snow Mountain Quest 2",
	LevelMin = 1050,
	LevelMax = 1099,
	Sea = 2,
	QuestName = "SnowMountainQuest",
	QuestId = 2,
	Mob = "Winter Warrior",
	Amount = 8,
	NpcName = "Snow Mountain Quest Giver",
	NpcCFrame = CFrame.new(604.5, 401.5, -5370.2),
	MobCFrame = CFrame.new(700.5, 402.2, -5450.8),
})

MakeQuest("QuestInvoke37", {
	Name = "Smoke Quest 1",
	LevelMin = 1100,
	LevelMax = 1124,
	Sea = 2,
	QuestName = "SmokeQuest",
	QuestId = 1,
	Mob = "Lab Subordinate",
	Amount = 8,
	NpcName = "Smoke Quest Giver",
	NpcCFrame = CFrame.new(-2880.5, 15.5, -250.2),
	MobCFrame = CFrame.new(-2920.2, 15.8, -300.5),
})

MakeQuest("QuestInvoke38", {
	Name = "Smoke Quest 2",
	LevelMin = 1125,
	LevelMax = 1174,
	Sea = 2,
	QuestName = "SmokeQuest",
	QuestId = 2,
	Mob = "Horned Man",
	Amount = 8,
	NpcName = "Smoke Quest Giver",
	NpcCFrame = CFrame.new(-2880.5, 15.5, -250.2),
	MobCFrame = CFrame.new(-2950.5, 16.2, -350.8),
})

MakeQuest("QuestInvoke39", {
	Name = "Frost Quest 1",
	LevelMin = 1175,
	LevelMax = 1199,
	Sea = 2,
	QuestName = "FrostQuest",
	QuestId = 1,
	Mob = "Snow Lurker",
	Amount = 8,
	NpcName = "Frost Quest Giver",
	NpcCFrame = CFrame.new(5669.5, 28.5, -6480.2),
	MobCFrame = CFrame.new(5700.2, 28.8, -6520.5),
})

MakeQuest("QuestInvoke40", {
	Name = "Frost Quest 2",
	LevelMin = 1200,
	LevelMax = 1249,
	Sea = 2,
	QuestName = "FrostQuest",
	QuestId = 2,
	Mob = "Arctic Warrior",
	Amount = 8,
	NpcName = "Frost Quest Giver",
	NpcCFrame = CFrame.new(5669.5, 28.5, -6480.2),
	MobCFrame = CFrame.new(5750.5, 29.2, -6580.8),
})

MakeQuest("QuestInvoke41", {
	Name = "Forgotten Quest 1",
	LevelMin = 1250,
	LevelMax = 1274,
	Sea = 2,
	QuestName = "ForgottenQuest",
	QuestId = 1,
	Mob = "Sea Soldier",
	Amount = 8,
	NpcName = "Forgotten Quest Giver",
	NpcCFrame = CFrame.new(-3050.5, 15.5, -9720.2),
	MobCFrame = CFrame.new(-3100.2, 15.8, -9780.5),
})

MakeQuest("QuestInvoke42", {
	Name = "Forgotten Quest 2",
	LevelMin = 1275,
	LevelMax = 1299,
	Sea = 2,
	QuestName = "ForgottenQuest",
	QuestId = 2,
	Mob = "Water Fighter",
	Amount = 8,
	NpcName = "Forgotten Quest Giver",
	NpcCFrame = CFrame.new(-3050.5, 15.5, -9720.2),
	MobCFrame = CFrame.new(-3150.5, 16.2, -9850.8),
})

MakeQuest("QuestInvoke43", {
	Name = "Pirate Port Quest 1",
	LevelMin = 1500,
	LevelMax = 1524,
	Sea = 3,
	QuestName = "PiratePortQuest",
	QuestId = 1,
	Mob = "Pirate Millionaire",
	Amount = 8,
	NpcName = "Pirate Port Quest Giver",
	NpcCFrame = CFrame.new(-290.5, 43.5, 5580.2),
	MobCFrame = CFrame.new(-712.82, 98.57, 5711.95),
})

MakeQuest("QuestInvoke44", {
	Name = "Pirate Port Quest 2",
	LevelMin = 1525,
	LevelMax = 1574,
	Sea = 3,
	QuestName = "PiratePortQuest",
	QuestId = 2,
	Mob = "Pistol Billionaire",
	Amount = 8,
	NpcName = "Pirate Port Quest Giver",
	NpcCFrame = CFrame.new(-290.5, 43.5, 5580.2),
	MobCFrame = CFrame.new(-723.43, 147.42, 5931.99),
})

MakeQuest("QuestInvoke45", {
	Name = "Dragon Crew Quest 1",
	LevelMin = 1575,
	LevelMax = 1599,
	Sea = 3,
	QuestName = "DragonCrewQuest",
	QuestId = 1,
	Mob = "Dragon Crew Warrior",
	Amount = 8,
	NpcName = "Dragon Crew Quest Giver",
	NpcCFrame = CFrame.new(6700.5, 55.5, -700.2),
	MobCFrame = CFrame.new(7021.50, 55.76, -730.12),
})

MakeQuest("QuestInvoke46", {
	Name = "Dragon Crew Quest 2",
	LevelMin = 1600,
	LevelMax = 1624,
	Sea = 3,
	QuestName = "DragonCrewQuest",
	QuestId = 2,
	Mob = "Dragon Crew Archer",
	Amount = 8,
	NpcName = "Dragon Crew Quest Giver",
	NpcCFrame = CFrame.new(6700.5, 55.5, -700.2),
	MobCFrame = CFrame.new(6625, 378, 244),
})

MakeQuest("QuestInvoke47", {
	Name = "Hydra Island Quest 1",
	LevelMin = 1625,
	LevelMax = 1649,
	Sea = 3,
	QuestName = "HydraIslandQuest",
	QuestId = 1,
	Mob = "Female Islander",
	Amount = 8,
	NpcName = "Hydra Island Quest Giver",
	NpcCFrame = CFrame.new(5200.5, 600.5, 300.2),
	MobCFrame = CFrame.new(4692.79, 797.97, 858.84),
})

MakeQuest("QuestInvoke48", {
	Name = "Hydra Island Quest 2",
	LevelMin = 1650,
	LevelMax = 1699,
	Sea = 3,
	QuestName = "HydraIslandQuest",
	QuestId = 2,
	Mob = "Venomous Assailant",
	Amount = 8,
	NpcName = "Hydra Island Quest Giver",
	NpcCFrame = CFrame.new(5200.5, 600.5, 300.2),
	MobCFrame = CFrame.new(4902, 670, 39),
})

MakeQuest("QuestInvoke49", {
	Name = "Great Tree Quest 1",
	LevelMin = 1700,
	LevelMax = 1724,
	Sea = 3,
	QuestName = "GreatTreeQuest",
	QuestId = 1,
	Mob = "Marine Commodore",
	Amount = 8,
	NpcName = "Great Tree Quest Giver",
	NpcCFrame = CFrame.new(2250.5, 80.5, -7200.2),
	MobCFrame = CFrame.new(2401, 123, -7589),
})

MakeQuest("QuestInvoke50", {
	Name = "Great Tree Quest 2",
	LevelMin = 1725,
	LevelMax = 1774,
	Sea = 3,
	QuestName = "GreatTreeQuest",
	QuestId = 2,
	Mob = "Marine Rear Admiral",
	Amount = 8,
	NpcName = "Great Tree Quest Giver",
	NpcCFrame = CFrame.new(2250.5, 80.5, -7200.2),
	MobCFrame = CFrame.new(3588, 229, -7085),
})

MakeQuest("QuestInvoke51", {
	Name = "Floating Turtle Quest 1",
	LevelMin = 1775,
	LevelMax = 1799,
	Sea = 3,
	QuestName = "TurtleQuest",
	QuestId = 1,
	Mob = "Fishman Raider",
	Amount = 8,
	NpcName = "Floating Turtle Quest Giver",
	NpcCFrame = CFrame.new(-10500.5, 330.5, -9000.2),
	MobCFrame = CFrame.new(-10941, 332, -8760),
})

MakeQuest("QuestInvoke52", {
	Name = "Floating Turtle Quest 2",
	LevelMin = 1800,
	LevelMax = 1824,
	Sea = 3,
	QuestName = "TurtleQuest",
	QuestId = 2,
	Mob = "Fishman Captain",
	Amount = 8,
	NpcName = "Floating Turtle Quest Giver",
	NpcCFrame = CFrame.new(-10500.5, 330.5, -9000.2),
	MobCFrame = CFrame.new(-11035, 332, -9087),
})

MakeQuest("QuestInvoke53", {
	Name = "Haunted Castle Quest 1",
	LevelMin = 1900,
	LevelMax = 1924,
	Sea = 3,
	QuestName = "HauntedQuest1",
	QuestId = 1,
	Mob = "Reborn Skeleton",
	Amount = 8,
	NpcName = "Haunted Castle Quest Giver",
	NpcCFrame = CFrame.new(-9500.5, 140.5, 5500.2),
	MobCFrame = CFrame.new(-8764, 142, 5963),
})

MakeQuest("QuestInvoke54", {
	Name = "Haunted Castle Quest 2",
	LevelMin = 1925,
	LevelMax = 1974,
	Sea = 3,
	QuestName = "HauntedQuest1",
	QuestId = 2,
	Mob = "Living Zombie",
	Amount = 8,
	NpcName = "Haunted Castle Quest Giver",
	NpcCFrame = CFrame.new(-9500.5, 140.5, 5500.2),
	MobCFrame = CFrame.new(-10227, 421, 6161),
})

MakeQuest("QuestInvoke55", {
	Name = "Haunted Castle Quest 3",
	LevelMin = 1975,
	LevelMax = 1999,
	Sea = 3,
	QuestName = "HauntedQuest2",
	QuestId = 1,
	Mob = "Demonic Soul",
	Amount = 8,
	NpcName = "Haunted Castle Quest Giver 2",
	NpcCFrame = CFrame.new(-9500.5, 140.5, 5500.2),
	MobCFrame = CFrame.new(-9579, 6, 6194),
})

MakeQuest("QuestInvoke56", {
	Name = "Haunted Castle Quest 4",
	LevelMin = 2000,
	LevelMax = 2024,
	Sea = 3,
	QuestName = "HauntedQuest2",
	QuestId = 2,
	Mob = "Posessed Mummy",
	Amount = 8,
	NpcName = "Haunted Castle Quest Giver 2",
	NpcCFrame = CFrame.new(-9500.5, 140.5, 5500.2),
	MobCFrame = CFrame.new(-9579, 6, 6194),
})

MakeQuest("QuestInvoke57", {
	Name = "Peanut Quest 1",
	LevelMin = 2025,
	LevelMax = 2049,
	Sea = 3,
	QuestName = "PeanutQuest1",
	QuestId = 1,
	Mob = "Peanut Scout",
	Amount = 8,
	NpcName = "Peanut Quest Giver",
	NpcCFrame = CFrame.new(-2100.5, 150.5, -10200.2),
	MobCFrame = CFrame.new(-1993, 187, -10103),
})

MakeQuest("QuestInvoke58", {
	Name = "Peanut Quest 2",
	LevelMin = 2050,
	LevelMax = 2074,
	Sea = 3,
	QuestName = "PeanutQuest1",
	QuestId = 2,
	Mob = "Peanut President",
	Amount = 8,
	NpcName = "Peanut Quest Giver",
	NpcCFrame = CFrame.new(-2100.5, 150.5, -10200.2),
	MobCFrame = CFrame.new(-2215, 159, -10474),
})

MakeQuest("QuestInvoke59", {
	Name = "Ice Cream Quest 1",
	LevelMin = 2075,
	LevelMax = 2099,
	Sea = 3,
	QuestName = "IceCreamQuest1",
	QuestId = 1,
	Mob = "Ice Cream Chef",
	Amount = 8,
	NpcName = "Ice Cream Quest Giver",
	NpcCFrame = CFrame.new(-800.5, 100.5, -10900.2),
	MobCFrame = CFrame.new(-877, 118, -11032),
})

MakeQuest("QuestInvoke60", {
	Name = "Ice Cream Quest 2",
	LevelMin = 2100,
	LevelMax = 2124,
	Sea = 3,
	QuestName = "IceCreamQuest1",
	QuestId = 2,
	Mob = "Ice Cream Commander",
	Amount = 8,
	NpcName = "Ice Cream Quest Giver",
	NpcCFrame = CFrame.new(-800.5, 100.5, -10900.2),
	MobCFrame = CFrame.new(-877, 118, -11032),
})

MakeQuest("QuestInvoke61", {
	Name = "Cake Quest 1",
	LevelMin = 2125,
	LevelMax = 2149,
	Sea = 3,
	QuestName = "CakeQuest1",
	QuestId = 1,
	Mob = "Cookie Crafter",
	Amount = 8,
	NpcName = "Cake Quest Giver",
	NpcCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
	MobCFrame = CFrame.new(-2021, 38, -12028),
})

MakeQuest("QuestInvoke62", {
	Name = "Cake Quest 2",
	LevelMin = 2150,
	LevelMax = 2174,
	Sea = 3,
	QuestName = "CakeQuest1",
	QuestId = 2,
	Mob = "Cake Guard",
	Amount = 8,
	NpcName = "Cake Quest Giver",
	NpcCFrame = CFrame.new(-2100.5, 30.5, -12000.2),
	MobCFrame = CFrame.new(-2024, 38, -12026),
})

MakeQuest("QuestInvoke63", {
	Name = "Cake Quest 3",
	LevelMin = 2175,
	LevelMax = 2199,
	Sea = 3,
	QuestName = "CakeQuest2",
	QuestId = 1,
	Mob = "Baking Staff",
	Amount = 8,
	NpcName = "Cake Quest Giver 2",
	NpcCFrame = CFrame.new(-2000.5, 30.5, -12800.2),
	MobCFrame = CFrame.new(-1932, 38, -12848),
})

MakeQuest("QuestInvoke64", {
	Name = "Cake Quest 4",
	LevelMin = 2200,
	LevelMax = 2224,
	Sea = 3,
	QuestName = "CakeQuest2",
	QuestId = 2,
	Mob = "Head Baker",
	Amount = 8,
	NpcName = "Cake Quest Giver 2",
	NpcCFrame = CFrame.new(-2000.5, 30.5, -12800.2),
	MobCFrame = CFrame.new(-1932, 38, -12848),
})

MakeQuest("QuestInvoke65", {
	Name = "Cocoa Quest 1",
	LevelMin = 2225,
	LevelMax = 2249,
	Sea = 3,
	QuestName = "CocoaQuest1",
	QuestId = 1,
	Mob = "Cocoa Warrior",
	Amount = 8,
	NpcName = "Cocoa Quest Giver",
	NpcCFrame = CFrame.new(100.5, 50.5, -12300.2),
	MobCFrame = CFrame.new(95, 73, -12309),
})

MakeQuest("QuestInvoke66", {
	Name = "Cocoa Quest 2",
	LevelMin = 2250,
	LevelMax = 2274,
	Sea = 3,
	QuestName = "CocoaQuest1",
	QuestId = 2,
	Mob = "Chocolate Bar Battler",
	Amount = 8,
	NpcName = "Cocoa Quest Giver",
	NpcCFrame = CFrame.new(100.5, 50.5, -12300.2),
	MobCFrame = CFrame.new(647, 42, -12401),
})

MakeQuest("QuestInvoke67", {
	Name = "Candy Quest 1",
	LevelMin = 2275,
	LevelMax = 2299,
	Sea = 3,
	QuestName = "CandyQuest1",
	QuestId = 1,
	Mob = "Sweet Thief",
	Amount = 8,
	NpcName = "Candy Quest Giver",
	NpcCFrame = CFrame.new(50.5, 40.5, -12500.2),
	MobCFrame = CFrame.new(116, 36, -12478),
})

MakeQuest("QuestInvoke68", {
	Name = "Candy Quest 2",
	LevelMin = 2300,
	LevelMax = 2324,
	Sea = 3,
	QuestName = "CandyQuest1",
	QuestId = 2,
	Mob = "Candy Rebel",
	Amount = 8,
	NpcName = "Candy Quest Giver",
	NpcCFrame = CFrame.new(50.5, 40.5, -12500.2),
	MobCFrame = CFrame.new(47, 61, -12889),
})

function CheckQuest.GetByCode(code)
	return CheckQuest.Functions[code]
end

function CheckQuest.GetData(code)
	return CheckQuest.Data[code]
end

function CheckQuest.GetAllCodes()
	return CheckQuest.Codes
end

function CheckQuest.GetByLevel(level)
	for code, data in pairs(CheckQuest.Data) do
		if level >= data.LevelMin and level <= data.LevelMax then
			return code, data
		end
	end
	return nil, nil
end

function CheckQuest.GetBySea(sea)
	local list = {}
	for code, data in pairs(CheckQuest.Data) do
		if data.Sea == sea then
			table.insert(list, {Code = code, Data = data})
		end
	end
	return list
end

function CheckQuest.GetByMob(mobName)
	local list = {}
	for code, data in pairs(CheckQuest.Data) do
		if data.Mob == mobName then
			table.insert(list, {Code = code, Data = data})
		end
	end
	return list
end

function CheckQuest.StartQuest(code)
	local data = CheckQuest.Data[code]
	if not data then return false end
	local rem = game:GetService("ReplicatedStorage"):FindFirstChild("Remotes")
	rem = rem and rem:FindFirstChild("CommF_")
	if not rem then return false end
	local ok = pcall(function()
		rem:InvokeServer("StartQuest", data.QuestName, data.QuestId)
	end)
	return ok
end

function CheckQuest.GetNpcCFrame(code)
	local data = CheckQuest.Data[code]
	return data and data.NpcCFrame or nil
end

function CheckQuest.GetMobCFrame(code)
	local data = CheckQuest.Data[code]
	return data and data.MobCFrame or nil
end

function CheckQuest.GetCurrentQuestCode()
	local level = 0
	pcall(function()
		level = game.Players.LocalPlayer.Data.Level.Value
	end)
	local code, data = CheckQuest.GetByLevel(level)
	return code, data
end

return CheckQuest
