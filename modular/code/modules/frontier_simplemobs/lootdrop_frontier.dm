// KNIVES

/obj/effect/spawner/lootdrop/random_knives
	color = "#57ff48"
	loot = list(
		/obj/item/melee/onehanded/knife/bowie = 1,
		/obj/item/melee/onehanded/knife/bayonet = 1,
		/obj/item/melee/onehanded/knife/survival = 1,
		/obj/item/melee/onehanded/knife/hunting = 1,
		/obj/item/melee/onehanded/knife/trench = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		)






/obj/effect/spawner/bundle/f13/m1911
	name = "m1911 and ammo spawner"
	items = list(
				/obj/item/gun/ballistic/automatic/pistol/m1911,
				/obj/item/ammo_box/magazine/m45
				)

/obj/effect/spawner/bundle/f13/ninemil
	name = "9mm pistol and ammo spawner"
	items = list(
				/obj/item/gun/ballistic/automatic/pistol/ninemil,
				/obj/item/ammo_box/magazine/m9mm/doublestack
				)

/obj/effect/spawner/bundle/f13/beretta
	name = "beretta pistol and ammo spawner"
	items = list(
				/obj/item/gun/ballistic/automatic/pistol/beretta,
				/obj/item/ammo_box/magazine/m9mm/doublestack/
				)

/obj/effect/spawner/bundle/f13/sig
	name = " p220 pistol and ammo spawner"
	items = list(
				/obj/item/gun/ballistic/automatic/pistol/sig/worn,
				/obj/item/ammo_box/magazine/m45
				)

/obj/effect/spawner/bundle/f13/glock
	name = "glock pistol and ammo spawner"
	items = list(
				/obj/item/gun/ballistic/automatic/pistol/ninemil/glock,
				/obj/item/ammo_box/magazine/m9mm/doublestack
	)

/obj/effect/spawner/bundle/f13/m29revolver
	name = ".44 magnum revolver"
	items = list(
				/obj/item/gun/ballistic/revolver/m29,
				/obj/item/ammo_box/m44
	)

/obj/effect/spawner/bundle/f13/m45revolver
	name = "S&W .45 ACP revolver"
	items = list(
				/obj/item/gun/ballistic/revolver/revolver45,
				/obj/item/ammo_casing/c45
	)

/obj/effect/spawner/bundle/f13/m45revolver
	name =  "Mauser M712"
	items = list(
				/obj/item/gun/ballistic/automatic/c96auto,
				/obj/item/ammo_box/magazine/uzim9mm/rockwell
	)

/obj/effect/spawner/lootdrop/random_pistol_bundle
	color = "#57ff48"
	loot = list(
		/obj/effect/spawner/bundle/f13/m1911 = 1,
		/obj/effect/spawner/bundle/f13/ninemil = 1,
		/obj/effect/spawner/bundle/f13/beretta = 1,
		/obj/effect/spawner/bundle/f13/sig = 1,
		/obj/effect/spawner/bundle/f13/glock = 1,
		/obj/effect/spawner/bundle/f13/m29revolver = 1,
		/obj/effect/spawner/bundle/f13/m45revolver = 1,
		)

	/// SHOTGUN	

/obj/effect/spawner/bundle/f13/caravan_shotgun
	name = "caravan shotgun and ammo spawner"
	items = list(
				/obj/item/gun/ballistic/revolver/caravan_shotgun,
				/obj/item/ammo_box/shotgun/improvised
				)

/obj/effect/spawner/bundle/f13/shotgunlever
	name = "lever action shotgun and ammo spawner"
	items = list(
				/obj/item/gun/ballistic/shotgun/automatic/combat/shotgunlever,
				/obj/item/ammo_box/shotgun/buck)

/obj/effect/spawner/bundle/f13/huntingshotgun
	name = "hunting shotgun and ammo spawner"
	items = list(
				/obj/item/gun/ballistic/shotgun/hunting,
				/obj/item/ammo_box/shotgun/buck
				)

/obj/effect/spawner/bundle/f13/widowmaker
	name = "widowmaker spawner"
	items = list(
				/obj/item/gun/ballistic/revolver/widowmaker,
				/obj/item/ammo_box/shotgun/buck
				)

