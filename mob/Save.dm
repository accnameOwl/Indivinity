

//save!!!!!!!
mob/proc/Save()

	if(fexists("savefile/[ckey].txt"))
		fdel("savefile/[ckey].txt")
	var/savefile/F = new("savefile/[ckey].txt")
	F["src"] << src
	F["x"] << x
	F["y"] << y
	F["z"] << z
	src.Write(F)


/*

	F << src
	F << icon
	F << overlays
	F << underlays
	F << cooldowns

	//reset in-combat variables on save
	F.cd = "combat"
	F["combat_timestamp"] << 0
	F["health_regeneration_trigger"] << FALSE
	F["in_combat"] << FALSE
	F["combat_stats"] << combat_stats

	F.cd = ".."
	F["x"] << x
	F["y"] << y
	F["z"] << z

*/