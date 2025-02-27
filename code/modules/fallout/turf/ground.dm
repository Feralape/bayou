//Fallout 13 general indestructible floor directory

/turf
	var/baseturf_icon
	var/baseturf_dir = 0
	var/edge_icon
	var/list/turf_types_to_check = list() // Add more turf types as needed

/turf/proc/CheckAdjacentTurfs(turf_types)
    for(var/direction in GLOB.cardinals)
        var/turf/turf_to_check = get_step(src, direction)
        for(var/turf_type in turf_types)
            if(istype(turf_to_check, turf_type))
                var/obj/effect/overlay/edge = new edge_icon(src)
                switch(direction)
                    if(NORTH)
                        edge.pixel_y = 32
                    if(SOUTH)
                        edge.pixel_y = -32
                    if(EAST)
                        edge.pixel_x = 32
                    if(WEST)
                        edge.pixel_x = -32
                edge.dir = dir = turn(direction, 180)

/turf/open/indestructible/ground
	icon = 'icons/fallout/turfs/ground.dmi'
	name = "\proper ground"
	icon_state = "wasteland1"
	intact = 0
	planetary_atmos = TRUE
	tiled_dirt = FALSE

	var/flags = NONE

/turf/open/indestructible/ground/New()
	..()
	baseturfs = src.type
	baseturf_icon = icon_state
	baseturf_dir = dir

/turf/open/indestructible/ground/attack_paw(mob/user)
	return src.attack_hand(user)

/turf/open/indestructible/ground/attackby(obj/item/C, mob/user, params)
	if(istype(C,/obj/item/stack/tile/plasteel))
		var/obj/item/stack/tile/plasteel/S = C
		if(S.use(1))
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			to_chat(user, span_notice("You build a floor."))
			ChangeTurf(/turf/open/floor/plating)
		else
			to_chat(user, span_warning("You need one floor tile to build a floor!"))
		return
	if(istype(C,/obj/item/stack/tile/wood))
		var/obj/item/stack/tile/wood/S = C
		if(S.use(1))
			playsound(src, 'sound/weapons/Genhit.ogg', 50, 1)
			to_chat(user, span_notice("You build a house base."))
			ChangeTurf(/turf/open/floor/plating/wooden)
		else
			to_chat(user, span_warning("You need one floor tile to build a house base!"))
		return
	else
		return ..()
/*
/turf/ground/Entered(go/A)
	..()

/turf/open/indestructible/ground/handle_slip()
	return
*/
/turf/open/indestructible/ground/singularity_act()
	return

/turf/open/indestructible/ground/can_have_cabling()
	return TRUE

//////////////////////////////////////////////////////////////////////
/turf/Initialize()
	CheckAdjacentTurfs(turf_types_to_check)
	. = ..()

/turf/open/indestructible/ground/outside
	sunlight_state = SUNLIGHT_SOURCE

/turf/open/indestructible/ground/outside/Initialize()
	. = ..()
	flags_2 |= GLOBAL_LIGHT_TURF_2


#define GRASS_SPONTANEOUS 		  	2
#define GRASS_WEIGHT			  	8
#define RAND_PLANT_CHANCE			50

GLOBAL_LIST_INIT(lush_plant_spawn_list, list(
	/obj/structure/flora/grass/wasteland = 1,
	))

GLOBAL_LIST_INIT(medicinal_plant_list, list(
	/obj/structure/flora/wasteplant/wild_broc = 12,
	/obj/structure/flora/wasteplant/wild_xander = 12,
	/obj/structure/flora/wasteplant/wild_feracactus = 12, //barrel cactus
	/obj/structure/flora/wasteplant/wild_buffalogourd = 10,
	/obj/structure/flora/wasteplant/wild_horsenettle = 10,
	/obj/structure/flora/wasteplant/wild_mesquite = 10,
	/obj/structure/flora/wasteplant/wild_pinyon = 10,
	/obj/structure/flora/wasteplant/wild_prickly = 10,
	/obj/structure/flora/wasteplant/wild_datura = 10,
	/obj/structure/flora/wasteplant/wild_punga = 10,
	/obj/structure/flora/wasteplant/wild_coyote = 10,
	/obj/structure/flora/wasteplant/wild_yucca = 10,
	/obj/structure/flora/wasteplant/wild_tato = 10,
	/obj/structure/flora/wasteplant/wild_mutfruit = 10,
	/obj/structure/flora/wasteplant/wild_fungus = 5,
	/obj/structure/flora/wasteplant/wild_agave = 10,
	/obj/structure/flora/wasteplant/fever_blossom = 10,
	))

