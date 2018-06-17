var/datum/announcement/minor/captain_announcement = new(do_newscast = 1)

//////////////////////////////////
//			Captain
//////////////////////////////////

/datum/job/captain
	title = "Colony Director"
	flag = CAPTAIN
	department = "Command"
	head_position = 1
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "company officials and Corporate Regulations"
	selection_color = "#1D1D4F"
	idtype = /obj/item/weapon/card/id/gold
	req_admin_notify = 1
	access = list() 			//See get_access()
	minimal_access = list() 	//See get_access()
	minimal_player_age = 14
	economic_modifier = 20

	minimum_character_age = 25
	ideal_character_age = 70 // Old geezer captains ftw

	outfit_type = /decl/hierarchy/outfit/job/captain
	job_description = "The Colony Director manages the other Command Staff, and through them the rest of the station. Though they have access to everything, \
						they do not understand everything, and are expected to delegate tasks to the appropriate crew member. The Colony Director is expected to \
						have an understanding of Standard Operating Procedure, and is subject to it, and legal action, in the same way as every other crew member."
	alt_titles = list("Colony Director" = /datum/alt_title/captain, "Site Manager" = /datum/alt_title/site_manager,
						"Overseer" = /datum/alt_title/overseer)

/*
/datum/job/captain/equip(var/mob/living/carbon/human/H)
	. = ..()
	if(.)
		H.implant_loyalty(src)
*/

/datum/job/captain/get_access()
	return get_all_station_access()


// Captain Alt Titles
/datum/alt_title/captain	// Screw it, this is the default, it has the default path
	title = "Colony Director"

/datum/alt_title/site_manager
	title = "Site Manager"

/datum/alt_title/overseer
	title = "Overseer"

//////////////////////////////////
//		Head of Personnel
//////////////////////////////////
/datum/job/hop
	title = "Head of Personnel"
	flag = HOP
	department = "Command"
	head_position = 1
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the Colony Director"
	selection_color = "#2F2F7F"
	idtype = /obj/item/weapon/card/id/silver/hop
	req_admin_notify = 1
	minimal_player_age = 10
	economic_modifier = 10

	minimum_character_age = 25
	ideal_character_age = 50

	outfit_type = /decl/hierarchy/outfit/job/hop
	job_description = "The Head of Personnel manages the Service department, the Exploration team, and most other civilians. They also \
						manage the Supply department, through the Quartermaster. In addition, the Head of Personnel oversees the personal accounts \
						of the crew, including their money and access. If necessary, the Head of Personnel is first in line to assume Acting Command."
	alt_titles = list("Head of Personnel" = /datum/alt_title/hop, "Crew Resources Officer" = /datum/alt_title/cro)

	access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway)
	minimal_access = list(access_security, access_sec_doors, access_brig, access_forensics_lockers,
			            access_medical, access_engine, access_change_ids, access_ai_upload, access_eva, access_heads,
			            access_all_personal_lockers, access_maint_tunnels, access_bar, access_janitor, access_construction, access_morgue,
			            access_crematorium, access_kitchen, access_cargo, access_cargo_bot, access_mailsorting, access_qm, access_hydroponics, access_lawyer,
			            access_chapel_office, access_library, access_research, access_mining, access_heads_vault, access_mining_station,
			            access_hop, access_RC_announce, access_keycard_auth, access_gateway)

// HOP Alt Titles
/datum/alt_title/hop
	title = "Head of Personnel"

/datum/alt_title/cro
	title = "Crew Resources Officer"

//////////////////////////////////
//		Command Secretary
//////////////////////////////////

/datum/job/secretary
	title = "Command Secretary"
	flag = BRIDGE
	department = "Command"
	department_flag = CIVILIAN
	faction = "Station"
	total_positions = 2
	spawn_positions = 2
	supervisors = "command staff"
	selection_color = "#2F2F7F"
	idtype = /obj/item/weapon/card/id/silver/secretary
	minimal_player_age = 5
	economic_modifier = 7

	access = list(access_heads, access_keycard_auth)
	minimal_access = list(access_heads, access_keycard_auth)

	outfit_type = /decl/hierarchy/outfit/job/secretary
	job_description = "A Command Secretary handles paperwork duty for the Heads of Staff, so they can better focus on managing their departments. \
						They are not Heads of Staff, and have no real authority."

// Command Secretary Alt Title
/datum/alt_title/command_secretary
	title = "Command Secretary"