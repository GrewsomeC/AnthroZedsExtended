require "../shared/Definitions/UnderwearDefinition"
UnderwearDefinition = UnderwearDefinition or {};
AZedChance = SandboxVars.AnthroZedsEX.Percent;
UnderwearDefinition.baseChance = AZedChance;

AnthroZedsEXServer = {}

function AnthroZedsEXServer.testThisShit()

	print("SUP MOTHERFUCKER???")
	print("HOLY FUCK!!!! THE SANDBOX VAR IS: " .. AZedChance)
	print("AY YO CHECK IT, NOW THE BASE CHANCE IS: " ..UnderwearDefinition.baseChance)

end