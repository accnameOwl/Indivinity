mob/player/verb

	Punch()
		set name="Punch"
		set category = "Combat"

		var/target_direction = get_step(src, src.dir)

		for(var/mob/m in target_direction)
			if(m != src)
				var/damage = prob(Stats_Get("crit","value")) ? Stats_Get("strength","value")*2 : Stats_Get("strength","value")
				DealDamage(m,damage)
