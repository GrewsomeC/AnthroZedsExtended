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
AnthroZedsEX.avaialbleModels = {}


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

function AnthroZedsEX.addToSpawn(modTable)
	for i = 1, #modTable.types do
		table.insert(AnthroZedsEX.avaialbleModels, {name=""..modTable.start.."Female"..modTable.types[i], chance=1})
		print(""..modTable.start.."Female"..modTable.types[i].." added to female spawns")
		table.insert(AnthroZedsEX.avaialbleModels, {name=""..modTable.start.."Male"..modTable.types[i], chance=1})
		print(""..modTable.start.."Male"..modTable.types[i].." added to male spawns")
	end
end

AnthroZedsEX.checkedZeds = {}
AnthroZedsEX.optionalSlots = {
	"Socks",
	"RightWrist",
	"LeftWrist",
	"Hat",
	"Right_MiddleFinger",
	"Left_MiddleFinger",
	"Right_RingFinger",
	"Left_RingFinger",
	"TankTop",
	"Tshirt",
	"Sweater",
	"Hands",
	"Shoes"
}
AnthroZedsEX.debugLastZombie = {}

function AnthroZedsEX.checkZombie(zombie)
	local zID = zombie:getUID()
    if has_value(AnthroZedsEX.checkedZeds, zID) then
        return
	end

	local itemVisuals = zombie:getItemVisuals()

	for i = 1, itemVisuals:size() - 1 do
		local testedItem = itemVisuals:get(i)
		local bodySlot = testedItem:getScriptItem():getBodyLocation()
		local optionalItem = has_value(AnthroZedsEX.optionalSlots, bodySlot)
		if optionalItem == true then
			if zombie:isFemale() then
				testedItem:setItemType("Base.Furry_FemaleCat")
			else
				testedItem:setItemType("Base.Furry_MaleCat")
			end
			print("Item on this zombie replaced!")
			zombie:resetModel()
			table.insert(AnthroZedsEX.checkedZeds, zID)
			break
		end
	end

	
end

function AnthroZedsEX.onGameStart()
	AnthroZedsEX.checkMods()
end

function AnthroZedsEX.OnZombieUpdate(zombie)
    local checkedZed = AnthroZedsEX.checkZombie(zombie)
end


Events.OnZombieUpdate.Add(AnthroZedsEX.OnZombieUpdate)
Events.OnGameStart.Add(AnthroZedsEX.onGameStart)

print("AZE loaded.")