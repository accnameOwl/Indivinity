


mob/player/New()
	combat_stats = list(\
		"level" = new/Stat("level",1,1,100,1.1,1),
		"health" = new/Stat("health", 10000, 1, 100, 1.1, 1.2),
		"mana" = new/Stat("mana", 5000, 1, 100),
		"regen" = new/Stat("regen", 260, 1, 100, 1.03, 1.1),
		"manaregen" = new/Stat("manaregen", 100, 1, 100),

		"strength" = new/Stat("strength", 500, 1, 100),
		"intellect" = new/Stat("intellect", 500000, 1, 100))
