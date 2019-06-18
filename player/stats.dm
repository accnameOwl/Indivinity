
//mob related variables for combat _statss
mob/var
//list containing all _statss related to combat
	list/combat_stats

mob/player/New()
	combat_stats = list(\
		"health" = new/Stat("health", 100, 1, 100, 1.1, 1.2),
		"mana" = new/Stat("mana", 2, 1, 100),
		"regen" = new/Stat("regen", 4, 1, 100, 1.03, 1.1),
		"manaregen" = new/Stat("manaregen", 1, 1, 100),

		"strength" = new/Stat("strength", 10, 1, 100),
		"intellect" = new/Stat("intellect", 1, 1, 100),

		"crit" = new/Stat("crit",4,1, 1#INF, 1, 1))


//mob gain experience for _statss
mob/proc
	Stats_AddExperience( s, _experience)
		if( s && _experience)
			var Stat/_stats = src.combat_stats && src.combat_stats[s]
			_stats.AddExperience( _experience )


//Set, get and add
mob/proc
	Stats_Get( name, variable )
		var Stat/_stat = src.combat_stats && src.combat_stats[name]
		return _stat.vars[variable]

	Stats_Set( name, variable, value )
		var Stat/_stat = src.combat_stats && src.combat_stats[name]
		_stat.vars[variable] = value

	Stats_Add( name, variable, value)
		var Stat/_stat = src.combat_stats && src.combat_stats[name]
		_stat.vars[variable] += value
	Stats_Sub( name, variable, value)
		var Stat/_stat = src.combat_stats && src.combat_stats[name]
		_stat.vars[variable] -= value
