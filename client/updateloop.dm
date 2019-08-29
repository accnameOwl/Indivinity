client


	New()
		if((. = ..()))
			spawn MoveLoop()
			spawn UIUpdate()





	proc

		MoveLoop()
			set waitfor = 0
			var/list/k = keybinds
			while(src)
				var/move_dir = k["DpadU"].getValue() + k["DpadD"].getValue() + k["DpadL"].getValue() + k["DpadR"].getValue()
				if((move_dir&3)==3) move_dir -= 3
				if((move_dir&12)==12) move_dir -= 12
				if(move_dir)
					mob.Step(/*src.mob,*/ move_dir, mob.step_size)
				sleep(10/world.fps)


//		KeyboardInput()