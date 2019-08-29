#define COMBAT_FLAG_DEAD		combat_flags["dead"]
#define COMBAT_FLAG_CANRESPAWN	combat_flags["can_respawn"]
#define COMBAT_FLAG_RESPAWNTIME combat_flags["respawn_time"]
#define COMBAT_FLAG_SEEGHOSTS	combat_flags["see_ghosts"]
#define COMBAT_FLAG_INCOMBAT	combat_flags["in_combat"]
#define COMBAT_FLAG_TIMESTAMP	combat_flags["combat_timestamp"]
#define COMBAT_FLAG_HRT			combat_flags["health_regeneration_trigger"]
#define COMBAT_FLAG_INVINSIBLE	combat_flags["invinsible"]


mob
	var
		//list of personal flags, related to combat.

		list/combat_flags = list(\
			"dead" = FALSE,
			"can_respawn" = TRUE,
			"respawn_time" = 50,
			"see_ghosts" = FALSE,
			"in_combat" = FALSE,
			"combat_timestamp" = 0,
			"health_regeneration_trigger" = FALSE,
			"invinsible" = FALSE,
			)
	proc
		//use to call for, or change a combat flag inside "combat_flags"
		in_combat(flag)
			if(flag != null)
				combat_flags["in_combat"] = flag
			return combat_flags["in_combat"]


			if(flag == null)
				return combat_flags["in_combat"]
			combat_flags["can_respawn"] = flag
		can_respawn(flag)
		//	. = combat_flags["can_respawn"] = flag|combat_flags["can_respawn"]
			if(flag == null)
				return combat_flags["can_respawn"]
			combat_flags["can_respawn"] = flag

		see_ghosts(flag)
			if(flag == null)
				return combat_flags["see_ghosts"]
			combat_flags["see_ghosts"] = flag

		dead(flag)
			if(flag == null)
				return combat_flags["dead"]
			combat_flags["dead"] = flag

		combat_timestamp(time)
			if(time == null)
				return combat_flags["damage_taken_worldtime"]
			combat_flags["damage_taken_worldtime"] = time

		health_regeneration_trigger(flag)
			if(flag == null)
				return combat_flags["health_regeneration_trigger"]
			combat_flags["health_regeneration_trigger"] = flag

		respawn_time(flag)
			if(flag == null)
				return combat_flags["respawn_time"]
			combat_flags["respawn_time"] = flag
		invinsible(flag)
			if(flag == null)
				return combat_flags["invinsible"]
			combat_flags["invinsible"] = flag
