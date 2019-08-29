obj/spell

	var
		decay_time = 0
		damage
		damage_multipl = 1

	layer = MOB_LAYER + 1


	New(location, mob/m, _damage)
		if(src)
			damage = _damage * 1

		spawn(decay_time)
			if(src) src.loc = null



	proc/Attack(mob/m)