GLOBAL_LIST_INIT(grass_plant_list, list(
	/obj/structure/flora/tallgrass = 150,
	/obj/structure/flora/branch = 1,
	/obj/structure/flora/branch_broken = 1,
	/obj/structure/flora/brushwood = 1,
	/obj/structure/flora/brushwoodalt = 1,
	/obj/structure/flora/grass/coyote = 1,
	/obj/structure/flora/wild_plant/thistle = 2,
	/obj/structure/flora/wild_plant/petunia = 2,
	/obj/structure/flora/wild_plant/petunia/purple = 2,
	/obj/structure/flora/wild_plant/petunia/purplewhite = 2,
	/obj/structure/flora/wild_plant/petunia/redwhite =  2,
	/obj/structure/flora/wild_plant/petunia/bluewhite = 2,
	/obj/structure/flora/ausbushes/ppflowers = 2,
	/obj/structure/flora/ausbushes/ywflowers = 2,
	/obj/structure/flora/ausbushes/brflowers = 2,
	/obj/structure/flora/ausbushes/stalkybush = 2,
	/obj/structure/flora/ausbushes/sunnybush = 2,
	/obj/structure/flora/ausbushes/palebush = 2,
	/obj/structure/flora/ausbushes/pointybush = 2,
	/obj/structure/flora/ausbushes/leafybush = 2,
	/obj/structure/flora/ausbushes/fernybush = 2,
	/obj/structure/flora/burnedtree = 2,
	))

GLOBAL_LIST_INIT(temperategrass_plant_list, list(
	/obj/structure/flora/ausbushes/fullgrass = 150,
	/obj/structure/flora/branch = 1,
	/obj/structure/flora/branch_broken = 1,
	/obj/structure/flora/brushwood = 1,
	/obj/structure/flora/brushwoodalt = 1,
	/obj/structure/flora/ausbushes/sparsegrass = 6,
	/obj/structure/flora/ausbushes/ppflowers = 2,
	/obj/structure/flora/ausbushes/brflowers = 2,
	/obj/structure/flora/ausbushes/ywflowers = 2,
	/obj/structure/flora/ausbushes/lavendergrass = 2,
	/obj/structure/flora/ausbushes/pointybush = 2,
	/obj/structure/flora/ausbushes/genericbush = 2,
	/obj/structure/flora/ausbushes/sunnybush = 2,
	/obj/structure/flora/ausbushes/fernybush = 2,
	/obj/structure/flora/ausbushes/grassybush = 2,
	/obj/structure/flora/ausbushes/stalkybush = 2,
	/obj/structure/flora/ausbushes/palebush = 2,
	/obj/structure/flora/ausbushes/leafybush = 2,
	/obj/structure/flora/ausbushes/reedbush = 2,
	/obj/structure/flora/ausbushes = 3,
	/obj/structure/flora/wild_plant/thistle = 2,
	/obj/structure/flora/wild_plant/petunia = 2,
	/obj/structure/flora/wild_plant/petunia/purple = 2,
	/obj/structure/flora/wild_plant/petunia/purplewhite = 2,
	/obj/structure/flora/wild_plant/petunia/redwhite =  2,
	/obj/structure/flora/wild_plant/petunia/bluewhite = 2,
	/obj/structure/flora/burnedtree = 2,
	))

GLOBAL_LIST_INIT(wintergrass_plant_list, list(
	/obj/structure/flora/grass/both = 150,
	/obj/structure/flora/grass/brown = 100,
	/obj/structure/flora/grass/green = 100,
	/obj/structure/flora/branch = 1,
	/obj/structure/flora/branch_broken = 1,
	/obj/structure/flora/bush = 6,
	))

GLOBAL_LIST_INIT(desertgrass_plant_list, list(
	/obj/structure/flora/tallgrass = 150,
	/obj/structure/flora/ausbushes/barrelcacti_smol = 50,
	/obj/structure/flora/grass/thicket = 100,
	/obj/structure/flora/ausbushes/shrub = 100,
	/obj/structure/flora/ausbushes/bushes = 50,
	/obj/structure/flora/branch = 1,
	/obj/structure/flora/branch_broken = 1,
	/obj/structure/flora/brushwood = 1,
	/obj/structure/flora/brushwoodalt = 1,
	))

GLOBAL_LIST_INIT(beachgrass_plant_list, list(
	/obj/item/toy/seashell = 15,
	/obj/structure/flora/branch = 1,
	/obj/structure/flora/branch_broken = 1,
	))



//TREES
GLOBAL_LIST_INIT(tree_plant_list, list(
	/obj/structure/flora/tree/jungle = 15,
	/obj/structure/flora/tree/jungle/small = 15,
	/obj/structure/flora/tree/med_pine = 7,
	/obj/structure/flora/tree/med_pine_dead = 7,
	/obj/structure/flora/tree_stump = 5,
	/obj/structure/flora/tree/african_acacia_dead = 5,
	/obj/structure/flora/tree/tall = 5,
	/obj/structure/flora/tree/oak = 5,
	/obj/structure/flora/tree/med_pine = 7,
	/obj/structure/flora/tree/med_pine_dead = 7,
	))

GLOBAL_LIST_INIT(temperatetree_plant_list, list(
	/obj/structure/flora/tree/pine = 7,
	/obj/structure/flora/tree_stump = 5,
	/obj/structure/flora/tree/oak = 5,
	/obj/structure/flora/tree/tall = 5,
	/obj/structure/flora/tree/wasteland = 5,
	))

