Monster/monster4

	name = "Lezley"

	icon = 'DungeonBoss2.dmi'
	grant_experience = 90
	bound_x = 53
	bound_width = 46
	bound_y = 24
	bound_height = 30

//	pixel_x = -40
//	pixel_y = -15

	aggro_dist = 5
	chase_dist = 20
	max_home_dist = 40
	attack_reach_dist = 5

	//chase speed ((10/world.fps) * chase_speed)
	chase_speed = 1.4

	mob/player/target

	//sleeping equals no target, no chasing. rest state
	sleeping = 1

	//areatrigger is the aggro_box around monsters, that detect players.
	Areatrigger/areatrigger

	//home_loc is the location to where monsters spawn, and return if failing chasing a player
	home_loc

	//last_attack_timestamp is the time where monster attacked the last time.
	//attacktime can be reduced by changing attack_speed
	last_attack_timestamp = 0
	//ticks untill next attack
	attack_speed = 10


	AttackState()
		if( world.time - last_attack_timestamp >= attack_speed )
			LOG("[src] /Monster : AttackState(), target = [target]")
			if( target.dead() )
				return ResetState()
			last_attack_timestamp = world.time
			flick("attack",src)
			DealDamage(target, Stats_Get("strength","value"))

	New()
		..()
		combat_stats = list(\
			"level" = new/Stat("level",0,120),
			"health" = new/Stat("health", 10000, 1, 100, 1.1, 1.2),
			"mana" = new/Stat("mana", 5000, 1, 100),
			"regen" = new/Stat("regen", 100, 1, 100, 1.1, 1.02),
			"manaregen" = new/Stat("manaregen", 40, 1, 100),

			"strength" = new/Stat("strength", 20, 1, 100),
			"intellect" = new/Stat("intellect", 1, 1, 100))
		block = 20
		resist = 300
		crit = 0