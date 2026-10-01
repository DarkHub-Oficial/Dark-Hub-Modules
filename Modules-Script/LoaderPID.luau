local PlaceIDS = {
	[2753915549] = "SEA1",
	[85211729168715] = "SEA1",
	[4442272183] = "SEA2",
	[79091703265657] = "SEA2",
	[7449423635] = "SEA3",
	[100117331123089] = "SEA3",
}

if not PlaceIDS[game.PlaceId] then
	game:GetService("Players").LocalPlayer:Kick("World Incorrect")
	return
end

local LoadingPlaceId = PlaceIDS[game.PlaceId]
SEA1 = LoadingPlaceId == "SEA1"
SEA2 = LoadingPlaceId == "SEA2"
SEA3 = LoadingPlaceId == "SEA3"

getgenv().CheckPlaceId3 = game.PlaceId == 85211729168715 and 85211729168715 or 2753915549
getgenv().CheckPlaceId2 = game.PlaceId == 79091703265657 and 79091703265657 or 4442272183
getgenv().CheckPlaceId = game.PlaceId == 100117331123089 and 100117331123089 or 7449423635

OldWorld = game.PlaceId == getgenv().CheckPlaceId3
NewWorld = game.PlaceId == getgenv().CheckPlaceId2
ThreeWorld = game.PlaceId == getgenv().CheckPlaceId

getgenv().SEA1 = SEA1
getgenv().SEA2 = SEA2
getgenv().SEA3 = SEA3
getgenv().OldWorld = OldWorld
getgenv().NewWorld = NewWorld
getgenv().ThreeWorld = ThreeWorld
getgenv().DarkHubSea = LoadingPlaceId
getgenv().DarkHubPlaceId = game.PlaceId
getgenv().PlaceIDS = PlaceIDS
getgenv().LoadingPlaceId = LoadingPlaceId

return {
	Sea = LoadingPlaceId,
	PlaceId = game.PlaceId,
	SEA1 = SEA1,
	SEA2 = SEA2,
	SEA3 = SEA3,
	OldWorld = OldWorld,
	NewWorld = NewWorld,
	ThreeWorld = ThreeWorld,
}
