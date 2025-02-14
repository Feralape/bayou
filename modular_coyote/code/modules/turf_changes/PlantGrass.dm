// Refactors plant grass to work on multiple turfs.
// I'm going to grab you by the antlers and stick every point of it up your ass

// pascal deez nuts
/turf/open/proc/plantGrass(Plantforce = FALSE)
	if(!prob(RAND_PLANT_CHANCE))
		return FALSE
	if(locate(/obj/structure/flora) in src)
		return FALSE
	if((locate(/obj/structure) in src))
		return FALSE
	if((locate(/obj/machinery) in src))
		return FALSE
	var/obj/structure/flora/randPlant
	var/floratype = pickweight(GLOB.plant_type_weighted)
	switch(floratype)
		if("medicinal")
			randPlant = pickweight(GLOB.medicinal_plant_list)
		if("tree")
			randPlant = pickweight(GLOB.tree_plant_list)
		if("grass")
			randPlant = pickweight(GLOB.grass_plant_list)
	if(randPlant)
		new randPlant(src)
		return TRUE

/turf/open/proc/plantGrass_new(Plantforce = FALSE)
	if(!prob(RAND_PLANT_CHANCE))
		return FALSE
	if(locate(/obj/structure/flora) in src)
		return FALSE
	if((locate(/obj/structure) in src))
		return FALSE
	if((locate(/obj/machinery) in src))
		return FALSE
	var/obj/structure/flora/randPlant
	var/floratype = pickweight(GLOB.plant_type_weighted)
	switch(climate)
		if("temperate")
			switch(floratype)
				if("medicinal")
					randPlant = pickweight(GLOB.medicinal_plant_list)
				if("tree")
					randPlant = pickweight(GLOB.temperatetree_plant_list)
				if("grass")
					randPlant = pickweight(GLOB.temperategrass_plant_list)
		if("tundra")
			floratype = pickweight(GLOB.plant_type_weighted_sparse)
			switch(floratype)
				if("medicinal")
					randPlant = pickweight(GLOB.medicinal_plant_list)
				if("tree")
					randPlant = pickweight(GLOB.wintertree_plant_list)
				if("grass")
					randPlant = pickweight(GLOB.wintergrass_plant_list)
				if("null")
					randPlant = null
		if("savannah")
			floratype = pickweight(GLOB.plant_type_weighted_sparse)
			switch(floratype)
				if("medicinal")
					randPlant = pickweight(GLOB.medicinal_plant_list)
				if("tree")
					randPlant = pickweight(GLOB.savtree_plant_list)
				if("grass")
					randPlant = pickweight(GLOB.grass_plant_list)
				if("null")
					randPlant = null
		if("desert")
			floratype = pickweight(GLOB.plant_type_weighted_sparse)
			switch(floratype)
				if("medicinal")
					randPlant = pickweight(GLOB.medicinal_plant_list)
				if("tree")
					randPlant = pickweight(GLOB.deserttree_plant_list)
				if("grass")
					randPlant = pickweight(GLOB.desertgrass_plant_list)	
				if("null")
					randPlant = null
		if("beach")
			floratype = pickweight(GLOB.plant_type_weighted_beach)
			switch(floratype)
				if("medicinal")
					randPlant = pickweight(GLOB.medicinal_plant_list)
				if("tree")
					randPlant = pickweight(GLOB.beachtree_plant_list)
				if("grass")
					randPlant = pickweight(GLOB.beachgrass_plant_list)	
				if("null")
					randPlant = null

	if(randPlant)
		new randPlant(src)
		return TRUE


	/*
	var/Weight = 0
	//spontaneously spawn grass
	if(Plantforce || prob(GRASS_SPONTANEOUS))
		randPlant = pickweight(GLOB.lush_plant_spawn_list) //Create a new grass object at this location, and assign var
		new randPlant(src)
		return TRUE

	// Check if we should just spawn a healing plant instead.
	// Guarantees that there are enough foragables to sustain the players.
	if(prob(MEDICINAL_PLANT_CHANCE))
		randPlant = pickweight(GLOB.medicinal_plant_list)
		new randPlant(src)
		return TRUE
	//If not, do the normal expensive checks
	else
		//loop through neighbouring desert turfs, if they have grass, then increase weight
		for(var/turf/open/indestructible/ground/T in RANGE_TURFS(3, src))
			if(istype(T, src))
				if(locate(/obj/structure/flora) in T)
					Weight += GRASS_WEIGHT


		// use weight to try to spawn a plant
		if(prob(Weight))
			//If surrounded on 5+ sides, pick from lush
			if(Weight == (5 * GRASS_WEIGHT))
				randPlant = pickweight(GLOB.lush_plant_spawn_list)
			else
				randPlant = pickweight(GLOB.desolate_plant_spawn_list)
			new randPlant(src)
			return TRUE
	*/

/turf/open/
	var/climate
	var/spawnPlants = FALSE
	var/spawnPlants_north = FALSE
	// var/obj/structure/flora/turfPlant // jon, this dels harder than my dick in ur ass

/turf/open/Initialize(mapload)
	if(mapload && climate && !is_reserved_level(z))
		plantGrass_new()
	. = ..()

/turf/open/ChangeTurf(path, new_baseturf, flags)
	for(var/obj/structure/flora/turfPlant in contents)
		qdel(turfPlant)
	. =  ..()

/turf/open/indestructible/ground/outside/dirt
	spawnPlants = TRUE

/turf/open/indestructible/ground/outside/savannah
	climate = "savannah"

/turf/open/indestructible/ground/outside/dirt_s
	climate = "temperate"

/turf/open/indestructible/ground/outside/grass_s
	climate = "temperate"

/turf/open/indestructible/ground/outside/civ/grass
	climate = "temperate"
	
/turf/open/indestructible/ground/outside/desert
	climate = "desert"

/turf/open/floor/plating/f13/outside/desert
	climate = "desert"

/turf/open/indestructible/ground/outside/snow
	climate = "tundra"

/turf/open/floor/plating/beach
	climate = "beach"
