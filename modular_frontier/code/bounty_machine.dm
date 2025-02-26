GLOBAL_LIST_EMPTY(head_bounties)

/obj/machinery/computer/bountycomp
	name = "Bounty Computer"
	desc = "Lists and manipulates bounties."
	icon = 'icons/obj/computer.dmi'
	icon_state = "enclave"
	icon_keyboard = "enclave_key"
	icon_screen = "enclave"
	anchored = TRUE

/datum/bounty
	var/target
	var/amount
	var/reason
	var/employer

	/// Whats displayed when consulting the bounties
	var/banner

/obj/machinery/computer/bounty/attack_hand(mob/user)

	if(!ishuman(user)) return

	// We need to check the user's bank account later
	var/mob/living/carbon/human/H = user

	// Main Menu
	var/list/choices = list("Consult Bounties", "Set Bounty", "Print List of Bounties")
	if(user.job in list("Rimwatch Officer", "Rimwatch Marshall", "Rimwatch Ranger"))
		choices += "Remove Bounty"

	var/selection = input(user, "Bounty Computer", src) as null|anything in choices

	switch(selection)

		if("Consult Bounties")
			consult_bounties(H)

		if("Set Bounty")
			set_bounty(H)

		if("Remove Bounty")
			remove_bounty(H)

///Shows all active bounties to the user.
/obj/machinery/computer/bounty/proc/consult_bounties(mob/living/carbon/human/user)
	var/bounty_found = FALSE
	var/consult_menu
	consult_menu += "<center>BOUNTIES<BR>"
	consult_menu += "--------------<BR>"
	for(var/datum/bounty/saved_bounty in GLOB.head_bounties)
		consult_menu += saved_bounty.banner
		bounty_found = TRUE

	if(bounty_found)
		var/datum/browser/popup = new(user, "BOUNTIES", "", 700, 500)
		popup.set_content(consult_menu)
		popup.open()
	else
		say("No bounties are currently active.")

///Sets a bounty on a target player through user input.
///@param user: The player setting the bounty.
/obj/machinery/computer/bounty/proc/set_bounty(mob/living/carbon/human/user)
	var/list/eligible_players = list()

	if(GLOB.player_list.len)
		for(var/guys_name in GLOB.player_list)
			eligible_players += guys_name
	else
		to_chat(user, span_warning("There is somehow nobody around."))
		return
	var/target = input(user, "Whose name shall be etched on the wanted list?", src) as null|anything in eligible_players
	if(isnull(target))
		say("No target selected.")
		return

	var/amount = input(user, "How many coins shall be rewarded for them?", src) as null|num
	if(isnull(amount))
		say("Invalid amount.")
		return
	if(amount < 20)
		say("Insufficient amount. Bounty must be at least 20 coins.")
		return

	// Has user a bank account?
	if(!(user in GLOB.bank_accounts))
		say("You have no bank account.")
		return

	// Has user enough money?
	var/amt = GLOB.bank_accounts[user]
	if(amt < amount)
		say("Insufficient balance funds.")
		return

	var/reason = input(user, "What is the reason of this bounty?", src) as null|text
	if(isnull(reason) || reason == "")
		say("No reason given.")
		return

	var/confirm = input(user, "Are you sure you want to do this? Your name will be known.", src) as null|anything in list("Yes", "No")
	if(isnull(confirm) || confirm == "No") return

	// Deduct money from user
	GLOB.bank_accounts[user] -= round(amount)
	user.client.prefs.bank_funds = GLOB.bank_accounts[user]
	user.client.prefs.save_banked_funds()

	// Finally create bounty
	add_bounty(target, amount, FALSE, reason, user.real_name)
	say("[target] now has a bounty on their head.")

	message_admins("[ADMIN_LOOKUPFLW(user)] has set a bounty on [ADMIN_LOOKUPFLW(target)] with the reason of: '[reason]'")

/obj/machinery/computer/bounty/proc/remove_bounty(mob/living/carbon/human/user)
	var/list/eligible_players = list()

	if(GLOB.player_list.len)
		for(var/datum/bounty/b in GLOB.head_bounties)
			eligible_players += b.target
	else
		to_chat(user, span_warning("There is somehow nobody around."))
		return
	var/mob/living/carbon/target = input(user, "Whose name shall be removed from the wanted list?", src) as null|anything in eligible_players
	if(isnull(target))
		say("No target selected.")
		return

	var/confirm = input(user, "Are you sure?", src) as null|anything in list("Yes", "No")
	if(isnull(confirm) || confirm == "No") return
	for(var/datum/bounty/b in GLOB.head_bounties)
		if(b.target == target.real_name)
			GLOB.head_bounties -= b

	say("[target] is no longer wanted.")
	message_admins("[ADMIN_LOOKUPFLW(user)] has removed a bounty on [ADMIN_LOOKUPFLW(target)]'")

/proc/add_bounty(target_realname, amount, reason, employer_name)
	var/datum/bounty/new_bounty = new /datum/bounty
	new_bounty.amount = amount
	new_bounty.target = target_realname
	new_bounty.reason = reason
	new_bounty.employer = employer_name
	compose_bounty(new_bounty)
	GLOB.head_bounties += new_bounty

