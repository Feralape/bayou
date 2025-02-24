/mob/living/simple_animal/hostile/frontier
	name = "scav"
	icon = 'modular/icons/mob/frontier_human_mobs.dmi'
	icon_state = "human"
	icon_living = "human"
	icon_dead = null
	icon_gib = "gib"
	del_on_death = TRUE
	rotate_on_lying = TRUE

	loot = list(
	/obj/effect/decal/cleanable/blood/splatter, 
	/obj/item/gun/ballistic/automatic/autopipe, 
	/obj/item/ammo_box/magazine/autopipe,
	)
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

	var/gear = "scav"
	var/weapon
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

	var/mutable_appearance/gear_overlay 
	var/mutable_appearance/weapon_overlay 
	var/mutable_appearance/hair_overlay
	var/mutable_appearance/eyes_overlay 
	var/mutable_appearance/facial_hair_overlay
	var/mob/living/carbon
	var/obj/effect/mob_spawn/human/corpse/frontier/deadguy
	var/corpse_outfit = /datum/outfit/scav/scavenger

/mob/living/simple_animal/hostile/frontier/Initialize(mapload)
	. = ..()
	generate_unique_appearance()
	generate_name()
	corpse_outfit = get_armor()
	gear_overlay = mutable_appearance(icon, "gear-[gear]", color = null)
	weapon_overlay = mutable_appearance(icon, "weapon-[weapon]", color = null)
	eyes_overlay = mutable_appearance(icon, "human_eyes", color = "#[eyes_color]")
	hair_overlay = mutable_appearance('icons/mob/hair.dmi', chosen_hair, color = "#[hair_color]")
	facial_hair_overlay = mutable_appearance('icons/mob/hair.dmi', chosen_facialhair, color = "#[hair_color]")
	color = "#[skin_color]"
	add_overlay(gear_overlay)
	add_overlay(weapon_overlay)
	add_overlay(eyes_overlay)
	add_overlay(hair_overlay)
	add_overlay(facial_hair_overlay)

	update_icon()
	INVOKE_ASYNC(src,PROC_REF(generate_corpse))

	death_sound = pick(more_deathsound)



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
	playsound(get_turf(src), pick('sound/effects/wounds/pierce1.ogg', 'sound/effects/wounds/pierce2.ogg', 'sound/effects/wounds/pierce3.ogg'), 100, 1)
	deadguy.forceMove(drop_location())
	deadguy.direction = src.dir
	deadguy.create()

/mob/living/simple_animal/hostile/frontier/scav
	desc = "It's a hostile scavenger."


	

/mob/living/simple_animal/hostile/frontier/scav/ranged

	weapon = "autopipe"
	autogun = TRUE
	projectilesound = 'sound/f13weapons/ninemil.ogg'
	projectiletype = /obj/item/projectile/bullet/c9mm/simple
	ranged = TRUE
	mob_armor = ARMOR_VALUE_RAIDER_LEATHER_JACKET
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

/mob/living/simple_animal/hostile/frontier/scav/ranged_pistol
	
	weapon = "pistol"
	autogun = FALSE
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

/mob/living/simple_animal/hostile/frontier/scav/Initialize(mapload)
	gear = pick(
		"scav",
		"scav_kit",
		"scav_kit2",
		"scav_kit3",
		"scav_ragged",
		"scav_ragged2",
	)
	..()

/mob/living/simple_animal/hostile/frontier/proc/get_armor()
	switch(gear)
		if("scav")
			return /datum/outfit/scav/scavenger
		if("scav_kit")
			return /datum/outfit/scav/scavenger_kit
		if("scav_kit2")
			return /datum/outfit/scav/scavenger_kit2
		if("scav_kit3")
			return /datum/outfit/scav/scavenger_kit3
		if("scav_ragged")
			return /datum/outfit/scav/scavenger_ragged
		if("scav_ragged2")
			return /datum/outfit/scav/scavenger_ragged2

/mob/living/simple_animal/hostile/frontier/Shoot(atom/targeted_atom)
	. = ..()
	projectilesound = pick(
		'sound/f13weapons/ninemil.ogg', 
		'sound/f13weapons/9mm.ogg', 
		'sound/f13weapons/greasegun.ogg', 
		'sound/f13weapons/policepistol.ogg',
		'sound/f13weapons/varmint_rifle.ogg',
		)
	if(autogun)
		rapid = rand(1,5) //How many shots per volley.
		rapid_fire_delay = rand(2,4)


//mob/living/simple_animal/hostile/frontier/ranged/random
/mob/living/simple_animal/hostile/frontier/Aggro()
	. = ..()
	if(.)
		return
	summon_backup(15)
	if(!ckey)
		say(pick(
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
			"I need fucking backup!",
			"Run, bitch, run!",
			"Eat lead, motherfucker!",
			 ))


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
		if("shaved")
			return "Beard (3 o\'Clock)"
	