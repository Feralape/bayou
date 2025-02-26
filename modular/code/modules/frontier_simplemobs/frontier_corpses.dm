/datum/outfit
	var/hair_style
	var/facial_hair_style
	var/hair_color
	var/facial_hair_color

/obj/effect/mob_spawn/human/corpse/frontier
	var/obj/item/bodypart/BP
	var/def_zone = BODY_ZONE_CHEST
	
	ghost_usable = FALSE //These are just not-yet-set corpses.
	instant = FALSE	
	mob_gender = MALE


/obj/effect/mob_spawn/human/corpse/frontier/equip(mob/living/carbon/human/H)
	.=..()
	def_zone = pick(BODY_ZONE_CHEST, BODY_ZONE_HEAD, BODY_ZONE_L_ARM, BODY_ZONE_R_ARM, BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
	BP = H.get_bodypart(def_zone)
	var/datum/wound/woundtype = pick(/datum/wound/bleed/slash/critical, /datum/wound/bleed/pierce/critical, /datum/wound/blunt/critical)
	brute_damage = rand(40,100)
	if(BP)
		H.apply_damage(rand(10,20), BRUTE, BP, H.run_armor_check(BP, "melee"))
		woundtype.apply_wound(BP)

/datum/outfit/scav/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	. = ..()
	if(prob(50))
		back = /obj/item/storage/backpack/loot
	if(prob(60))
		l_pocket = pick(pick(GLOB.trash_loot, GLOB.common_loot))
	if(prob(60))
		r_pocket = pick(pick(GLOB.trash_loot, GLOB.common_loot))

