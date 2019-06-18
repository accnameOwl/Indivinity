client


	New()
		if((. = ..()))
			KeyboardUpdate()
			UIUpdate()





	proc
		UIUpdate()
			set waitfor = 0
			var/_old = mob.Stats_Get("health","value") / mob.Stats_Get("health","limit")
			while(src)
				//dir : screen/hud/ui_frames.dm

				//update health frame
				var/_new = mob.Stats_Get("health","value") / mob.Stats_Get("health","limit")
				if(_new != _old)
					health_frame.setValue(_new)
					_old = _new
				//update mana frame
			//	mf_fg.Update(mob.Stats_Get("mana","value") / mob.Stats_Get("mana","limit")*100)
				sleep(20/world.fps)

		KeyboardUpdate()
			set waitfor = 0
			var/list/k = keybinds
			while(src)
				var/move_dir = k["DpadU"].getValue() + k["DpadD"].getValue() + k["DpadL"].getValue() + k["DpadR"].getValue()
				if((move_dir&3)==3) move_dir -= 3
				if((move_dir&12)==12) move_dir -= 12
				if(move_dir)
					step(src.mob, move_dir, mob.step_size)
				sleep(10/world.fps)


		KeyboardInput()