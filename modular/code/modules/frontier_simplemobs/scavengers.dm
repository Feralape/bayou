/* Scavengers

/mob/living/simple_animal/hostile/frontier/scav/melee,
/mob/living/simple_animal/hostile/frontier/scav/melee2h,
/mob/living/simple_animal/hostile/frontier/scav/ranged,
/mob/living/simple_animal/hostile/frontier/scav/ranged_pistol,
/mob/living/simple_animal/hostile/frontier/scav/ranged_shotgun,
/mob/living/simple_animal/hostile/frontier/scav/med/melee,
/mob/living/simple_animal/hostile/frontier/scav/med/melee2h,
/mob/living/simple_animal/hostile/frontier/scav/med/ranged,
/mob/living/simple_animal/hostile/frontier/scav/med/ranged_pistol,
/mob/living/simple_animal/hostile/frontier/scav/med/ranged_shotgun,
/mob/living/simple_animal/hostile/frontier/scav/masked/melee,
/mob/living/simple_animal/hostile/frontier/scav/masked/melee2h,
/mob/living/simple_animal/hostile/frontier/scav/masked/ranged,
/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_pistol,
/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_shotgun,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee2h,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_pistol,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_shotgun,

*/


/mob/living/simple_animal/hostile/frontier/scav
	desc = "It's a hostile scavenger."
	gear = "scav"

	healthmax = 100
	healthmin = 50

	mob_armor = ARMOR_VALUE_RAIDER_LEATHER_JACKET
	aggro_lines = list(			
			"Hey! Over here!", 
			"Get 'em!", 
			"We got a live one!" , 
			"Hey! Kill this one!", 
			"Hey!", 
			"Let's dance, bitch!", 
			"Time to die, asshole!", 
			"Holy fuck!", 
			"Kill 'em!",
			"Shit!",
			"I need fucking backups!",
			"Run, bitch, run!",
			"Eat lead, motherfucker!",
			"Hahaha! Let's play!",
			"Let's smoke this bitch!",
			"Get some, asshole!"
			)

	hat = list("rusted_cowboy", "scarecrow_hat", "cowboyhat", "baseballsoft", "bandit", "pot", "cargosoft", "greysoft")

/mob/living/simple_animal/hostile/frontier/scav/melee

	weapon = "knife"
	attack_verb_simple = list ("stabs", "slashes", "shanks", "slices")
	melee_damage_lower = 10
	melee_damage_upper = 20
	loot = list(/obj/effect/spawner/lootdrop/random_knives)

/mob/living/simple_animal/hostile/frontier/scav/melee2h

	weapon = "bat"
	attack_verb_simple = list ("clobbers", "strikes", "thrashes", "smashes")
	melee_damage_lower = 15
	melee_damage_upper = 33

/mob/living/simple_animal/hostile/frontier/scav/melee2h/Initialize(mapload)
	
	weapon = pick("bat", "bat2", "golf")
	switch(weapon)
		if("bat")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/baseball)
		if("bat2")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/baseball/spiked)
		if("golf")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/baseball/golfclub)
	..()

/mob/living/simple_animal/hostile/frontier/scav/ranged

	weapon = "autopipe"
	autogun = TRUE
	projectilesound = 'sound/f13weapons/ninemil.ogg'
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	ranged = TRUE


	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(RIFLE_LIGHT_VOLUME),
		SP_VOLUME_SILENCED(RIFLE_LIGHT_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(RIFLE_LIGHT_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(RIFLE_LIGHT_DISTANT_SOUND),
		SP_DISTANT_RANGE(RIFLE_LIGHT_RANGE_DISTANT)
	)
	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/item/gun/ballistic/automatic/autopipe,
	/obj/item/ammo_box/magazine/autopipe
	)

