
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

		UpdateThreat(mob/m, _damage)
			if(!threat_damage[m])
				threat_damage[m] = list()
			if(!target)
				FoundTarget(m)


			threat_damage[m].Add(new/Threat(world.time, _damage))
			threat_total_damage[m] += _damage

			for(var/Threat/t in threat_damage[m])
				if(t.getTime() <= world.time - threat_duration)
					threat_total_damage[m] -= t.getDamage()
					threat_damage[m].Remove(t)
			LOG("<[src.type]>[src]	UpdateThreat() target<[target]> mob<[m]> damage<[_damage]>")
			if( threat_total_damage[m] >= threat_highest_damage  && m != target)
				src.target = m
				threat_highest_damage = threat_total_damage[m]
				LOG("<[src.type]>[src]	UpdateThreat() new_target<[target]> threat<[threat_highest_damage]>")

		ClearThreat()
			LOG("<[src.type]>[src]	ClearThreat()")
			threat_damage.Cut()
			threat_total_damage.Cut()

Threat
	var
		time
		damage
	New(time, damage)
		src.time = time
		src.damage = damage
	proc
		getTime() . = time
		getDamage() . = damage