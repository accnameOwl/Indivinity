

mob/player
	Move(turf/newLoc, Dir=0, step_x = 0, step_y = 0)
		var
			turf/oldLoc = src.loc
			oDir = src.dir
			osx = step_x
			osy = step_y
		. = ..(newLoc, Dir, step_x, step_y)
		if(equipped_items["10"])
			src.Stats_AddExperience("health",1)
			src.Stats_AddExperience("strength",1)
		if(.)
			Moved(oldLoc, oDir, osx, osy)

	proc
		Moved(turf/oldLoc, oDir=0, osx, osy)
