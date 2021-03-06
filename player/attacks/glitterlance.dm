mob/player/verb

	Glitterlance()

		set name = "Glitter lance"
		set category = "Combat"
		var/mana_cost = 10
		if(!OnCooldown("glitterlance") && !OnCooldown("GCD") && target  && Stats_Get("mana","value") >= mana_cost)
			var/d = Stats_Get("strength","value")
			SetCooldown("glitterlance", GLITTERLANCE_CD)
			SetCooldown("GCD",GCD_CD)
			Stats_AddExperience("strength", 30)
			Stats_Sub("mana","value",mana_cost)
			LOG("<[src.type]>[src]	Glitterlance() target<[target]> damage<[d]>")
			new/obj/spell/glitterlance(target.loc, target, d, get_dir(src,target))

obj/spell

	glitterlance

		icon = 'Glitterlance.dmi'
		bound_x = 20
		bound_y = 15
		bound_width = 30
		bound_height = 100

		decay_time = 12

		New(location, mob/m, _damage, dir)

			..(location, m, _damage)
			src.dir = dir
			Attack(m)

		Attack(mob/m)
			if( m != src)
				flick("Explode",src)
				usr.DealDamage(m, damage)
			while(src)
				if(src.loc == null)
					break
				src.loc = m.loc
				src.step_x = m.step_x
				src.step_y = m.step_y
				sleep(10/world.fps)
