/mob/living/simple_animal/hostile/frontier
	name = "scav"
	icon = 'modular/icons/mob/frontier_human_mobs.dmi'
	icon_state = "human"
	icon_living = "human"
	icon_dead = null
	icon_gib = "gib"
	del_on_death = TRUE
	rotate_on_lying = TRUE
	gender = MALE
	loot = list()
	loot_drop_amount = 2
	loot_amount_random = TRUE

	mob_biotypes = MOB_ORGANIC|MOB_HUMANOID
	speak_chance = 0
	turns_per_move = 5
	speed = 0
	stat_attack = CONSCIOUS
	robust_searching = 1
	maxHealth = 80
	health = 80
	harm_intent_damage = 5
	melee_damage_lower = 10
	melee_damage_upper = 10
	attack_verb_continuous = "punches"
	attack_verb_simple = "punch"
	attack_sound = 'sound/weapons/punch1.ogg'
	faction = list("bandits")
	check_friendly_fire = 1
	a_intent = INTENT_HARM
	status_flags = CANPUSH
	dodging = TRUE

	rapid_melee = 2
	melee_queue_distance = 5
	move_to_delay = 2.8
	waddle_amount = 2
	waddle_up_time = 1
	waddle_side_time = 1
	retreat_distance = 1 //mob retreats 1 tile when in min distance
	minimum_distance = 1 //Mob pushes up to melee, then backs off to avoid player attack?
	aggro_vision_range = 6 //mob waits to attack if the player chooses to close distance, or if the player attacks first.
	vision_range = 8

	retreat_health_percent = 0.2
	max_heal_amount = 0.9
	heal_per_life = 0.115
	tactical_retreat = 10
	turns_per_move = 5
	footstep_type = FOOTSTEP_MOB_SHOE

	var/healthmax = 100
	var/healthmin = 80

	var/gear
	var/weapon
	var/headwear
	var/autogun 	//is it an automatic weapon?
	var/list/hair = list(
		"hair_a", "hair_c", "bald", "hair_spikey", "hair_spiky2", "hair_unshaven_mohawk", "hair_skinhead",
		"hair_e", "hair_bedhead", "hair_cornrows", "hair_cornrows2", "hair_cornrowbraid",
		"hair_cornrowbun", "hair_jensen"	
		)
	var/chosen_hair
	var/list/facialhair = list("shaved", "facial_brokenman", "facial_fullbeard", "facial_elvis", "facial_longbeard",
		"facial_gt", "facial_goatee", "facial_hip",	"facial_jensen","facial_moonshiner","facial_neckbeard",	
		"facial_tribeard"	
		)
	var/list/hat = list()
	var/chosen_facialhair
	var/hair_name
	var/facial_hair_name
	var/hair_color
	var/skin_color
	var/eyes_color


	emote_taunt_sound = list(
		'sound/voice/human/male/attn.ogg', 
		'sound/voice/human/male/warcry_male1.ogg',
		'sound/voice/human/male/warcry_male2.ogg',
		'sound/voice/human/male/warcry_male3.ogg',
		'sound/voice/human/male/rage (1).ogg',
		'sound/voice/human/male/rage (2).ogg',
		'sound/voice/human/male/rage (3).ogg',
		'sound/voice/human/male/rage (4).ogg',
		'sound/voice/human/male/rage (5).ogg',
		'sound/voice/human/male/laugh (1).ogg',
		'sound/voice/human/male/laugh (2).ogg',
		'sound/voice/human/male/laugh (3).ogg',
		)

	idlesound = list(
		'sound/voice/human/male/sigh.ogg',
		'sound/voice/human/male/spit.ogg',
		'sound/voice/human/male/hum (1).ogg',
		'sound/voice/human/male/hum (2).ogg',		
		'sound/voice/human/male/hum (3).ogg',		
		'sound/voice/human/male/chuckle.ogg',			
		'sound/voice/human/male/grumble.ogg',		
		)

	death_sound = 'sound/voice/human/male/deathgurgle (1).ogg'

	var/list/more_deathsound = list(
		'sound/voice/human/male/deathgurgle (1).ogg', 
		'sound/voice/human/male/deathgurgle (2).ogg', 
		'sound/voice/human/male/deathgurgle (3).ogg',
		'sound/voice/human/male/paincrit (1).ogg',
		'sound/voice/human/male/paincrit (2).ogg',
		)

	var/list/pain_sound = list(
		'sound/voice/human/male/pain (1).ogg',
		'sound/voice/human/male/pain (2).ogg',
		'sound/voice/human/male/pain (3).ogg',
		'sound/voice/human/male/painmoan (1).ogg',	
		'sound/voice/human/male/painmoan (2).ogg',	
		'sound/voice/human/male/painmoan (3).ogg',	
		'sound/voice/human/male/painmoan (4).ogg',	
		'sound/voice/human/male/painmoan (5).ogg',
		'sound/voice/human/male/painscream (1).ogg',	
		'sound/voice/human/male/painscream (2).ogg',
		'sound/voice/human/male/painscream (3).ogg',
	)

	var/list/aggro_lines = list()

	var/mutable_appearance/gear_overlay 
	var/mutable_appearance/weapon_overlay 
	var/mutable_appearance/hair_overlay
	var/mutable_appearance/eyes_overlay 
	var/mutable_appearance/facial_hair_overlay
	var/mutable_appearance/headwear_overlay
	var/mob/living/carbon
	var/obj/effect/mob_spawn/human/corpse/frontier/deadguy
	var/corpse_outfit = /datum/outfit/scav/scav1

