# Anthro Zeds Extended
Anthro Zeds Extended (AZE) is a mod for Project Zomboid that allows zombies to spawn as anthro animals ("furries"). It provides a number of fixes and additions over the original mod, Anthro Zeds, by Sai.

AZE does not include any models. It only provides the ability for zombies to spawn as species added by other mods, as well as an interface for tweaking said spawns.

## Installation
The by far easiest method is to simply subscribe to the mod on Steam Workshop. Steam will download, unpack, and install everything in the proper place for you. It will also automatically download and install updates whenever I add them.

If for some reason you insist on installing it manually, Windows users can download this repo and place it in C:/users/<username>/Zomboid/mods/AnthroZedsExtended.

## Additions
Anthro Zeds Extended adds a number of features not included in the original Anthro Zeds mod:

* The "hybrid glitch" where zeds would spawn multiple species, and thus have things like extra antlers or tails, has been fixed. This was the main reason I made this mod, tbh.
* Automatic detection of which submods are installed, preventing the need to have a different mod for every submod.
* Increased compatibility, allowing spawns of _all_ species that are available on Workshop, instead of just Anthro Survivors and Scalies.
* Customizable spawn weights, so you can prioritize the species you want to see more of.
* Toggleable oddities, allowing you to disable things like fantasy species (ex. jackalopes, dragons), anachronisms (ex. protogens, synths), and unnatural colors (ex. blue cows, pink sheep).

## Dependencies
* Anthro Survivors

While AZE _technically_ does not need Anthro Survivors to function, it is pointless to run this mod without it as AZE will have nothing to add to the spawn tables.

## Compatible Mods
The following mods are compatible with Anthro Zeds Extended, and will automatically add them to the spawn list:

* Anthro Survivors
* Anthro Survivors - Ungulate Friends
* Anthro Survivors - Cobra and Jackalope
* Anthro Survivors - Loong

### Upcoming
I plan to add the following mods as compatible soon:

* Anthro Survivors - More Species
* Anthro Survivors - Scalies!
* Anthro Survivors - Aligator and Shark
* Anthro Survivors - Insectoids

## Incompatible Mods
The following mods are **not** compatible with Anthro Zeds Extended. Do not run these mods while Anthro Zeds Extended is running.

* [Anthro Zeds mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2930890411)
  * Will at best duplicate some spawns, at worst completely override what this mod does. They do the same thing anyway, so there's no point.
* Any other mods that spawn clothing on zombies by utilizing the UnderwearDefinitions method.
  * Will either add non-anthro spawns to the game, overwrite them, or do nothing depending on load order. Point being, if a mod adds clothing to a zombie when it spawns, it will probably cause issues.

## FAQ

### Can I have 100% anthro spawns?
Currently not possible. The method AZE uses to spawn anthro zombies is an addition to the game's zombie underwear spawning system (yes, really). As a result, we can only ADD options. As it currently stands, the chance to spawn anthro:human is 10000:100, or 100 to 1, meaning out of every 100 zombies, one should be human. Just pretend it is a monkey furry or something.

I believe this can be fixed, but will take some work to do so and will come in a later version.

### If human spawns are 1:100, why am I seeing multiple in one small area?
Because random is random. 1 in 100 does not mean only one in one hundred will spawn; it means the _average_ is one in one hundred. It is totally possible, though extremely unlikely, to enter a building and see five humans all in one room. Just the same, it is completely possible, though also very unlikely, to see 100,000 zombies and none of them be humans.

### Will this spawn specific skins from individual fursona workshop items?
No. AZE only spawns the skins included in the base mods listed above in _compatible mods._

There are simply too many of them to go through and add every single one to this, and then keeping it updated would be a large time investment. Additionally, most people want their characters to be the survivor, not the zombie, and would dislike seeing multiple of themselves.

### I saw something unique, does AZE have any textures in it?
There are a few very rare spawn (~1:100,000) easter egg zeds, yes. They are OCs of mine and my close friends.

### Can I play a human with anthro zombies?
AZE makes absolutely zero changes to players. You can play as anything you want, including humans.

## Technical Details (smelly nerd stuff)


## Credits/Thanks
* Wuffwick and Jaql for making the [Anthro Survivors mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2893930681).
* Sai for making the original [Anthro Zeds mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2930890411).
* All the modders making new species for the Anthro Survivors mod.
* CAESURA, creator of numerous [Anthro Survivors submods](https://steamcommunity.com/workshop/filedetails/?id=3162333876), for providing me with the original Anthro Survivors app when it became unavailable.