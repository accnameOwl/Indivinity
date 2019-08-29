#define MANAVAL combat_stats["mana"].value
#define MANALIMIT combat_stats["mana"].limit

mob

	proc/ManaRegeneration()
		set waitfor = 0
		var
			last_tick_of_mana_regen = 0

		while(src)

			if(MANAVAL < MANALIMIT && last_tick_of_mana_regen == 1#INF)
				last_tick_of_mana_regen = -1

			if(world.time >= last_tick_of_mana_regen)

				. = Stats_Add("mana","value", MANALIMIT / 100 + mana_regeneration_add)
				if(. > MANALIMIT)
					Stats_Set("mana","value", combat_stats["mana"].limit)
					last_tick_of_mana_regen = 1#INF
				else
					last_tick_of_mana_regen = world.time + 5
			/*
				if(mana > limit)
					Stats_Set("mana","value", limit)
					last_tick_of_mana_regen = 1#INF
			*/
			sleep(10/world.fps)