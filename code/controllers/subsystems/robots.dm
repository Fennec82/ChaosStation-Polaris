SUBSYSTEM_DEF(robots)
	name = "Robots"
	init_order = INIT_ORDER_MISC_EARLY
	flags = SS_NO_FIRE

	var/list/modules_by_category         = list()
	var/list/crisis_modules_by_category  = list()
	var/list/upgrade_modules_by_category = list()
	var/list/all_module_names            = list()

	var/list/mob_types_by_title = list(
		"cyborg, flying"  = /mob/living/silicon/robot/flying,
		"robot, flying"   = /mob/living/silicon/robot/flying,
		"drone, flying"   = /mob/living/silicon/robot/flying,
		"drone, platform" = /mob/living/silicon/robot/platform
	)

	var/list/mmi_types_by_title = list(
		"robot"           = /obj/item/mmi/digital/posibrain,
		"robot, flying"   = /obj/item/mmi/digital/posibrain,
		"drone"           = /obj/item/mmi/digital/robot,
		"drone, flying"   = /obj/item/mmi/digital/robot,
		"drone, platform" = /obj/item/mmi/digital/robot
	)

/datum/controller/subsystem/robots/Initialize(start_uptime)

	for(var/module_type in subtypesof(/obj/item/robot_module))
		var/obj/item/robot_module/module = module_type
		if(initial(module.unavailable_by_default))
			continue
		var/module_category = initial(module.module_category)
		var/module_name = initial(module.display_name)
		if(module_name && module_category)
			if(initial(module.upgrade_locked))
				LAZYINITLIST(upgrade_modules_by_category[module_category])
				LAZYSET(upgrade_modules_by_category[module_category], module_name, module)
			else if(initial(module.crisis_locked))
				LAZYINITLIST(crisis_modules_by_category[module_category])
				LAZYSET(crisis_modules_by_category[module_category], module_name, module)
			else
				LAZYINITLIST(modules_by_category[module_category])
				LAZYSET(modules_by_category[module_category], module_name, module)
			all_module_names |= module_name
	all_module_names = sortTim(all_module_names, /proc/cmp_text_asc)

/datum/controller/subsystem/robots/proc/get_available_modules(module_category, crisis_mode, include_override)
	. = list()
	if(modules_by_category[module_category])
		. += modules_by_category[module_category]
	if(crisis_mode && crisis_modules_by_category[module_category])
		. |= crisis_modules_by_category[module_category]
	if(include_override && upgrade_modules_by_category[module_category])
		var/list/modules = upgrade_modules_by_category[module_category]
		if(modules[include_override])
			.[include_override] = modules[include_override]

/datum/controller/subsystem/robots/proc/get_mmi_type_by_title(check_title)
	. = mmi_types_by_title[lowertext(trim(check_title))] || /obj/item/mmi

/datum/controller/subsystem/robots/proc/get_mob_type_by_title(check_title)
	. = mob_types_by_title[lowertext(trim(check_title))] || /mob/living/silicon/robot
