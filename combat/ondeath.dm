mob/proc
	OnDeath(mob/from)
		//leave combat
		in_combat(OUT_OF_COMBAT)
		health_regeneration_trigger(FALSE)
		dead(TRUE)
		density = 0

		//Turn to a ghost
		TurnGhost(TRUE)
		Stats_Set("health", "value", 0)

		from.Stats_AddExperience("level",grant_experience)

		if(can_respawn())
			spawn(respawn_time()) OnRespawn()