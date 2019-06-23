mob/proc
	PreRead()
	PostRead()

mob/Read()
	PreRead()
	..()
	PostRead()



mob/proc/Load()

	var/savefile/s = file("/savefile/[src.key]")
	if(fexists(s))
		s[src] >> src
		s["x"] >> src.x
		s["y"] >> src.y
		s["z"] >> src.z
		s["step_x"] >> src.step_x
		s["step_y"] >> src.step_y
		src.Read(s)
