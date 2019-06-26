mob
	//called on by taking damage, regardless of source.
	proc/OnDamage(mob/from)

		if(Stats_Get("health", "value") <= 0)
			return OnDeath(from)

		//if you are not in combat and getting hit, you enter combat
		if( in_combat() == OUT_OF_COMBAT )
			spawn EnteredCombat()

		//create a timestamp from when you got hit.
		//this tells the system when to drop combat if not hit from the past 13 seconds
		combat_timestamp(world.time)