
mob
	proc/OnRespawn()
		TurnGhost(FALSE)
		dead(FALSE)
		density = 1
		combat_stats["health"].value = combat_stats["health"].limit
		LOG("<[src.type]>[src]	OnRespawn()")