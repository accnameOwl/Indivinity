

mob/player
	var
		savefile/__SAVEFILE = new("savefiles/save.sav")

	Write()
		..()
		var/savefile/__SAVE = new("savefiles/[key].sav")
		__SAVE << src

	Read()
		..()
		var/savefile/__SAVE = new("savefiles/[key].sav")
		__SAVE >> src

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