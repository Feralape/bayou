/// TECHNICIAN
/datum/job/frontier/engineer_outpost
	title = "Outpost Engineer"
	flag = OUTPOST_ENGINEER
	faction = FACTION_OUTPOST
	display_order = JOB_DISPLAY_ORDER_OUTPOSTENGINEER
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Governor."
	description = "You are an engineer of the Outpost, you perform maintenance, setup generator and construct things. Check your guidebook for more info."
	enforces = "Check your guidebook"
	selection_color = "#3169bd"
	exp_requirements = 0

	outfit = /datum/outfit/job/engineer_outpost
	access = list(ACCESS_OUTPOST, ACCESS_ENGINE)
	minimal_access = list(ACCESS_OUTPOST, ACCESS_ENGINE)


/datum/outfit/job/engineer_outpost
	name =		"Technician"
	jobtype =	/datum/job/frontier/engineer_outpost
	shoes =		/obj/item/clothing/shoes/f13/explorer
	belt = 		/obj/item/supplykit
	id =		/obj/item/card/id/dogtag/technician
	ears =		/obj/item/radio/headset/headset_outpost/technician
	uniform =	/obj/item/clothing/under/technician
	gloves = 	/obj/item/pda
	l_pocket = /obj/item/storage/wallet/stash/mid
	satchel =	/obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	backpack = 	/obj/item/storage/backpack/industrial

/datum/outfit/job/engineer_outpost/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_EXPLOSIVE_CRAFTING, src)


/// TECHNICIAN
/datum/job/frontier/ce_outpost
	title = "Chief Engineer"
	flag = OUTPOST_CE
	faction = FACTION_OUTPOST
	display_order = JOB_DISPLAY_ORDER_OUTPOSTCE
	total_positions = 3
	spawn_positions = 3
	supervisors = "the Governor."
	description = "You are the chief engineer of the Outpost, you oversee your engineers and lead engineering projects."
	enforces = "Check your guidebook"
	selection_color = "#3169bd"
	exp_requirements = 0

	outfit = /datum/outfit/job/ce_outpost
	access = list(ACCESS_OUTPOST, ACCESS_ENGINE)
	minimal_access = list(ACCESS_OUTPOST, ACCESS_ENGINE)


/datum/outfit/job/ce_outpost
	name =		"Chief Engineer"
	jobtype =	/datum/job/frontier/ce_outpost
	shoes =		/obj/item/clothing/shoes/f13/explorer
	belt = 		/obj/item/supplykit
	id =		/obj/item/card/id/dogtag/technician
	ears =		/obj/item/radio/headset/headset_outpost/technician
	uniform =	/obj/item/clothing/under/technician
	gloves = 	/obj/item/pda
	l_pocket = /obj/item/storage/wallet/stash/mid
	satchel =	/obj/item/storage/backpack/satchel/eng
	duffelbag = /obj/item/storage/backpack/duffelbag/engineering
	backpack = 	/obj/item/storage/backpack/industrial

/datum/outfit/job/ce_outpost/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	if(visualsOnly)
		return
	ADD_TRAIT(H, TRAIT_GENERIC, src)
	ADD_TRAIT(H, TRAIT_TECHNOPHREAK, src)
	ADD_TRAIT(H, TRAIT_EXPLOSIVE_CRAFTING, src)


