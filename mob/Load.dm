

mob/proc/Load()
	return
	var/savefile/F = file("savefile/[src.key].txt")
	if(fexists(F))
		F["x"] >> x
		F["y"] >> y
		F["z"] >> z
		src.Read(F)