///Composes a random bounty banner based on the given bounty info.
///@param new_bounty:  The bounty datum.
/proc/compose_bounty(datum/bounty/new_bounty)
	switch(rand(1, 3))
		if(1)
			new_bounty.banner += "A dire bounty hangs upon the capture of [new_bounty.target], for '[new_bounty.reason]'.<BR>"
			new_bounty.banner += "The patron, [new_bounty.employer], offers [new_bounty.amount] coins for the task.<BR>"
		if(2)
			new_bounty.banner += "The capture of [new_bounty.target] is wanted for '[new_bounty.reason]''.<BR>"
			new_bounty.banner += "The employer, [new_bounty.employer], offers [new_bounty.amount] coins for the deed.<BR>"
		if(3)
			new_bounty.banner += "[new_bounty.employer] hath offered to pay [new_bounty.amount] coins for the capture of [new_bounty.target].<BR>"
			new_bounty.banner += "By reason of the following: '[new_bounty.reason]'.<BR>"
	new_bounty.banner += "--------------<BR>"

/obj/structure/chair/arrestchair
	name = "Bounty Chair"
	desc = "A chairesque machine that collects bounties, dead targets are paid half to encourage alive-taking."
	icon = 'icons/obj/chairs.dmi'
	icon_state = "brass_chair"
	item_chair = null
	anchored = TRUE

/obj/structure/chair/arrestchair/buckle_mob(mob/living/carbon/human/M, force, check_loc)
	. = ..()
	if(!(ishuman(M)))
		return
	if(M.loc != loc)
		M.forceMove(get_turf(src))
		buckle_mob(M)
		return

	M.Paralyze(3 SECONDS)

	var/correct_head = FALSE
	var/grove_marked = FALSE
	var/reward_amount = 0

	for(var/datum/bounty/b in GLOB.head_bounties)
		if(b.target == M.real_name)
			correct_head = TRUE
			reward_amount += b.amount
			GLOB.head_bounties -= b

	say(pick(list("Performing intra-cranial inspection...", "Analyzing skull structure...", "Commencing cephalic dissection...")))

	sleep(1 SECONDS)

	if(M.stat == DEAD)
		say("Target is dead, half the reward elibigle.")
		reward_amount *= 0.5

	var/list/headcrush = list('sound/effects/wounds/crack1.ogg', 'sound/effects/wounds/crack2.ogg', 'sound/effects/wounds/crackandbleed.ogg')
	playsound(src, pick_n_take(headcrush), 100, FALSE, -1)
	M.emote("scream")
	M.apply_damage(50, BRUTE, BODY_ZONE_HEAD, FALSE)
	sleep(1 SECONDS)
	playsound(src, pick(headcrush), 100, FALSE, -1)
	M.emote("agony")
	M.apply_damage(50, BRUTE, BODY_ZONE_HEAD, FALSE)

	sleep(2 SECONDS)

	if(correct_head || grove_marked)
		if(correct_head)
			say("A bounty has been fulfilled, payout to hunter is [reward_amount], Rimwatch' reward is [reward_amount*0.5].")
			budget2change((reward_amount*1.5))
	else
		say("This skull carries no reward.")
	M.Unconscious(15 SECONDS)

	sleep(2 SECONDS)
	unbuckle_all_mobs()

/obj/structure/chair/arrestchair/proc/budget2change(budget, mob/user, specify)
	var/turf/T
	if(!user || (!ismob(user)))
		T = get_turf(src)
	else
		T = get_turf(user)
	if(!budget || budget <= 0)
		return
	budget = floor(budget)
	var/type_to_put
	var/coins_to_put
	if(specify)
		switch(specify)
			if("GOLD")
				coins_to_put = budget/100
				type_to_put = /obj/item/stack/f13Cash/aureus
			if("SILVER")
				coins_to_put = budget/10
				type_to_put = /obj/item/stack/f13Cash/denarius
			if("COPPER")
				coins_to_put = budget
				type_to_put = /obj/item/stack/f13Cash/caps
	else
		var/highest_found = FALSE
		var/coins = floor(budget/100)
		if(coins)
			budget -= coins * 100
			highest_found = TRUE
			type_to_put = /obj/item/stack/f13Cash/aureus
			coins_to_put = coins
		coins = floor(budget/10)
		if(coins)
			budget -= coins * 10
			if(!highest_found)
				highest_found = TRUE
				type_to_put = /obj/item/stack/f13Cash/denarius
				coins_to_put = coins
			else
				new /obj/item/stack/f13Cash/denarius(T, coins)
		if(budget >= 1)
			if(!highest_found)
				type_to_put = /obj/item/stack/f13Cash/caps
				coins_to_put = budget
			else
				new /obj/item/stack/f13Cash/caps(T, budget)
	if(!type_to_put || coins_to_put < 1)
		return
	var/obj/item/stack/f13Cash/G = new type_to_put(T, floor(coins_to_put))
	if(user)
		user.put_in_hands(G)
	playsound(T, 'sound/misc/coindispense.ogg', 100, FALSE, -1)
