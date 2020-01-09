
#define CRIT 3
#define BLOCK 2
#define PARRY 1
#define NONE 0

mob
	//called by attacker, to target
	proc/DealDamage( mob/target, damage)
		if( !target.COMBAT_FLAG_DEAD )
			//if you are not in combat, call EnteredCombat()
			if( COMBAT_FLAG_INCOMBAT == OUT_OF_COMBAT )
				spawn EnteredCombat()
			//set timestamp since last time you did damage
			COMBAT_FLAG_TIMESTAMP = world.time
			var/t = prob(target.block - hit) ? BLOCK : prob(target.parry - hit) ? PARRY : prob(crit) ? CRIT : NONE
			damage = round(damage / 100 * (100-target.resist) )
			switch(t)
				if(BLOCK)
					damage = round(damage * 0.6)
					spawn RenderDamageText("<b><font COLOR=white>[damage]</font></b>")
				if(PARRY)
					damage = 0
					spawn RenderDamageText("<b>Parried!</b>", target.loc)
				if(CRIT)
					damage = round(damage*2)
					spawn RenderDamageText("<b><font COLOR=#FF4500 SIZE=+3>[damage]</font></b>", target.loc)
				if(0)
					spawn RenderDamageText("<b><font COLOR=yellow SIZE=+1>[damage]</font></b>",target.loc)

			spawn LOGCOMBAT("[src]","DealDamage()","target=[target]; damage=[damage];")
			//continue by following up the damage
			target.combat_stats["health"].value -= damage
			target.OnDamage(src)

			if(target && target.COMBAT_FLAG_DEAD)
				spawn SetTarget(null)