/obj/effect/spawner/lootdrop/random_shotgun_bundle
	color = "#57ff48"
	loot = list(
		/obj/effect/spawner/bundle/f13/caravan_shotgun = 1,
		/obj/effect/spawner/bundle/f13/shotgunlever = 1,
		/obj/effect/spawner/bundle/f13/huntingshotgun = 1,
		/obj/effect/spawner/bundle/f13/widowmaker = 1,
		)

/obj/item/storage/backpack/loot
var/item1
var/item2
var/item3
var/item4

/obj/item/storage/backpack/loot/scav

/obj/item/storage/backpack/loot/PopulateContents()
	. = ..()
	item1 = generate_loot()
	item2 = generate_loot()
	item3 = generate_loot() 
	item4 = generate_loot() 

	new item1(src)
	if(prob(50))
		new item2(src)
	if(prob(25))
		new item3(src)
	if(prob(10))
		new item4(src)

/obj/item/storage/backpack/loot/proc/generate_loot()
	var/rarity = pickweight(list("trash" = 35, "common" = 25, "uncommon" = 10))
	var/list/loottype
	switch(rarity)
		if("trash")
			loottype = pickweight(GLOB.trash_loot)	//>> code\_globalvars\lists\maintenance_loot.dm
		if("common")
			loottype = pickweight(GLOB.common_loot)
		if("uncommon")
			loottype = pickweight(GLOB.uncommon_loot)

	return loottype

