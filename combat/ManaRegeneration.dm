mob

	proc/ManaRegeneration()
		set waitfor = 0
		var
			__mana
			__limit
			last_tick_of_mana_regen = 0
		while(src)
			if(world.time >= last_tick_of_mana_regen)
				__mana 	= Stats_Get("mana","value")
				__limit	= Stats_Get("mana","limit")
				if(__mana < __limit )
					Stats_Add("mana","value", __limit / 100 + mana_regeneration_add)
					last_tick_of_mana_regen = world.time + 5
				if(__mana > __limit)
					Stats_Set("mana","value", __limit)
					last_tick_of_mana_regen = world.time + 20

			sleep(10/world.fps)