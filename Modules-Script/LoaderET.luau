local allowedExecutors = (getexecutorname and getexecutorname()) or (identifyexecutor and identifyexecutor())

if allowedExecutors then
	if
		string.find(allowedExecutors, "Real")
		or string.find(allowedExecutors, "Delta")
		or string.find(allowedExecutors, "Madium")
		or string.find(allowedExecutors, "Ronix")
		or string.find(allowedExecutors, "YubX")
		or string.find(allowedExecutors, "Seliware")
		or string.find(allowedExecutors, "Arceus")
		or string.find(allowedExecutors, "Velocity")
		or string.find(allowedExecutors, "Xeno")
		or string.find(allowedExecutors, "Solara")
		or string.find(allowedExecutors, "Codex")
		or string.find(allowedExecutors, "Cryptic")
		or string.find(allowedExecutors, "Vegax")
		or string.find(allowedExecutors, "Trigon")
		or string.find(allowedExecutors, "Evon")
		or string.find(allowedExecutors, "Vortex")
		or string.find(allowedExecutors, "Cosmic")
		or string.find(allowedExecutors, "Potassium")
		or string.find(allowedExecutors, "Macsploit")
		or string.find(allowedExecutors, "Hydrogen")
		or string.find(allowedExecutors, "Punkx")
		or string.find(allowedExecutors, "Synapse")
		or string.find(allowedExecutors, "Volt")
		or string.find(allowedExecutors, "Isaeva")
		or string.find(allowedExecutors, "Luna")
		or string.find(allowedExecutors, "Eclipse")
	then
	else
		game:GetService("Players").LocalPlayer:Kick("Executor Invalid, Please try using Delta Mobile Or Madium Pc!")
		return
	end
end

getgenv().allowedExecutors = allowedExecutors
getgenv().DarkHubExecutor = allowedExecutors

return {
	Executor = allowedExecutors,
}