GLOBAL_LIST_INIT(wintertree_plant_list, list(
	/obj/structure/flora/tree/pine_snow = 7,
	/obj/structure/flora/tree_stump = 5,
	/obj/structure/flora/tree/tall = 5,
	/obj/structure/flora/tree/dead = 5,
	))

GLOBAL_LIST_INIT(savtree_plant_list, list(
	/obj/structure/flora/tree/med_pine = 15,
	/obj/structure/flora/tree/med_pine_dead = 7,
	/obj/structure/flora/tree_stump = 5,
	/obj/structure/flora/tree/african_acacia_dead = 5,
	/obj/structure/flora/tree/tall = 5,
	/obj/structure/flora/tree/oak = 2,
	))

GLOBAL_LIST_INIT(deserttree_plant_list, list(
	/obj/structure/flora/tree/palmy = 10,
	/obj/structure/flora/tree/shrubber = 5,
	/obj/structure/flora/tree/barrelcacti = 5,
	/obj/structure/flora/tree/african_acacia_dead = 3,
	/obj/structure/flora/tree/tall = 2,
	))


GLOBAL_LIST_INIT(beachtree_plant_list, list(
	/obj/structure/flora/tree/palm = 15,
	/obj/structure/flora/tree/palmy = 8,
	))







GLOBAL_LIST_INIT(plant_type_weighted, list(
	"grass" = 50,
	"medicinal" = 10,
	"tree" = 10,
))

GLOBAL_LIST_INIT(plant_type_weighted_sparse, list(
	"grass" = 30,
	"medicinal" = 10,
	"tree" = 10,
	"null" = 60,
))

GLOBAL_LIST_INIT(plant_type_weighted_beach, list(
	"grass" = 30,
	"medicinal" = 1,
	"tree" = 15,
	"null" = 30,
))




/turf/open/indestructible/ground/outside/dirthole
	name = "Dirt hole"
	icon_state = "dirthole"
	desc = "A dirt hole."
	slowdown = 3
	flags_1 = ADJACENCIES_OVERLAY

/turf/open/indestructible/ground/outside/river
	name = "river"
	icon_state = "riverwateruhh"
	desc = "A river."
	slowdown = 5
	flags_1 = ADJACENCIES_OVERLAY


//////////////
// SAVANNAH //
//////////////

/turf/open/indestructible/ground/outside/savannah
	name = "savannah"
	desc = "Some savannah."
	icon = 'icons/fallout/turfs/savannah.dmi'
	icon_state = "savannah"
	slowdown = 0.4
	flags_1 = CAN_HAVE_NATURE | ADJACENCIES_OVERLAY
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	edge_icon = /obj/effect/overlay/savannah/edge
	turf_types_to_check = list(
	/turf/open/indestructible/ground/outside/dirt,
	/turf/open/indestructible/ground/outside/gravel, 
	/turf/open/liquid/water,
	/turf/open/indestructible/ground/outside/road,
	/turf/open/indestructible/ground/outside/sidewalk,
	/turf/open/indestructible/ground/inside/mountain,
	/turf/open/indestructible/ground/outside/desert,
	/turf/open/floor/plating/beach,
	/turf/open/indestructible/ground/inside/mountain)

/obj/effect/overlay/savannah/edge
	name = "savannah edge"
	icon = 'icons/fallout/turfs/savannah.dmi'
	icon_state = "savannahedge"

/turf/open/indestructible/ground/outside/savannah/center
	icon_state = "savannahcenter"
/turf/open/indestructible/ground/outside/savannah/bottomright
	icon_state = "savannah1"
/turf/open/indestructible/ground/outside/savannah/bottomcenter
	icon_state = "savannah2"
/turf/open/indestructible/ground/outside/savannah/bottomleft
	icon_state = "savannah3"
/turf/open/indestructible/ground/outside/savannah/leftcenter
	icon_state = "savannah4"
/turf/open/indestructible/ground/outside/savannah/topleft
	icon_state = "savannah5"
/turf/open/indestructible/ground/outside/savannah/topcenter
	icon_state = "savannah6"
/turf/open/indestructible/ground/outside/savannah/topright
	icon_state = "savannah7"
/turf/open/indestructible/ground/outside/savannah/rightcenter
	icon_state = "savannah8"
/turf/open/indestructible/ground/outside/savannah/bottomleftcorner
	icon_state = "savannah9"
/turf/open/indestructible/ground/outside/savannah/bottomrightcorner
	icon_state = "savannah10"
/turf/open/indestructible/ground/outside/savannah/topleftcorner
	icon_state = "savannah11"
/turf/open/indestructible/ground/outside/savannah/toprightcorner
	icon_state = "savannah12"
/turf/open/indestructible/ground/outside/savannah/cornersnew
	icon_state = "savannah13"
/turf/open/indestructible/ground/outside/savannah/edgesnew
	icon_state = "savannah14"

// Savannah merged with dark dirt 1-
/turf/open/indestructible/ground/outside/savannah/dark
	icon_state = "savannah1_dark"


GLOBAL_LIST_INIT(dirt_loots, list(
	/obj/item/stack/crafting/metalparts/five = 30,
	/obj/item/stack/crafting/goodparts/five = 30,
	/obj/item/stack/ore/blackpowder/twenty = 10,))
