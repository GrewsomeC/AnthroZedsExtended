AnthroZedsEX = {}

--I actually have to write this out. Every time I want to find a value in an array.
--Lua may be one of the worst languages I have ever used. This is pretty inexcusable.
local function has_value(table, find)
    for index, value in ipairs(table) do
        if value == find then
            return true
        end
    end
    return false
end

--Decides whether or not more bizarre species, such as electronic, fantasy, or unnatural colors are spawned, or if things are kept more realistic.
AnthroZedsEX.enableAnachronistic = false
AnthroZedsEX.enableFantasy = true
AnthroZedsEX.enableUnnatural = true

--List of enabled mods
AnthroZedsEX.enabledMods = {}
AnthroZedsEX.availableModels = {}
AnthroZedsEX.availableModels.female = {}
AnthroZedsEX.availableModels.male = {}


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
	"DuskCobra",
	"DuskCobraHorned",
	"DuskJackalope",
	"DuskJackalopeRitual",
	"LunarCobra",
	"LunarCobraHorned",
	"LunarJackalope",
	"LunarJackalopeRitual",
	"MochaCobra",
	"MochaCobraHorned",
	"MochaJackalope",
	"MochaJackalopeRitual",
	"SageCobra",
	"SageCobraHorned",
	"SageJackalope",
	"SageJackalopeRitual",
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

AnthroZedsEX.allMods = {
	"AnthroUngulates",
	"Loong",
	"CobraJackalope"
}

--Define which mod uses which list
AnthroZedsEX.modList = {
	AnthroUngulates = AnthroZedsEX.Ungulates,
	Loong = AnthroZedsEX.Loong,
	CobraJackalope = AnthroZedsEX.CJ
}

--Check if mod is installed; if so, add to enabled list and add the models to the spawn list
function AnthroZedsEX.checkMods()
	local modID
	for i = 1, #AnthroZedsEX.allMods do
		modID = #AnthroZedsEX.allMods[i]
		print("Checking for mod "..modID..".")
		if getActivatedMods():contains(modID) then
			print("" .. modID .. " detected, adding to spawn list.");
			table.insert(AnthroZedsEX.enabledMods, modID)
			AnthroZedsEX.addToSpawn(AnthroZedsEX.modList[modID]);
		end
	end
end

--Add species to spawn list.
function AnthroZedsEX.addToSpawn(modTable)
	for i = 1, #modTable.types do
		table.insert(AnthroZedsEX.availableModels.female, {name=""..modTable.start.."Female"..modTable.types[i], chance=1})
		print(""..modTable.start.."Female"..modTable.types[i].." added to female spawns")
		table.insert(AnthroZedsEX.availableModels.male, {name=""..modTable.start.."Male"..modTable.types[i], chance=1})
		print(""..modTable.start.."Male"..modTable.types[i].." added to male spawns")
	end
end

--Pick random species from the available list.
function AnthroZedsEX.randomFurry(female)
	local randomFur
	local randomNumber
	if female then
		randomNumber = ZombRand(#AnthroZedsEX.availableModels.female)
		randomFur = AnthroZedsEX.availableModels.female[randomNumber]["name"]
		return randomFur
	else
		randomNumber = ZombRand(#AnthroZedsEX.availableModels.male)
		randomFur = AnthroZedsEX.availableModels.male[randomNumber]["name"]
		return randomFur
	end
end

AnthroZedsEX.checkedZeds = {}
AnthroZedsEX.optionalSlots = {
	"Socks",
	"RightWrist",
	"LeftWrist",
	"Right_MiddleFinger",
	"Left_MiddleFinger",
	"Right_RingFinger",
	"Left_RingFinger",
	"Hands",
	"Shoes"
}
AnthroZedsEX.debugLastZombie = {}
AnthroZedsEX.totalZombies = 0

--Extremely rough and will need to be rewritten later to some extent.
--Want to make the chosen item actually find the lowest point on the list rather than just the first one it finds.
function AnthroZedsEX.checkZombie(zombie)
	local zID = zombie:getPersistentOutfitID()
    if has_value(AnthroZedsEX.checkedZeds, zID) then
        return
	end
	--Zombies don't have inventories until they die, so we have to get their "ItemVisuals" instead.
	local itemVisuals = zombie:getItemVisuals()
	
	--Loop through all of their visuals and find an item that is on an "optional" slot, replace it with fur.
	for i = 1, itemVisuals:size() - 1 do
		if itemVisuals:size() < 2 then return end
		local testedItem = itemVisuals:get(i)
		if testedItem == nil then return end
		local bodySlot = testedItem:getScriptItem():getBodyLocation()
		local optionalItem = has_value(AnthroZedsEX.optionalSlots, bodySlot)
		if optionalItem == true then
			local randomFur = AnthroZedsEX.randomFurry(zombie:isFemale())
			testedItem:setItemType(randomFur)
			print("Item on "..zID.." replaced!")
			zombie:resetModel()
			table.insert(AnthroZedsEX.checkedZeds, zID)
			return
		end
	end

	
end

function AnthroZedsEX.onGameStart()
	print("AZE: Starting onGameStart.")
	AnthroZedsEX.addToSpawn(AnthroZedsEX.baseSpecies)
	AnthroZedsEX.checkMods()
end

function AnthroZedsEX.onZombieUpdate(zombie)
    local checkedZed = AnthroZedsEX.checkZombie(zombie)
end



Events.OnZombieUpdate.Add(AnthroZedsEX.onZombieUpdate)
Events.OnGameStart.Add(AnthroZedsEX.onGameStart)

print("AZE loaded.")