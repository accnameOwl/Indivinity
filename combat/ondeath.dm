mob/proc
	OnDeath(mob/from)
		world << "OnDeath()"
		//leave combat
		in_combat(OUT_OF_COMBAT)
		health_regeneration_trigger(FALSE)
		dead(TRUE)
		density = 0

		//Turn to a ghost
		spawn() TurnGhost(TRUE)
		src.Stats_Set("health", "value", 0)

		if(can_respawn())
			spawn(respawn_time()) OnRespawn()