GLOBAL_LIST_INIT(trash_loot, list(
	/obj/item/gun/ballistic/automatic/sportcarbine = 5, //we need these for turrets. may make craftable later
	/obj/item/gun/ballistic/automatic/hobo/zipgun = 5,
	/obj/item/gun/ballistic/revolver/hobo/piperifle = 5,
	/obj/item/gun/ballistic/revolver/hobo/pepperbox = 5,
	/obj/item/gun/ballistic/revolver/hobo/single_shotgun = 5,
	/obj/item/gun/ballistic/revolver/hobo/knifegun = 5,
	/obj/item/gun/ballistic/revolver/hobo/knucklegun = 5,
	/obj/item/gun/ballistic/automatic/autopipe = 5,
	/obj/item/gun/ballistic/revolver/winchesterrebored = 5,
	/obj/item/melee/onehanded/machete/scrapsabre = 5,
	/obj/item/melee/onehanded/knife/cosmicdirty = 5,
	/obj/item/melee/onehanded/club/tireiron = 5,
	/obj/item/twohanded/fireaxe/bmprsword = 5,
	/obj/item/melee/onehanded/club = 5,
	/obj/item/twohanded/spear/scrapspear = 5,
	/obj/item/melee/unarmed/lacerator = 5,
	/obj/item/shishkebabpack = 5,
	/obj/item/crafting/duct_tape = 5,
	/obj/item/crafting/abraxo = 5,
	/obj/item/circuitboard/machine/autolathe/ammo/improvised = 5,
	/obj/item/crafting/lunchbox = 5,
	/obj/item/stack/crafting/metalparts/three = 5,
	/obj/item/stack/crafting/electronicparts/three = 5,
	/obj/item/stack/crafting/goodparts = 5,
	/obj/item/storage/pill_bottle/chem_tin/radx  = 5,
	/obj/item/reagent_containers/food/drinks/bottle/orangejuice = 5,
	/obj/item/reagent_containers/food/drinks/bottle/cognac = 5,
	/obj/item/reagent_containers/food/drinks/bottle/whiskey = 5,
	/obj/item/export/bottle/whiskey = 5,
	/obj/item/export/bottle/vodka = 5,
	/obj/item/export/bottle/nukashine = 5,
	/obj/item/stock_parts/chem_cartridge/garbage = 5,
	/obj/item/stock_parts/chem_cartridge/simple = 5,
	/obj/item/reagent_containers/pill/patch/jet = 5,
	/obj/item/reagent_containers/pill/patch/turbo = 1,
	/obj/item/reagent_containers/pill/healingpowder = 5,
	/obj/item/reagent_containers/pill/stimulant = 1,
	/obj/item/reagent_containers/pill/patch/medx = 5,
	/obj/item/storage/pill_bottle/chem_tin/buffout = 5,
	/obj/item/reagent_containers/pill/patch/steady = 5,
	/obj/item/reagent_containers/pill/patch/psycho = 5,
	/obj/item/storage/pill_bottle/chem_tin/mentats = 5,
	/obj/item/storage/pill_bottle/chem_tin/mentats/grape = 1,
	/obj/item/storage/pill_bottle/chem_tin/mentats/orange = 1,
	/obj/item/storage/pill_bottle/chem_tin/mentats/berry = 1,
	/obj/item/reagent_containers/pill/random = 10,
	/obj/item/reagent_containers/pill/patch/random = 5,
	/obj/item/reagent_containers/pill/healingpowder/random = 10,
	/obj/item/reagent_containers/hypospray/medipen/stimpak/random = 10,
	/obj/item/reagent_containers/syringe/random = 10,
	/obj/item/reagent_containers/glass/bottle/random = 10,
	/obj/item/storage/pill_bottle/random = 1,
	/obj/item/ammo_box/a308box/improvised = 2,
	/obj/item/ammo_box/a3006box/improvised = 2,
	/obj/item/ammo_box/m5mmbox/improvised = 1,
	/obj/item/ammo_box/a556/improvised = 3,
	/obj/item/ammo_box/magazine/m10mm/adv/simple = 1,
	/obj/item/ammo_box/c10mm/improvised = 5,
	/obj/item/ammo_box/c9mm/improvised = 5,
	/obj/item/ammo_box/shotgun/improvised = 1,
	/obj/item/ammo_box/a357box/improvised = 3,
	/obj/item/ammo_box/m44box/improvised = 1,
	/obj/item/ammo_box/c45/improvised = 5,
	/obj/item/ammo_box/m14mm/improvised = 1,
	/obj/item/ammo_box/c4570box/improvised = 1,
	/obj/item/ammo_box/m22 = 3,
	/obj/item/ammo_box/rock/improvised = 3,
	/obj/item/clothing/glasses/sunglasses/big = 5,
	/obj/item/clothing/glasses/sunglasses = 5,
	/obj/item/clothing/suit/armor/medium/vest/breastplate/light = 5,
	/obj/item/clothing/head/helmet/knight/f13/rider = 5,
	/obj/item/clothing/shoes/f13/cowboy = 5,
	/obj/item/clothing/shoes/f13/explorer = 5,
	/obj/item/clothing/shoes/f13/diesel = 5,
	/obj/item/clothing/shoes/f13/diesel/alt = 5,
	/obj/item/clothing/gloves/f13/leather = 5,
	/obj/item/clothing/gloves/f13/military = 5,
	/obj/item/clothing/gloves/f13/leather/fingerless = 5,
	/obj/item/clothing/shoes/f13/tan = 5,
	/obj/item/clothing/suit/armor/light/kit/punk = 5,
	/obj/item/clothing/suit/armor/light/kit = 5,
	/obj/item/clothing/head/welding = 5,
	/obj/item/stock_parts/cell = 5,
	/obj/item/stock_parts/capacitor/adv = 5,
	/obj/item/stock_parts/scanning_module/adv = 5,
	/obj/item/stock_parts/manipulator/nano = 5,
	/obj/item/stock_parts/micro_laser/high = 5,
	/obj/item/stock_parts/matter_bin/adv = 5,
	/obj/item/stock_parts/manipulator/pico = 3,
	/obj/item/stock_parts/matter_bin/super = 3,
	/obj/item/stock_parts/cell/high = 3,
	/obj/item/reagent_containers/food/snacks/f13/bubblegum = 10,
	/obj/item/reagent_containers/food/snacks/f13/bubblegum/large = 10,
	/obj/item/reagent_containers/food/snacks/f13/cram = 10,
	/obj/item/reagent_containers/food/snacks/f13/cram/large = 10,
	/obj/item/reagent_containers/food/snacks/f13/yumyum = 10,
	/obj/item/reagent_containers/food/snacks/f13/fancylads = 10,
	/obj/item/reagent_containers/food/snacks/f13/sugarbombs = 10,
	/obj/item/reagent_containers/food/snacks/f13/crisps = 10,
	/obj/item/reagent_containers/food/snacks/f13/steak = 10,
	/obj/item/reagent_containers/food/snacks/f13/specialapples = 10,
	/obj/item/reagent_containers/food/snacks/f13/dandyapples = 10,
	/obj/item/reagent_containers/food/snacks/f13/blamco = 10,
	/obj/item/reagent_containers/food/snacks/f13/blamco/large = 10,
	/obj/item/reagent_containers/food/snacks/f13/mechanic = 10,
	/obj/item/reagent_containers/food/snacks/f13/instamash = 10,
	/obj/item/reagent_containers/food/snacks/f13/canned/porknbeans = 10,
	/obj/item/reagent_containers/food/snacks/f13/canned/borscht = 10,
	/obj/item/reagent_containers/food/snacks/f13/canned/dog = 10,
	/obj/item/geiger_counter = 5,
	/obj/item/cultivator = 5,
	/obj/item/shovel/spade = 5,
	/obj/item/hatchet = 5,
	/obj/item/scalpel = 5,
	/obj/item/circular_saw = 5,
	/obj/item/surgicaldrill = 5,
	/obj/item/retractor = 5,
	/obj/item/cautery = 5,
	/obj/item/hemostat = 5,
	/obj/item/crowbar = 5,
	/obj/item/flashlight = 5,
	/obj/item/extinguisher = 5,
	/obj/item/multitool = 5,
	/obj/item/analyzer = 5,
	/obj/item/t_scanner = 5,
	/obj/item/weldingtool = 5,
	/obj/item/screwdriver = 5,
	/obj/item/wirecutters = 5,
	/obj/item/wrench = 5,
	/obj/item/stack/cable_coil/random = 5,
	/obj/item/radio/off = 5,
	/obj/item/pipe = 5,
	/obj/item/trash/f13/electronic/toaster = 5,
	/obj/item/reagent_containers/glass/bucket = 5,
	/obj/item/kitchen/knife = 5,
	/obj/item/kitchen/fork = 5,
	/obj/item/storage/bag/tray = 5,
	/obj/item/reagent_containers/glass/bowl = 5,
	/obj/item/reagent_containers/food/drinks/drinkingglass = 5,
	/obj/item/reagent_containers/food/drinks/drinkingglass/shotglass = 5,
	/obj/item/reagent_containers/glass/beaker = 5,
	/obj/item/reagent_containers/glass/beaker/large = 5,
	/obj/item/taperecorder/empty = 5,
	/obj/item/light/tube = 5,
	/obj/item/light/bulb = 5,
	/obj/item/reagent_containers/syringe = 5,
	/obj/item/restraints/handcuffs = 5,
	/obj/item/toy/crayon/spraycan = 5,
	/obj/item/laser_pointer = 5,
	/obj/item/gun_upgrade/scope/watchman = 1,
	/obj/item/gun_upgrade/trigger/raidertrigger = 1,
	/obj/item/tool_upgrade/productivity/ergonomic_grip = 1,
	/obj/item/tool_upgrade/refinement/ported_barrel = 1,
	/obj/item/tool_upgrade/refinement/stabilized_grip = 1,
	/obj/item/tool_upgrade/refinement/laserguide = 1,
	/obj/item/tool_upgrade/productivity/booster = 1,
	/obj/item/tool_upgrade/paint/red = 1,
	/obj/item/tool_upgrade/paint/blue = 1,
	/obj/item/tool_upgrade/paint/yellow = 1,
	/obj/item/clothing/suit/armor/light/leather/leather_jacket = 5,
	/obj/item/clothing/suit/armor/light/kit = 5,
	/obj/item/clothing/suit/armor/light/duster = 5,
	/obj/item/crowbar = 5,
	/obj/item/extinguisher = 5,
	/obj/item/hatchet = 5,
	/obj/item/pickaxe/mini = 5,
	/obj/item/wrench = 5,
	/obj/item/kitchen/knife = 5,
	/obj/item/kitchen/rollingpin = 5,
	/obj/item/broken_bottle = 5,
	/obj/item/poster/random_official = 5,
	/obj/item/multitool = 5,
	/obj/item/cigbutt/cigarbutt = 5,
	/obj/item/razor = 5,
	/obj/item/candle = 5,
	/obj/item/rollingpaper = 5,
	/obj/item/trash/coal = 5,
	/obj/item/soap/homemade = 5,
	/obj/item/stack/cable_coil/random = 5,
	/obj/item/stack/medical/bruise_pack = 5,
	/obj/item/trash/popcorn = 5,
	/obj/item/valentine = 5,
	/obj/item/taperecorder = 5,
	/obj/item/tape/random = 5,
	/obj/item/stack/medical/gauze = 5,
	/obj/item/trash/plate = 5,
	/obj/item/storage/box/snappops = 5,
	/obj/item/stack/packageWrap = 5,
	/obj/item/storage/box/matches = 5,
	/obj/item/reagent_containers/food/snacks/deadmouse = 5,
	/obj/item/toner = 5,
	/obj/item/tank/internals/oxygen = 5,
	/obj/item/storage/box/papersack = 5,
	/obj/item/storage/box/lights/mixed = 5,
	/obj/item/storage/box/beakers = 5,
	/obj/item/storage/belt/fannypack/black = 5,
	/obj/item/camera = 5,
	/obj/item/bodypart/l_arm = 5,
	/obj/item/toy/dummy = 5,
	/obj/item/toy/eightball = 5,
	/obj/item/toy/cards/deck = 5,
	/obj/item/trash/tray = 5,
	/obj/item/toy/xmas_cracker = 5,
	/obj/item/reagent_containers/glass/bowl = 5,
	/obj/item/reagent_containers/spray/cleaner = 5,
	/obj/item/reagent_containers/glass/bucket = 5,
	/obj/item/poster/random_contraband = 5,
	/obj/item/seeds/ambrosia = 5,
	/obj/item/seeds/apple = 5,
	/obj/item/seeds/banana = 5,
	/obj/item/seeds/cotton = 5,
	/obj/item/seeds/berry = 5,
	/obj/item/seeds/poppy/broc = 5,
	/obj/item/seeds/cabbage = 5,
	/obj/item/seeds/carrot = 5,
	/obj/item/seeds/carrot/parsnip = 5,
	/obj/item/seeds/cherry = 5,
	/obj/item/seeds/chanterelle = 5,
	/obj/item/seeds/chili = 5,
	/obj/item/seeds/cocoapod = 5,
	/obj/item/seeds/coffee = 5,
	/obj/item/seeds/corn = 5,
	/obj/item/seeds/eggplant = 5,
	/obj/item/seeds/grape = 5,
	/obj/item/seeds/grass = 5,
	/obj/item/seeds/lemon = 5,
	/obj/item/seeds/lime = 5,
	/obj/item/seeds/onion = 5,
	/obj/item/seeds/orange = 5,
	/obj/item/seeds/rainbow_bunch = 5,
	/obj/item/seeds/pineapple = 5,
	/obj/item/seeds/potato = 5,
	/obj/item/seeds/poppy = 5,
	/obj/item/seeds/pumpkin = 5,
	/obj/item/seeds/wheat/rice = 5,
	/obj/item/seeds/soya = 5,
	/obj/item/seeds/sugarcane = 5,
	/obj/item/seeds/sunflower = 5,
	/obj/item/seeds/tea = 5,
	/obj/item/seeds/tobacco = 5,
	/obj/item/seeds/tomato = 5,
	/obj/item/seeds/tower = 5,
	/obj/item/seeds/watermelon = 5,
	/obj/item/seeds/wheat = 5,
	/obj/item/seeds/whitebeet = 5,
	/obj/item/seeds/xander = 5,
	/obj/item/seeds/mutfruit = 5,
	/obj/item/seeds/amanita = 5,
	/obj/item/seeds/glowshroom = 5,
	/obj/item/seeds/liberty = 5,
	/obj/item/seeds/nettle = 5,
	/obj/item/seeds/plump = 5,
	/obj/item/seeds/reishi = 5,
	/obj/item/seeds/cannabis = 5,
	/obj/item/seeds/starthistle = 5,
	/obj/item/seeds/random = 5,
	))

