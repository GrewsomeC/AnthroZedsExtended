require "../shared/Definitions/UnderwearDefinition"
UnderwearDefinition = UnderwearDefinition or {};

AnthroZedsEX = {}

-- create empty table to fill
-- Does this "F_Black" section actually do anything, or is this just a case of "everyone does it beacuse everyone does it"? Find out.
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


-- Ungulates list
AnthroZedsEX.Ungulates = {}
AnthroZedsEX.Ungulates.start = "Furry_AnthroUngulates"
AnthroZedsEX.Ungulates.types = {
	"BlackSheep",
	"WhiteSheep",
	"BlackWhiteSheep",
	"JacobsSheep",
	"ScottishBlackSheep",
	"PinkSheep",
	"WildBoar",
	"CowBrown",
	"CowBlackWhite",
	"CowBlack",
	"CowBlue",
	"GoatBrown"
}

-- Loong list
AnthroZedsEX.Loong = {}
AnthroZedsEX.Loong.start = "Furry_Loong_"
AnthroZedsEX.Loong.types = {
	"LunarLoong",
	"RedLoong",
	"GreenLoong",
	"TransLoong",
	"GoldLoong",
	"BlueLoong"
}

-- Cobra/Jackalope list
AnthroZedsEX.CJ = {}
AnthroZedsEX.CJ.start = "Furry_CobraJackalope_"
AnthroZedsEX.CJ.types = {
	"LunarJackalope",
	"DuskCobra",
	"DuskJackalopeRitual",
	"LunarCobraHorned"
}

-- Anthro Survivors base mod list
AnthroZedsEX.baseSpecies = {}
AnthroZedsEX.baseSpecies.start = "Furry_"
AnthroZedsEX.baseSpecies.types = {
	"Cat",
	"Deer",
	"Dog",
	"Fox",
	"Fox_Black",
	"Fox_White",
	"Jackal",
	"Rabbit",
	"TrashPanda",
	"Spiffy",
	"Snep",
	"Wolf",
	"Wolf_Black",
	"Wolf_White",
	"Wolf_Red",
	"Leggy",
	"TubeRat",
	"Marten"
}



--Define which mod uses which list
AnthroZedsEX.modList = {
	AnthroUngulates = AnthroZedsEX.Ungulates,
	Loong = AnthroZedsEX.Loong,
	CobraJackalope = AnthroZedsEX.CJ
}

--Add models to the spawn list
function AnthroZedsEX.addToSpawn(modTable)
	for i = 1, #modTable.types do
		table.insert(UnderwearDefinition.Female_F_Black.top, {name=""..modTable.start.."Female"..modTable.types[i], chance=1})
		print(""..modTable.start.."Female"..modTable.types[i].." added to female spawns.")
		table.insert(UnderwearDefinition.Male_F_Black.top, {name=""..modTable.start.."Male"..modTable.types[i], chance=1})
		print(""..modTable.start.."Male"..modTable.types[i].." added to male spawns.")
	end
end

--Check if mod is installed
function AnthroZedsEX.checkMod(modID)
	print("Checking for mod "..modID..".")
	if getActivatedMods():contains(modID) then
		print("" .. modID .. " detected, adding to spawn list.");
		AnthroZedsEX.addToSpawn(AnthroZedsEX.modList[modID]);
	end
end

--Get the sandbox percentage 
function AnthroZedsEX.updateSpawnChance()
	print("UnderwearDefinition spawn chance was: " .. UnderwearDefintion.baseChance);
	AZedChance = SandboxVars.AnthroZedsEX.Percent;
	UnderwearDefinition.baseChance = AZedChance;
	print("AnthroZedsEX: Updating spawn chance to: " ..AZedChance);
	print("UnderwearDefinition chance is now: " ..UnderwearDefinition.baseChance);

end

--Add the default models, then check for every submod and whether it is installed or not
function AnthroZedsEX.onGameBoot()
	print("Anthro Zeds Expanded has loaded.")
	AnthroZedsEX.addToSpawn(AnthroZedsEX.baseSpecies);
	AnthroZedsEX.checkMod("AnthroUngulates");
	AnthroZedsEX.checkMod("Loong");
	AnthroZedsEX.checkMod("CobraJackalope")
end

--Lastly, add our method to the game's boot method, so it automatically runs when the game starts.
Events.OnGameBoot.Add(AnthroZedsEX.onGameBoot)