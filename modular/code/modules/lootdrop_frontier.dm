
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

/obj/item/storage/backpack/loot

/obj/item/storage/backpack/loot/scav

/obj/item/storage/backpack/loot/PopulateContents()
	. = ..()
	var/item = generate_loot()
	var/item2 = generate_loot()
	var/item3 = generate_loot()
	var/item4 = generate_loot()

	new item(src)
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
			loottype = pick(GLOB.trash_loot)	//>> code\_globalvars\lists\maintenance_loot.dm
		if("common")
			loottype = pick(GLOB.common_loot)
		if("uncommon")
			loottype = pick(GLOB.uncommon_loot)

	return pick(loottype)

