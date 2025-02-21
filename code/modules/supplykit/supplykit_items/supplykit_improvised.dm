
/* improvised firearms

//primary vars
/datum/supplykit_item/improvised/
	name = 
	desc = 
	item = 
	cost = 

//other vars
	surplus = 100 //if set below 100, reduces chances of being in the surplus crate
	cant_discount = FALSE //if set to true, prevents possible discounts
	limited_stock = -1 //-1 is infinite stock. otherwise, limits how many you can buy. also prevents discounts.
	restricted_roles = list() //for restricting by job type
	*/



/datum/supplykit_item/improvised/sling
	name = "Sling"
	desc = "A scrap of cloth and string used to sling rocks at high speed. Rocks are effortless to find."
	item = /obj/item/gun/energy/kinetic_accelerator/crossbow/sling

/datum/supplykit_item/improvised/slingstaff
	name = "Sling staff"
	desc = "A sling attached to a pole to increase its force. Rocks are effortless to find."
	item = /obj/item/gun/energy/kinetic_accelerator/crossbow/sling/staff

/datum/supplykit_item/improvised/shortbow
	name = "Shortbow"
	desc = "A small bow, short enough to be stashed in a backpack."
	item = /obj/item/gun/ballistic/bow/shortbow
	cost = 20

/datum/supplykit_item/improvised/recurve
	name = "Longow"
	desc = "A tall, bulky bow, with a high power draw."
	item = /obj/item/gun/ballistic/bow/longbow
	cost = 20

/datum/supplykit_item/improvised/quiver
	name = "Light Quiver"
	desc = "A small quiver with twelve field arrows."
	item = /obj/item/storage/bag/tribe_quiver/light/full
	cost = 10
	important = TRUE

/datum/supplykit_item/improvised/spearquiver
	name = "Spear Quiver"
	desc = "A belt quiver holding five throwing spears."
	item = /obj/item/storage/backpack/spearquiver
	cost = 20

/datum/supplykit_item/improvised/throwspear
	name = "Throwing Spear"
	desc = "A light spear designed for powerful throws."
	item = /obj/item/throwing_star/spear
	cost = 5

/datum/supplykit_item/improvised/throwingknife
	name = "Throwing Knife"
	desc = "A simple, well balanced blade and handle"
	item = /obj/item/melee/onehanded/knife/throwing
	cost = 5

/datum/supplykit_item/improvised/rockbag
	name = "Rock Bag"
	desc = "A small pouch made for carrying rocks."
	item = /obj/item/ammo_box/rock/improvised
	cost = 10

