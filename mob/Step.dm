mob
	var
		step_delay = 0.25
		tmp
			last_step = -1#INF
			next_step = -1#INF

	proc
		Step(dir, delay=step_delay)
			if(next_step - world.time >= world.tick_lag / 10)
				return 0

			if(step(src, dir))
				last_step = world.time
				next_step = last_step + step_delay
				return 1
			else
				return 0
