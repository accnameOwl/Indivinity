mob/player
	OnLogin()
		src.loc = locate(5,5,1)



		var cpu_text/o = new
		client.screen += o
		spawn() o.update()



cpu_text
	parent_type = /obj

	screen_loc = "NORTHEAST"
	maptext_width = 32

	proc/update()
		while(src)
			if(world.cpu >= 0)
				maptext = "cpu: <font color=#FF5555>[world.cpu]%</font>"
			else
				maptext = "cpu: [world.cpu]%"
			sleep(world.tick_lag)