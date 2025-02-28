#define MOB_SPAWNER_SCAVENGER "scavenger"
#define MOB_SPAWNER_KIND_EASTWATER "eastwater mobs"
#define MOB_SPAWNER_KIND_SCAVENGER "scavenger mobs"

/obj/structure/nest/randomized/frontier
	name = "Gross uninitialized carp spawner thing"
	desc = "Shouldnt see this! probably a bug~"
	randomizer_tag = "set tag here"
	randomizer_kind = MOB_SPAWNER_KIND_EASTWATER
	randomizer_difficulty = MOB_SPAWNER_DIFFICULTY_EASY | MOB_SPAWNER_DIFFICULTY_MED | MOB_SPAWNER_DIFFICULTY_HARD 

/obj/structure/nest/randomized/frontier/easy
	randomizer_difficulty = MOB_SPAWNER_DIFFICULTY_EASY 

/obj/structure/nest/randomized/frontier/medium
	randomizer_difficulty = MOB_SPAWNER_DIFFICULTY_EASY | MOB_SPAWNER_DIFFICULTY_MED

/obj/structure/nest/randomized/frontier/hard
	randomizer_difficulty = MOB_SPAWNER_DIFFICULTY_MED | MOB_SPAWNER_DIFFICULTY_HARD

/datum/random_mob_spawner/scavenger
	nest_tag = MOB_SPAWNER_SCAVENGER
	nest_name = "scavenger's tunnel"
	nest_desc = "A tunnel dug by the scavs to enter this area."
	nest_icon_state = MOB_SPAWNER_ICONSTATE_RAIDER // RAIDER LADDER
	sound_to_play = MOB_SPAWNER_SOUND_LADDER

	num_mobs_to_spawn_easy = 1
	mob_respawn_time_easy = MOB_SPAWNER_TIME_DEFAULT
	mob_list_easy = list(
		/mob/living/simple_animal/hostile/frontier/scav/melee = 10,
		/mob/living/simple_animal/hostile/frontier/scav/melee2h = 5,
		/mob/living/simple_animal/hostile/frontier/scav/ranged = 5,
		/mob/living/simple_animal/hostile/frontier/scav/ranged_pistol = 8,
		/mob/living/simple_animal/hostile/frontier/scav/ranged_shotgun = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/melee = 10,
		/mob/living/simple_animal/hostile/frontier/scav/masked/melee2h = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/ranged = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_pistol = 8,
		/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_shotgun = 10,
		/mob/living/simple_animal/hostile/frontier/scav/med/melee = 5,
		/mob/living/simple_animal/hostile/frontier/scav/med/melee2h = 3,
		/mob/living/simple_animal/hostile/frontier/scav/med/ranged	= 3,
		/mob/living/simple_animal/hostile/frontier/scav/med/ranged_pistol = 5,
		/mob/living/simple_animal/hostile/frontier/scav/med/ranged_shotgun = 2,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee2h = 3,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged = 3,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_pistol	= 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_shotgun = 2,
		)
	num_mobs_to_spawn_medium = 2
	mob_respawn_time_medium = MOB_SPAWNER_TIME_DEFAULT
	mob_list_medium = list(
		/mob/living/simple_animal/hostile/frontier/scav/melee = 5,
		/mob/living/simple_animal/hostile/frontier/scav/melee2h = 5,
		/mob/living/simple_animal/hostile/frontier/scav/ranged = 7,
		/mob/living/simple_animal/hostile/frontier/scav/ranged_pistol = 5,
		/mob/living/simple_animal/hostile/frontier/scav/ranged_shotgun = 7,
		/mob/living/simple_animal/hostile/frontier/scav/masked/melee = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/melee2h = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/ranged = 7,
		/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_pistol = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_shotgun = 7,
		/mob/living/simple_animal/hostile/frontier/scav/med/melee = 5,
		/mob/living/simple_animal/hostile/frontier/scav/med/melee2h = 5,
		/mob/living/simple_animal/hostile/frontier/scav/med/ranged	= 7,
		/mob/living/simple_animal/hostile/frontier/scav/med/ranged_pistol = 5,
		/mob/living/simple_animal/hostile/frontier/scav/med/ranged_shotgun = 7,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee2h = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged = 7,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_pistol	= 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_shotgun = 7,
		)
	num_mobs_to_spawn_hard = 3
	mob_respawn_time_hard = MOB_SPAWNER_TIME_DEFAULT
	mob_list_hard = list(
		/mob/living/simple_animal/hostile/frontier/scav/med/melee = 5,
		/mob/living/simple_animal/hostile/frontier/scav/med/melee2h = 5,
		/mob/living/simple_animal/hostile/frontier/scav/med/ranged	= 5,
		/mob/living/simple_animal/hostile/frontier/scav/med/ranged_pistol = 5,
		/mob/living/simple_animal/hostile/frontier/scav/med/ranged_shotgun = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee2h = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged = 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_pistol	= 5,
		/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_shotgun = 5,
		)


/datum/random_mob_spawner_group/eastwater
	group_tag = MOB_SPAWNER_KIND_EASTWATER
	group_list = list(
		MOB_SPAWNER_SCAVENGER,
	)