// DESERT

/turf/open/indestructible/ground/outside/desert
	name = "sand"
	icon = 'icons/fallout/turfs/sand.dmi'
	icon_state = "sand1"
//	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/feracactus, /obj/item/seeds/corn,/obj/item/seeds/shroom, /obj/item/seeds/agave)
	slowdown = 0.4
	flags_1 = CAN_HAVE_NATURE | ADJACENCIES_OVERLAY
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	turf_types_to_check = list(/turf/open/liquid/water,
	/turf/open/indestructible/ground/outside/road,
	/turf/open/indestructible/ground/outside/sidewalk,
	/turf/open/indestructible/ground/inside/mountain,
	/turf/open/floor/plating/beach)
	var/dug = FALSE				//FALSE = has not yet been dug, TRUE = has already been dug
	var/pit_sand = 1
	// TODO: REWRITE PITS ENTIRELY
	var/storedindex = 0			//amount of stored items
	var/mob/living/gravebody	//is there a body in the pit?
	var/obj/structure/closet/crate/coffin/gravecoffin //or maybe a coffin?
	var/obj/salvage //or salvage
	var/pitcontents // Lazylist of pit contents. TODO: Replace with mypit.contents?
	var/obj/dugpit/mypit
	var/unburylevel = 0
	edge_icon = /obj/effect/overlay/desert_side


//For sculpting with more precision, the random picking does not work very well. Slowdown 0.5 instead of 1. No random armor or gunpowder or titanium. Use directions for control. - Pebbles
/turf/open/indestructible/ground/outside/desert/sonora
	icon = 'icons/fallout/turfs/wasteland.dmi'
	icon_state = "desertsmooth"
	slowdown = 0.3
	footstep = FOOTSTEP_LOOSE_SAND
	barefootstep = FOOTSTEP_LOOSE_SAND
	clawfootstep = FOOTSTEP_LOOSE_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/desert/sonora/coarse
	icon_state = "desertcoarse"
	slowdown = 0.6

/turf/open/indestructible/ground/outside/desert/sonora/coarse2
	icon_state = "desertcoarse2"
	slowdown = 0.6

/turf/open/indestructible/ground/outside/desert/sonora/rough
	icon_state = "desertrough"
	slowdown = 0.4

/turf/open/indestructible/ground/outside/desert/harsh
	icon_state = "wasteland"
	icon = 'icons/fallout/turfs/ground_harsh.dmi'

/turf/open/indestructible/ground/outside/desert/Initialize()
	. = ..()
	if(prob(2))
		var/obj/derp = pickweight(GLOB.dirt_loots)
		salvage = new derp()
	if(prob(25))
		icon_state = "sand[rand(2,4)]"
	

/turf/open/indestructible/ground/outside/desert/harsh/Initialize()
	. = ..()
	if(prob(2))
		var/obj/derp = pickweight(GLOB.dirt_loots)
		salvage = new derp()
	if(icon_state != "wasteland")
		icon_state = "wasteland[rand(1,31)]"

/obj/effect/overlay/desert_side
	name = "sand"
	icon = 'icons/fallout/turfs/sand.dmi'
	icon_state = "sandedge"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

// Two edge smootheners for the new desert turf
/obj/effect/overlay/desert/sonora/edge
	name = "desert edge"
	icon = 'icons/fallout/turfs/wasteland.dmi'
	icon_state = "desertedge"

/obj/effect/overlay/desert/sonora/edge/corner
	icon_state = "desertcorner"

/turf/open/indestructible/ground/outside/desert/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return //I mean, it makes sense that deserts don't get slippery, I guess... :(

/turf/open/indestructible/ground/outside/dirt
	name = "dirt"
	icon = 'icons/fallout/turfs/dirt.dmi'
	icon_state = "dirtfull_dark"
//	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/potato, /obj/item/seeds/carrot, /obj/item/seeds/pumpkin, /obj/item/seeds/corn, /obj/item/seeds/agave)
	slowdown = 0.3
	flags_1 = CAN_HAVE_NATURE
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_GRAVEL
	clawfootstep = FOOTSTEP_GRAVEL
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY	
	edge_icon = /obj/effect/overlay/dirt_side
	turf_types_to_check = list(/turf/open/liquid/water, 
	/turf/open/floor/plating/ice, 
	/turf/open/indestructible/ground/outside/desert,
	/turf/open/indestructible/ground/outside/road,
	/turf/open/indestructible/ground/outside/sidewalk,
	/turf/open/indestructible/ground/inside/mountain)

/turf/open/indestructible/ground/outside/dirt_noplants
	name = "dirt"
	icon = 'icons/fallout/turfs/dirt.dmi'
	icon_state = "dirtfull_dark"
