
mob
	//called by attacker, to target
	proc/DealDamage( mob/target, damage)
		if( isplayer(target) || isnpc(target) || !target.dead() )
			//if you are not in combat, call EnteredCombat()
			if( in_combat() == OUT_OF_COMBAT )
				spawn EnteredCombat()

			//set timestamp since last time you did damage
			combat_timestamp(world.time)

			var/t = prob(target.block-hit) ? 2 : prob(crit)

			switch(t)
				if(2) //block
					damage = 0
					spawn RenderDamageText("<b>blocked!</b>", target.loc, target.step_x, target.step_y)
				if(1) //crit
					damage = round(damage * 2 - target.resist)
					spawn RenderDamageText("<b><font color=#FF4500 style=font-size:8;>[damage]</font></b>", target.loc, target.step_x, target.step_y)
				if(0) //standard
					damage = round(damage - target.resist )
					spawn RenderDamageText("<b><font color=yellow style=font-size:3;>[damage]</font></b>",target.loc, target.step_x, target.step_y)

			if(ismonster(target))
				//var/Monster/monster = target
				spawn target:UpdateThreat(src,damage)

			//continue by following up the damage
			target.Stats_Sub("health", "value", damage)
			target.OnDamage(src)

			if(target && target.dead())
				spawn SetTarget(null)
