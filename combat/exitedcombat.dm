mob/proc
	ExitedCombat()
		world << "ExitedCombat()"
		//if src is npc, turn AI to LostAggroState()
		if( isnpc(src) )
			in_combat(EXITED_COMBAT)
			//	src:LostAggroState()
		//if src is a player, make him get out of combat
		else
			in_combat(OUT_OF_COMBAT)

		//Trigger health Regeneration
		if(!health_regeneration_trigger())
			spawn() HealthRegeneration()

		//reset time of last damage taken
		combat_timestamp(0)