Monster

	//ai
	var
		//distance related variables
		aggro_dist = 5
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
		obj/Areatrigger/areatrigger

		//home_loc is the location to where monsters spawn, and return if failing chasing a player
		home_loc

		//last_attack_timestamp is the time where monster attacked the last time.
		//attacktime can be reduced by changing attack_speed
		last_attack_timestamp = 0
		//ticks untill next attack
		attack_speed = 10

	New()
		..()
		ShowAreatrigger(src)
		home_loc = src.loc

	FoundTarget(mob/m)
		if(!target)
			target = m
			sleeping = 0
			HideAreatrigger()
			ChaseState()

	ChaseState()
		//conditions
		if( !target.dead() || !dead())

			var
				dist = get_dist( src, target )
				dir = get_dir( src, locate(target.x, target.y, target.z) )
				max_dist = get_dist( src, home_loc )
			//chase loop
			//condition: while distance between monster and target, and while there is a target
			while(dist <= chase_dist && target && !dead())
				//if by some reason target is removed, return with ResetState()
				if(!target)
					return ResetState()
				//update direction and distance between monster and target
				dist = get_dist( src, target )
				dir = get_dir( src, locate(target.x, target.y, target.z) )
				max_dist = get_dist( src, home_loc )

				//default returnvalue set to step towards target
				. = step(src, dir, step_size)

				//if step fails, do a randomized step
				if(!.)
					step_rand(src)

				if(max_home_dist && max_dist >= max_home_dist)
					return ResetState()

				//if there is an overwritten CastingState()
				//do CastingState()
				if(dist <= cast_reach_dist)
					CastingState()

				//forward to ResetState()
				if(dist <= attack_reach_dist)
					AttackState()

				sleep(world.tick_lag * chase_speed)

			ResetState()

	AttackState()
		if( world.time - last_attack_timestamp >= attack_speed )
			if( target.dead() )
				return ResetState()
			last_attack_timestamp = world.time
			DealDamage(target, Stats_Get("strength","value"))

	ResetState()
		target = null
		sleeping = 1
		var/dist = get_dist(src, home_loc)
		var/dir = get_dir(src, home_loc)
		while(dist > 0)
			. = step(src, dir)
			if(!.)
				step_rand(src)
			dist = get_dist(src, home_loc)
			dir = get_dir(src, home_loc)
			sleep(world.tick_lag)

		ClearThreat()
		ShowAreatrigger(src)

	ShowAreatrigger(Monster/m)
		if(!areatrigger)
			areatrigger = new/obj/Areatrigger(m)

			//scale the areatrigger, relative to the monsters aggro_dist
			areatrigger.Scale(aggro_dist,aggro_dist)
			//Change it's bounds and offsets
			areatrigger.ChangeBounds((aggro_dist * world.icon_size/2) *-1, (aggro_dist * world.icon_size / 2)*-1, aggro_dist, aggro_dist)
		areatrigger.Relocate(src.loc)


	HideAreatrigger()
		areatrigger.Relocate(locate(0,0,0))
#define AREATRIGGER_ICON

//area trigger for monster ai
obj/Areatrigger
	parent_type = /obj
	#ifdef AREATRIGGER_ICON
	icon = 'areatrigger.dmi'
	#endif

	var/Monster/owner

	//apply scale to the Areatrigger
	proc/Scale(_x,_y)
		transform = new/matrix().Scale(_x,_y)

	proc/Relocate(loc)
		src.loc = loc

	//offsets image, bounds and step
	proc/ChangeBounds(x_offset = 0, y_offset = 0, extra_width = 0, extra_height = 0)
		pixel_x -= x_offset
		pixel_y -= y_offset

		bound_width += extra_width * world.icon_size
		bound_height += extra_height * world.icon_size

		step_x = (bound_width / 2) * -1
		step_y = (bound_height / 2) * -1

	New(Monster/_owner)
		owner=_owner

	Crossed(mob/a)
		if(isplayer(a) && !owner.dead())
			spawn() owner.FoundTarget(a)

	Del()
		world.log << "[src]:/Areatrigger.Del()"
		..()
