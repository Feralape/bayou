
//persistent char inv code by vide noir.
//i could not make this work, not withdrawing nor depositing beyond one item, or saving. I dont know wtf is wrong.
//Code refactored by Derflammenwerfer

/obj/machinery/computer/itemvault
	name = "Vaultier 1000"
	desc = "Stores and withdraws items for long term safekeeping."
	icon = 'icons/obj/computer.dmi'
	icon_state = "lunar"
	icon_keyboard = "lunar_key"
	icon_screen = "lunar"

/obj/machinery/computer/itemvault/on_attack_hand(mob/living/user, act_intent = user.a_intent, unarmed_attack_flags)
	var/mob/living/M = user
	var/datum/playervault/PV = GLOB.playervaults[M.ckey]
	if(PV == null)//This should only happen if the player has no entry in the global list.
		to_chat(user, span_notice("No previous entry found. Attempting to create a new vault entry for you."))
		PV = new(M.ckey, 0, list(), FALSE)
		GLOB.playervaults += list(M.ckey = PV)
		if(M.ckey in GLOB.playervaults)
			to_chat(user, span_green("Vault entry successfully created."))
			return
		else
			to_chat(user, span_warning("Unable to create vault. Report this as a bug."))
			return
	switch(askuser(user, "Which function do you wish to perform?", name, "Withdraw Debit", "Withdraw Item", "Cancel", StealFocus=0, Timeout=600))
		if(1)
			var/currency_name = "edison(s)"
			var/max = PV.currency
			var/value = round(input(user, "How many [currency_name] would you like to withdraw? (Maximum  [max])", "Vaultier 1000") as num|null)
			if(value == null || value == 0)
				to_chat(user, span_warning("Transaction cancelled by user."))
				return
			if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
				to_chat(user, span_warning("User no longer in proximity."))
				return
			if(value < 0)
				to_chat(user, span_warning("Cannot withdraw a negative value."))
				return
			if(value > PV.currency)
				value = PV.currency
			to_chat(user, span_green("Dispensing [value] [currency_name]."))
			var/cash_type = /obj/item/stack/f13Cash/caps
			var/obj/item/stack/f13Cash/caps/T = new cash_type
			T.amount = value
			T.update_icon()
			PV.currency -= value
			user.put_in_hands(T)
			return
		if(2)
			var/list/options = list()
			for(var/obj/path as anything in PV.storeditems)
				options[initial(path.name)] = path
			var/choice = tgui_input_list(user,"Which item would you like to withdraw?", "Vaultier 1000", options)
			var/selection = options[choice]
			if(!choice)
				to_chat(user, span_warning("Withdrawal canceled by user."))
				return
			if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
				to_chat(user, span_notice("Withdrawal canceled -- user not in proximity."))
				return
			if(PV.storeditems[selection] <= 0)
				to_chat(user, span_warning("Withdrawal canceled -- Entry has zero or negative balance."))
				PV.storeditems -= selection
				return
			else
				var/obj/item/dispensed = new selection
				to_chat(user, span_green("Dispensing [dispensed.name]."))
				PV.storeditems[selection] -= 1
				if(istype(dispensed, /obj/item/stack))
					var/obj/item/stack/S = dispensed
					S.amount = S.max_amount
				if(istype(dispensed, /obj/item/ammo_box))
					var/obj/item/ammo_box/AB = dispensed
					if(AB.start_empty)
						qdel(dispensed)
						dispensed = new AB.parent_type
				user.put_in_hands(dispensed)
				if(PV.storeditems[selection] < 1)
					PV.storeditems -= selection
				return

/obj/machinery/computer/itemvault/attacked_by(obj/item/I, mob/living/user)
	var/datum/playervault/PV = GLOB.playervaults[user.ckey]
	if(PV == null)//This should only happen if the player has no entry in the global list.
		to_chat(user, span_warning("Unable to find an existing vault. Please place your hand on the console to create one."))
		return
	if(istype(I, /obj/item/stack/f13Cash))
		var/obj/item/stack/f13Cash/C = I
		if(C.value < 1)
			to_chat(user, span_warning("Cannot store coinage value of less than one edison."))
			return
		PV.currency += (C.amount * C.value)
		qdel(C)
		return
	if(istype(I, /obj/item/stack))
		var/obj/item/stack/S = I
		if(!istype(I, /obj/item/stack/f13Cash) && S.amount < S.max_amount)
			to_chat(user, span_warning("Cannot store partial stacks."))
			return
	if(!user.canUseTopic(src, BE_CLOSE, ismonkey(user)))
		to_chat(user, span_warning("Deposit canceled -- user not in proximity."))
		return
	if(istype(I, /obj/item/storage))
		var/obj/item/storage/ST = I
		if(ST.contents.len > 0)
			to_chat(user, span_warning("Please empty the container prior to storage."))
			return
	if(istype(I, /obj/item/ammo_box))
		var/obj/item/ammo_box/AB = I
		if(length(AB.stored_ammo) < AB.max_ammo)
			to_chat(user, span_warning("Cannot store partial or empty ammo containers. Please fill before submitting."))
		return
	if(I)
		var/choice = input(user,"Deposit [I.name]? Non-standard contents may be lost.") as anything in list("Yes", "No")
		if(choice == "Yes")
			if(I.type in PV.storeditems)
				if(PV.storeditems[I.type] >= 10)
					to_chat(user, span_warning("Cannot deposit item: Quota reached."))
					return
				else
					PV.storeditems[I.type] += 1
					to_chat(user, span_green("Item successfully added to existing reserve."))
					qdel(I)
					return
			else
				PV.storeditems += list(I.type = 1)
				to_chat(user, span_green("Item successfully added to new reserve."))
				qdel(I)
				return
		else
			to_chat(user, span_warning("Deposit cancelled by user."))
			return
	else
		to_chat(user, span_warning("Cannot deposit a null object."))
		return
