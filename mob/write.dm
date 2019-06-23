mob/proc
	PreWrite()
	PostWrite()


mob/Write()
	PreWrite()
	..()
	PostWrite()



//save!!!!!!!
mob/proc/Save()

	var/savefile/s = file("/savefile/[src.key]")
	if(fexists(s))
		fdel(s)
	s = new("/savefile/[src.key]")
	s[src] << src
	s["x"] << src.x
	s["y"] << src.y
	s["z"] << src.z
	s["step_x"] << src.step_x
	s["step_y"] << src.step_y
	src.Write(s)
