mob/proc
	ExitedCombat()
		//if src is npc, turn AI to LostAggroState()

		in_combat( ismonster(src) || isnpc(src) ? EXITED_COMBAT : OUT_OF_COMBAT )

		if(!health_regeneration_trigger())
			. = HealthRegeneration()

		//reset time of last damage taken
		combat_timestamp(0)