/mob/living/simple_animal/hostile/frontier/scav/ranged_pistol
	
	weapon = "pistol"
	autogun = FALSE
	ranged = TRUE
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(PISTOL_LIGHT_VOLUME),
		SP_VOLUME_SILENCED(PISTOL_LIGHT_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(PISTOL_LIGHT_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(PISTOL_LIGHT_DISTANT_SOUND),
		SP_DISTANT_RANGE(PISTOL_LIGHT_RANGE_DISTANT)
	)

	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/effect/spawner/lootdrop/random_pistol_bundle
	)
	loot_drop_amount = 2
	loot_amount_random = FALSE

/mob/living/simple_animal/hostile/frontier/scav/ranged_shotgun

	weapon = "shotgunpump"

	autogun = FALSE
	ranged = TRUE
	rapid = 2
	rapid_fire_delay = 6
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	projectilesound = 'sound/f13weapons/shotgun.ogg'
	sound_after_shooting = 	'sound/weapons/shotgunpump.ogg'

	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(SHOTGUN_VOLUME),
		SP_VOLUME_SILENCED(SHOTGUN_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(SHOTGUN_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(SHOTGUN_DISTANT_SOUND),
		SP_DISTANT_RANGE(SHOTGUN_RANGE_DISTANT)
	)

	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/effect/spawner/lootdrop/random_shotgun_bundle
	)
	loot_drop_amount = 2
	loot_amount_random = FALSE


/mob/living/simple_animal/hostile/frontier/scav/Initialize(mapload)
	gear = "[gear][rand(1,6)]"
	if(headwear && prob(30))
		headwear = pick(hat)
	..()

/*

	==== MASKED - LIGHT ====

*/
/mob/living/simple_animal/hostile/frontier/scav/masked

	hat = null
	gear = "scavmask"

/mob/living/simple_animal/hostile/frontier/scav/masked/melee

	weapon = "knife"
	attack_verb_simple = list ("stabs", "slashes", "shanks", "slices")
	melee_damage_lower = 10
	melee_damage_upper = 20
	loot = list(/obj/effect/spawner/lootdrop/random_knives)

/mob/living/simple_animal/hostile/frontier/scav/masked/melee2h

	weapon = "bat"
	attack_verb_simple = list ("clobbers", "strikes", "thrashes", "smashes")
	melee_damage_lower = 15
	melee_damage_upper = 33

/mob/living/simple_animal/hostile/frontier/scav/masked/ranged

	weapon = "autopipe"
	autogun = TRUE
	projectilesound = 'sound/f13weapons/ninemil.ogg'
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	ranged = TRUE


	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(RIFLE_LIGHT_VOLUME),
		SP_VOLUME_SILENCED(RIFLE_LIGHT_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(RIFLE_LIGHT_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(RIFLE_LIGHT_DISTANT_SOUND),
		SP_DISTANT_RANGE(RIFLE_LIGHT_RANGE_DISTANT)
	)
	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/item/gun/ballistic/automatic/autopipe,
	/obj/item/ammo_box/magazine/autopipe
	)

/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_pistol
	
	weapon = "pistol"
	autogun = FALSE
	ranged = TRUE
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(PISTOL_LIGHT_VOLUME),
		SP_VOLUME_SILENCED(PISTOL_LIGHT_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(PISTOL_LIGHT_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(PISTOL_LIGHT_DISTANT_SOUND),
		SP_DISTANT_RANGE(PISTOL_LIGHT_RANGE_DISTANT)
	)

	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/effect/spawner/lootdrop/random_pistol_bundle
	)
	loot_drop_amount = 2
	loot_amount_random = FALSE

/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_shotgun

	weapon = "shotgunpump"

	autogun = FALSE
	ranged = TRUE
	rapid = 2
	rapid_fire_delay = 6
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	projectilesound = 'sound/f13weapons/shotgun.ogg'
	sound_after_shooting = 	'sound/weapons/shotgunpump.ogg'

	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(SHOTGUN_VOLUME),
		SP_VOLUME_SILENCED(SHOTGUN_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(SHOTGUN_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(SHOTGUN_DISTANT_SOUND),
		SP_DISTANT_RANGE(SHOTGUN_RANGE_DISTANT)
	)

	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/effect/spawner/lootdrop/random_shotgun_bundle
	)
	loot_drop_amount = 2
	loot_amount_random = FALSE


