
/* small melee

//primary vars
/datum/supplykit_item/meleesmall/
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

/datum/supplykit_item/melee/brassknuckles
	name = "Brass Knuckles"
	desc = "A set of brass rings that give your unarmed punches a hard impact when worn as a glove."
	item = /obj/item/melee/unarmed/brass
	important = TRUE

/datum/supplykit_item/melee/brassspiked
	name = "Spiked Knuckes"
	desc = "Unlike normal brass knuckles, these have a metal plate across the knuckles with four spikes on, one for each knuckle. So not only does the victim feel the force of the punch, but also the devastating effects of spikes being driven in."
	item = /obj/item/melee/unarmed/brass/spiked
	important = TRUE
	cost = 30

/datum/supplykit_item/melee/survival
	name = "Survival Knife"
	desc = "A high-quality pre-war survival knife. Perfect for a survivalist or hunter."
	item = /obj/item/melee/onehanded/knife/survival


/datum/supplykit_item/melee/bayonet
	name = "Bayonet"
	desc = "This weapon is made for stabbing, not much use for other things."
	item = /obj/item/melee/onehanded/knife/bayonet

/datum/supplykit_item/melee/trench
	name = "Trench Knife"
	desc = "This blade is designed for brutal close quarters combat."
	item = /obj/item/melee/onehanded/knife/trench


/datum/supplykit_item/melee/bowie
	name = "Bowie Knife"
	desc = "A hefty bladed knife."
	item = /obj/item/melee/onehanded/knife/bowie

/datum/supplykit_item/melee/switchblade
	name = "Switchblade"
	desc = "A swift folding blade that can fit in wallets and other small spaces."
	item = /obj/item/melee/onehanded/knife/switchblade


/datum/supplykit_item/melee/club
	name = "Metal Pipe"
	desc = "A piece of rusted metal pipe, good for smashing heads. "
	item = /obj/item/melee/onehanded/club

/datum/supplykit_item/melee/baton
	name = "Police Baton"
	desc = "A black metallic nightstick, used by police officers to detain rowdy law-breakers."
	item = /obj/item/melee/classic_baton/police

/datum/supplykit_item/melee/tireiron
	name = "Tire Iron"
	desc = "A rusty old tire iron, normally used for loosening nuts from car tires.<br>Though it has a short reach, it has decent damage and a fast swing."
	item = /obj/item/melee/onehanded/club/tireiron

/datum/supplykit_item/melee/fryingpan
	name = "Frying Pan"
	desc = "Hehehe pan go bonk."
	item = /obj/item/melee/onehanded/club/fryingpan

/datum/supplykit_item/melee/basebat
	name = "Baseball Bat"
	desc = "A swift and sturdy wooden bat."
	item = /obj/item/twohanded/baseball

/datum/supplykit_item/melee/bmprsword
	name = "bumper sword"
	desc = "It was too big to be called a sword. Massive, thick, heavy, and far too rough. Indeed, it was more like a heap of raw iron."

/datum/supplykit_item/melee/scrapspear
	name = "Scrap Spear"
	desc = "A sharp pointy bit is all you need to hurt things. Sticking it on a long handle means you can hurt things from further away."
	item = /obj/item/twohanded/spear/scrapspear

/datum/supplykit_item/melee/combataxe
	name = "Combat Axe"
	desc = "A heavy iron hafted fighting axe."
	item = /obj/item/melee/coyote/combataxe
	cost = 30

/datum/supplykit_item/melee/machete
	name = "Machete"
	desc = "A tarnished machete with a curved blade."
	item = /obj/item/melee/onehanded/machete/forgedmachete
	cost = 30

/datum/supplykit_item/melee/tanto
	name = "Tanto"
	desc = "A curved eastern heavy bladed dagger."
	item = /obj/item/melee/coyote/tantoold
	cost = 30

/datum/supplykit_item/melee/wakazashi
	name = "Wakazashi"
	desc = "An eastern short sword with a curved blade."
	item = /obj/item/melee/coyote/wakazashiold
	cost = 30

/datum/supplykit_item/melee/energykatana
	name = "Energy Katana"
	desc = "A swift eastern energy blade."
	cost = 50
	item = /obj/item/melee/transforming/plasmacutter/regular/energykatana

/datum/supplykit_item/melee/plasma
	name = "Plasma Cutter"
	desc = "A green plasma blade, augmented for boosted damage."
	item = /obj/item/melee/transforming/plasmacutter/regular
	cost = 50

/datum/supplykit_item/melee/celestia
	name = "Plasma Cutter Celestia"
	desc = "A blue plasma blade, augmented to deflect attacks."
	item = /obj/item/melee/transforming/plasmacutter/regular/celestia
	cost = 50

/datum/supplykit_item/melee/eve
	name = "Plasma Cutter Eve"
	desc = "A purple plasma blade, augmented for swift strikes."
	item = /obj/item/melee/transforming/plasmacutter/regular/eve
	cost = 50

/datum/supplykit_item/melee/sledge
	name = "Sledgehammer"
	desc = "A heavy, slow swinging hammer, adept at breaking things apart."
	item = /obj/item/twohanded/sledgehammer/simple
	cost = 40

/datum/supplykit_item/melee/fireaxe
	name = "Fire Axe"
	desc = "A heavy axe with a long haft, made for chopping structures apart."
	item = /obj/item/twohanded/fireaxe
	cost = 40



/*
/datum/supplykit_item/meleesmall/supergar
	name = "Gigga Gar Glasses"
	desc = "An incredibly stylish set of razor sharp glasses."
	item = /obj/item/clothing/glasses/sunglasses/gar/supergar


/datum/supplykit_item/meleesmall/mace
	name = "Mace"
	desc = "A weighty iron mace with a leather grip."
	item = /obj/item/melee/coyote/club/mace

/datum/supplykit_item/meleesmall/garb
	name = "Black Gar Glasses"
	desc = "A pair of over the top and razor sharp glasses."
	item = /obj/item/clothing/glasses/sunglasses/garb

/datum/supplykit_item/meleesmall/supergarb
	name = "Black Gigga Gar Glasses"
	desc = "A pair of extra over the top and razor sharp glasses."
	item = /obj/item/clothing/glasses/sunglasses/garb/supergarb

/datum/supplykit_item/meleesmall/boomerang
	name = "Boomerang"
	desc = "A wooden melee weapon that will return when thrown."
	item = /obj/item/melee/f13onehanded/boomerang

/datum/supplykit_item/meleesmall/mac
	name = "Macuahuitl"
	desc = "A wooden club lined with obsidian shards, originally designed to cause crippling but survivable wounds to capture subjects for aztec blood rituals."
	item = /obj/item/melee/coyote/macuahuitl

/datum/supplykit_item/meleesmall/armingsword
	name = "Arming Sword"
	desc = "A classic western sword commonly used by knights of the high middle ages."
	item = /obj/item/melee/coyote/oldlongsword/armingsword
*/
/*
/datum/supplykit_item/meleesmall/bokken
	name = "Bokken"
	desc = "A wooden katana for practice and nonlethal blunt force trauma."
	item = /obj/item/melee/classic_baton/coyote/oldquarterstaff/oldbokken

/datum/supplykit_item/meleesmall/broadsword
	name = "Broadsword"
	desc = "A classic, straight bladed steel sword."
	item = /obj/item/melee/coyote/oldlongsword/broadsword

/datum/supplykit_item/meleesmall/longquan
	name = "Chinese Sword"
	desc = "An ancient straight bladed sword with a gold filagreed guard."
	item = /obj/item/melee/coyote/oldlongsword/longquan

/datum/supplykit_item/meleesmall/cutlass
	name = "Cutlass"
	desc = "A curved sword for butchering and swashbuckling."
	item = /obj/item/melee/coyote/oldcutlass

/datum/supplykit_item/meleesmall/dervish
	name = "Dervish Blade"
	desc = "A single bladed middle-eastern sword with a curved grip."
	item = /obj/item/melee/coyote/olddervish

/datum/supplykit_item/meleesmall/khopesh
	name = "Khopesh"
	desc = "An ancient bronze weapon that crosses the line between sword and axe."
	item = /obj/item/melee/coyote/oldkhopesh

/datum/supplykit_item/meleesmall/longsword
	name = "Longsword"
	desc = "A long bladed steel sword, used by the knights of old."
	item = /obj/item/melee/coyote/oldlongsword

/datum/supplykit_item/meleesmall/quarterstaff
	name = "Quarterstaff"
	desc = "A simple, sturdy pole that allows very defensive combat."
	item = /obj/item/melee/classic_baton/coyote/oldquarterstaff

/datum/supplykit_item/meleesmall/spadroon
	name = "Spadroon"
	desc = "A light military blade with a brass basket hilt."
	item = /obj/item/melee/coyote/oldlongsword/spadroon



/datum/supplykit_item/meleesmall/xiphos
	name = "Xiphos"
	desc = "A short bladed Roman dagger with a tapered thrusting blade."
	item = /obj/item/melee/coyote/oldlongsword/xiphos

/datum/supplykit_item/meleesmall/gar
	name = "Orange Gar Glasses"
	desc = "A stylish set of sharp pointy glasses."
	item = /obj/item/clothing/glasses/sunglasses/gar

/datum/supplykit_item/meleesmall/warclub
	name = "War Club"
	desc = "A carved wooden tribal club with turquoise decoration."
	item = /obj/item/melee/onehanded/club/warclub

/datum/supplykit_item/meleesmall/smallsword
	name = "Small Sword"
	desc = "A light, narrow blade made for thrusting. The lethal version of a fencing foil."
	item = /obj/item/melee/coyote/smallsword
*/


