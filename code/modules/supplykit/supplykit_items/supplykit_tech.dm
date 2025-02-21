/* lab and science gear

//primary vars
/datum/supplykit_item/tech/
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


/datum/supplykit_item/tech/xenoarch
	name = "Xenoarch Belt"
	desc = "A belt containing all the tools you need for beginner's xenoarcheology."
	item = /obj/item/storage/belt/xenoarch/full
	cost = 20




/datum/supplykit_item/tech/chemmaster
	name = "Chemmaster Circuit"
	desc = "The electronics needed for a machine that synthesizes chemicals, for those adequately knowledgeable."
	item = /obj/item/circuitboard/machine/chem_master
	cost = 5

/datum/supplykit_item/tech/chemcartridge
	name = "Improvised Chem Cartridge"
	desc = "A cartridge containing the base materials used in the chemmaster to produce medicines."
	item = /obj/item/stock_parts/chem_cartridge/crafted
	cost = 5

/datum/supplykit_item/tech/
	name = "Grinder Circuit"
	desc = "The zappy bits required for a grinder, used to mix foods and grind up plants and objects."
	item = /obj/item/circuitboard/machine/reagentgrinder
	cost = 5

/datum/supplykit_item/tech/blenderbelt
	name = "Blender Belt"
	desc = "A self contained belt mounted grinder, with an AI personality."
	item = /obj/item/storage/blender_belt
	cost = 5

/datum/supplykit_item/tech/chemheater
	name = "Chem Heater Circuit"
	desc = "The fragile pieces for a chem heater, used to cook blue meth and other chemicals."
	item = /obj/item/circuitboard/machine/chem_heater
	cost = 5

/datum/supplykit_item/tech/chembag
	name = "Medical Bag"
	desc = "A clean cloth bag used to hold bottles and medical supplies."
	item = /obj/item/storage/bag/chemistry
	cost = 1

/datum/supplykit_item/tech/sciencegoggles
	name = "Science Goggles"
	desc = "A set of purple goggles that analyze the contents of beakers and medical items, for SCIENCE."
	item = /obj/item/clothing/glasses/science
	cost = 10

/datum/supplykit_item/tech/beakerbox
	name = "Beaker Box"
	desc = "A box full of small beakers, for holding all your bubbling chems."
	item = /obj/item/storage/box/beakers
	cost = 5

/datum/supplykit_item/tech/silverbars
	name = "Silver Bars"
	desc = "Two silver bars, just enough to create a clean surgical table, on a table frame."
	item = /obj/item/stack/sheet/mineral/silver/two
	cost = 5
	limited_stock = 2
