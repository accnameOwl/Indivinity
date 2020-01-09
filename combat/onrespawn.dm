
mob
	proc/OnRespawn()
		TurnGhost(FALSE)
		dead(FALSE)
		density = 1
		combat_stats["health"].value = combat_stats["health"].limit

		LOGCOMBAT(src,"OnRespawn()",";;")