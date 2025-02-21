
/* tools

//primary vars
/datum/supplykit_item/tools/
	name = 
	desc = 
	item = 
	cost = 

//other vars
	surplus = 100 //if set below 100, reduces chances of being in the surplus crate
	cant_discount = FALSE //if set to true, prevents possible discounts
	limited_stock = -1 //-1 is infinite stock. otherwise, limits how many you can buy. also prevents discounts.
	restricted_roles = list() //for restricting by job type
	*/

/datum/supplykit_item/tools/weldgoggles
	name = "Welding Goggles"
	desc = "A set of hard to come by welding goggles, used to protect your eyes during construction and salvage."
	item = /obj/item/clothing/glasses/welding
	cost = 20

/datum/supplykit_item/tools/industrialwelder
	name = "Industrial Welding Tool"
	desc = "A welding tool with a large reservoir, for efficient salvaging."
	item = /obj/item/weldingtool/largetank
	cost = 40

/datum/supplykit_item/tools/salvagebag
	name = "Salvage Bag"
	desc = "A rugged sturdy bag for collecting junk."
	item = /obj/item/storage/bag/salvage
	cost = 10

/datum/supplykit_item/tools/drill
	name = "Mining Drill"
	desc = "A heavy duty rock breaking drill, operates much faster than a pickaxe. C4 not included."
	item = /obj/item/pickaxe/drill
	cost = 40

/datum/supplykit_item/tools/pickaxe
	name = "Compact Pickaxe"
	desc = "A small but effective pickaxe, which can be stashed in a backpack."
	item = /obj/item/pickaxe/mini
	cost = 20

/datum/supplykit_item/tools/mininscanner
	name = "Automatic Mining Scanner"
	desc = "A scanner used to detect precious minerals in nearby rock and stone."
	item = /obj/item/t_scanner/adv_mining_scanner/lesser
	cost = 20

/datum/supplykit_item/tools/hardhat
	name = "Hard Hat"
	desc = "A sturdy helmet with a mounted lamp, for protecting against falling rocks and debris."
	item = /obj/item/clothing/head/hardhat
	cost = 10

/datum/supplykit_item/tools/orebag
	name = "Ore Bag"
	desc = "A cloth bag made for holding minerals as you mine."
	item = /obj/item/storage/bag/ore
	cost = 10

/datum/supplykit_item/tools/lightreplacer
	name = "Light Replacer"
	desc = "A clever device that recycles broken tubes and bulbs and synthesizes new ones."
	item = /obj/item/lightreplacer
	cost = 5

/datum/supplykit_item/tools/smithgloves
	name = "Blacksmith Gloves"
	desc = "A pair of heavy leather gloves that protect your hands while working with hot metal."
	item = /obj/item/clothing/gloves/f13/blacksmith
	cost = 5

/datum/supplykit_item/tools/smithapron
	name = "Blacksmith Apron"
	desc = "A heavy leather apron, used to prevent burns while working at the forge."
	item = /obj/item/clothing/suit/armor/outfit/overalls/blacksmith
	cost = 2

/datum/supplykit_item/tools/smithhammer
	name = "Smithing Hammer"
	desc = "A basic forging hammer, for beginning smithing."
	item = /obj/item/melee/smith/hammer/premade
	cost = 5

/datum/supplykit_item/tools/toolbox
	name = "Tool Box"
	desc = "A box containing a full set of tools for construction and wiring."
	item = /obj/item/storage/toolbox/mechanical
	cost = 10

/datum/supplykit_item/tools/spraycan
	name = "Spraypaint Can"
	desc = "A can full of pressurized paint, for art and graffiti."
	item = /obj/item/toy/crayon/spraycan
	cost = 5

/datum/supplykit_item/tools/screwdriver
	name = "Screwdriver"
	desc = "For screwing around with screws."
	item = /obj/item/screwdriver
	cost = 2

/datum/supplykit_item/tools/wrench
	name = "Wrench"
	desc = "An adjustable tool for handling nuts."
	item = /obj/item/wrench
	cost = 2

/datum/supplykit_item/tools/weldingtool
	name = "Welding Tool"
	desc = "A basic torch for both welding and cutting."
	item = /obj/item/weldingtool
	cost = 2

/datum/supplykit_item/tools/crowbar
	name = "Crowbar"
	desc = "A solid hooked bar for prying things apart and killing headcrabs."
	item = /obj/item/crowbar
	cost = 2

/datum/supplykit_item/tools/multitool
	name = "Multitool"
	desc = "A piece of electronic equipment for working with wires."
	item = /obj/item/multitool
	cost = 2

/datum/supplykit_item/tools/wirecutters
	name = "Wire Cutters"
	desc = "A pair of snips for use in wiring."
	item = /obj/item/wirecutters
	cost = 2

/datum/supplykit_item/tools/extinguisher
	name = "Mini Fire Extinguisher"
	desc = "A compact extinguisher, for emergencies and freezing slimes."
	item = /obj/item/extinguisher/mini
	cost = 2

