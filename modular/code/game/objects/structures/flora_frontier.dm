//TREES

/obj/structure/flora/tree/pine
	name = "pine tree"
	desc = "woody"
	icon = 'modular/code/game/objects/tree_pine.dmi'
	icon_state = "pine1"
	anchored = TRUE
	density = FALSE

/obj/structure/flora/tree/pine/Initialize()
	. = ..()
	icon_state = "pine[rand(1,3)]"

/obj/structure/flora/tree/pine_snow
	name = "pine tree"
	desc = "woody"
	icon = 'modular/code/game/objects/tree_pine.dmi'
	icon_state = "snowpine1"
	anchored = TRUE
	density = FALSE

/obj/structure/flora/tree/pine_snow/Initialize()
	. = ..()
	icon_state = "snowpine[rand(1,3)]"

//GRASS

/obj/structure/flora/grass/temperate
	name = "grass"
	desc = "greeny"
	icon = 'icons/obj/flora/ausflora.dmi'
	icon_state = "fullgrass_1"

/obj/structure/flora/grass/temperate/Initialize()
	. = ..()
	icon_state = "fullgrass_[rand(1,3)]"

/obj/structure/flora/grass/temperate/sparse
	icon_state = "sparsegrass_1"

/obj/structure/flora/grass/temperate/sparse/Initialize()
	. = ..()
	icon_state = "sparsegrass_[rand(1,3)]"



//DESERT STUFF

/obj/structure/flora/ausbushes/barrelcacti_smol
	name = "baby barrelcacti"
	desc = "small but spiky"
	icon = 'modular_coyote/icons/objects/desert_plant.dmi'
	icon_state = "barrelcacti0"

/obj/structure/flora/ausbushes/barrelcacti_smol/Initialize()
	. = ..()
	icon_state = "barrelcacti[rand(0,3)]"

/obj/structure/flora/grass/thicket
	name = "thicket"
	desc = "greeny"
	icon = 'modular_coyote/icons/objects/desert_plant.dmi'
	icon_state = "thicket0"

/obj/structure/flora/grass/thicket/Initialize()
	. = ..()
	icon_state = "thicket[rand(0,6)]"

/obj/structure/flora/ausbushes/shrub
	name = "shrubs"
	desc = "shruby"
	icon = 'modular_coyote/icons/objects/desert_plant.dmi'
	icon_state = "shrub0"

/obj/structure/flora/ausbushes/shrub/Initialize()
	. = ..()
	icon_state = "shrub[rand(0,5)]"

/obj/structure/flora/ausbushes/bushes
	name = "bush"
	desc = "bushy"
	icon = 'modular_coyote/icons/objects/desert_plant.dmi'
	icon_state = "bush0"

/obj/structure/flora/ausbushes/bushes/Initialize()
	. = ..()
	icon_state = "shrub[rand(0,5)]"

/obj/structure/flora/tree/palmy
	name = "dwarf palm tree"
	desc = "a dwarven species of the palm tree"
	icon = 'modular_coyote/icons/objects/desert_plant.dmi'
	icon_state = "palmy0"
	log_amount = 2

/obj/structure/flora/tree/palmy/Initialize()
	. = ..()
	icon_state = "palmy[rand(0,2)]"

/obj/structure/flora/tree/shrubber
	name = "shrubber"
	desc = "a tangled mass of dry shrubbery"
	icon = 'modular_coyote/icons/objects/desert_plant.dmi'
	icon_state = "shrubber0"
	log_amount = 0

/obj/structure/flora/tree/shrubber/Initialize()
	. = ..()
	icon_state = "shrubber[rand(0,2)]"

/obj/structure/flora/tree/barrelcacti
	name = "barrelcacti"
	desc = "a fully grown barrel cacti, very thorny."
	icon = 'modular_coyote/icons/objects/desert_plant.dmi'
	icon_state = "lbarrelcacti0"
	log_amount = 2

/obj/structure/flora/tree/barrelcacti/Initialize()
	. = ..()
	icon_state = "lbarrelcacti[rand(0,2)]"




/// BEACH STUFF

/obj/structure/flora/tree/palm
	name = "palm tree"
	desc = "a tall palm tree"
	icon = 'icons/misc/beach2.dmi'
	icon_state = "palm1"
	log_amount = 0

/obj/structure/flora/tree/palm/Initialize()
	. = ..()
	icon_state = "palm[rand(1,5)]"
