mob/proc
	ExitedCombat()
		//if src is npc, turn AI to LostAggroState()
		if( ismonster(src) || isnpc(src))
			in_combat(EXITED_COMBAT)
		//if src is a player, make him get out of combat
		else
			in_combat(OUT_OF_COMBAT)
		//Trigger health Regeneration
		if(!health_regeneration_trigger())
			. = HealthRegeneration()

		//reset time of last damage taken
		combat_timestamp(0)