//VEHICLE DEFAULT HANDLING
/obj/vehicle/proc/generate_actions()
	return

/obj/vehicle/proc/generate_action_type(actiontype)
	var/datum/action/vehicle/A = new actiontype
	if(!istype(A))
		return
	A.vehicle_target = src
	return A

/obj/vehicle/proc/initialize_passenger_action_type(actiontype)
	autogrant_actions_passenger += actiontype
	for(var/i in occupants)
		grant_passenger_actions(i)	//refresh

/obj/vehicle/proc/initialize_controller_action_type(actiontype, control_flag)
	LAZYINITLIST(autogrant_actions_controller["[control_flag]"])
	autogrant_actions_controller["[control_flag]"] += actiontype
	for(var/i in occupants)
		grant_controller_actions(i)	//refresh

/obj/vehicle/proc/grant_action_type_to_mob(actiontype, mob/m)
	if(isnull(occupants[m]) || !actiontype)
		return FALSE
	LAZYINITLIST(occupant_actions[m])
	if(occupant_actions[m][actiontype])
		return TRUE
	var/datum/action/action = generate_action_type(actiontype)
	action.Grant(m)
	occupant_actions[m][action.type] = action
	return TRUE

/obj/vehicle/proc/remove_action_type_from_mob(actiontype, mob/m)
	if(isnull(occupants[m]) || !actiontype)
		return FALSE
	LAZYINITLIST(occupant_actions[m])
	if(occupant_actions[m][actiontype])
		var/datum/action/action = occupant_actions[m][actiontype]
		action.Remove(m)
		occupant_actions[m] -= actiontype
	return TRUE

/obj/vehicle/proc/grant_passenger_actions(mob/M)
	for(var/v in autogrant_actions_passenger)
		grant_action_type_to_mob(v, M)

/obj/vehicle/proc/remove_passenger_actions(mob/M)
	for(var/v in autogrant_actions_passenger)
		remove_action_type_from_mob(v, M)

/obj/vehicle/proc/grant_controller_actions(mob/M)
	if(!istype(M) || isnull(occupants[M]))
		return FALSE
	for(var/i in GLOB.bitflags)
		if(occupants[M] & i)
			grant_controller_actions_by_flag(M, i)
	return TRUE

/obj/vehicle/proc/remove_controller_actions(mob/M)
	if(!istype(M) || isnull(occupants[M]))
		return FALSE
	for(var/i in GLOB.bitflags)
		remove_controller_actions_by_flag(M, i)
	return TRUE

/obj/vehicle/proc/grant_controller_actions_by_flag(mob/M, flag)
	if(!istype(M))
		return FALSE
	for(var/v in autogrant_actions_controller["[flag]"])
		grant_action_type_to_mob(v, M)
	return TRUE

/obj/vehicle/proc/remove_controller_actions_by_flag(mob/M, flag)
	if(!istype(M))
		return FALSE
	for(var/v in autogrant_actions_controller["[flag]"])
		remove_action_type_from_mob(v, M)
	return TRUE

/obj/vehicle/proc/cleanup_actions_for_mob(mob/M)
	if(!istype(M))
		return FALSE
	for(var/path in occupant_actions[M])
		stack_trace("Leftover action type [path] in vehicle type [type] for mob type [M.type] - THIS SHOULD NOT BE HAPPENING!")
		var/datum/action/action = occupant_actions[M][path]
		action.Remove(M)
		occupant_actions[M] -= path
	occupant_actions -= M
	return TRUE

//ACTION DATUMS

/datum/action/vehicle
	check_flags = AB_CHECK_RESTRAINED | AB_CHECK_STUN | AB_CHECK_CONSCIOUS
	icon_icon = 'icons/mob/actions/actions_vehicle.dmi'
	button_icon_state = "vehicle_eject"
	var/obj/vehicle/vehicle_target

/datum/action/vehicle/sealed
	var/obj/vehicle/sealed/vehicle_entered_target

