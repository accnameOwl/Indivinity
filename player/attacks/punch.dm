mob/player/proc

	Punch()
		set name="Punch"
		set category = "Combat"

		for(var/mob/m in oview(1))
			var/target_direction = get_dir(src, m)
			if(target_direction == src.dir)
				var/damage = prob(Stats_Get("crit","value")) ? Stats_Get("strength","value")*2 : Stats_Get("strength","value")
				DealDamage(m,damage)