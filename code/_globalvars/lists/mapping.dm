GLOBAL_LIST_INIT(cardinals, list(NORTH, SOUTH, EAST, WEST))
GLOBAL_LIST_INIT(cardinals_multiz, list(NORTH, SOUTH, EAST, WEST, UP, DOWN))
GLOBAL_LIST_INIT(diagonals, list(NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST))
GLOBAL_LIST_INIT(corners_multiz, list(UP|NORTHEAST, UP|NORTHWEST, UP|SOUTHEAST, UP|SOUTHWEST, DOWN|NORTHEAST, DOWN|NORTHWEST, DOWN|SOUTHEAST, DOWN|SOUTHWEST))
GLOBAL_LIST_INIT(diagonals_multiz, list(
	NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST,
	UP|NORTH, UP|SOUTH, UP|EAST, UP|WEST, UP|NORTHEAST, UP|NORTHWEST, UP|SOUTHEAST, UP|SOUTHWEST,
	DOWN|NORTH, DOWN|SOUTH, DOWN|EAST, DOWN|WEST, DOWN|NORTHEAST, DOWN|NORTHWEST, DOWN|SOUTHEAST, DOWN|SOUTHWEST))
GLOBAL_LIST_INIT(alldirs_multiz, list(
	NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST,
	UP, UP|NORTH, UP|SOUTH, UP|EAST, UP|WEST, UP|NORTHEAST, UP|NORTHWEST, UP|SOUTHEAST, UP|SOUTHWEST,
	DOWN, DOWN|NORTH, DOWN|SOUTH, DOWN|EAST, DOWN|WEST, DOWN|NORTHEAST, DOWN|NORTHWEST, DOWN|SOUTHEAST, DOWN|SOUTHWEST))
GLOBAL_LIST_INIT(alldirs, list(NORTH, SOUTH, EAST, WEST, NORTHEAST, NORTHWEST, SOUTHEAST, SOUTHWEST))

GLOBAL_LIST_EMPTY(landmarks_list)				//list of all landmarks created
GLOBAL_LIST_EMPTY(dungeon_marks)	//test
GLOBAL_LIST_EMPTY(start_landmarks_list)			//list of all spawn points created
GLOBAL_LIST_EMPTY(department_security_spawns)	//list of all department security spawns
GLOBAL_LIST_EMPTY(generic_event_spawns)			//list of all spawns for events
GLOBAL_LIST_EMPTY(jobspawn_overrides)					//These will take precedence over normal spawnpoints if created.

GLOBAL_LIST_EMPTY(wizardstart)
GLOBAL_LIST_EMPTY(nukeop_start)
GLOBAL_LIST_EMPTY(nukeop_leader_start)
GLOBAL_LIST_EMPTY(newplayer_start)
GLOBAL_LIST_EMPTY(prisonwarp)	//prisoners go to these
GLOBAL_LIST_EMPTY(holdingfacility)	//captured people go here
GLOBAL_LIST_EMPTY(xeno_spawn)//Aliens spawn at these.
GLOBAL_LIST_EMPTY(tdome1)
GLOBAL_LIST_EMPTY(tdome2)
GLOBAL_LIST_EMPTY(tdomeobserve)
GLOBAL_LIST_EMPTY(tdomeadmin)
GLOBAL_LIST_EMPTY(prisonwarped)	//list of players already warped
GLOBAL_LIST_EMPTY(blobstart)
GLOBAL_LIST_EMPTY(secequipment)
GLOBAL_LIST_EMPTY(deathsquadspawn)
GLOBAL_LIST_EMPTY(emergencyresponseteamspawn)
GLOBAL_LIST_EMPTY(servant_spawns) //Servants of Ratvar spawn here
GLOBAL_LIST_EMPTY(city_of_cogs_spawns) //Anyone entering the City of Cogs spawns here
GLOBAL_LIST_EMPTY(ruin_landmarks)
GLOBAL_LIST_EMPTY(traveltiles)

//away missions
GLOBAL_LIST_EMPTY(vr_spawnpoints)

	//used by jump-to-area etc. Updated by area/updateName()
GLOBAL_LIST_EMPTY(sortedAreas)
/// An association from typepath to area instance. Only includes areas with `unique` set.
GLOBAL_LIST_EMPTY_TYPED(areas_by_type, /area)

GLOBAL_LIST_EMPTY(all_abstract_markers)

GLOBAL_LIST_EMPTY(stationroom_landmarks) //List of all spawns for stationrooms

///Away missions, VR, random z levels stuff.
GLOBAL_LIST_EMPTY(random_zlevels_generated)
GLOBAL_LIST_INIT(potential_away_levels, generateMapList(filename = "[global.config.directory]/awaymissionconfig.txt"))
GLOBAL_LIST_INIT(potential_vr_levels, generateMapList(filename = "[global.config.directory]/vr_config.txt"))

//Typepaths of outdoor areas.
GLOBAL_LIST_INIT(outdoor_areas, list(/area/frontier/outdoor, 
/area/frontier/outdoor/wilderness, 
/area/frontier/outdoor/river, 
/area/frontier/outdoor/shoreline, 
/area/frontier/outdoor/colony, 
/area/frontier/outdoor/colony/depot_dock,
/area/frontier/outdoor/colony/roof,
/area/frontier/outdoor/eastwater_town,
/area/frontier/outdoor/wilderness_north
)) //I lick the fel viciously ~TK