//	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/potato, /obj/item/seeds/carrot, /obj/item/seeds/pumpkin, /obj/item/seeds/corn, /obj/item/seeds/agave)
	slowdown = 0.3
	flags_1 = CAN_HAVE_NATURE
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_GRAVEL
	clawfootstep = FOOTSTEP_GRAVEL
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY	
	edge_icon = /obj/effect/overlay/dirt_side
	turf_types_to_check = list(/turf/open/liquid/water,  
	/turf/open/indestructible/ground/outside/desert,
	/turf/open/indestructible/ground/outside/road,
	/turf/open/indestructible/ground/outside/sidewalk,
	/turf/open/indestructible/ground/inside/mountain)

/obj/effect/overlay/dirt_side
	name = "dirt"
	icon = 'icons/fallout/turfs/dirt.dmi'
	icon_state = "dirtedge"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/turf/open/indestructible/ground/outside/dirt/Initialize()
	. = ..()
	if(icon_state == "dirtfull_dark")
		if(SSweather.snowy_time)
			name = "snow"
			icon = 'icons/fallout/turfs/dirt.dmi'
			icon_state = "snow[rand(0,12)]"
			update_icon()

/turf/open/indestructible/ground/outside/dirt/MakeSlippery(wet_setting, min_wet_time, wet_time_to_add, max_wet_time, permanent)
	return //same thing here, dirt absorbs the liquid... :(

// DARK DIRT - the legacy one
/turf/open/indestructible/ground/outside/dirt/dark
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_GRAVEL
	clawfootstep = FOOTSTEP_GRAVEL
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/dirt/harsh
	icon = 'icons/fallout/turfs/ground_harsh.dmi'
	icon_state = "dirtfull"

/turf/open/indestructible/ground/outside/dirt/harsh/side
	icon_state = "dirt"

/turf/open/indestructible/ground/outside/dirt/harsh/corner
	icon_state = "dirtcorner"

/turf/open/indestructible/ground/outside/dirt_s
	name = "dirt"
	icon_state = "bottomleft"
	icon = 'icons/fallout/turfs/dirtsnow.dmi'
//	step_sounds = list("human" = "dirtfootsteps")

/turf/open/indestructible/ground/outside/grass_s
	name = "grass"
	icon_state = "bottomleft"
	icon = 'icons/fallout/turfs/snowgrass.dmi'
//	step_sounds = list("human" = "dirtfootsteps")

/turf/open/indestructible/ground/outside/road
	name = "\proper road"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphalt.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/road_s
	name = "\proper road"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphalt_s.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/sidewalk
	name = "\proper sidewalk"
	icon_state = "outermiddle"
	icon = 'icons/fallout/turfs/sidewalk.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/sidewalk_s
	name = "\proper sidewalk"
	icon_state = "outermiddle"
	icon = 'icons/fallout/turfs/sidewalk_s.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/ruins
	name = "ruins"
	desc = "It's just a pile of concrete rubble."
	icon_state = "rubblefull"
	icon = 'icons/fallout/turfs/ground.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_HARD_BAREFOOT
	clawfootstep = FOOTSTEP_HARD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/wood
	name = "\proper wood planks"
	icon_state = "housewood1"
	icon = 'icons/turf/floors.dmi'
	footstep = FOOTSTEP_WOOD
	barefootstep = FOOTSTEP_WOOD_BAREFOOT
	clawfootstep = FOOTSTEP_WOOD_CLAW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	//	step_sounds = list("human" = "woodfootsteps")

/turf/open/indestructible/ground/outside/woodalt
	name = "\proper wood planks"
	icon_state = "wood"
	icon = 'icons/turf/floors.dmi'
	//	step_sounds = list("human" = "woodfootsteps")

/turf/open/indestructible/ground/outside/roof
	name = "roof"
	icon_state = "floorrusty"
	icon = 'icons/fallout/turfs/floors.dmi'
	//	step_sounds = list("human" = "woodfootsteps")

/turf/open/indestructible/ground/outside/water
	gender = PLURAL
	name = "river water"
	desc = "Shallow river water."
	icon = 'icons/turf/floors.dmi'
	icon_state = "riverwater_motion"
	slowdown = 2
	depth = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = 'sound/effects/puddlesplash.ogg'
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/open/indestructible/ground/outside/water/running
	gender = PLURAL
	name = "moving river water"
	desc = "Shallow river water."
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "riverwateruhh"
	slowdown = 6
	depth = 1
	bullet_sizzle = TRUE
	bullet_bounce_sound = null //needs a splashing sound one day.
	footstep = FOOTSTEP_WATER
	barefootstep = FOOTSTEP_WATER
	clawfootstep = FOOTSTEP_WATER
	heavyfootstep = FOOTSTEP_WATER

/turf/open/indestructible/ground/outside/water/Initialize()
	. = ..()
	update_icon()

/turf/open/indestructible/ground/outside/water/Entered(atom/movable/AM, atom/oldloc)
	. = ..()
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(oldloc, /turf/open/indestructible/ground/outside/water))
			to_chat(L, span_warning("You get drenched in water!"))
	AM.water_act(5)

/turf/open/indestructible/ground/outside/water/Exited(atom/movable/AM, atom/newloc)
	. = ..()	
	if(istype(AM, /mob/living))
		var/mob/living/L = AM
		L.update_water()
		if(L.check_submerged() <= 0)
			return
		if(!istype(newloc, /turf/open/indestructible/ground/outside/water))
			to_chat(L, span_warning("You climb out of \the [src]."))