/*
					=== MEDIUM ===	
*/
/mob/living/simple_animal/hostile/frontier/scav/med
	gear = "scavmed"
	mob_armor = ARMOR_VALUE_RAIDER_COMBAT_ARMOR_RUSTY


/mob/living/simple_animal/hostile/frontier/scav/med/melee

	weapon = "machete"
	attack_verb_simple = list ("stabs", "slashes", "shanks", "slices")
	melee_damage_lower = 10
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/frontier/scav/med/melee/Initialize(mapload)
	weapon = pick("machete", "scrapsabre", "knife")
	switch(weapon)
		if("machete")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/melee/onehanded/machete)
		if("scrapsabre")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/melee/onehanded/machete/scrapsabre)
		if("knife")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/effect/spawner/lootdrop/random_knives)
	..()

/mob/living/simple_animal/hostile/frontier/scav/med/melee2h

	weapon = "bat"
	attack_verb_simple = list ("clobbers", "strikes", "thrashes", "smashes")
	melee_damage_lower = 15
	melee_damage_upper = 33


/mob/living/simple_animal/hostile/frontier/scav/med/melee2h/Initialize(mapload)
	weapon = pick("bat", "bat2", "golf", "fireaxe", "sledge", "bumper")
	switch(weapon)
		if("bat")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/baseball)
		if("bat2")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/baseball/spiked)
		if("golf")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/baseball/golfclub)
		if("fireaxe")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/fireaxe)
		if("sledge")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/sledgehammer/simple)
		if("bumper")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/fireaxe/bmprsword)
	..()




/mob/living/simple_animal/hostile/frontier/scav/med/ranged

	weapon = "autopipe"
	autogun = TRUE
	projectilesound = 'sound/f13weapons/ninemil.ogg'
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	ranged = TRUE


	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(RIFLE_LIGHT_VOLUME),
		SP_VOLUME_SILENCED(RIFLE_LIGHT_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(RIFLE_LIGHT_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(RIFLE_LIGHT_DISTANT_SOUND),
		SP_DISTANT_RANGE(RIFLE_LIGHT_RANGE_DISTANT)
	)
	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/item/gun/ballistic/automatic/autopipe,
	/obj/item/ammo_box/magazine/autopipe
	)

/mob/living/simple_animal/hostile/frontier/scav/med/ranged_shotgun

	weapon = "shotgunpump"

	autogun = FALSE
	ranged = TRUE
	rapid = 2
	rapid_fire_delay = 6
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	projectilesound = 'sound/f13weapons/shotgun.ogg'
	sound_after_shooting = 	'sound/weapons/shotgunpump.ogg'

	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(SHOTGUN_VOLUME),
		SP_VOLUME_SILENCED(SHOTGUN_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(SHOTGUN_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(SHOTGUN_DISTANT_SOUND),
		SP_DISTANT_RANGE(SHOTGUN_RANGE_DISTANT)
	)

	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/effect/spawner/lootdrop/random_shotgun_bundle
	)
	loot_drop_amount = 2
	loot_amount_random = FALSE

/mob/living/simple_animal/hostile/frontier/scav/med/ranged_pistol
	
	weapon = "pistol"
	autogun = FALSE
	ranged = TRUE
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(PISTOL_LIGHT_VOLUME),
		SP_VOLUME_SILENCED(PISTOL_LIGHT_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(PISTOL_LIGHT_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(PISTOL_LIGHT_DISTANT_SOUND),
		SP_DISTANT_RANGE(PISTOL_LIGHT_RANGE_DISTANT)
	)

	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/effect/spawner/lootdrop/random_pistol_bundle
	)
	loot_drop_amount = 2
	loot_amount_random = FALSE

/*
					=== MEDIUM MASKED ===	
*/
/mob/living/simple_animal/hostile/frontier/scav/masked/medium
	hat = null
	gear = "scavmedmask"

/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee

	weapon = "machete"
	attack_verb_simple = list ("stabs", "slashes", "shanks", "slices")
	melee_damage_lower = 10
	melee_damage_upper = 20

