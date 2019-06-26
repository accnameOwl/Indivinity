
mob
	proc/OnRespawn()
		TurnGhost(FALSE)
		dead(FALSE)
		density = 1
		Stats_Set("health","value", Stats_Get("health","limit"))
	//	var/max_health = Stats_Get("health", "limit")
	//	Stats_Set("health", "value", max_health)