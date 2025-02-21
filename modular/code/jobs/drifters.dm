/// DRIFTER
/datum/job/frontier/outlander
	title = "Outlander"
	flag = FRONTIER_OUTLANDER
	display_order = JOB_DISPLAY_ORDER_OUTLANDER
	faction = FACTION_DRIFTER
	total_positions = -1
	spawn_positions = -1
	description = "You are a lone wanderer, unaffliated with any of the factions in the region, you are here for purposes known only to you. You do not get the protection and benefits that comes with being part of a faction and have in your possession whatever you get to carry on your back."
	supervisors = "fate"
	selection_color = "#d5d4dfb7"

	outfit = /datum/outfit/job/frontier/outlander

	access = list()		//we can expand on this and make alterations as people suggest different loadouts
	minimal_access = list()
	matchmaking_allowed = list(
		/datum/matchmaking_pref/friend = list(
			/datum/job/frontier/outlander,
		),
		/datum/matchmaking_pref/rival = list(
			/datum/job/frontier/outlander,
		),
		/datum/matchmaking_pref/mentor = list(
			/datum/job/frontier/outlander,
		),
		/datum/matchmaking_pref/disciple = list(
			/datum/job/frontier/outlander,
		),
		/datum/matchmaking_pref/patron = list(
			/datum/job/frontier/outlander,
		),
		/datum/matchmaking_pref/protegee = list(
			/datum/job/frontier/outlander,
		),
	)
	
	loadout_options = list()
//	/datum/outfit/loadout/ncrcitizen,
//	/datum/outfit/loadout/legioncivilian,
//	/datum/outfit/loadout/wastelander_desert_ranger)

/datum/outfit/job/frontier/outlander
	name = "Outlander"
	jobtype = /datum/job/frontier/outlander

	id = null
	ears = null
	belt = /obj/item/supplykit
	l_pocket = /obj/item/storage/wallet/stash/low
	r_pocket = /obj/item/flashlight/flare
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	box = /obj/item/storage/survivalkit
	box_two = /obj/item/storage/survivalkit/medical
	backpack_contents = list(
		///obj/item/reagent_containers/hypospray/medipen/stimpak, //we don't need this big advantage to being a wastelander instead of citizen
		///obj/item/reagent_containers/hypospray/medipen/stimpak,
		/obj/item/pda = 1,
		/obj/item/storage/pill_bottle/chem_tin/radx,
		/obj/item/radio/headset
		)

/datum/outfit/job/frontier/outlander/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/vagabond, \
		/obj/item/clothing/under/f13/worn, \
		/obj/item/clothing/under/foxflannel, \
		/obj/item/clothing/under/redflannel)


///RADIO OPERATOR
/datum/job/frontier/radioop
	title = "Radio Operator"
	flag = FRONTIER_RADIOOP
	faction = FACTION_DRIFTER
	total_positions = 2
	spawn_positions = 2
	description = "The most broad and open role, you have arrived in the region for purposes known only to you. If you're new, the Outpost to the Southwest may prove a valuable first stop. Try to make a living for yourself - or simply survive - and craft your own unique story."
	supervisors = "fate"
	selection_color = "#d5d4dfb7"

	outfit = /datum/outfit/job/frontier/radioop

	access = list(ACCESS_TCOMSAT)
	minimal_access = list(ACCESS_TCOMSAT)

/datum/outfit/job/frontier/radioop
	name = "Radio Operator"
	jobtype = /datum/job/frontier/radioop
	id =	/obj/item/card/id/silver
	ears = /obj/item/radio/headset
	belt = /obj/item/supplykit
	l_pocket = /obj/item/storage/wallet/stash/low
	r_pocket = /obj/item/flashlight/flare
	backpack = /obj/item/storage/backpack/satchel/explorer
	satchel = /obj/item/storage/backpack/satchel/explorer
	box = /obj/item/storage/survivalkit
	box_two = /obj/item/storage/survivalkit/medical
	backpack_contents = list(
		/obj/item/pda = 1,
		/obj/item/storage/pill_bottle/chem_tin/radx,
		/obj/item/card/id/selfassign,
		/obj/item/clothing/mask/chameleon
		)

GLOBAL_LIST_EMPTY(radio_operators)

