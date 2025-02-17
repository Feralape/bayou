/obj/machinery/door/poddoor/gate/secure
	name = "secure gate"
	icon = 'modular/icons/obj/structures/large_gate.dmi'
	icon_state = "closed"


/obj/machinery/door/poddoor/gate/secure/preopen
	icon_state = "open"
	density = FALSE
	opacity = FALSE

/obj/machinery/door/poddoor/gate/secure/open()
	. = ..()
	if(!.)
		return
	set_opacity(FALSE)


/obj/machinery/door/poddoor/gate/secure/close()
	. = ..()
	if(!.)
		return
	set_opacity(TRUE)
