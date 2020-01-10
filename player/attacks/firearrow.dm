mob/player/verb

	Firearrow()

		set name = "Fire Arrow"
		set category = "Combat"
		var/mana_cost = 50
		if(!OnCooldown("firearrow") && !OnCooldown("GCD") && target  && Stats_Get("mana","value") >= mana_cost)
			AddAura(/AURA/Buff/StrongInArms)
			var/d = Stats_Get("strength","value")*1.1
			SetCooldown("firearrow", FIREARROW_CD)
			SetCooldown("GCD",GCD_CD)
			src.Stats_AddExperience("intellect", 30)
			Stats_Sub("mana","value",mana_cost)
			LOG("<[src.type]>[src]	Firearrow() target<[target]> damage<[d]>")
			new/obj/spell/firearrow(target.loc, target, d, get_dir(src,target))
obj/spell

	firearrow

		icon = 'ArrowSoul2.dmi'
		bound_x = 75
		bound_y = 55
		bound_width = 30
		bound_height = 256

		decay_time = 17

		New(location, mob/m, _damage, dir)

			..(location, m, _damage)
			src.dir = dir
			Attack(m)

		Attack(mob/m)
			spawn if( m )
				flick("attack",src)
				sleep(9)
				usr.DealDamage(m, damage)
			while(src)
				if(src.loc == null)
					break
				src.loc = m.loc
				src.step_x = m.step_x
				src.step_y = m.step_y
				sleep(10/world.fps)

