//Fallout 13 primary vehicle

/obj/vehicle/ridden/fuel/motorcycle
	name = "motorcycle"
	desc = "Wanderer Motors LLC."
	icon = 'icons/fallout/vehicles/medium_vehicles.dmi'
	icon_state = "bike"
	pixel_x = -16
	pixel_y = -2
	layer = LYING_MOB_LAYER
	obj_integrity = 400
	max_integrity = 400
	armor = list(melee = 50, bullet = 40, laser = 30, energy = 30, bomb = 0, bio = 0, rad = 0, fire = 30, acid = 40)
	var/image/cover = null
	key_type = /obj/item/key/motorcycle
	var/mutable_appearance/bike_cover
	engine_start  = 'sound/f13machines/bike_start.ogg'
	engine_fail = 'sound/f13machines/engine_fail.ogg'
	drive_sound = list('sound/f13machines/bike_loop2.ogg')

/obj/vehicle/ridden/fuel/motorcycle/Initialize()
	. = ..()
	bike_cover = GetCover()
	bike_cover.layer = ABOVE_MOB_LAYER
	bike_cover.plane = MOB_PLANE
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 1
	D.set_riding_offsets(RIDING_OFFSET_ALL, list(TEXT_NORTH = list(0, 1), TEXT_SOUTH = list(0, 1), TEXT_EAST = list(0, 4), TEXT_WEST = list( 0, 4)))
	D.set_vehicle_dir_offsets(NORTH, -16, -16)
	D.set_vehicle_dir_offsets(SOUTH, -16, -16)
	D.set_vehicle_dir_offsets(EAST, -18, 0)
	D.set_vehicle_dir_offsets(WEST, -18, 0)
	D.set_vehicle_dir_layer(SOUTH,  OBJ_LAYER)
	D.set_vehicle_dir_layer(NORTH, OBJ_LAYER)
	D.set_vehicle_dir_layer(EAST, OBJ_LAYER)
	D.set_vehicle_dir_layer(WEST, OBJ_LAYER)
	update_icon()

/obj/vehicle/ridden/fuel/motorcycle/proc/GetCover()
	return mutable_appearance('icons/fallout/vehicles/medium_vehicles.dmi', "[icon_state]_cover")


/obj/vehicle/ridden/fuel/motorcycle/relaymove(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(istype(H.wear_suit, /obj/item/clothing/suit/armor/power_armor))
			to_chat(user, "The [name] will not move, because you are too heavy.")
			return
	..()

/obj/vehicle/ridden/fuel/motorcycle/post_buckle_mob(mob/living/M)
	. = ..()
	update_cover()

/obj/vehicle/ridden/fuel/motorcycle/proc/update_cover()
	if(occupants)
		add_overlay(bike_cover)
	else
		cut_overlay(bike_cover)

/obj/vehicle/ridden/fuel/motorcycle/post_unbuckle_mob(mob/living/buckled_mob,force = FALSE)
	. = ..()
	update_cover()

/obj/vehicle/ridden/fuel/motorcycle/relaymove(mob/user)
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		/*
		if(istype(H.wear_suit, /obj/item/clothing/suit/armor/f13/power_armor))//Standard PA.
			to_chat(user, "The [name] will not move, because you are too heavy.")
			return
		if(istype(H.wear_suit, /obj/item/clothing/suit/armored/heavy))//Salvaged PA and misc.
			to_chat(user, "The [name] will not move, because you are too heavy.")
			return
		*/
		if(H.pulling)
			to_chat(user, "The [name] will not move, because you are attempting to pull something.")
			return
	..()

/obj/item/key/motorcycle
	name = "motorcycle key"
	desc = "A keyring with a small steel key.<br>By the look of the key cuts it likely belongs to a motorcycle."
	icon = 'icons/fallout/vehicles/small_vehicles.dmi'

/obj/item/key/motorcycle/New()
	..()
	icon_state = pick("key-bike-r","key-bike-y","key-bike-g","key-bike-b")

//Motorcycle subtypes with different skins

/obj/vehicle/ridden/fuel/motorcycle/rusty
	name = "rusty motorcycle"
	desc = "A very old, weathered motorcycle.<br>Somehow the engine is still intact."
	icon_state = "bike_rust_med"
//	D.vehicle_move_delay = 1.2

/obj/vehicle/ridden/fuel/motorcycle/rusty/Initialize()
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 1.1//only 10% slower.

/obj/vehicle/ridden/fuel/motorcycle/green
	name = "green motorcycle"
	desc = "A military motorcycle from the old days.<br>Oddly enough it's still in pristine condition. The Army always had all the top-quality stuff."
	icon_state = "bike_green"

/obj/vehicle/ridden/fuel/motorcycle/flamy
	name = "black motorcycle"
	desc = "A vintage motorcycle from the old days.<br>It's extremely well maintained, jet black, and very shiny.<br>Topping it all off, it has badass flames painted on the fuel tank."
	icon_state = "bike_flamy"

/obj/vehicle/ridden/fuel/motorcycle/scrambler
	name = "scrambler motorbike"
	desc = "Scrambler is an old term for a dirt bike with a powerful engine that raced on dirt tracks with low jumps.<br>Something tells you it's better not to mess around with its owner."
	icon_state = "bike_scrambler"

/obj/vehicle/ridden/fuel/motorcycle/scrambler/Initialize()
	. = ..()
	var/datum/component/riding/D = LoadComponent(/datum/component/riding)
	D.vehicle_move_delay = 0.7

