
#ifdef TEST_MODE
	#undef DAYCYCLE
	#define AREATRIGGER_ICON
	#if defined(AREATRIGGER_CROSSED_AI) && defined(NO_AI)
		#undef AREATRIGGER_CROSSED_AI
	#endif

#endif

#define DAYNIGHTCYCLE_ENABLEDAY 1
#define DAYNIGHTCYCLE_ENABLENIGHT 1

//Day and Night cyclus
#define DAYCYCLE
#define NIGHT FALSE
#define DAY TRUE
var
	// Range: 0.1 > 1
	day_and_night_changerate = 0.1
	day_and_night_updateloop = 18000
	day_or_night = NIGHT

world
	proc
		DayAndNightLoop()
			set waitfor = 0
			set background = 1
			#ifdef DAYCYCLE
			spawn while(TRUE)
				#ifdef DAYNIGHTCYCLE_ENABLEDAY
				if(day_or_night==NIGHT)
					for(var/mob/player/p in world)
						spawn(10/world.fps) p.ToggleDay()
					day_or_night = DAY
					sleep(global.day_and_night_updateloop/30)
				#endif
				#ifdef DAYNIGHTCYCLE_ENABLENIGHT
				if(day_or_night == DAY)
					for(var/mob/player/p in world)
						spawn(10/world.fps) p.ToggleNight()
					day_or_night = NIGHT
					sleep(global.day_and_night_updateloop/30)
				#endif
			#else
			world.log << "Day and night cycle turned off"
			#endif

	New()
		..()
		DayAndNightLoop()
