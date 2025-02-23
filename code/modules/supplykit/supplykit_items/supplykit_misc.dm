
/* miscellaneous

//primary vars
/datum/supplykit_item/misc/
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

/datum/supplykit_item/misc/thief
	name = "Thieve's Gloves"
	desc = "A pair of slick gloves that allow you to pickpocket without anyone's notice."
	item = /obj/item/clothing/gloves/thief
	cost = 20

/datum/supplykit_item/misc/lockpick
	name = "Lockpick Set"
	desc = "A set of tools for opening safe boxes and locked doors and airlocks."
	item = /obj/item/lockpick_set
	cost = 5

/datum/supplykit_item/misc/binoculars
	name = "Binoculars"
	desc = "Useful for scouting, or just taking in the sights."
	item = /obj/item/binoculars
	cost = 5

/datum/supplykit_item/misc/stealthboy
	name = "Stealthboy"
	desc = "A device worn on your belt that makes you almost impossible to see for a time. does not currently work for simpleminded creatures."
	item = /obj/item/stealthboy
	cost = 40

/datum/supplykit_item/misc/music
	name = "Musical Instrument"
	desc = "Your choice of a musical instrument, for bolstering the mood and wellbeing of those around you."
	item = /obj/item/choice_beacon/music
	cost = 5

/datum/supplykit_item/misc/tuner
	name = "Musical Tuner"
	desc = "A device used to tune your instrument, improving its sound quality and performance."
	item = /obj/item/musicaltuner
	cost = 10

/*
/datum/supplykit_item/misc/copper
	name = "Copper Coin"
	desc = "A single copper coin. chump change, really."
	item = /obj/item/stack/f13Cash
	cost = 1
	important = TRUE

/datum/supplykit_item/misc/silver
	name = "Silver Coin"
	desc = "A single silver coin, worth ten coppers."
	item = /obj/item/stack/f13Cash/denarius
	cost = 10
	important = TRUE

/datum/supplykit_item/misc/gold
	name = "Gold Coin"
	desc = "A single shiny gold coin, worth 100 coppers. we're rich!"
	item = /obj/item/stack/f13Cash/aureus
	cost = 100
	important = TRUE

/datum/supplykit_item/misc/hornoffense
	name = "Hunting Horn - Offense"
	desc = "A horn that bolsters the speed and melee power of those who hear it."
	item = /obj/item/huntinghorn/offense
	cost = 5

/datum/supplykit_item/misc/horndefense
	name = "Hunting Horn - Defense"
	desc = "A horn that bolsters the endurance and pain resistance of those who hear it."
	item = /obj/item/huntinghorn/defense
	cost = 5

/datum/supplykit_item/misc/hornutility
	name = "Hunting Horn - Utility"
	desc = "A horn that bolsters the reaction speed and stamina of those who hear it."
	item = /obj/item/huntinghorn/utility
	cost = 5

/datum/supplykit_item/misc/hornhealing
	name = "Hunting Horn - Healing"
	desc = "A horn that bolsters the health of and heals those who hear it."
	item = /obj/item/huntinghorn/healing
	cost = 5

/datum/supplykit_item/misc/bikehorn
	name = "Bike Horn"
	desc = "Honk."
	item = /obj/item/bikehorn
	cost = 5

/datum/supplykit_item/misc/chameleon
	name = "Chameleon Mask"
	desc = "An adaptive disguise used to hide your identity and change your voice when you need to do a crime."
	item = /obj/item/clothing/mask/chameleon
	cost = 1 //cheap and affordable for all to use
	
/datum/supplykit_item/misc/radhood
	name = "Radiation Hood"
	desc = "Useful if you plan on spending a prolonged amount of time in a radioactive area."
	item = /obj/item/clothing/head/radiation
	cost = 1

/datum/supplykit_item/misc/radsuit
	name = "Radiation Suit"
	desc = "Useful if you plan on spending a prolonged amount of time in a radioactive area."
	item = /obj/item/clothing/suit/radiation
	cost = 4

/datum/supplykit_item/misc/geiger
	name = "Geiger Counter"
	desc = "An instrument that passively detects rises in local radiation levels. Very useful."
	item = /obj/item/geiger_counter
	cost = 5

*/



/datum/supplykit_item/misc/trashbag
	name = "Trash Bag"
	desc = "A big ol bag for stowing lots of trash or random junk in."
	item = /obj/item/storage/bag/trash
	cost = 5

/datum/supplykit_item/misc/cleaner
	name = "Abraxo Cleaner"
	desc = "A spray bottle full of chemicals, for making things pristine and clean."
	item = /obj/item/reagent_containers/spray/cleaner
	cost = 5

/datum/supplykit_item/misc/abraxo
	name = "Abraxo"
	desc = "A box of industrial cleaner, strong enough to scrub up radioactive sludge puddles."
	item = /obj/item/crafting/abraxo
	cost = 5

/datum/supplykit_item/misc/galoshes
	name = "Galoshes"
	desc = "A robust pair of bright yellow boots, with slip resistant grips."
	item = /obj/item/clothing/shoes/galoshes
	cost = 20

/datum/supplykit_item/misc/soap
	name = "Soap Bar"
	desc = "A bar of soap, useful for cleaning, tripping, and eating."
	item = /obj/item/soap
	cost = 5

/datum/supplykit_item/misc/paintremover
	name = "Paint Remover"
	desc = "A bucket of solvent used to scrub paint off floorboards, following colorful hijinx "
	item = /obj/item/paint/paint_remover
	cost = 1

/datum/supplykit_item/misc/mop
	name = "Mop"
	desc = "A basic mop, for cleaning bulkheads and bonking miscreant heads."
	item = /obj/item/mop
	cost = 5

/datum/supplykit_item/misc/broom
	name = "Broom"
	desc = "A useful tool for clearing away trash and gathering up useful junk."
	item = /obj/item/broom
	cost = 5

/datum/supplykit_item/misc/cellcharger
	name = "Cell Charger Circuit"
	desc = "The thinky bits needed to set up your very own cell charger, for enterprising e-gun users."
	item = /obj/item/circuitboard/machine/cell_charger
	cost = 20

/datum/supplykit_item/misc/reloader
	name = "Makeshift Reloader Parts"
	desc = "The pieces needed to start creating low quality handloads. Just attach it to a table or some wood pieces."
	item = /obj/item/circuitboard/machine/autolathe/ammo/improvised
	cost = 5
	
/datum/supplykit_item/misc/beartrap
	name = "Bear Trap"
	desc = "A large intimidating leg trap."
	item = /obj/item/restraints/legcuffs/beartrap
	cost = 5

/datum/supplykit_item/misc/bola
	name = "Bola"
	desc = "A thrown device that entangles its target, slowing them down."
	item = /obj/item/restraints/legcuffs/bola
	cost = 5

/datum/supplykit_item/misc/jammer
	name = "Radio Jammer"
	desc = "A device that blocks radio signals, in case you need that."
	item = /obj/item/jammer
	cost = 5