/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee/Initialize(mapload)
	weapon = pick("machete", "scrapsabre", "knife")
	switch(weapon)
		if("machete")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/melee/onehanded/machete)
		if("scrapsabre")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/melee/onehanded/machete/scrapsabre)
		if("knife")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/effect/spawner/lootdrop/random_knives)
	..()

/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee2h

	weapon = "bat"
	attack_verb_simple = list ("clobbers", "strikes", "thrashes", "smashes")
	melee_damage_lower = 15
	melee_damage_upper = 33


/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee2h/Initialize(mapload)
	weapon = pick("bat", "bat2", "golf", "fireaxe", "sledge", "bumper")
	switch(weapon)
		if("bat")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/baseball)
		if("bat2")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/baseball/spiked)
		if("golf")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/baseball/golfclub)
		if("fireaxe")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/fireaxe)
		if("sledge")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/sledgehammer/simple)
		if("bumper")
			loot = list(/obj/effect/decal/cleanable/blood/splatter, /obj/item/twohanded/fireaxe/bmprsword)
	..()




/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee

	weapon = "knife"
	attack_verb_simple = list ("stabs", "slashes", "shanks", "slices")
	melee_damage_lower = 10
	melee_damage_upper = 20
	loot = list(/obj/effect/spawner/lootdrop/random_knives)

/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee2h

	weapon = "bat"
	attack_verb_simple = list ("clobbers", "strikes", "thrashes", "smashes")
	melee_damage_lower = 15
	melee_damage_upper = 33

/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged

	weapon = "autopipe"
	autogun = TRUE
	projectilesound = 'sound/f13weapons/ninemil.ogg'
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	ranged = TRUE


	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(RIFLE_LIGHT_VOLUME),
		SP_VOLUME_SILENCED(RIFLE_LIGHT_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(RIFLE_LIGHT_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(RIFLE_LIGHT_DISTANT_SOUND),
		SP_DISTANT_RANGE(RIFLE_LIGHT_RANGE_DISTANT)
	)
	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/item/gun/ballistic/automatic/autopipe,
	/obj/item/ammo_box/magazine/autopipe
	)

/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_pistol
	
	weapon = "pistol"
	autogun = FALSE
	ranged = TRUE
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(PISTOL_LIGHT_VOLUME),
		SP_VOLUME_SILENCED(PISTOL_LIGHT_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(PISTOL_LIGHT_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(PISTOL_LIGHT_DISTANT_SOUND),
		SP_DISTANT_RANGE(PISTOL_LIGHT_RANGE_DISTANT)
	)

	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/effect/spawner/lootdrop/random_pistol_bundle
	)
	loot_drop_amount = 2
	loot_amount_random = FALSE

/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_shotgun

	weapon = "shotgunpump"

	autogun = FALSE
	ranged = TRUE
	rapid = 2
	rapid_fire_delay = 6
	minimum_distance = 3
	casingtype = /obj/item/ammo_casing/shotgun/buckshot
	projectilesound = 'sound/f13weapons/shotgun.ogg'
	sound_after_shooting = 	'sound/weapons/shotgunpump.ogg'

	projectile_sound_properties = list(
		SP_VARY(FALSE),
		SP_VOLUME(SHOTGUN_VOLUME),
		SP_VOLUME_SILENCED(SHOTGUN_VOLUME * SILENCED_VOLUME_MULTIPLIER),
		SP_NORMAL_RANGE(SHOTGUN_RANGE),
		SP_NORMAL_RANGE_SILENCED(SILENCED_GUN_RANGE),
		SP_IGNORE_WALLS(TRUE),
		SP_DISTANT_SOUND(SHOTGUN_DISTANT_SOUND),
		SP_DISTANT_RANGE(SHOTGUN_RANGE_DISTANT)
	)

	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/effect/spawner/lootdrop/random_shotgun_bundle
	)
	loot_drop_amount = 2
	loot_amount_random = FALSE
