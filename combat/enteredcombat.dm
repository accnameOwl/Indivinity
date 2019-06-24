
mob/proc
	EnteredCombat()
		set background = 1

		switch(in_combat())
			if(EXITED_COMBAT) // monter AI
				return
			if(OUT_OF_COMBAT)
				health_regeneration_trigger(FALSE)
		in_combat(ENTERED_COMBAT)

		var/passed_time = 0
		//loop while in combat.
		while(in_combat())
			passed_time = combat_timestamp() - world.time
			//drop combat if it has passed 5 seconds since last damage taken.
			if(passed_time <= DROP_COMBAT_TIMER)
				//breaks the loop by changing combat_flags["in_combat"] to OUT_OF_COMBAT
				return ExitedCombat()
			sleep(10/world.fps)