/mob/living/simple_animal/hostile/frontier/Initialize(mapload)
	. = ..()
	generate_unique_appearance()
	generate_name()
	corpse_outfit = get_armor()
	gear_overlay = mutable_appearance(icon, "[gear]", color = null)
	weapon_overlay = mutable_appearance(icon, "weapon-[weapon]", color = null)
	eyes_overlay = mutable_appearance(icon, "human_eyes", color = "#[eyes_color]")
	hair_overlay = mutable_appearance('icons/mob/hair.dmi', chosen_hair, color = "#[hair_color]")
	facial_hair_overlay = mutable_appearance('icons/mob/hair.dmi', chosen_facialhair, color = "#[hair_color]")
	headwear_overlay = mutable_appearance(icon, "[headwear]", color = null)
	headwear_overlay.layer = src.layer + 0.1
	headwear_overlay.plane = src.plane + 0.1
//	color = "#[skin_color]"
	add_overlay(mutable_appearance(icon, "human", color = "#[skin_color]"))
	add_overlay(eyes_overlay)
	add_overlay(hair_overlay)
	add_overlay(gear_overlay)
	add_overlay(weapon_overlay)
	if(!chosen_facialhair == "shaved")
		add_overlay(facial_hair_overlay)
	if(headwear)
		add_overlay(headwear)
	update_icon()
	INVOKE_ASYNC(src,PROC_REF(generate_corpse))

	death_sound = pick(more_deathsound)
	deathmessage = pick(
	"falls limp, their eyes lifeless.", 
	"collapses, their body twitching briefly before going still.", 
	"drops to the ground, their body limp and lifeless.", 
	"falls to the ground with a burst of blood!",
	"sprays blood from their wounds as they fall to the ground.",
	"left a mist of blood as they fall to the ground.", 
	"collapses, splattering the floor with their blood.",
	"splatters the ground with their blood as they suddenly drop dead.",)

	health = rand(healthmin, healthmax)
	maxHealth = health


/mob/living/simple_animal/hostile/frontier/proc/generate_name()
	name = (pick(GLOB.first_names_male)) + " " + (pick(GLOB.last_names))

/mob/living/simple_animal/hostile/frontier/proc/generate_corpse()
	deadguy = new(src)
	deadguy.mob_name = name
	deadguy.outfit = corpse_outfit
	hair_name = get_hair_name()
	facial_hair_name = get_beard_name()
	deadguy.mob_species = /datum/species/human
	deadguy.random = FALSE
	deadguy.skin_tone = get_skintone()
	deadguy.hair_style = hair_name
	deadguy.hair_color = hair_color
	deadguy.facial_hair_style = facial_hair_name
	deadguy.facial_hair_color = hair_color
	deadguy.eyes_color = eyes_color
	deadguy.outfit = corpse_outfit


/mob/living/simple_animal/hostile/frontier/drop_loot()
	. = ..()
	if(headwear)
		var/obj/item/hat = 	get_headwear()
		new hat(drop_location())   
	playsound(get_turf(src), pick('sound/effects/wounds/pierce1.ogg', 'sound/effects/wounds/pierce2.ogg', 'sound/effects/wounds/pierce3.ogg'), 100, 1)
	deadguy.forceMove(drop_location())
	deadguy.direction = src.dir
	deadguy.create()


/mob/living/simple_animal/hostile/frontier/proc/get_armor()
	switch(gear)
		if("scav1")
			return /datum/outfit/scav/scav1
		if("scav2")
			return /datum/outfit/scav/scav2
		if("scav3")
			return /datum/outfit/scav/scav3
		if("scav4")
			return /datum/outfit/scav/scav4
		if("scav5")
			return /datum/outfit/scav/scav5
		if("scav6")
			return /datum/outfit/scav/scav6