GLOBAL_LIST_INIT(common_loot, list(
	/obj/item/clothing/suit/armor/light/raider/supafly = 5,
	/obj/item/clothing/head/helmet/f13/raider = 5,
	/obj/item/clothing/suit/armor/light/raider/sadist = 5,
	/obj/item/clothing/head/helmet/f13/raider/arclight = 5,
	/obj/item/clothing/suit/armor/medium/raider/blastmaster = 5,
	/obj/item/clothing/head/helmet/f13/raider/blastmaster = 5,
	/obj/item/clothing/suit/armor/medium/raider/yankee = 5,
	/obj/item/clothing/head/helmet/f13/raider/yankee = 5,
	/obj/item/clothing/head/helmet/f13/fiend = 5,
	/obj/item/clothing/suit/armor/light/raider/painspike = 5,
	/obj/item/clothing/head/helmet/f13/raider/psychotic = 5,
	/obj/item/clothing/suit/armor/light/raider/supafly = 5,
	/obj/item/clothing/head/helmet/f13/raider = 5,
	/obj/item/clothing/suit/armor/medium/raider/iconoclast = 5,
	/obj/item/hemostat = 5,
	/obj/item/surgicaldrill = 5,
	/obj/item/retractor = 5,
	/obj/item/cautery = 5,
	/obj/item/scalpel = 5,
	/obj/item/clothing/suit/hooded/surgical = 5,
	/obj/item/clothing/gloves/color/latex = 5,
	/obj/item/clothing/mask/surgical = 5,
	/obj/item/surgical_drapes = 5,
	/obj/item/circular_saw = 5,
	/obj/item/reagent_containers/pill/healingpowder = 5,
	/obj/item/reagent_containers/blood/radaway = 5,
	/obj/item/reagent_containers/hypospray/medipen/stimpak = 5,
	/obj/item/stack/medical/gauze/adv = 5,
	/obj/item/stack/medical/mesh/advanced = 5,
	/obj/item/stack/medical/suture/medicated = 5,
	/obj/item/reagent_containers/pill/patch/jet = 5,
	/obj/item/reagent_containers/pill/patch/turbo = 5,
	/obj/item/reagent_containers/pill/healingpowder = 5,
	/obj/item/reagent_containers/pill/stimulant = 5,
	/obj/item/reagent_containers/pill/patch/medx = 5,
	/obj/item/reagent_containers/pill/patch/steady = 5,
	/obj/item/oar = 5,
	/obj/item/pickaxe = 5,
	/obj/item/shovel = 5,
	/obj/item/melee/onehanded/knife/switchblade = 5,
	/obj/item/throwing_star/spear = 5,
	/obj/item/surgicaldrill = 5,
	/obj/item/melee/onehanded/knife/hunting = 5,
	/obj/item/melee/onehanded/knife/survival = 5,
	/obj/item/melee/onehanded/knife/bone = 5,
	/obj/item/twohanded/baseball/golfclub = 5,
	/obj/item/twohanded/baseball/louisville = 5,
	/obj/item/instrument/guitar = 5,
	/obj/item/melee/onehanded/club = 5,
	/obj/item/melee/onehanded/knife/cosmicdirty = 5,
	/obj/item/melee/unarmed/brass = 5,
	/obj/item/melee/unarmed/brass/spiked = 5,
	/obj/item/ammo_box/magazine/m9mm = 5,
	/obj/item/ammo_box/shotgun/buck = 5,
	/obj/item/ammo_box/shotgun/bean = 5,
	/obj/item/ammo_box/c22 = 5,
	/obj/item/ammo_box/magazine/m10mm/adv/simple = 5,
	/obj/item/ammo_box/magazine/m556/rifle/small = 5,
	/obj/item/ammo_box/magazine/m45 = 5,
	/obj/item/ammo_box/a3006 = 5,
	/obj/item/ammo_box/a308 = 5,
	/obj/item/ammo_box/magazine/m10mm/adv/simple = 5,
	/obj/item/ammo_box/magazine/m556/rifle = 5,
	/obj/item/ammo_box/magazine/m9mm = 5,
	/obj/item/ammo_box/m44 = 5,
	/obj/item/ammo_box/tube/a357 = 5,
	/obj/item/ammo_box/a357 = 5,
	/obj/item/ammo_box/magazine/m556/rifle/small = 5,
	/obj/item/storage/box/ingredients/american = 5,
	/obj/item/reagent_containers/food/snacks/f13/crisps = 5,
	/obj/item/reagent_containers/food/snacks/f13/crisps = 5,
	/obj/item/reagent_containers/food/snacks/f13/bubblegum = 5,
	/obj/item/reagent_containers/food/snacks/f13/cram = 5,
	/obj/item/reagent_containers/food/snacks/f13/yumyum = 5,
	/obj/item/reagent_containers/food/snacks/f13/fancylads = 5,
	/obj/item/reagent_containers/food/snacks/f13/sugarbombs = 5,
	/obj/item/reagent_containers/food/snacks/cheesiehonkers = 5,
	/obj/item/reagent_containers/food/snacks/f13/steak = 5,
	/obj/item/reagent_containers/food/snacks/f13/dandyapples = 5,
	/obj/item/reagent_containers/food/snacks/f13/blamco = 5,
	/obj/item/reagent_containers/food/snacks/f13/instamash  = 5,
	/obj/item/reagent_containers/food/snacks/f13/canned/porknbeans = 5,
	/obj/item/storage/box/ingredients/carnivore = 5,
	/obj/item/storage/box/ingredients/delights = 5,
	/obj/item/storage/box/ingredients/exotic = 5,
	/obj/item/storage/box/ingredients/fiesta = 5,
	/obj/item/storage/box/ingredients/fruity = 5,
	/obj/item/storage/box/ingredients/grains = 5,
	/obj/item/storage/box/ingredients/italian = 5,
	/obj/item/storage/box/ingredients/sweets = 5,
	/obj/item/storage/box/ingredients/vegetarian = 5,
	/obj/item/storage/box/ingredients/wildcard = 5,
	/obj/item/reagent_containers/food/condiment/flour = 5,
	/obj/item/reagent_containers/food/condiment/rice = 5,
	/obj/item/reagent_containers/food/condiment/yeast = 5,
	/obj/item/reagent_containers/food/condiment/soymilk = 5,
	/obj/item/reagent_containers/food/condiment/ketchup = 5,
	/obj/item/reagent_containers/food/condiment/sugar = 5,
	/obj/item/reagent_containers/food/condiment/milk = 5,
	/obj/item/reagent_containers/food/condiment/saltshaker = 5,
	/obj/item/reagent_containers/food/condiment/peppermill = 5,
	/obj/item/reagent_containers/food/condiment/soysauce = 5,
	/obj/item/reagent_containers/food/snacks/beans = 5,
	/obj/item/reagent_containers/food/snacks/cracker = 5,
	/obj/item/reagent_containers/food/snacks/lollipop = 5,
	/obj/item/crafting/abraxo = 5,
	/obj/item/stack/crafting/metalparts/three = 5,
	/obj/item/stack/crafting/metalparts/five = 5,
	/obj/item/stack/crafting/goodparts/three = 5,
	/obj/item/stack/crafting/goodparts/five = 5,
	/obj/item/stack/crafting/electronicparts/three = 5,
	/obj/item/stack/crafting/electronicparts/five = 5,
	/obj/item/reagent_containers/glass/bottle/blackpowder = 5,
	/obj/item/crafting/wonderglue = 5,
	/obj/item/crafting/duct_tape = 5,
	/obj/item/reagent_containers/food/drinks/beer = 5,
	/obj/item/reagent_containers/food/drinks/ale = 5,
	/obj/item/reagent_containers/food/drinks/bottle/gin = 5,
	/obj/item/reagent_containers/food/drinks/bottle/hcider = 5,
	/obj/item/reagent_containers/food/drinks/bottle/whiskey = 5,
	/obj/item/reagent_containers/food/drinks/bottle/vodka = 5,
	/obj/item/reagent_containers/food/drinks/bottle/tequila = 5,
	/obj/item/reagent_containers/food/drinks/bottle/rum = 5,
	/obj/item/reagent_containers/food/drinks/bottle/vermouth = 5,
	/obj/item/reagent_containers/food/drinks/bottle/kahlua = 5,
	/obj/item/reagent_containers/food/drinks/bottle/cognac = 5,
	/obj/item/reagent_containers/food/drinks/bottle/wine = 5,
	/obj/item/reagent_containers/food/drinks/bottle/absinthe = 5,
	/obj/item/reagent_containers/food/drinks/bottle/lizardwine = 5,
	/obj/item/reagent_containers/food/drinks/bottle/hcider = 5,
	/obj/item/reagent_containers/food/drinks/bottle/grappa = 5,
	/obj/item/reagent_containers/food/drinks/bottle/sake = 5,
	/obj/item/reagent_containers/food/drinks/bottle/fernet = 5,
	/obj/item/stack/rods/ten = 5,
	/obj/item/stack/sheet/metal/ten = 5,
	/obj/item/stack/sheet/cardboard/fifty = 5,
	/obj/item/stack/sheet/cardboard/twenty = 5,
	/obj/item/stack/sheet/glass/ten = 5,
	/obj/item/stack/sheet/metal/five = 5,
	/obj/item/stack/sheet/plasteel/five = 5,
	/obj/item/stack/sheet/plastic/five = 5,
	/obj/item/stack/sheet/paperframes/twenty = 5,
	/obj/item/stack/sheet/cloth/ten = 5,
	/obj/item/stack/crafting/metalparts/five = 5,
	/obj/item/stack/crafting/goodparts/three = 5,
	/obj/item/stack/f13Cash/random/low = 5,
	/obj/item/stack/f13Cash/random/med = 5,
))

