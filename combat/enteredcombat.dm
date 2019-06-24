
mob/proc
	EnteredCombat()
		set background = 1

		//change in_combat flag
		if(in_combat() == OUT_OF_COMBAT)
			//make sure there spawns NO MORE REGEN ontop of eachothers!
			health_regeneration_trigger(FALSE)

		in_combat(ENTERED_COMBAT)

		var/passed_time
		//loop while in combat.
		while(combat_flags["in_combat"] == ENTERED_COMBAT)
			passed_time = combat_timestamp() - world.time
			//drop combat if it has passed 5 seconds since last damage taken.
			if(passed_time <= DROP_COMBAT_TIMER)
				//breaks the loop by changing combat_flags["in_combat"] to OUT_OF_COMBAT
				ExitedCombat()
			sleep(20/world.fps)