// scav masked
		if("scavmask1")
			return /datum/outfit/scav/scavmask1
		if("scavmask2")
			return /datum/outfit/scav/scavmask2
		if("scavmask3")
			return /datum/outfit/scav/scavmask3
		if("scavmask4")
			return /datum/outfit/scav/scavmask4
		if("scavmask5")
			return /datum/outfit/scav/scavmask5
		if("scavmask6")
			return /datum/outfit/scav/scavmask6
// scav medium
		if("scavmed1")
			return /datum/outfit/scav/scavmed1
		if("scavmed2")
			return /datum/outfit/scav/scavmed2
		if("scavmed3")
			return /datum/outfit/scav/scavmed3
		if("scavmed4")
			return	/datum/outfit/scav/scavmed4
		if("scavmed5")
			return /datum/outfit/scav/scavmed5
		if("scavmed6")
			return /datum/outfit/scav/scavmed6
// scav medium masked
		if("scavmedmask1")
			return /datum/outfit/scav/scavmedmask1
		if("scavmedmask2")
			return /datum/outfit/scav/scavmedmask2
		if("scavmedmask3")
			return /datum/outfit/scav/scavmedmask3
		if("scavmedmask4")
			return	/datum/outfit/scav/scavmedmask4
		if("scavmedmask5")
			return /datum/outfit/scav/scavmedmask5
		if("scavmedmask6")
			return /datum/outfit/scav/scavmedmask6


/mob/living/simple_animal/hostile/frontier/AttackingTarget()
	. = ..()
	get_weapon_sound()

/mob/living/simple_animal/hostile/frontier/Shoot(atom/targeted_atom)
	. = ..()
	get_weapon_sound()
	if(autogun)
		rapid = rand(1,5) //How many shots per volley.
		rapid_fire_delay = rand(2,4)


//mob/living/simple_animal/hostile/frontier/ranged/random
/mob/living/simple_animal/hostile/frontier/scav/Aggro()
	. = ..()
	if(.)
		return
	summon_backup(15)
	if(!ckey)
		if(aggro_lines)
			say(pick(aggro_lines))


/mob/living/simple_animal/hostile/frontier/proc/pain_scream()
	playsound(get_turf(src), pain_sound, 100, 1)
	say(pick(
			"Aggh!", 
			"I'm hit!", 
			"Agh! Shit!" , 
			"Oof!", 
			"Ouch!", 
			"Auugh!", 
			"I'm hurt!", 
			"F-Fuck...!", 
			"S-Shit...!",
			"Agh! They got me!",
			"Guh, I'm fucked...",
			"Bastard!",
			"Takes more than that!",
			 ))


/mob/living/simple_animal/hostile/frontier/adjustHealth(amount, updating_health = TRUE, forced = FALSE)
	. = ..()
	if(. > 0 && stat == CONSCIOUS)
		pain_scream()


/*
	FERAL'S AUTISTIC UNIQUE SIMPLE MOB-DENATOR!!
*/
/mob/living/simple_animal/hostile/frontier/proc/generate_unique_appearance()	//ALL THE SHIT COMBINED
	skin_color = pick(
	"fff4e6",
	"ffe0d1",
	"fcccb3",
	"e8b59b",
	"d9ae96",
	"c79b8b",
	"ffdeb3",
	"e3ba84",
	"c4915e",
	"b87840",
	"754523",
	"471c18",
	)
	eyes_color = pick(
	//	"ff3030",  
		"3d77ff",		
		"31e8f5",
		"49c928",		
		"693b00",		
		"000000",		
		)
	hair_color = pick(
		"ec7631",
		"000000",
		"ffee8d",
		"e9e9e9",
		"a52a26",
		"75400e",
	)
	chosen_hair = pick(hair)
	chosen_facialhair = pick(facialhair)

/mob/living/simple_animal/hostile/frontier/proc/get_skintone()		//Possibly the dumbest code I made so far
	switch(skin_color)
		if("fff4e6")
			return "albino"
		if("ffe0d1")
			return "caucasian1"
		if("fcccb3")
			return "caucasian2"
		if("e8b59b")
			return "caucasian3"
		if("d9ae96")
			return "latino"
		if("c79b8b")
			return "mediterranean"
		if("ffdeb3")
			return "asian1"
		if("e3ba84")
			return "asian2"
		if("c4915e")
			return "arab"
		if("b87840")
			return "indian"
		if("754523")
			return "african1"
		if("471c18")
			return "african2"

