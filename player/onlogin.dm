var/list/online_players = list()

mob/player
	OnLogin()
		online_players.Add(src)
		if(!CheckBan(src.key))
			src << "You are in the banlist"
		if(!Load())
			src.loc = locate(20,20,1)

			if(src.key == "Tafe")
				src.verbs += typesof(/Admin/Host/verb)
				src.verbs += typesof(/Admin/Admin/verb)
				mana_regeneration_add = 5
				name = "Owl"
				online_players << "Owl has connected!"
	/*
			var/Item/Equipment/Weights/weights = new
			weights.loc = src
			EquipItem(weights)
	*/
		client.UI_Show()

		//cpu usage maptext
		var cpu_text/o = new
		client.screen += o
		spawn() o.update()

		spawn() ManaRegeneration()


	OnLogout()
		online_players[src.key] = null

cpu_text
	parent_type = /obj

	screen_loc = "SOUTHEAST"
	maptext_width = 32

	proc/update()
		while(src)
			if(world.cpu >= 0)
				maptext = "cpu: <font color=#FF5555>[world.cpu]%</font>"
			else
				maptext = "cpu: [world.cpu]%"
			sleep(10/world.fps)