Monster/monster2
	name = "Black basic"

	icon_state = "monster2"

	//distance related variables
	aggro_dist = 10
	chase_dist = 15
	max_home_dist = 30
	attack_reach_dist = 1
	cast_reach_dist = 5

	//chase speed ( sleeptime would be world.tick_lag * chase_speed )
	chase_speed = 2

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