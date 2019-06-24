
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

			damage = target.resist ? damage-target.resist : damage >= 1


			//set timestamp since last time you did damage
			combat_timestamp(world.time)
			var/bl = target.block ? prob(target.block-hit) : 0
			var/cr = crit ? prob(crit) : 0
			if(bl)
				damage = 0
				spawn RenderDamageText("<b>blocked!</b>", target.loc, target.step_x, target.step_y)
			if(!bl && cr)
				damage *= 2
				spawn RenderDamageText("<b><font color=#FF4500 style=font-size:8;>[damage]</font></b>", target.loc, target.step_x, target.step_y)
			else
				spawn RenderDamageText("<b><font color=yellow>[damage]</font></b>",target.loc, target.step_x, target.step_y)

			damage = prob(crit) ? damage * 2 : damage

			if(ismonster(target))
				var/Monster/monster = target
				monster.UpdateThreat(src,damage)

			//continue by following up the damage
			target.Stats_Sub("health", "value", damage)
			target.OnDamage(src)

			if(src.target == target && target.dead())
				SetTarget(null)
	//called on by taking damage, regardless of source.
	OnDamage(mob/from)
		var/current_hp = src.Stats_Get("health", "value")

		//if you are not in combat and getting hit, you enter combat
		if( in_combat() == OUT_OF_COMBAT )
			spawn EnteredCombat()

		//create a timestamp from when you got hit.
		//this tells the system when to drop combat if not hit from the past 13 seconds
		combat_timestamp(world.time)
		if(current_hp <= 0)
			OnDeath(from)

