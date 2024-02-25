# Anthro Zeds Extended
Anthro Zeds Extended (AZE) is a mod for Project Zomboid that allows zombies to spawn as anthro animals ("furries"). It provides a number of fixes and additions over the original mod, Anthro Zeds, by Sai.

AZE does not include any models. It only provides the ability for zombies to spawn as species added by other mods, as well as an interface for tweaking said spawns.

## Installation
The by far easiest method is to simply subscribe to the mod on Steam Workshop. Steam will download, unpack, and install everything in the proper place for you. It will also automatically download and install updates whenever I add them.

If for some reason you insist on installing it manually, Windows users can download this repo and place it in C:/users/<\username>/Zomboid/mods/AnthroZedsExtended.

## Additions
Anthro Zeds Extended adds a number of features not included in the original Anthro Zeds mod:

* The "hybrid glitch" where zeds would spawn multiple species, and thus have things like extra antlers or tails, has been fixed. This was the main reason I made this mod, tbh.
* Automatic detection of which submods are installed, preventing the need to have a different mod for every submod.
* Increased compatibility, allowing spawns of _all_ species that are available on Workshop, instead of just Anthro Survivors and Scalies.
* By default, increases spawns to 100% of all zombies. You can change this in Sandbox settings.
* Customizable spawn weights, so you can prioritize the species you want to see more of.
* Toggleable oddities, allowing you to disable things like fantasy species (ex. jackalopes, dragons), anachronisms (ex. protogens, synths), and unnatural colors (ex. blue cows, pink sheep).

## Dependencies
* None

AZE *technically* does not require any other mods to run. However, running AZE on its own is pointless, as it has no models to add and thus does nothing. If you want to see AZE actually work and add anthro zombies, you must install at least one of the mods in the section below.

## Compatible Mods
The following mods are compatible with Anthro Zeds Extended, and will automatically add them to the spawn list:

* [Anthro Survivors](https://steamcommunity.com/sharedfiles/filedetails/?id=2893930681) by Wuffwick and Jaql
* [Anthro Survivors - Ungulate Friends](https://steamcommunity.com/sharedfiles/filedetails/?id=2934987146) by Yap
* [Anthro Survivors - Cobra and Jackalope](https://steamcommunity.com/sharedfiles/filedetails/?id=3092480630) by CAESURA
* [Anthro Survivors - Loong](https://steamcommunity.com/sharedfiles/filedetails/?id=3157929817) by CAESURA

### Upcoming
I plan to add the following mods as compatible soon:

* [Anthro Survivors - More Species](https://steamcommunity.com/sharedfiles/filedetails/?id=2986277840) by Xochiesuincle
* [Anthro Survivors - Scalies!](https://steamcommunity.com/sharedfiles/filedetails/?id=2921417999) by JusFoNo
* [Anthro Survivors - Aligator and Shark](https://steamcommunity.com/sharedfiles/filedetails/?id=3069371309) by CAESURA
* [Anthro Survivors - Insectoids](https://steamcommunity.com/sharedfiles/filedetails/?id=3162204987) by CAESURA

## Incompatible Mods
The following mods are **not** compatible with Anthro Zeds Extended. Do not run these mods while Anthro Zeds Extended is running.

* [Anthro Zeds](https://steamcommunity.com/sharedfiles/filedetails/?id=2930890411) by Sai
* [Scaly Zeds](https://steamcommunity.com/sharedfiles/filedetails/?id=2923210340) by Sai
  * Both of these will at best duplicate some spawns, at worst completely override what this mod does. They do the same thing anyway, so there's no point.
* Any other mods that spawn clothing on zombies by utilizing the UnderwearDefinitions method. For example: [The Last of Us Infected - Overhaul](https://steamcommunity.com/sharedfiles/filedetails/?id=3128757602) by Sir Doggy Jvla
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

## Technical Details (STUPID SMELLY NERD stuff)
Zomboid has a strangely specific mechanic called UnderwearDefinition. This script rolls a random number behind the scenes whenever a zombie is spawned, determines if a zombie will have underwear equipped, and if so, rolls a second number to determine which set of underwear a zombie has. If you've ever wondered why zombies with the same clothing uniforms can have different or no underwear, this is why. (Fun fact: by default, only 70% of people in Knox County wear underpants or bras.)

Anthro Survivors works by adding a full-body piece of clothing to the character that includes the anthro head and skin. It additionally creates a new slot, "fur", to equip it to, which is why you never see this item conflict with any other items.

You can probably see where this is going. Anthro Zeds Extended (as well as the original, Anthro Zeds) combines these together. We inject a list of "underwear" that comprises every possible furry model into UnderwearDefinitions, set the underwear chance to 100%, and make the spawn weight massive. This causes the game to spawn and equip a random furry model to every zombie (with an extremely small leftover chance of being human with underwear). The only downside to this is that zombies now only extremely rarely spawn with underwear, but since bras/underpants don't actually do anything in Zomboid, this is not really a problem.

The main thing that Anthro Zeds Extended changes is we do **not** use the "_Deceased" version of furry heads. For some reason, the base Anthro Survivors mod requires four versions of every species: male, female, male deceased, and female deceased. Thing is, **the deceased versions are literally the same model and texture.** There is no difference. The *only* change is that the "deceased" version is a different item that is equipped to the "bandage" layer rather than the "fur" layer.

Why? Quite frankly, I have absolutely *zero idea*. I cannot find a reason why this is done, especially since Anthro Survivors only uses this "deceased" version on the game over screen when the player is zombified. I have attempted to reach out to the creators, Wuffwick and Jaql, to try and ask why this is done but neither will accept my messages on Steam and have no other public contact info.

The problem with this is that the "bandage" layer is "multi item". Meaning, you can have multiple "bandage" layer clothing equipped (because you have different bandage locations). This was (partially) the cause of the "hybrid" glitch in the original Anthro Zeds mod; if a zombie had two "deceased" furry heads, both could be equipped at the same time. The "fur" layer doesn't have this issue, as it is a unique slot (like almost every piece of clothing in Zomboid).

As a result, I have simply equipped the regular, "fur" layer version of each model to the zombies... and I have yet to see any issue. Everything functions perfectly fine and without problem. Again, I literally cannot find a reason for the "_Deceased" versions at all. I even asked CAESURA, the creator of most of the submod species, and they have no idea either -- they simply did it because the original Anthro Survivors mod did it, and like me, assumed there was a reason for it.

## Credits/Thanks
* Wuffwick and Jaql for making the [Anthro Survivors mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2893930681).
* Sai for making the original [Anthro Zeds mod](https://steamcommunity.com/sharedfiles/filedetails/?id=2930890411).
* walter
* All the modders making new species for the Anthro Survivors mod.
* CAESURA, creator of numerous [Anthro Survivors submods](https://steamcommunity.com/workshop/filedetails/?id=3162333876), for providing me with the original Anthro Survivors app when it became unavailable.

## Contact
If for some reason you wish to contact me:

* Discord: grewsome (easiest, most reliable way)
* Steam: [DR DICKNBALLS](https://steamcommunity.com/id/whatthehellisthisshit/)
* Post on AZE's Community Board