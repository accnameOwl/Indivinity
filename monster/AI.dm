Monster

	OnDamage(mob/from)
		..()
		if(!target)
			FoundTarget(from)

	//ai
	var
		//distance related variables
		aggro_dist = 5
		chase_dist = 35
		max_home_dist = 30
		attack_reach_dist = 1
		cast_reach_dist = 5

		//chase speed ((10/world.fps) * chase_speed)
		chase_speed = 10

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
			LOG("/Monster : FoundTarget() \n src: [src] \n target: [target]")
			HideAreatrigger()
			ChaseState()

	ChaseState()
		set waitfor = 0
		//conditions
		if( !target.dead() || !dead() )
			LOG("/Monster : ChaseState() \n src: [src]")

			var
				dist = get_dist( src, target )
				dir = get_dir( src, locate(target.x, target.y, target.z) )
				max_dist = get_dist( src, home_loc )
			//chase loop
			//condition: while distance between monster and target, and while there is a target
			while(dist <= chase_dist && target && !target.dead() && !dead())
				//if by some reason target is removed, return with ResetState()
				//update direction and distance between monster and target
				dist = get_dist( src, target )
				dir = get_dir( src, locate(target.x, target.y, target.z) )
				max_dist = get_dist( src, home_loc )

				//default returnvalue set to step towards target

				if(dist > attack_reach_dist)

					. = step(src, dir, step_size)

					//if step fails, do a randomized step
					if(!.)
						step_rand(src)

				if(max_home_dist && max_dist >= max_home_dist)
					return ResetState()
				//forward to ResetState()

				//attack state
				if(dist <= attack_reach_dist)
					AttackState()

				sleep((10/world.fps) * chase_speed)

			ResetState()

	AttackState()
		if( world.time - last_attack_timestamp >= attack_speed )
			LOG("[src] /Monster : AttackState(), target = [target]")
			if( target.dead() )
				return ResetState()
			last_attack_timestamp = world.time
			DealDamage(target, Stats_Get("strength","value"))

	ResetState()
		LOG("/Monster : ResetState() \n src: [src]")
		target = null
		sleeping = 1
		var/dist = get_dist(src, home_loc)
		var/dir = get_dir(src, home_loc)
		while(dist > 4 && !target)
			. = step(src, dir, step_size)
			if(!.)
				step_rand(src)
			dist = get_dist(src, home_loc)
			dir = get_dir(src, home_loc)
			sleep(10/world.fps)
		if(!target)
			home_loc = src.loc
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



//area trigger for monster ai
obj/Areatrigger
	parent_type = /obj
	#ifdef AREATRIGGER_ICON
	icon = 'areatrigger.dmi'
	#endif

	var/Monster/owner


	proc
		Relocate(location)
			src.loc = location
		//The object needs to portray correct bounds in pixel movement.
		//And also to scale, relative to parent_monster's aggro_dist

		/* ChangeBounds(x_offset, y_offset, extra_width, extra_height)
		*
		*	arguments:
		*		x_offset = pixels to shift image on the x-axis. Automaticly negative
		*		y_offset = pixels to shift image on the y-axis. Automaticly negative
		*		extra_width = how many tiles to enlarge on x-axis
		*		extra_height = how many tiles to enlarge on y-axis
		*
		*/
		ChangeBounds(x_offset = 0, y_offset = 0, extra_width = 0, extra_height = 0)

			//offset image in pixels.
			pixel_x -= x_offset
			pixel_y -= y_offset

			//increase bound size
			bound_width += extra_width * world.icon_size
			bound_height += extra_height * world.icon_size

			//offstep the object on the map, relative to it's size.
			step_x = ((bound_width / 2) * -1) + world.icon_size/2
			step_y = ((bound_height / 2) * -1) + world.icon_size/2

		/*	Scale()
		*
		*	argument:
		*		_x = times to scale in x-coordinate
		*		_y = times to scale in y-coordinate
		*
		*/
		Scale(_x,_y)
			transform = new/matrix().Scale(_x+1,_y+1)


	New(Monster/_owner)
		owner=_owner

	Crossed(mob/a)
		if(isplayer(a) && !owner.dead())
			owner.FoundTarget(a)

	Del()
		world.log << "[src]:/Areatrigger.Del()"
		..()
