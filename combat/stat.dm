//@Stat_type
Stat/var
	name = ""
	level = 0

	value = 0
	limit = 0

	experience = 1
	limit_experience = 0
	total_experience = 0

	experience_multiplier = 1.1
	value_multiplier = 1.1

Stat/New(name = "", value = STAT_DEFAULT_VALUE, level = STAT_DEFAULT_LEVEL, limit_experience = STAT_DEFAULT_LIMITEXPERIENCE, experience_multiplier = STAT_DEFAULT_EXPERIENCEMULTIPLIER, value_multiplier = STAT_DEFAULT_VALUEMULTIPLIER)
	src.name = name
	src.value = value
	src.limit = value
	src.level = level
	src.limit_experience = limit_experience
	src.experience_multiplier = experience_multiplier
	src.value_multiplier = value_multiplier

Stat/proc

	AddExperience( xp )
		experience += xp
		total_experience += xp
		. = level
		while( experience >= limit_experience )
			limit += round( (level / 2) * value_multiplier)
			if(name != "health" || name != "regen")
				value = limit
			++level
			experience -= limit_experience
			limit_experience = round( limit_experience* experience_multiplier)

			world << "[name] level: [level]"

	Get(variable)
		return vars[variable]
	Set(variable, value)
		vars[variable] = value
	Add(variable, value)
		vars[variable] += value
	Sub(variable, value)
		vars[variable] -= value


//mob gain experience for _stats
mob/proc
	Stats_AddExperience( s, _experience)
		if( s && _experience)
			var Stat/_stats = src.combat_stats && src.combat_stats[s]
			_stats.AddExperience( _experience )


//Set, get and add
mob/proc

	//@speed:
	//Check this later on, to increase efficiency.
	//target: Remove variable declaration.
	Stats_Get( name, variable )
		return combat_stats[name].Get(variable)
	Stats_Set( name, variable, value )
		combat_stats[name].Set(variable, value)
	Stats_Add( name, variable, value)
		combat_stats[name].Add(variable, value)
	Stats_Sub( name, variable, value)
		combat_stats[name].Sub(variable, value)