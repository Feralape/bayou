GLOBAL_LIST_INIT(small_arms_sound, list(
					'sound/f13weapons/ninemil.ogg',
					'sound/f13weapons/9mm.ogg',
					'sound/f13weapons/greasegun.ogg',
					'sound/f13weapons/policepistol.ogg',
					'sound/f13weapons/varmint_rifle.ogg',))

GLOBAL_LIST_INIT(shotgun_sound, list(
					'sound/f13weapons/shotgun.ogg',
					'sound/f13weapons/riot_shotgun.ogg',
					'sound/f13weapons/caravan_shotgun.ogg'))


GLOBAL_LIST_INIT(mobs_scavenger, list(
/mob/living/simple_animal/hostile/frontier/scav/melee,
/mob/living/simple_animal/hostile/frontier/scav/melee2h,
/mob/living/simple_animal/hostile/frontier/scav/ranged,
/mob/living/simple_animal/hostile/frontier/scav/ranged_pistol,
/mob/living/simple_animal/hostile/frontier/scav/ranged_shotgun,
/mob/living/simple_animal/hostile/frontier/scav/med/melee,
/mob/living/simple_animal/hostile/frontier/scav/med/melee2h,
/mob/living/simple_animal/hostile/frontier/scav/med/ranged,
/mob/living/simple_animal/hostile/frontier/scav/med/ranged_pistol,
/mob/living/simple_animal/hostile/frontier/scav/med/ranged_shotgun,
/mob/living/simple_animal/hostile/frontier/scav/masked/melee,
/mob/living/simple_animal/hostile/frontier/scav/masked/melee2h,
/mob/living/simple_animal/hostile/frontier/scav/masked/ranged,
/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_pistol,
/mob/living/simple_animal/hostile/frontier/scav/masked/ranged_shotgun,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/melee2h,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_pistol,
/mob/living/simple_animal/hostile/frontier/scav/masked/medium/ranged_shotgun,
))

GLOBAL_LIST_INIT(blunt_weapon_sound, list(
	'sound/rogueweapons/blunt/genblunt (1).ogg',
	'sound/rogueweapons/blunt/genblunt (2).ogg',
	'sound/rogueweapons/blunt/genblunt (3).ogg',
	'sound/rogueweapons/blunt/metalblunt (1).ogg',
	'sound/rogueweapons/blunt/metalblunt (2).ogg',
	'sound/rogueweapons/blunt/metalblunt (3).ogg',
))

GLOBAL_LIST_INIT(sharp_weapon_sound, list(
	'sound/rogueweapons/bladed/genchop (1).ogg',
	'sound/rogueweapons/bladed/genchop (2).ogg',
	'sound/rogueweapons/bladed/genchop (3).ogg',
	'sound/rogueweapons/bladed/genslash (1).ogg',
	'sound/rogueweapons/bladed/genslash (2).ogg',
	'sound/rogueweapons/bladed/genslash (3).ogg',
	'sound/rogueweapons/bladed/genstab (1).ogg',
	'sound/rogueweapons/bladed/genstab (2).ogg',
	'sound/rogueweapons/bladed/genstab (3).ogg',
	'sound/rogueweapons/bladed/genthrust (1).ogg',
	'sound/rogueweapons/bladed/genthrust (2).ogg',

))

GLOBAL_LIST_INIT(chop_weapon_sound, list(
	'sound/rogueweapons/bladed/genchop (1).ogg',
	'sound/rogueweapons/bladed/genchop (2).ogg',
	'sound/rogueweapons/bladed/genchop (3).ogg',
	'sound/rogueweapons/bladed/genslash (1).ogg',
	'sound/rogueweapons/bladed/genslash (2).ogg',
	'sound/rogueweapons/bladed/genslash (3).ogg',
))

GLOBAL_LIST_INIT(pointy_weapon_sound, list(
	'sound/rogueweapons/bladed/genstab (1).ogg',
	'sound/rogueweapons/bladed/genstab (2).ogg',
	'sound/rogueweapons/bladed/genstab (3).ogg',
	'sound/rogueweapons/bladed/genthrust (1).ogg',
	'sound/rogueweapons/bladed/genthrust (2).ogg',
))

GLOBAL_LIST_INIT(large_sharp_whoosh_sound, list(
'sound/rogueweapons/whooshes/bladed/wooshlarge (1).ogg',
'sound/rogueweapons/whooshes/bladed/wooshlarge (2).ogg',
'sound/rogueweapons/whooshes/bladed/wooshlarge (3).ogg',
'sound/rogueweapons/whooshes/bladed/wooshmed (1).ogg',
'sound/rogueweapons/whooshes/bladed/wooshmed (2).ogg',
'sound/rogueweapons/whooshes/bladed/wooshmed (3).ogg',
))

GLOBAL_LIST_INIT(small_sharp_whoosh_sound, list(
'sound/rogueweapons/whooshes/bladed/wooshsmall (1).ogg',
'sound/rogueweapons/whooshes/bladed/wooshsmall (2).ogg',
'sound/rogueweapons/whooshes/bladed/wooshsmall (3).ogg',
))

GLOBAL_LIST_INIT(large_blunt_whoosh_sound, list(
'sound/rogueweapons/whooshes/blunt/wooshlarge (1).ogg',
'sound/rogueweapons/whooshes/blunt/wooshlarge (2).ogg',
'sound/rogueweapons/whooshes/blunt/wooshlarge (3).ogg',

))

GLOBAL_LIST_INIT(small_blunt_whoosh_sound, list(
'sound/rogueweapons/whooshes/blunt/wooshmed (1).ogg',
'sound/rogueweapons/whooshes/blunt/wooshmed (2).ogg',
'sound/rogueweapons/whooshes/blunt/wooshmed (3).ogg',
))




/datum/random_mob_spawner/raider_melee
	nest_tag = MOB_SPAWNER_RAIDER_MELEE
	nest_name = "narrow tunnel"
	nest_desc = "A crude tunnel used by raiders to travel across the wasteland."
	nest_icon_state = MOB_SPAWNER_ICONSTATE_VENT // RAIDER VENTED
	sound_to_play = MOB_SPAWNER_SOUND_VENT

	num_mobs_to_spawn_easy = 1
	mob_respawn_time_easy = MOB_SPAWNER_TIME_LONG
	mob_list_easy = list(
		/mob/living/simple_animal/hostile/raider = 5,
		/mob/living/simple_animal/hostile/raider/firefighter = 2,
		/mob/living/simple_animal/hostile/raider/baseball = 2,
		/mob/living/simple_animal/hostile/raider/tribal = 2
		)
	num_mobs_to_spawn_medium = 2
	mob_respawn_time_medium = MOB_SPAWNER_TIME_LONG
	mob_list_medium = list(
		/mob/living/simple_animal/hostile/raider = 10,
		/mob/living/simple_animal/hostile/raider/firefighter = 5,
		/mob/living/simple_animal/hostile/raider/baseball = 5,
		/mob/living/simple_animal/hostile/raider/tribal = 5
		)
	num_mobs_to_spawn_hard = 2
	mob_respawn_time_hard = MOB_SPAWNER_TIME_LONG
	mob_list_hard = list(
		/mob/living/simple_animal/hostile/raider = 10,
		/mob/living/simple_animal/hostile/raider/firefighter = 5,
		/mob/living/simple_animal/hostile/raider/baseball = 5,
		/mob/living/simple_animal/hostile/raider/tribal = 5,
		/mob/living/simple_animal/hostile/raider/legendary = 1,
		/mob/living/simple_animal/hostile/raider/sulphite = 2
		)
