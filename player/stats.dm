
//mob related variables for combat _statss
mob/var
//list containing all _statss related to combat
	list/combat_stats
	block = 20
	hit = 15
	crit = 20
	resist = 0

mob/player/New()
	combat_stats = list(\
		"level" = new/Stat("level",1,1,100,1.1,1),
		"health" = new/Stat("health", 200000, 1, 100, 1.1, 1.2),
		"mana" = new/Stat("mana", 5000, 1, 100),
		"regen" = new/Stat("regen", 260, 1, 100, 1.03, 1.1),
		"manaregen" = new/Stat("manaregen", 100, 1, 100),

		"strength" = new/Stat("strength", 500, 1, 100),
		"intellect" = new/Stat("intellect", 500, 1, 100))



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
