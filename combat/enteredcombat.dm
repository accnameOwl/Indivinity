
mob
	proc/EnteredCombat()
		set background = 1

		switch(COMBAT_FLAG_INCOMBAT)
			if(EXITED_COMBAT)
				return
			if(OUT_OF_COMBAT)
				COMBAT_FLAG_HRT = FALSE

		COMBAT_FLAG_INCOMBAT = ENTERED_COMBAT
		LOGCOMBAT(src,"EnteredCombat()","combat_flags<in_combat>=[COMBAT_FLAG_INCOMBAT];")

		var/passed_time = 0
		//loop while in combat.
		while(COMBAT_FLAG_INCOMBAT)
			passed_time = COMBAT_FLAG_TIMESTAMP - world.time
			//drop combat if it has passed 5 seconds since last damage taken.
			if(passed_time <= DROP_COMBAT_TIMER)
				//breaks the loop by changing combat_flags["in_combat"] to OUT_OF_COMBAT
				return ExitedCombat()
			sleep(10/world.fps)