GLOBAL_LIST_INIT(uncommon_loot, list(
	/obj/item/gun_upgrade/scope/watchman = 1,
	/obj/item/gun_upgrade/trigger/raidertrigger = 1,
	/obj/item/tool_upgrade/productivity/ergonomic_grip = 1,
	/obj/item/tool_upgrade/refinement/ported_barrel = 1,
	/obj/item/tool_upgrade/refinement/stabilized_grip = 1,
	/obj/item/tool_upgrade/refinement/laserguide = 1,
	/obj/item/tool_upgrade/productivity/booster = 1,
	/obj/item/tool_upgrade/paint/red = 1,
	/obj/item/tool_upgrade/paint/blue = 1,
	/obj/item/tool_upgrade/paint/yellow = 1,
	/obj/item/book/granter/trait/chemistry = 5,
	/obj/item/book/granter/trait/trekking = 5,
	/obj/item/book/granter/trait/pa_wear = 5,
	/obj/item/book/granter/crafting_recipe/gunsmith_one = 5,
	/obj/item/book/granter/crafting_recipe/gunsmith_two = 5,
	/obj/item/book/granter/crafting_recipe/gunsmith_three = 5,
	/obj/item/book/granter/crafting_recipe/gunsmith_four = 5,
	/obj/item/stack/f13Cash/random/high = 5,
	/obj/item/ammo_box/shotgun/buck = 5,
	/obj/item/ammo_box/magazine/uzim9mm = 5,
	/obj/item/ammo_box/magazine/m10mm/adv/simple = 5,
	/obj/item/ammo_box/magazine/greasegun = 5,
	/obj/item/ammo_box/needle = 5,
	/obj/item/ammo_box/magazine/tommygunm45 = 5,
	/obj/item/ammo_box/tube/m44 = 5,
	/obj/item/ammo_box/magazine/m10mm/adv/ext = 5,
	/obj/item/stock_parts/cell/ammo/ec = 5,
	/obj/item/ammo_box/magazine/d12g = 5,
	/obj/item/ammo_box/magazine/m44 = 5,
	/obj/item/ammo_box/magazine/m556/rifle = 5,
	/obj/item/ammo_box/c4570 = 5,
	/obj/item/ammo_box/tube/c4570 = 5,
	/obj/item/ammo_box/a50MG = 5,
	/obj/item/ammo_box/a308/doublestacked = 5,
	/obj/item/stock_parts/cell/ammo/mfc = 5,
	/obj/item/weldingtool = 5,
	/obj/item/twohanded/spear = 5,
	/obj/item/twohanded/baseball = 5,
	/obj/item/kitchen/knife/butcher = 5,
	/obj/item/melee/onehanded/machete = 5,
	/obj/item/melee/onehanded/machete/forgedmachete = 5,
	/obj/item/melee/transforming/energy/axe/protonaxe = 5,
	/obj/item/shield/riot/buckler = 5,
	/obj/item/melee/unarmed/tigerclaw = 5,
	/obj/item/melee/unarmed/sappers = 5,
	/obj/item/clothing/suit/armor/heavy/metal = 5,
	/obj/item/clothing/head/helmet/knight/f13/metal = 5,
	/obj/item/clothing/suit/armor/heavy/metal = 5,
	/obj/item/clothing/head/helmet/f13/metalmask = 5,
	/obj/item/clothing/suit/armor/light/leather = 5,
	/obj/item/clothing/suit/armor/light/leather/leather_jacketmk2 = 5,
	/obj/item/clothing/suit/armor/light/leather/leathercoat = 5,
))



