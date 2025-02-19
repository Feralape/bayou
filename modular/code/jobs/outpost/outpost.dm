///UNCATEGORIZED OUTPOST JOBS

//PILOT

/datum/job/frontier/outpost_pilot
	title = "Outpost Pilot"
	flag = OUTPOST_PILOT 
	display_order = JOB_DISPLAY_ORDER_PILOT
	faction = FACTION_OUTPOST
	total_positions = 1
	spawn_positions = 1
	supervisors = "Outpost's Laws"
	description = "You are a pilot, hired to fly the town's vertibird. Your job is to provide transport for people and aid in search and rescue. Don't forget to charge a fare."
	selection_color = "#3169bd"
/*
	loadout_options = list(
	/datum/outfit/loadout/pilotformal,
	/datum/outfit/loadout/pilotshock,
	/datum/outfit/loadout/flightsurgeon,
	/datum/outfit/loadout/pilotparamed)
*/
	outfit = /datum/outfit/job/frontier/pilot

	access = list(ACCESS_BAR, ACCESS_EVA)
	minimal_access = list(ACCESS_BAR, ACCESS_EVA)

/datum/outfit/job/frontier/pilot
	name = "Outpost Pilot"
	jobtype = /datum/job/frontier/outpost_pilot
	belt = /obj/item/supplykit
	id = /obj/item/card/id/dogtag/town
	uniform = /obj/item/clothing/under/f13/settler
	shoes = /obj/item/clothing/shoes/jackboots
	backpack = /obj/item/storage/backpack/satchel/explorer
	r_pocket = /obj/item/flashlight/flare
	backpack_contents = list(
		/obj/item/storage/pill_bottle/chem_tin/radx,
		/obj/item/storage/wallet/stash/low = 1,
		/obj/item/pda = 1,
		)

/datum/outfit/job/frontier/pilot/pre_equip(mob/living/carbon/human/H)
	. = ..()
	uniform = pick(
		/obj/item/clothing/under/f13/gentlesuit,
		/obj/item/clothing/under/f13/formal,
		/obj/item/clothing/under/f13/spring,
		/obj/item/clothing/under/f13/relaxedwear,
		/obj/item/clothing/under/f13/machinist,
		/obj/item/clothing/under/f13/brahminf,
		/obj/item/clothing/under/f13/cowboyb,
		/obj/item/clothing/under/f13/cowboyg,
		/obj/item/clothing/under/f13/cowboyt)


//BARTENDER

/datum/job/frontier/bartender
	title = "Bartender"
	flag = OUTPOST_BARTENDER
	display_order = JOB_DISPLAY_ORDER_OUTPOSTBARTENDER
	faction = FACTION_OUTPOST
	total_positions = -1
	spawn_positions = -1
	supervisors = "Outpost's Laws"
	description = "You're given the lease to open your bar on the outpost for thirsty colonists and wanderers."
	enforces = "Check your guidebook"
	selection_color = "#3169bd"

	outfit = /datum/outfit/job/frontier/bartender
/*
	loadout_options = list(
	/datum/outfit/loadout/diner
	)
*/
	access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_CARGO, ACCESS_GUILD)
	minimal_access = list(ACCESS_BAR, ACCESS_CARGO_BOT, ACCESS_CARGO, ACCESS_GUILD)
/*	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/oasis
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/oasis
		)
	)
*/

/datum/outfit/job/frontier/bartender
	name = "Bartender"
	jobtype = /datum/job/frontier/bartender
	uniform = /obj/item/clothing/under/f13/bartenderalt
	id = /obj/item/card/id/dogtag/town
	ears = /obj/item/radio/headset/headset_town/guild
	belt = /obj/item/supplykit
	shoes = /obj/item/clothing/shoes/workboots/mining
	backpack = /obj/item/storage/backpack/satchel/leather
	gloves = /obj/item/pda
	l_pocket = /obj/item/storage/wallet/stash/mid
	backpack_contents = list(
		/obj/item/book/manual/nuka_recipes = 1,
		/obj/item/cool_book/guildguide = 1
		)




/// DEBUG SHIT


/datum/outfit/job/den/f13secretary
	name = "Councilperson"
	id = /obj/item/card/id/silver
	belt = /obj/item/supplykit
	ears = /obj/item/radio/headset/headset_town/mayor
	glasses = /obj/item/clothing/glasses/regular/hipster
	gloves = /obj/item/clothing/gloves/color/white
	backpack = /obj/item/storage/backpack/satchel/leather
	satchel = /obj/item/storage/backpack/satchel/leather
	r_hand = /obj/item/storage/briefcase/secretary
	l_pocket = /obj/item/storage/wallet/stash/mid
	r_pocket = /obj/item/flashlight/seclite
	shoes = /obj/item/clothing/shoes/f13/fancy
	uniform = /obj/item/clothing/under/suit/black
	backpack_contents = list(
		/obj/item/storage/pill_bottle/chem_tin/radx,
		/obj/item/ammo_box/magazine/m9mm = 1,
		/obj/item/melee/onehanded/knife/switchblade = 1,
		/obj/item/pda = 1
		)
