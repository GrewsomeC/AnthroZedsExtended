AnthroZedsEX = {}

AnthroZedsEX.enableAnachronistic = false
AnthroZedsEX.enableFantasy = false
AnthroZedsEX.enableUnnatural = false

--For some baffling reason, Lua does not include a way to check values in a table.
--"erm thats because lua is a *small* language by design" 🤓☝️ holy christ shut up nobody asked
local function has_value(table, find)
    for index, value in ipairs(table) do
        if value == find then
            return true
        end
    end
    return false
end



--List of enabled mods
AnthroZedsEX.enabledMods = {}
--I don't know why this one is necessary but it breaks if I don't have it here.
AnthroZedsEX.availableModels = {}
--Male/female versions of each model. Probably a better way to do this, but I probably don't care.
AnthroZedsEX.availableModels.female = {}
AnthroZedsEX.availableModels.male = {}

AnthroZedsEX.debugMode = true

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

--Xochie's MSM list
AnthroZedsEX.XochieMSM = {}
AnthroZedsEX.XochieMSM.start = "Furry_XochisMSM_"
AnthroZedsEX.XochieMSM.types = {
	"BlueDog",
	"RedDog",
	"piebald",
	"bay",
	"eurasian",
	"canadian",
	"riverotter",
	"bengal",
	"white",
	"pride"
}
AnthroZedsEX.XochieMSM.anachronistic = {
	"DefaultSynth",
	"RedSynth",
	"YellowSynth",
	"GreenSynth",
	"BlueSynth",
	"PurpleSynth",
	"BSODSynth",
	"GreenProot",
	"RedProot",
	"BlueProot",
	"SilverProot",
	"PurpProot"
}
AnthroZedsEX.XochieMSM.fantasy = {
	"bluvali",
	"pinkvali",
	"greenvali",
	"bluesergal",
	"brownsergal",
	"greensergal",
	"greysergal",
	"purplesergal",
	"redsergal",
	"winesergal",
	"silversergal",
	"southernsergal"
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

--List of all compatible mods.
AnthroZedsEX.allMods = {
	"AnthroUngulates",
	"Loong",
	"CobraJackalope",
	"XochisMSM"
}

--Define which mod uses which list
AnthroZedsEX.modList = {
	AnthroUngulates = AnthroZedsEX.Ungulates,
	Loong = AnthroZedsEX.Loong,
	CobraJackalope = AnthroZedsEX.CJ,
	XochisMSM = AnthroZedsEX.XochieMSM
}

--Check if mod is installed; if so, add to enabled list and add the models to the spawn list
function AnthroZedsEX.checkMods()
	if AnthroZedsEX.debugMode then print("AZE: checkMods() is starting.") end
	local modID
	for i = 1, #AnthroZedsEX.allMods do
		modID = AnthroZedsEX.allMods[i]
		if AnthroZedsEX.debugMode then print("Checking for mod "..modID..".") end
		if getActivatedMods():contains(modID) then
			if AnthroZedsEX.debugMode then print("" .. modID .. " detected, adding to spawn list.") end
			table.insert(AnthroZedsEX.enabledMods, modID)
			AnthroZedsEX.addToSpawn(AnthroZedsEX.modList[modID]);
		end
		
	end
end

--Add species to spawn list.
function AnthroZedsEX.addToSpawn(modTable)
	for i = 1, #modTable.types do
		table.insert(AnthroZedsEX.availableModels.female, {name=""..modTable.start.."Female"..modTable.types[i], chance=1})
		if AnthroZedsEX.debugMode then print(""..modTable.start.."Female"..modTable.types[i].." added to female spawns") end
		table.insert(AnthroZedsEX.availableModels.male, {name=""..modTable.start.."Male"..modTable.types[i], chance=1})
		if AnthroZedsEX.debugMode then print(""..modTable.start.."Male"..modTable.types[i].." added to male spawns") end
	end
	if AnthroZedsEX.debugMode then if not AnthroZedsEX.enableAnachronistic then print("Anachronism disabled, skipping check.") end end
	if AnthroZedsEX.debugMode then if not modTable.anachronistic then print("Mod has no anachronistic species to add.") end end
	if AnthroZedsEX.enableAnachronistic and modTable.anachronistic then
		if AnthroZedsEX.debugMode then print("Anachronism on and mod has them. Adding to spawns.") end
		for i = 1, #modTable.anachronistic do
			table.insert(AnthroZedsEX.availableModels.female, {name=""..modTable.start.."Female"..modTable.anachronistic[i], chance=1})
			if AnthroZedsEX.debugMode then print(""..modTable.start.."Female"..modTable.anachronistic[i].." added to female spawns") end
			table.insert(AnthroZedsEX.availableModels.male, {name=""..modTable.start.."Male"..modTable.anachronistic[i], chance=1})
			if AnthroZedsEX.debugMode then print(""..modTable.start.."Male"..modTable.anachronistic[i].." added to male spawns") end
		end
	end
	if AnthroZedsEX.debugMode then if not AnthroZedsEX.enableFantasy then print("Fantasy disabled, skipping check.") end end
	if AnthroZedsEX.debugMode then if not modTable.fantasy then print("Mod has no fantasy species to add.") end end
	if AnthroZedsEX.enableFantasy and modTable.fantasy then
		if AnthroZedsEX.debugMode then print("Fantasy on and mod has them. Adding to spawns.") end
		for i = 1, #modTable.fantasy do
			table.insert(AnthroZedsEX.availableModels.female, {name=""..modTable.start.."Female"..modTable.fantasy[i], chance=1})
			if AnthroZedsEX.debugMode then print(""..modTable.start.."Female"..modTable.fantasy[i].." added to female spawns") end
			table.insert(AnthroZedsEX.availableModels.male, {name=""..modTable.start.."Male"..modTable.fantasy[i], chance=1})
			if AnthroZedsEX.debugMode then print(""..modTable.start.."Male"..modTable.fantasy[i].." added to male spawns") end
		end
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

--Stores zeds we have already replaced something on, performance saver.
AnthroZedsEX.checkedZeds = {}

--Slots we don't really care about. If I can find a way to make anthro feet "tough"
--and not be injured barefoot, I might just swap this to socks/shoes entirely.
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

--Extremely rough and will need to be rewritten later to some extent.
--Want to make the chosen item actually find the lowest point on the list rather than just the first one it finds.
--But for now, it works.
function AnthroZedsEX.checkZombie(zombie)
	local zID = zombie:getPersistentOutfitID()
    if has_value(AnthroZedsEX.checkedZeds, zID) then
        return
	end
	--Zombies don't have inventories until they die, so we have to get their "ItemVisuals" instead.
	local itemVisuals = zombie:getItemVisuals()
	
	--Loop through all of their visuals and find an item that is on an "optional" slot, replace it with fur.
	--Because for some reason, they DO store a list of clothing, just NOT as items. Uh, okay I guess.
	for i = 1, itemVisuals:size() - 1 do
		if itemVisuals:size() < 2 then return end
		local testedItem = itemVisuals:get(i)
		if testedItem == nil then return end
		local bodySlot = testedItem:getScriptItem():getBodyLocation()
		local optionalItem = has_value(AnthroZedsEX.optionalSlots, bodySlot)
		if optionalItem == true then
			local randomFur = AnthroZedsEX.randomFurry(zombie:isFemale())
			testedItem:setItemType(randomFur)
			if AnthroZedsEX.debugMode then print("Item on "..zID.." replaced!") end
			zombie:resetModel()
			table.insert(AnthroZedsEX.checkedZeds, zID)
			return
		end
	end

	
end

function AnthroZedsEX.onGameStart()
	if AnthroZedsEX.debugMode then print("AZE: Starting onGameStart.") end
	--Decides whether or not more bizarre species, such as electronic, fantasy, or unnatural colors are spawned, or if things are kept more realistic.
	AnthroZedsEX.enableAnachronistic = SandboxVars.AnthroZedsEX.allowAnachronistic
	AnthroZedsEX.enableFantasy = SandboxVars.AnthroZedsEX.allowFantasy
	AnthroZedsEX.enableUnnatural = SandboxVars.AnthroZedsEX.allowUnnatural
	AnthroZedsEX.addToSpawn(AnthroZedsEX.baseSpecies)
	AnthroZedsEX.checkMods()
end

function AnthroZedsEX.onZombieUpdate(zombie)
    AnthroZedsEX.checkZombie(zombie)
end



Events.OnZombieUpdate.Add(AnthroZedsEX.onZombieUpdate)
Events.OnGameStart.Add(AnthroZedsEX.onGameStart)

if AnthroZedsEX.debugMode then print("AZE loaded.") end