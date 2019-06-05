
mob/proc
	//called by attacker, to target
	DealDamage( mob/target, damage)
		if( isplayer(target) || isnpc(target) )
			//if target is dead, end
			if( target.dead() || target.invinsible())
				return
			//if you are not in combat, call EnteredCombat()
			if( in_combat() == OUT_OF_COMBAT )
				spawn() EnteredCombat()

			//set timestamp since last time you did damage
			combat_timestamp(world.time)

			//continue by following up the damage
			target.Stats_Sub("health", "value", damage)
			world << "Damage: [damage]"
			world << "Health: [target.Stats_Get("health","value")]"
			target.OnDamage(src)

	//called on by taking damage, regardless of source.
	OnDamage(mob/from)
		var/current_hp = src.Stats_Get("health", "value")

		//if you are not in combat and getting hit, you enter combat
		if( in_combat() == OUT_OF_COMBAT )
			spawn() EnteredCombat()

		//create a timestamp from when you got hit.
		//this tells the system when to drop combat if not hit from the past 13 seconds
		combat_timestamp(world.time)
		if(current_hp <= 0)
			OnDeath(from)