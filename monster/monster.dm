
Monster

	parent_type = /mob/npc

	icon = 'monster.dmi'
	icon_state = "monster1"

	bound_width = 8
	bound_height = 8


	proc
		FoundTarget(mob/m)
		ChaseState()
		ResetState()
		RestState()
		AttackState()
		CastingState()
		ShowAreatrigger()
		HideAreatrigger()
		GetChaseDist(loc)


	New()
		..()
		combat_stats = list(\
			"health" = new/Stat("health", 100, 1, 100, 1.1, 1.2),
			"mana" = new/Stat("mana", 2, 1, 100),
			"regen" = new/Stat("regen", 4, 1, 100, 1.1, 1.02),
			"manaregen" = new/Stat("manaregen", 1, 1, 100),

			"strength" = new/Stat("strength", 1, 1, 100),
			"intellect" = new/Stat("intellect", 1, 1, 100),

			"crit" = new/Stat("crit",4,1, 1#INF, 1, 1))