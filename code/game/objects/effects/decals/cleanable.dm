/*
USAGE NOTE
For decals, the var Persistent = 'has already been saved', and is primarily used to prevent duplicate savings of generic filth (filth.dm).
This also means 'TRUE' can be used to define a decal as "Do not save at all, even as a generic replacement." if a dirt decal is considered 'too common' to save.
generic_filth = TRUE means when the decal is saved, it will be switched out for a generic green 'filth' decal.
*/

/obj/effect/decal/cleanable
	plane = DIRTY_PLANE
	/// If `TRUE`, slimes can "eat" this decal for a small amount of nutrition.
	var/slime_food = FALSE
	var/persistent = FALSE
	var/generic_filth = FALSE
	var/age = 0
	var/list/random_icon_states = list()

/obj/effect/decal/cleanable/Initialize(var/mapload, var/_age)
	if(!isnull(_age))
		age = _age
	if(random_icon_states && length(src.random_icon_states) > 0)
		src.icon_state = pick(src.random_icon_states)
	if(!mapload || !config.persistence_ignore_mapload)
		SSpersistence.track_value(src, /datum/persistent/filth)
	. = ..()
	if (random_icon_states && length(src.random_icon_states) > 0)
		src.icon_state = pick(src.random_icon_states)

/obj/effect/decal/cleanable/Destroy()
	SSpersistence.forget_value(src, /datum/persistent/filth)
	. = ..()

/obj/effect/decal/cleanable/clean_blood(var/ignore = 0)
	if(!ignore)
		qdel(src)
		return
	..()

/obj/effect/decal/cleanable/is_slime_food()
	return slime_food

/obj/effect/decal/cleanable/slime_chomp(mob/living/simple_mob/slime/xenobio/slime) // The base amount is always the same, but not all decals can be slime'd up
	slime.adjust_nutrition(1)
	slime.visible_message(
		SPAN_NOTICE("\The [slime] rolls over \the [src] and absorbs it from \the [loc]."),
		SPAN_NOTICE("You absorb \the [src]!")
	)
	qdel(src)
