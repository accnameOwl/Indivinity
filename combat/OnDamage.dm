mob
	//called on by taking damage, regardless of source.
	proc/OnDamage(mob/from)

		if(combat_stats["health"].value <= 0)
			return OnDeath(from)

		//if you are not in combat and getting hit, you enter combat
		if( COMBAT_FLAG_INCOMBAT == OUT_OF_COMBAT )
			spawn EnteredCombat()

		//create a timestamp from when you got hit.
		//this tells the system when to drop combat if not hit from the past 13 seconds
		COMBAT_FLAG_TIMESTAMP = world.time