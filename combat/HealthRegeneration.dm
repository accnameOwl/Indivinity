//regeneration
#define SLEEPTIME_CAP world.time+5
mob
	proc/HealthRegeneration()
		set waitfor = 0
		if( in_combat() == OUT_OF_COMBAT && !dead() && !health_regeneration_trigger())
			health_regeneration_trigger(TRUE)

			var
				subtract_time = round(Stats_Get("regen","level")/2)
				sleeptime = world.time
				i = TRUE
			while( i && !in_combat())
				if(Stats_Get("health","value") >= Stats_Get("health","limit"))
					i = FALSE

				if( world.time >= sleeptime )
					//cap how often regen procs
					if(sleeptime < REGEN_SLEEPTIME_CAP)
						sleeptime = REGEN_SLEEPTIME_CAP

					var/amount = src.Stats_Get("regen","value")
					src.Stats_Add("health","value", amount*2)

					//output amount
					LOG("regen amount: [amount]")

					//grant experience to regeneration
					src.Stats_AddExperience("regen", REGEN_EXPERIENCE_GAIN)

					//update sleeptime
					sleeptime = world.time + 15 - subtract_time

				sleep(30/world.fps)

			Stats_Set("health", "value", Stats_Get("health", "limit"))
			health_regeneration_trigger(FALSE)
