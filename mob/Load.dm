

mob/proc/Load()
	if(fexists("savefile/[ckey].sav"))
		var/savefile/F = file("savefile/[ckey].sav")
		F["src"] >> src
		F["x"] >> x
		F["y"] >> y
		F["z"] >> z


		src.Read(F)
