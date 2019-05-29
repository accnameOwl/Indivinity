
mob/proc
	EnteredCombat()
		set background = 1

		//change in_combat flag
		if(!in_combat())
			//make sure there spawns NO MORE REGEN ontop of eachothers!
			health_regeneration_trigger(FALSE)

		in_combat(ENTERED_COMBAT)


		//loop while in combat.
		while(in_combat() == ENTERED_COMBAT)
			//drop combat if it has passed 5 seconds since last damage taken.
			var/passed_time = combat_timestamp() - world.time
			if(passed_time <= DROP_COMBAT_TIMER)
				ExitedCombat()
			sleep(world.tick_lag * 2)