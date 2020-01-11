var/list/online_players = list()

mob/player
	Login()
		online_players.Add(src)
		if(!CheckBan(src.key))
			src << "You are in the banlist"

		if(!src.Read("saves/[copytext(src.ckey,1,2)]/[src.ckey].sav"))
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
		else
			src << "loaded"

		client.UIShow()

		//cpu usage maptext
		var cpu_text/o = new
		client.screen += o
		spawn() o.update()

		spawn() ManaRegeneration()
		LOG("&lt;[src.type]&gt;[src]	OnLogin()")

		..()


	Logout()
		online_players[src.key] = null
		..()
cpu_text
	parent_type = /obj

	screen_loc = "SOUTHEAST"
	maptext_width = 64
	maptext_height=64

	proc/update()
		while(src)
			if(world.cpu >= 0)
				maptext = "<font size=18px>cpu: <font color=#FF5555>[world.cpu]%</font></font>"
			else
				maptext = "<font size=18px>cpu: [world.cpu]%</font>"
			sleep(10/world.fps)