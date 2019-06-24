
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

