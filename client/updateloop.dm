client


	New()
		if((. = ..()))
			KeyboardUpdate()





	proc

		KeyboardUpdate()
			set waitfor = 0
			var/list/k = keybinds
			while(src)
				var/move_dir = k["DpadU"].getValue() + k["DpadD"].getValue() + k["DpadL"].getValue() + k["DpadR"].getValue()
				if((move_dir&3)==3) move_dir -= 3
				if((move_dir&12)==12) move_dir -= 12
				if(move_dir)
					step(src.mob, move_dir, 4)
				sleep(10/world.fps)


		KeyboardInput()