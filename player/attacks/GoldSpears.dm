mob/player/verb

	GoldSpears()
		set name = "Gold spears"
		set category = "Combat"
		var/mana_cost = 120
		if(!OnCooldown("goldspears") && !OnCooldown("GCD") && target  && Stats_Get("mana","value") >= mana_cost)
			SetCooldown("goldspears", GOLDENSPEARS_CD)
			SetCooldown("GCD",GCD_CD)
			src.Stats_AddExperience("intellect", 300)
			Stats_Sub("mana","value",mana_cost)

			var/obj/spell/goldspears/player/i = new
			src.overlays += i
			spawn(20)
				src.overlays-=i
				new/obj/spell/goldspears/target(target.loc, target, Stats_Get("intellect","value")*1.16, get_dir(src,target))

obj/spell

	goldspears/target

		icon = 'DeadArmy.dmi'
		bound_x = 100
		bound_y = 18
		bound_width = 46
		bound_height = 15

		decay_time = 20

		New(location, mob/m, _damage, dir)

			..(location, m, _damage)
			src.dir = dir
			Attack(m)

		Attack(mob/m)
			spawn if( m )
				flick("target",src)
				sleep(3)
				usr.DealDamage(m, damage)
			while(src)
				if(src.loc == null)
					break
				src.loc = m.loc
				src.step_x = m.step_x
				src.step_y = m.step_y
				sleep(10/world.fps)

	goldspears/player

		icon = 'DeadArmy.dmi'
		bound_x = 100
		bound_y = 30
		bound_width = 46
		bound_height = 15

		pixel_x = -128
		pixel_y = -30

		New()
			flick("player",src)