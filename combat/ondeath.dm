mob
	proc/OnDeath(mob/from)
		//leave combat
	//	in_combat(OUT_OF_COMBAT)
		COMBAT_FLAG_INCOMBAT = OUT_OF_COMBAT
		COMBAT_FLAG_HRT = FALSE
		COMBAT_FLAG_DEAD = TRUE
		density = 0

		LOG("<[src.type]>[src]	OnDeath() from<[from]>")
		//Turn to a ghost
		TurnGhost(TRUE)
		combat_stats["health"].value = 0

		//from.Stats_AddExperience("level",grant_experience)
		from.combat_stats["level"].AddExperience(grant_experience)

		if(COMBAT_FLAG_CANRESPAWN)
			spawn(COMBAT_FLAG_RESPAWNTIME) OnRespawn()