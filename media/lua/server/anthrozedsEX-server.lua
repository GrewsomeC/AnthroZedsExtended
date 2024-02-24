require "../shared/Definitions/UnderwearDefinition"

--Replace default spawn chance with user-defined spawn.
--We do this in \server because this runs AFTER the Sandbox vars are set, while \client is on game boot.
UnderwearDefinition = UnderwearDefinition or {};
AZedChance = SandboxVars.AnthroZedsEX.Percent;
UnderwearDefinition.baseChance = AZedChance;

AnthroZedsEXServer = {}

--Test method when I was unsure if the 100% spawn chance was working lol.
function AnthroZedsEXServer.testThisShit()

	print("SUP MOTHERFUCKER???")
	print("HOLY FUCK!!!! THE SANDBOX VAR IS: " .. AZedChance)
	print("AY YO CHECK IT, NOW THE BASE CHANCE IS: " ..UnderwearDefinition.baseChance)

end