/turf/open/indestructible/ground/outside/water/update_icon()
	. = ..()

/turf/open/indestructible/ground/outside/water/AltClick(mob/user)
	. = ..()
	if(isliving(user))
		var/mob/living/L = user
		L.DelayNextAction(CLICK_CD_MELEE)
		if(!user.incapacitated() && Adjacent(user))
			user.visible_message(span_notice("[L] starts washing in \the [src]."),
								span_notice("You start washing in \the [src]."),
								span_notice("You hear splashing water and scrubbing."))
			playsound(user,"water_wade",100,TRUE)
			if(do_after(user,5 SECONDS, TRUE, src, TRUE,allow_movement=FALSE,stay_close=TRUE))
				give_mob_washies(L)
				user.visible_message(span_notice("[L] finishes washing in \the [src]."),
									span_notice("You finish washing in \the [src]."),
									span_notice("The splashing and scrubbing stops."))
				playsound(user,"water_wade",100,TRUE)

/turf/open/indestructible/ground/outside/water/examine(mob/user)
	. = ..()
	. += span_notice("Alt-Click \the [src] to wash yourself off.")

/turf/open/indestructible/ground/outside/snow
	initial_gas_mix = "o2=22;n2=82;TEMP=285"
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	desc = "Looks cold."
	icon_state = "snow"
	footstep = FOOTSTEP_SNOW
	barefootstep = FOOTSTEP_SNOW
	clawfootstep = FOOTSTEP_SNOW
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	edge_icon = /obj/effect/overlay/snow_edge
	turf_types_to_check = list(/turf/open/liquid/water,
	/turf/open/indestructible/ground/outside/desert,
	/turf/open/floor/plating/beach,
	/turf/open/indestructible/ground/outside/road,
	/turf/open/indestructible/ground/outside/sidewalk,
	/turf/open/indestructible/ground/inside/mountain,
	/turf/open/indestructible/ground/outside/dirt,
	/turf/open/floor/plating/dirt,
	/turf/open/floor/plating/asteroid/snow/ice,
	/turf/open/indestructible/ground/outside/gravel,
	/turf/open/indestructible/ground/outside/savannah,
	/turf/open/indestructible/ground/outside/civ/grass,
	/turf/open/indestructible/ground/outside/civ/drygrass,
	/turf/open/floor/plating/ice)

/turf/open/indestructible/ground/outside/snow/Initialize()
	. = ..()
	if(prob(25))
		icon_state = "snow[rand(1,12)]"

/obj/effect/overlay/snow_edge
	name = "snow"
	icon = 'icons/turf/snow.dmi'
	icon_state = "snow_corner"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/turf/open/indestructible/ground/outside/ruins/ex_act(severity, target)
	contents_explosion(severity, target)
	switch(severity)
		if(4)
			if(prob(5))
				ChangeTurf(baseturfs)
		if(3)
			if(prob(25))
				ChangeTurf(baseturfs)
		if(2)
			if(prob(50))
				ChangeTurf(baseturfs)
		if(1)
			ChangeTurf(baseturfs)

/////////////////////////////////////////////////////////

#define SHROOM_SPAWN_GROUND	1

/turf/open/indestructible/ground/inside/mountain
	name = "cave"
	icon_state = "rockfloor1"
	icon = 'icons/fallout/turfs/mining.dmi'
	footstep = FOOTSTEP_SAND
	edge_icon = /obj/effect/overlay/rockfloor_side
	turf_types_to_check = list(/turf/open/liquid/water, 
	/turf/open/indestructible/ground/outside/desert,
	/turf/open/indestructible/ground/outside/road,
	/turf/open/indestructible/ground/outside/sidewalk,
	/turf/open/floor/plating/beach)
	footstep = FOOTSTEP_SAND
	barefootstep = FOOTSTEP_SAND
	clawfootstep = FOOTSTEP_SAND
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
//	allowed_plants = list(/obj/item/seeds/glow)
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/inside/mountain/Initialize()
	. = ..()
	//If no fences, machines, etc. try to plant mushrooms
	if(!(\
			(locate(/obj/structure) in src) || \
			(locate(/obj/machinery) in src) ))
		plantShrooms()


/obj/effect/overlay/rockfloor_side
	name = "cave"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "rockfloor_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/turf/open/indestructible/ground/inside/mountain/proc/plantShrooms()
	if(prob(SHROOM_SPAWN_GROUND))
		new /obj/structure/flora/wasteplant/wild_fungus(src)
		return TRUE

/turf/open/indestructible/ground/inside/mountain/New()
	..()
	icon_state = "rockfloor[rand(1,2)]"

/turf/open/indestructible/ground/inside/dirt
	name = "dirt"
	icon_state = "dirtfull"
//	step_sounds = list("human" = "dirtfootsteps")
//	allowed_plants = list(/obj/item/seeds/poppy/broc, /obj/item/seeds/xander, /obj/item/seeds/mutfruit,
//	/obj/item/seeds/potato, /obj/item/seeds/carrot, /obj/item/seeds/pumpkin, /obj/item/seeds/corn, /obj/item/seeds/agave)
	slowdown = 0.2
	flags_1 = CAN_HAVE_NATURE

