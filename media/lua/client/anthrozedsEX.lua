require "../shared/Definitions/UnderwearDefinition"
UnderwearDefinition = UnderwearDefinition or {};

AnthroZedsEX = {}

UnderwearDefinition.Female_F_Black = {
	chanceToSpawn = 10000,
	gender = "female",
	top = {
		},
		bottom = "",
}

UnderwearDefinition.Male_F_Black = {
	chanceToSpawn = 10000,
	gender = "male",
	top = {
		},
		bottom = "",
}

AnthroZedsEX.AnthroUngulatesF = {
"Furry_AnthroUngulates_FemaleBlackSheep",
"Furry_AnthroUngulates_FemaleWhiteSheep",
"Furry_AnthroUngulates_FemaleBlackWhiteSheep",
"Furry_AnthroUngulates_FemaleHerdwickSheep",
"Furry_AnthroUngulates_FemaleJacobsSheep",
"Furry_AnthroUngulates_FemaleScottishBlackSheep",
"Furry_AnthroUngulates_FemalePinkSheep",
"Furry_AnthroUngulates_FemaleWildBoar",
"Furry_AnthroUngulates_FemaleCowBrown",
"Furry_AnthroUngulates_FemaleCowBlackWhite",
"Furry_AnthroUngulates_FemaleCowBlack",
"Furry_AnthroUngulates_FemaleCowBlue",
"Furry_AnthroUngulates_FemaleGoatBrown"
}
AnthroZedsEX.AnthroUngulatesM = {
"Furry_AnthroUngulates_MaleBlackSheep",
"Furry_AnthroUngulates_MaleWhiteSheep",
"Furry_AnthroUngulates_MaleBlackWhiteSheep",
"Furry_AnthroUngulates_MaleHerdwickSheep",
"Furry_AnthroUngulates_MaleJacobsSheep",
"Furry_AnthroUngulates_MaleScottishBlackSheep",
"Furry_AnthroUngulates_MalePinkSheep",
"Furry_AnthroUngulates_MaleWildBoar",
"Furry_AnthroUngulates_MaleCowBrown",
"Furry_AnthroUngulates_MaleCowBlackWhite",
"Furry_AnthroUngulates_MaleCowBlack",
"Furry_AnthroUngulates_MaleCowBlue",
"Furry_AnthroUngulates_MaleGoatBrown"
}

AnthroZedsEX.LoongF = {
"Furry_Loong_FemaleLunarLoong",
"Furry_Loong_FemaleRedLoong",
"Furry_Loong_FemaleGreenLoong",
"Furry_Loong_FemaleTransLoong",
"Furry_Loong_FemaleGoldLoong",
"Furry_Loong_FemaleBlueLoong"
}

AnthroZedsEX.LoongM = {
"Furry_Loong_MaleLunarLoong",
"Furry_Loong_MaleRedLoong",
"Furry_Loong_MaleGreenLoong",
"Furry_Loong_MaleTransLoong",
"Furry_Loong_MaleGoldLoong",
"Furry_Loong_MaleBlueLoong"
}

AnthroZedsEX.CJF = {
"Furry_CobraJackalope_FemaleLunarJackalope",
"Furry_CobraJackalope_FemaleDuskCobra",
"Furry_CobraJackalope_FemaleDuskJackalopeRitual",
"Furry_CobraJackalope_FemaleLunarCobraHorned"
}

AnthroZedsEX.CJM = {
"Furry_CobraJackalope_MaleLunarJackalope",
"Furry_CobraJackalope_MaleDuskCobra",
"Furry_CobraJackalope_MaleDuskJackalopeRitual",
"Furry_CobraJackalope_MaleLunarCobraHorned"
}

AnthroZedsEX.baseSpeciesF = {
"Furry_FemaleCat",
"Furry_FemaleDeer",
"Furry_FemaleDog",
"Furry_FemaleFox",
"Furry_FemaleFox_Black",
"Furry_FemaleFox_White",
"Furry_FemaleJackal",
"Furry_FemaleRabbit",
"Furry_FemaleTrashPanda",
"Furry_FemaleSpiffy",
"Furry_FemaleSnep",
"Furry_FemaleWolf",
"Furry_FemaleWolf_Black",
"Furry_FemaleWolf_White",
"Furry_FemaleWolf_Red",
"Furry_FemaleLeggy",
"Furry_FemaleTubeRat",
"Furry_FemaleMarten"
}

AnthroZedsEX.baseSpeciesM = {
"Furry_MaleCat",
"Furry_MaleDeer",
"Furry_MaleDog",
"Furry_MaleFox",
"Furry_MaleFox_Black",
"Furry_MaleFox_White",
"Furry_MaleJackal",
"Furry_MaleRabbit",
"Furry_MaleTrashPanda",
"Furry_MaleSpiffy",
"Furry_MaleSnep",
"Furry_MaleWolf",
"Furry_MaleWolf_Black",
"Furry_MaleWolf_White",
"Furry_MaleWolf_Red",
"Furry_MaleLeggy",
"Furry_MaleTubeRat",
"Furry_MaleMarten"
}

AnthroZedsEX.modList = {

AnthroUngulates = {AnthroZedsEX.AnthroUngulatesF, AnthroZedsEX.AnthroUngulatesM},
Loong = {AnthroZedsEX.LoongF, AnthroZedsEX.LoongM},
CobraJackalope = {AnthroZedsEX.CJF, AnthroZedsEX.CJM}


}

function AnthroZedsEX.addToSpawn(femaleList, maleList)
	for i = 1, #femaleList do
		table.insert(UnderwearDefinition.Female_F_Black.top, {name=""..femaleList[i], chance=1});
		print(""..femaleList[i].." added to female spawns.");
		table.insert(UnderwearDefinition.Male_F_Black.top, {name=""..maleList[i], chance=1});
		print(""..maleList[i].." added to male spawns.");
	end
end

function AnthroZedsEX.checkMod(modID)
	print("Checking for mod "..modID..".")
	if getActivatedMods():contains(modID) then
		print("" .. modID .. " detected, adding to spawn list.");
		AnthroZedsEX.addToSpawn(AnthroZedsEX.modList[modID][1], AnthroZedsEX.modList[modID][2]);
	end
end

function AnthroZedsEX.updateSpawnChance()
	print("UnderwearDefinition spawn chance was: " .. UnderwearDefintion.baseChance);
	AZedChance = SandboxVars.AnthroZedsEX.Percent;
	UnderwearDefinition.baseChance = AZedChance;
	print("AnthroZedsEX: Updating spawn chance to: " ..AZedChance);
	print("UnderwearDefinition chance is now: " ..UnderwearDefinition.baseChance);

end

function AnthroZedsEX.onGameBoot()
	print("Anthro Zeds Expanded has loaded.")
	AnthroZedsEX.addToSpawn(AnthroZedsEX.baseSpeciesF, AnthroZedsEX.baseSpeciesM);
	AnthroZedsEX.checkMod("AnthroUngulates");
	AnthroZedsEX.checkMod("Loong");
	AnthroZedsEX.checkMod("CobraJackalope")
end

Events.OnGameBoot.Add(AnthroZedsEX.onGameBoot)