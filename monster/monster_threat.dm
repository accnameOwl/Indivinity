
Monster
	var
		//calculate damage over said duration,
		//then update target to highest damage output.

		// threat_list[mob][world.time] = damage
		list/threat_damage = list()
		list/threat_total_damage = list()

		threat_duration = 50

		threat_highest_damage = 0

	// list[m] = list(list(damage=d, time=t), list(damage=d, time=t))

	proc

		UpdateThreat(mob/m, damage)
			if(!threat_damage[m])
				threat_damage[m] = list()

			threat_damage[m] += list(list("damage" = damage, "time" = world.time))
			threat_total_damage[m] += damage

			var/i
			for( i = 1, i <= threat_damage[m].len, i++)
				//delete out-timed damages, and remove them from total damage
				if(threat_damage[m][i]["time"] <= world.time - threat_duration)
					threat_total_damage[m] -= threat_damage[m][i]["damage"]
				else
					break
			if(i > 1)
				threat_damage[m].Cut(1,i)
			if( threat_total_damage[m] >= threat_highest_damage )
				src.target = m
				threat_highest_damage = threat_total_damage[m]

			world << "threatlevel: [threat_highest_damage]\nTarget: [target]"

		ClearThreat()
			threat_damage.Cut()
			threat_total_damage.Cut()