/turf/open/indestructible/ground/inside/subway
	name = "subway tunnel"
	icon = 'icons/fallout/turfs/ground.dmi'
	icon_state = "railsnone"

/turf/open/indestructible/ground/inside/subway/Initialize()
	. = ..()
	for(var/direction in GLOB.cardinals)
		var/turf/turf_to_check = get_step(src, direction)
		if(istype(turf_to_check, /turf/open))
			var/obj/effect/overlay/railsnone_side/DS = new /obj/effect/overlay/railsnone_side(src)
			switch(direction)
				if(NORTH)
					DS.pixel_y = 32
				if(SOUTH)
					DS.pixel_y = -32
				if(EAST)
					DS.pixel_x = 32
				if(WEST)
					DS.pixel_x = -32
			DS.dir = turn(direction, 180)

/obj/effect/overlay/railsnone_side
	name = "cave"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "railsnone_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE


/turf/open/indestructible/ground/outside/roaddirt
	name = "road"
	icon_state = "innermiddle"
	icon = 'icons/fallout/turfs/asphaltdirt.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_ROAD
	clawfootstep = FOOTSTEP_ROAD
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
//	step_sounds = list("human" = "erikafootsteps")

/turf/open/indestructible/ground/outside/sidewalkdirt
	name = "sidewalk"
	icon_state = "outermiddle"
	icon = 'icons/fallout/turfs/sidewalkdirt.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_ROAD
	clawfootstep = FOOTSTEP_ROAD
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
//	step_sounds = list("human" = "erikafootsteps")

//Obsolete but used in yucky Pahrump
/turf/open/indestructible/ground/outside/graveldirt
	name = "gravel"
	icon_state = "graveldirt"
	icon = 'icons/fallout/turfs/ground.dmi'
	footstep = FOOTSTEP_ROAD
	barefootstep = FOOTSTEP_ROAD
	clawfootstep = FOOTSTEP_ROAD
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
//	step_sounds = list("human" = "erikafootsteps")

// New gravel, organized. Use directions for control. - Pebbles
/turf/open/indestructible/ground/outside/gravel
	name = "gravel"
	icon_state = "gravel"
	icon = 'icons/fallout/turfs/gravel.dmi'
	footstep = FOOTSTEP_GRAVEL
	barefootstep = FOOTSTEP_GRAVEL
	clawfootstep = FOOTSTEP_GRAVEL
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	edge_icon = /obj/effect/overlay/gravel/edge
	turf_types_to_check = list(/turf/open/indestructible/ground/outside/dirt, 
	/turf/open/indestructible/ground/outside/road,
	/turf/open/indestructible/ground/outside/sidewalk,
	/turf/open/liquid/water,
	/turf/open/indestructible/ground/inside/mountain,
	/turf/open/indestructible/ground/outside/desert,
	/turf/open/floor/plating/beach
	)

/turf/open/indestructible/ground/outside/gravel/alt
	name = "gravel"
	icon_state = "gravel_alt"

/turf/open/indestructible/ground/outside/gravel/path_desert
	name = "gravel path"
	icon_state = "path_desert"

/turf/open/indestructible/ground/outside/gravel/path_desert/intersection
	name = "gravel path"
	icon_state = "path_desert_intersection"

/turf/open/indestructible/ground/outside/gravel/path_desert/end
	name = "gravel path"
	icon_state = "path_desert_end"

/turf/open/indestructible/ground/outside/gravel/path_dirt
	name = "gravel path"
	icon_state = "path_dirt"

/turf/open/indestructible/ground/outside/gravel/path_dirt/intersection
	name = "gravel path"
	icon_state = "path_dirt_intersection"

/turf/open/indestructible/ground/outside/gravel/path_dirt/end
	name = "gravel path"
	icon_state = "path_dirt_end"

// Two edge smootheners for the new gravel turf
/obj/effect/overlay/gravel/edge
	name = "gravel edge"
	icon = 'icons/fallout/turfs/gravel.dmi'
	icon_state = "graveledge"

/obj/effect/overlay/gravel/edge/corner
	icon_state = "gravelcorner"


//New Coyote Dirts
/turf/open/indestructible/ground/outside/dirt/light_grass
	name = "lightly grassed dirt"
	icon = 'modular_coyote/icons/turfs/lightgrass.dmi'
	icon_state = null
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY
	

/turf/open/indestructible/ground/outside/dirt/bigdirtturf2
	name = "big dirt turf 2"
	icon = 'modular_coyote/icons/turfs/Big_Dirt_Turf_2.dmi'
	icon_state = null

/turf/open/indestructible/ground/outside/dirt/bigdirtturf
	name = "big dirt turf"
	icon = 'modular_coyote/icons/turfs/Big_Dirt_Turfs.dmi'
	icon_state = null

/turf/open/indestructible/ground/outside/dirt/biggrass
	name = "big grass"
	icon = 'modular_coyote/icons/turfs/Big_Grass.dmi'
	icon_state = null

