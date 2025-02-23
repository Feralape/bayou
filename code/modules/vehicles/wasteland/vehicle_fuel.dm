//Fallout 13 general fuel directory - Gas! Petrol! Guzzolene!

/obj/vehicle/ridden/fuel
	name = "vehicle"
	desc = "Something went wrong! Badmins spawned shit!"
	icon_state = ""
	mechanical = TRUE
	on = FALSE

	var/fuel = 600
	var/max_fuel = 600
	var/obj/item/reagent_containers/fuel_tank/fuel_holder
	var/idle_wasting = 0.5
	var/move_wasting = 0.1

/obj/vehicle/ridden/fuel/New()
	..()
	fuel_holder = new(max_fuel, fuel)


/obj/vehicle/ridden/fuel/attackby(obj/item/weapon/W, mob/user, params) //Refueling
	if(istype(W, /obj/item/reagent_containers))
		fuel_holder.attackby(W, user, params)
		return 1
	return ..()

/obj/vehicle/ridden/fuel/Move(NewLoc,Dir=0,step_x=0,step_y=0)
	. = ..()
	if(on && move_wasting)
		fuel_holder.reagents.remove_reagent(/datum/reagent/fuel,move_wasting)

/obj/vehicle/ridden/fuel/process() //If process begining you can sure that engine is on
	var/fuel_wasting

	fuel_wasting += idle_wasting

//Health check
	var/health = (obj_integrity/max_integrity)
	if(health < 1)
		if(health < 0.5 && fuel > 100 && prob(10)) // If vehicle is broken it will burn
			visible_message("<span class='warning'>[src] is badly damaged, the engine has burst into flames!</span>")
			fuel_wasting += 2
			new /obj/effect/hotspot(get_turf(src))
			if(prob(50)) //MOAR FIRE
				dyn_explosion(epicenter = src, power = fuel_holder.reagents.get_reagent_amount(/datum/reagent/fuel)/10, flash_range = 2, adminlog = 0, flame_range = 5 ,silent = 1)

	fuel_holder.reagents.remove_reagent(/datum/reagent/fuel,fuel_wasting)

	if(!fuel_holder.reagents.get_reagent_amount(/datum/reagent/fuel))
		stop_engine()

/obj/vehicle/ridden/fuel/start_engine()
	if(!fuel_holder.reagents.get_reagent_amount(/datum/reagent/fuel))
		playsound(src, engine_fail, 50)
		to_chat(usr, "<span class='warning'>\The [src] has run out of fuel!</span>")
		return
	on = TRUE
	..()
	START_PROCESSING(SSobj, src)

/obj/vehicle/ridden/fuel/stop_engine()
	..()
	on = FALSE
	STOP_PROCESSING(SSobj, src)

/obj/vehicle/ridden/fuel/verb/ToogleFuelTank()
	set name = "Toogle Fuel Tank"
	set category = "Object"
	set src in view(1)
	fuel_holder.inside = !fuel_holder.inside
	to_chat(usr, "<span class='notice'>You changed transfer type.</span>")

/obj/vehicle/ridden/fuel/examine(mob/user)
	..()
	if(fuel_holder)
		var/fuel_percent = round(fuel_holder.reagents.total_volume / fuel_holder.reagents.maximum_volume * 100)
		to_chat(user, "<span class='notice'>The fuel meter is at [fuel_percent]%.</span>")
		switch(fuel_percent)
			if(95 to INFINITY)
				to_chat(user, "<span class='notice'>The fuel tank is full to the top. Let's ride!</span>")
			if(60 to 95)
				to_chat(user, "<span class='notice'>Not so full, but it'll still last a while.</span>")
			if(25 to 60)
				to_chat(user, "<span class='notice'>That should be just enough to find more fuel.</span>")
			if(1 to 25)
				to_chat(user, "<span class='warning'>It's almost out of fuel!</span>")
			else
				to_chat(user, "<span class='danger'>There is no fuel left!</span>")



/obj/item/reagent_containers/fuel_tank
	name = "fuel tank"
	reagent_flags = OPENCONTAINER
	amount_per_transfer_from_this = 25
	var/inside = 1

/obj/item/reagent_containers/fuel_tank/New(volume, fuel)
	src.volume = volume
	list_reagents = list(/datum/reagent/fuel = fuel)
	..()

/obj/item/reagent_containers/fuel_tank/attackby(obj/item/weapon/W, mob/user, params)
	if(W.is_open_container() && W.reagents)
		if(inside)
			if(!W.reagents.total_volume)
				to_chat(user, "<span class='warning'>[W] is empty!</span>")
				return

			if(src.reagents.total_volume >= src.reagents.maximum_volume)
				to_chat(user, "<span class='notice'>[src] is full.</span>")
				return


			var/trans = W.reagents.trans_to(src, amount_per_transfer_from_this)
			to_chat(user, "<span class='notice'>You transfer [trans] units of the solution to [src].</span>")
		else
			if(!src.reagents.total_volume)
				to_chat(user, "<span class='warning'>[src] is empty!</span>")
				return

			if(W.reagents.total_volume >= W.reagents.maximum_volume)
				to_chat(user, "<span class='notice'>[W] is full.</span>")
				return


			var/trans = src.reagents.trans_to(W, amount_per_transfer_from_this)
			to_chat(user, "<span class='notice'>You transfer [trans] units of the solution to [W].</span>")
