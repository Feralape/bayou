/datum/outfit
	var/hair_style
	var/facial_hair_style
	var/hair_color
	var/facial_hair_color

/datum/outfit/scav/scavenger
	uniform = /obj/item/clothing/under/f13/raider_leather
	shoes = /obj/item/clothing/shoes/f13/rag

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
	back = /obj/item/storage/backpack/loot/scav

/*
/datum/outfit/job/den/f13settler/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/f13/settler, \
		/obj/item/clothing/under/f13/brahminm, \
		/obj/item/clothing/under/f13/machinist, \
		/obj/item/clothing/under/f13/lumberjack, \
		/obj/item/clothing/under/f13/roving)
*/
/datum/outfit/scav/scavenger_kit
	uniform = /obj/item/clothing/under/pants/f13/cloth
	suit = /obj/item/clothing/suit/armor/light/kit
	shoes = /obj/item/clothing/shoes/f13/rag

/datum/outfit/scav/scavenger_kit2
	uniform = /obj/item/clothing/under/pants/f13/ghoul
	suit = /obj/item/clothing/suit/armor/light/kit
	shoes = /obj/item/clothing/shoes/f13/rag

/datum/outfit/scav/scavenger_kit3
	uniform = /obj/item/clothing/under/pants/f13/cloth
	suit = /obj/item/clothing/suit/armor/light/kit
	shoes = /obj/item/clothing/shoes/f13/rag

/datum/outfit/scav/scavenger_kit2
	uniform = /obj/item/clothing/under/pants/f13/ghoul
	suit = /obj/item/clothing/suit/armor/light/kit
	shoes = /obj/item/clothing/shoes/f13/rag

/datum/outfit/scav/scavenger_ragged
	uniform = /obj/item/clothing/under/pants/f13/ghoul
	shoes = /obj/item/clothing/shoes/f13/rag

/datum/outfit/scav/scavenger_ragged2
	uniform = /obj/item/clothing/under/pants/f13/cloth
	shoes = /obj/item/clothing/shoes/f13/rag