/datum/outfit/job/frontier/radioop/pre_equip(mob/living/carbon/human/H)
	..()
	uniform = pick(
		/obj/item/clothing/under/vagabond, \
		/obj/item/clothing/under/f13/worn, \
		/obj/item/clothing/under/foxflannel, \
		/obj/item/clothing/under/redflannel)

/datum/outfit/job/frontier/radioop/post_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	. = ..()
	to_chat(H, span_red("Use the play-internet-sound verb carefully, you may get job banned or worse on misuse."))
	add_verb(H, /client/proc/play_web_sound_radioman)

/client/proc/play_web_sound_radioman()
	set category = "Radio Op"
	set name = "Play on Radio"

	var/ytdl = CONFIG_GET(string/invoke_youtubedl)
	if(!ytdl)
		to_chat(src, span_boldwarning("yt-dlp was not configured, action unavailable")) //Check config.txt for the INVOKE_YOUTUBEDL value
		return

	var/web_sound_input = input("Enter content URL (supported sites only, leave blank to stop playing)", "Play Internet Sound via yt-dlp") as text|null
	if(istext(web_sound_input))
		var/web_sound_url = ""
		var/stop_web_sounds = FALSE
		var/list/music_extra_data = list()
		if(length(web_sound_input))

			web_sound_input = trim(web_sound_input)
			if(findtext(web_sound_input, ":") && !findtext(web_sound_input, GLOB.is_http_protocol))
				to_chat(src, span_boldwarning("Non-http(s) URIs are not allowed."))
				to_chat(src, span_warning("For yt-dlp shortcuts like ytsearch: please use the appropriate full url from the website."))
				return
			var/shell_scrubbed_input = shell_url_scrub(web_sound_input)
			var/list/output = world.shelleo("[ytdl] --format \"bestaudio\[ext=mp3]/best\[ext=mp4]\[height<=360]/bestaudio\[ext=m4a]/bestaudio\[ext=aac]\" --dump-single-json --no-playlist -- \"[shell_scrubbed_input]\"")
			var/errorlevel = output[SHELLEO_ERRORLEVEL]
			var/stdout = output[SHELLEO_STDOUT]
			var/stderr = output[SHELLEO_STDERR]
			if(!errorlevel)
				var/list/data
				try
					data = json_decode(stdout)
				catch(var/exception/e)
					to_chat(src, span_boldwarning("yt-dlp JSON parsing FAILED:"))
					to_chat(src, span_warning("[e]: [stdout]"))
					return

				if (data["url"])
					web_sound_url = data["url"]
					var/title = "[data["title"]]"
					var/webpage_url = title
					if (data["webpage_url"])
						webpage_url = "<a href=\"[data["webpage_url"]]\">[title]</a>"
					music_extra_data["start"] = data["start_time"]
					music_extra_data["end"] = data["end_time"]
					music_extra_data["link"] = data["webpage_url"]
					music_extra_data["title"] = data["title"]

					to_chat(world, span_boldannounce("A radio operator played: [webpage_url]"))
					SSblackbox.record_feedback("nested tally", "played_url", 1, list("[ckey]", "[web_sound_input]"))
					log_admin("[key_name(src)] (RADIO OP) played web sound: [web_sound_input]")
					message_admins("[key_name(src)] (RADIO OP) played web sound: [web_sound_input]")
			else
				to_chat(src, span_boldwarning("yt-dlp URL retrieval FAILED:"))
				to_chat(src, span_warning("[stderr]"))

		else //pressed ok with blank
			log_admin("[key_name(src)] stopped web sound")
			message_admins("[key_name(src)] stopped web sound")
			web_sound_url = null
			stop_web_sounds = TRUE

		if(web_sound_url && !findtext(web_sound_url, GLOB.is_http_protocol))
			to_chat(src, span_boldwarning("BLOCKED: Content URL not using http(s) protocol"))
			to_chat(src, span_warning("The media provider returned a content URL that isn't using the HTTP or HTTPS protocol"))
			return
		if(web_sound_url || stop_web_sounds)
			for(var/m in GLOB.player_list)
				var/mob/M = m
				var/client/C = M.client
				if(C.prefs.toggles & SOUND_MIDI)
					if(!stop_web_sounds)
						C.tgui_panel?.play_music(web_sound_url, music_extra_data)
					else
						C.tgui_panel?.stop_music()

	SSblackbox.record_feedback("tally", "admin_verb", 1, "Play Internet Sound")
