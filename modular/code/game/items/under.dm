
/obj/item/clothing/under/dockworker
	name = "dockworker uniform"
	desc = "A utility jumpsuit belonging to a CTN officer."
	icon_state = "utilsupply"
	item_state = "utilsupply"
	item_color = "utilsupply"
	can_adjust = FALSE

/obj/item/clothing/under/technician
	name = "utility uniform"
	desc = "A dark utility jumpsuit."
	icon_state = "utilgen"
	item_state = "utilgen"
	item_color = "utilgen"
	can_adjust = FALSE

/obj/item/clothing/under/scrubs_blue
	name = "blue medical scrubs"
	desc = "A sterile medical uniform."
	icon_state = "scrubs_blue"
	item_state = "scrubs_blue"
	item_color = "scrubs_blue"
	can_adjust = FALSE


/obj/item/clothing/under/scrubs_green
	name = "green medical scrubs"
	desc = "A sterile medical uniform."
	icon_state = "scrubs_darkgreen"
	item_state = "scrubs_darkgreen"
	item_color = "scrubs_darkgreen"
	can_adjust = FALSE


/obj/item/clothing/under/scrubs_green_light
	name = "light green medical scrubs"
	desc = "A sterile medical uniform."
	icon_state = "scrubs_lightgreen"
	item_state = "scrubs_lightgreen"
	item_color = "scrubs_lightgreen"
	can_adjust = FALSE

/obj/item/clothing/under/scrubs_navy
	name = "navy medical scrubs"
	desc = "A sterile medical uniform."
	icon_state = "scrubs_navy"
	item_state = "scrubs_navy"
	item_color = "scrubs_navy"
	can_adjust = FALSE

/obj/item/clothing/under/scrubs_white
	name = "white medical scrubs"
	desc = "A sterile medical uniform."
	icon_state = "scrubs_white"
	item_state = "scrubs_white"
	item_color = "scrubs_white"
	can_adjust = FALSE

/obj/item/clothing/under/medlab_uniform
	name = "medlab uniform"
	desc = "A sterile medical uniform for medlab staff."
	icon_state = "uniform_enclave_science"
	item_state = "uniform_enclave_science"
	item_color = "uniform_enclave_science"
	can_adjust = FALSE

/obj/item/clothing/under/rimwatch_uniform
	name = "Rimwatch fatigue"
	desc = "A dark utilitarian fatigue for officers of the Rimwatch."
	icon_state = "pmc"
	item_state = "pmc"
	item_color = "pmc"
	can_adjust = FALSE

/obj/item/clothing/under/rimwatch_uniform_marshall
	name = "Rimwatch marshall uniform"
	desc = "A dark military uniform worn by Rimwatch Marshalls."
	icon_state = "bosformsilver_m"
	item_state = "bosformsilver_m"
	item_color = "bosformsilver_m"
	can_adjust = FALSE

/obj/item/clothing/under/merchant
	name = "merchant outfit"
	desc = "A smart yet gritty outfit befitting a trader."
	icon_state = "merchant"
	item_state = "merchant"
	item_color = "merchant"
	can_adjust = FALSE

/obj/item/clothing/under/vagabond
	name = "vagabond fatigues"
	desc = "It's a rugged white t-shirt with brown trousers."
	icon_state = "doctor_m"
	item_state = "doctor_m"
	item_color = "doctor_m"

/obj/item/clothing/under/vagabond/Initialize()
	. = ..()
	icon_state = pick("doctor_m", "doctor_f")
	item_state = icon_state
	item_color = icon_state

/obj/item/clothing/under/foxflannel
	name = "black flannel outfit"
	desc = "A black flannel ontop of a pair of slim-fitting pre-war jeans that were kept in excellent condition. The back leather panel is worn out."
	mutantrace_variation = STYLE_DIGITIGRADE
	icon_state = "foxflannel"
	item_state = "foxflannel"
	item_color = "foxflannel"


/obj/item/clothing/under/redflannel
	name = "red flannel outfit"
	desc = "Simple rustic clothes consisting of a red flannel on top of a pair of slim-fitting pre-war jeans."
	icon_state = "vetranger"
	item_state = "vetranger"
	item_color = "vetranger"
