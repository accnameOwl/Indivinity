mob
	proc/ExitedCombat()
		//if src is npc, turn AI to LostAggroState()

		COMBAT_FLAG_INCOMBAT = ismonster(src) ? EXITED_COMBAT : OUT_OF_COMBAT
		LOG("<[src.type]>[src]	ExitedCombat() FLAG<[COMBAT_FLAG_INCOMBAT]>")

		if(!COMBAT_FLAG_HRT)
			. = HealthRegeneration()

		//reset time of last damage taken
		COMBAT_FLAG_TIMESTAMP = 0