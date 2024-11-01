/obj/item/magnetic_ammo
	name = "flechette magazine"
	desc = "A magazine containing steel flechettes."
	icon = 'icons/obj/ammo.dmi'
	icon_state = "caseless-mag"
	w_class = ITEMSIZE_SMALL
	matter = list(MAT_STEEL = 1800)
	origin_tech = list(TECH_COMBAT = 1)
	var/remaining = 9
	preserve_item = 1

/obj/item/magnetic_ammo/examine(mob/user, distance, infix, suffix)
	. = ..()
	. += "There [(remaining == 1)? "is" : "are"] [remaining] flechette\s left!"

/obj/item/magnetic_ammo/pistol
	name = "flechette magazine (small)"
	desc = "A magazine containing smaller steel flechettes, intended for a pistol."
	icon_state = "caseless-mag-short"
