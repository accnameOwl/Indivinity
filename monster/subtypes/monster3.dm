Monster/monster3
	name = "Black basic"

	icon_state = "monster3"

	//distance related variables
	aggro_dist = 15
	chase_dist = 20
	max_home_dist = 40
	attack_reach_dist = 1
	cast_reach_dist = 5

	//chase speed ((10/world.fps) * chase_speed)
	chase_speed = 1.8

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