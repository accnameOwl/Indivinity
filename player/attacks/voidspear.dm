mob/player/verb

	VoidSpear()
		set name = "Void Spear"
		set category = "Combat"
		var/mana_cost = 40
		if(!OnCooldown("voidspear") && !OnCooldown("GCD") && target  && Stats_Get("mana","value") >= mana_cost)
			SetCooldown("voidspear", VOIDSPEAR_CD)
			SetCooldown("GCD",GCD_CD)
			src.Stats_AddExperience("intellect", 30)
			Stats_Sub("mana","value",mana_cost)
			new/obj/spell/voidspear(target.loc, target, Stats_Get("intellect","value")*0.92, get_dir(src,target))


obj/spell/voidspear

	icon = 'Blizzard Charge.dmi'
	bound_x = 75
	bound_y = 55
	bound_width = 30
	bound_height = 256

	decay_time = 20

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