/turf/open/indestructible/ground/outside/dirt/biggrassdirt2
	name = "grassier"
	icon = 'modular_coyote/icons/turfs/Big_Grass_Turf_2.dmi'
	icon_state = null

/turf/open/indestructible/ground/outside/dirt/bigiceturf
	name = "crunchy ice"
	icon = 'modular_coyote/icons/turfs/Big_Ice_Turf.dmi'
	icon_state = null


/turf/open/indestructible/ground/outside/dirt/bigsandturf
	name = "crunchy sand"
	icon = 'modular_coyote/icons/turfs/Big_Sand_Turf.dmi'
	icon_state = null

/turf/open/indestructible/ground/outside/dirt/rockysnow
	name = "snow on rocks"
	icon = 'modular_coyote/icons/turfs/Big_Snow_and_Rock_Turf.dmi'
	icon_state = null


/turf/open/indestructible/ground/outside/dirt/bigsnow
	name = "thick snow"
	icon = 'modular_coyote/icons/turfs/Big_Snow_turf.dmi'
	icon_state = null

//////////////
// 	 gob	//
//////////////

/turf/open/indestructible/ground/outside/dirt/desertsand
	name = "desertsand"
	icon = 'modular_coyote/icons/turfs/desertsand.dmi'
	icon_state = "sand1"

//Light dirt readded
/turf/open/indestructible/ground/outside/dirt/light
	name = "dirt"
	icon = 'icons/fallout/turfs/dirt.dmi'
	icon_state = "dirt_light"

/turf/open/indestructible/ground/outside/dirt/dirtgrasscorner
	name = "grass"
	icon = 'icons/fallout/turfs/dirt.dmi'
	icon_state = "dirtgrasscorner"

/turf/open/indestructible/ground/outside/dirt/dirtgrassline
	name = "grass"
	icon = 'icons/fallout/turfs/dirt.dmi'
	icon_state = "dirtgrassline"

/turf/open/indestructible/ground/outside/civ/grassdark
	name = "grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "grass_dark"

/turf/open/indestructible/ground/outside/civ/grass
	name = "grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "grass0"
	edge_icon = /obj/effect/overlay/grass/edge
	turf_types_to_check = list(/turf/open/indestructible/ground/outside/dirt, 
	/turf/open/indestructible/ground/outside/desert,
	/turf/open/indestructible/ground/outside/road,
	/turf/open/indestructible/ground/outside/sidewalk,
	/turf/open/indestructible/ground/outside/gravel, 
	/turf/open/liquid/water,
	/turf/open/floor/plating/ice,
	/turf/open/indestructible/ground/inside/mountain,
	/turf/open/floor/plating/beach)
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/grass0
	name = "grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "grass0"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/obj/effect/overlay/grass/edge
	name = "grass edge"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "grassedge"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE


/obj/effect/overlay/drygrass/edge
	name = "grass edge"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "grassedge_dry"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/turf/open/indestructible/ground/outside/civ/grass1
	name = "grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "grass1"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/grass2
	name = "grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "grass2"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/grass3
	name = "grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "grass3"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/drygrass
	name = "dry grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "dry_grass"
	edge_icon = /obj/effect/overlay/drygrass/edge
	turf_types_to_check = list(/turf/open/indestructible/ground/outside/dirt,
	/turf/open/indestructible/ground/outside/civ/grass, 
	/turf/open/indestructible/ground/outside/desert,
	/turf/open/indestructible/ground/outside/road,
	/turf/open/indestructible/ground/outside/sidewalk,
	/turf/open/indestructible/ground/outside/gravel, 
	/turf/open/liquid/water,
	/turf/open/floor/plating/ice,
	/turf/open/indestructible/ground/inside/mountain,
	/turf/open/floor/plating/beach)
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/drygrass0
	name = "dry grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "dead_grass0"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/drygrass1
	name = "dry grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "dead_grass1"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/drygrass2
	name = "dry grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "dead_grass2"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/drygrass3
	name = "dry grass"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "dead_grass3"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/woodalt
	name = "wood"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "woodalt"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/thatch1
	name = "thatch"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "thatch1"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/turf/open/indestructible/ground/outside/civ/thatch2
	name = "thatch"
	icon = 'icons/fallout/turfs/civfloor.dmi'
	icon_state = "thatch2"
	footstep = FOOTSTEP_GRASS
	barefootstep = FOOTSTEP_GRASS
	clawfootstep = FOOTSTEP_GRASS
	heavyfootstep = FOOTSTEP_GENERIC_HEAVY

/// BEACH SHORE



/obj/effect/overlay/shore
	name = "sandy shore"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "sand_water_side"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE

/obj/effect/overlay/shore_corner
	name = "sandy shore"
	icon = 'icons/fallout/turfs/smoothing.dmi'
	icon_state = "sand_water_corner"
	density = FALSE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	plane = FLOOR_PLANE
	layer = ABOVE_OPEN_TURF_LAYER
	anchored = TRUE
	resistance_flags = INDESTRUCTIBLE