/*
	DUMBEST FUCKING WAY TO MATCH HAIR AND BEARD TO THE CARBON CORPSE, I'M SO SORRY TO FUTURE DEVS LOOKING AT THIS
*/
/mob/living/simple_animal/hostile/frontier/proc/get_hair_name()	//HAIR
	switch(chosen_hair)
		if("hair_a")
			return "Short Hair"
		if("hair_c")
			return "Cut Hair"
		if("bald")
			return "bald"
		if("hair_spikey")
			return "Spiky"
		if("hair_spiky2")
			return "Spiky 3"
		if("hair_unshaven_mohawk")
			return "Mohawk Tall"
		if("hair_skinhead")
			return "Skinhead"
		if("hair_e")
			return "Balding Hair"
		if("hair_bedhead")
			return "Bedhead wild"
		if("hair_cornrows")
			return "Cornrows"
		if("hair_cornrows2")
			return  "Cornrows Long"
		if("hair_cornrowbraid")
			return  "Cornrow Braid"
		if("hair_cornrowbun")
			return "Cornrow Bun"
		if("hair_jensen")
			return "Jensen"


/mob/living/simple_animal/hostile/frontier/proc/get_beard_name()	//BEARD	
	switch(chosen_facialhair)
		if("facial_brokenman")
			return "Beard (Broken Man)"
		if("facial_fullbeard")
			return "Beard (Full)"
		if("facial_elvis")
			return "Sideburns (Elvis)"
		if("facial_longbeard")		
			return "Beard (Pretty Long)"
		if("facial_gt")		
			return "Short beard (Goatee)"
		if("facial_goatee")		
			return "Short beard (Goatee alt)"
		if(	"facial_hip")		
			return "Short beard (Hipster)"
		if("facial_jensen")		
			return "Short beard (Jensen)"
		if("facial_moonshiner")		
			return "Beard (Moonshiner)"
		if("facial_neckbeard")		
			return "Beard (Neckbeard)"
		if("facial_tribeard")		
			return "Beard (Tribeard)"

/mob/living/simple_animal/hostile/frontier/proc/get_headwear()
	switch(headwear)
		if("rusted_cowboy")
			return /obj/item/clothing/head/helmet/f13/rustedcowboyhat
		if("scarecrow_hat")
			return /obj/item/clothing/head/scarecrow_hat
		if("cowboyhat")
			return /obj/item/clothing/head/cowboyhat
		if("baseballsoft")
			return /obj/item/clothing/head/soft/f13/baseball
		if("bandit")
			return /obj/item/clothing/head/f13/bandit
		if("pot")
			return /obj/item/clothing/head/f13/pot
		if("cargosoft")
			return /obj/item/clothing/head/soft
		if("greysoft")
			return /obj/item/clothing/head/soft/grey

/mob/living/simple_animal/hostile/frontier/proc/get_weapon_sound()
	if(weapon)
		if(ranged)
			switch(weapon)
				if("pistol")
					projectilesound = pick(GLOB.small_arms_sound)
				if("autopipe")
					projectilesound = pick(GLOB.small_arms_sound)
				if("shotgun")
					projectilesound = pick(GLOB.shotgun_sound)
		else
			switch(weapon)
				if("knife")
					melee_windup_sound = pick(GLOB.small_sharp_whoosh_sound)
					attack_sound = pick(GLOB.sharp_weapon_sound)
				if("fireaxe")
					melee_windup_sound = pick(GLOB.large_sharp_whoosh_sound)
					attack_sound = pick(GLOB.chop_weapon_sound)
				if("bat")
					melee_windup_sound = pick(GLOB.small_blunt_whoosh_sound)
					attack_sound = pick(GLOB.blunt_weapon_sound)
				if("bat2")
					melee_windup_sound = pick(GLOB.small_blunt_whoosh_sound)
					attack_sound = pick(GLOB.blunt_weapon_sound)
				if("golf")
					melee_windup_sound = pick(GLOB.small_blunt_whoosh_sound)
					attack_sound = pick(GLOB.blunt_weapon_sound)
				if("sledge")
					melee_windup_sound = pick(GLOB.large_blunt_whoosh_sound)
					attack_sound = pick(GLOB.blunt_weapon_sound)
				if("machete")
					melee_windup_sound = pick(GLOB.large_sharp_whoosh_sound)
					attack_sound = pick(GLOB.chop_weapon_sound)
				if("scrapsabre")
					melee_windup_sound = pick(GLOB.large_sharp_whoosh_sound)
					attack_sound = pick(GLOB.chop_weapon_sound)