/datum/action/vehicle/sealed/climb_out
	name = "Climb Out"
	desc = "Climb out of your vehicle!"
	button_icon_state = "car_eject"

/datum/action/vehicle/sealed/climb_out/Trigger()
	if(..() && istype(vehicle_entered_target))
		vehicle_entered_target.mob_try_exit(owner, owner)

/datum/action/vehicle/ridden
	var/obj/vehicle/ridden/vehicle_ridden_target

/datum/action/vehicle/sealed/remove_key
	name = "Remove key"
	desc = "Take your key out of the vehicle's ignition"
	button_icon_state = "car_removekey"

/datum/action/vehicle/sealed/remove_key/Trigger()
	vehicle_entered_target.remove_key(owner)
	if (vehicle_entered_target.on)
		vehicle_entered_target.on = FALSE

/datum/action/vehicle/sealed/start_engine
	name = "Start Engine"
	desc = "Start the vehicle's engine"
	button_icon_state = "car_removekey"

/datum/action/vehicle/sealed/start_engine/Trigger()
	if(vehicle_entered_target.mechanical)
		if(vehicle_entered_target.inserted_key)
			if(!vehicle_entered_target.on)
				vehicle_entered_target.start_engine()	
			else
				to_chat(owner, span_warning("The engine is already on!"))			
		else
			to_chat(owner, span_warning("[vehicle_entered_target.name] has no key inserted!"))	
			return

/datum/action/vehicle/sealed/start_engine
	name = "Start Engine"
	desc = "Start the vehicle's engine"
	button_icon_state = "car_removekey"

/datum/action/vehicle/sealed/start_engine/Trigger()
	if(vehicle_entered_target.mechanical)
		if(vehicle_entered_target.inserted_key)
			if(!vehicle_entered_target.on)
				vehicle_entered_target.start_engine()	
			else
				to_chat(owner, span_warning("The engine is already on!"))			
		else
			to_chat(owner, span_warning("[vehicle_entered_target.name] has no key inserted!"))	
			return


/datum/action/vehicle/sealed/stop_engine
	name = "Stop Engine"
	desc = "Stop the vehicle's engine"
	button_icon_state = "car_removekey"

/datum/action/vehicle/sealed/stop_engine/Trigger()
	if(vehicle_entered_target.mechanical)
		if(vehicle_entered_target.inserted_key)
			if(!vehicle_entered_target.on)
				to_chat(owner, span_warning("The engine is already off!"))		
			else
				vehicle_entered_target.stop_engine()						

/datum/action/vehicle/ridden/remove_key/Trigger()
	vehicle_ridden_target.remove_key(owner)
	if (vehicle_ridden_target.on)
		vehicle_ridden_target.on = FALSE

/datum/action/vehicle/ridden/start_engine
	name = "Start Engine"
	desc = "Take your key out of the vehicle's ignition"
	button_icon_state = "car_removekey"

/datum/action/vehicle/ridden/start_engine/Trigger()
	if(vehicle_ridden_target.mechanical)
		if(vehicle_ridden_target.inserted_key)
			if(!vehicle_ridden_target.on)
				vehicle_ridden_target.start_engine()	
			else
				to_chat(owner, span_warning("The engine is already on!"))			
		else
			to_chat(owner, span_warning("[vehicle_ridden_target.name] has no key inserted!"))	
			return

/datum/action/vehicle/ridden/stop_engine
	name = "Stop Engine"
	desc = "Stop the vehicle's engine"
	button_icon_state = "car_removekey"

/datum/action/vehicle/ridden/stop_engine/Trigger()
	if(vehicle_ridden_target.mechanical)
		if(vehicle_ridden_target.inserted_key)
			if(!vehicle_ridden_target.on)
				to_chat(owner, span_warning("The engine is already off!"))		
			else
				vehicle_ridden_target.stop_engine()	

/obj/vehicle/proc/start_engine()
	playsound(src, engine_start, 100, 1)
	on = TRUE

/obj/vehicle/proc/stop_engine()
	playsound(src, engine_fail, 100, 1)
	on = FALSE
