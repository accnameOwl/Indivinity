var/list/online_players = list()

mob/player
	OnLogin()
		online_players[src.key] = src
		if(!CheckBan(src.key))
			src << "You are in the banlist"
		src.loc = locate(5,5,1)

		if(src.key == "Tafe")
			src.verbs += typesof(/Admin/Host/verb)
			src.verbs += typesof(/Admin/Admin/verb)
/*
		var/Item/Equipment/Weights/weights = new
		weights.loc = src
		EquipItem(weights)
*/


		var cpu_text/o = new
		client.screen += o
		spawn() o.update()


	OnLogout()
		online_players[src.key] = null

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