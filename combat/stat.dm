Stat/var
	name = ""
	level = 0

	value = 0
	limit = 0

	experience = 0
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
			value = limit
			++level
			experience -= limit_experience
			limit_experience = round( limit_experience* experience_multiplier)


			world << "[name] level: [level]"