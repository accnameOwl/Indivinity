

client
	var
		keypress_last = -1#INF
		keypress_next = -1#INF
		keypress_delay = 0.5
		list/keybinds_personal = list("Tab" = "Tab-Target", "1" = "voidspear","2" = "glitter", "3" = "firearrow", "4" = "goldenspears")
	onRawPress(key)
		if((.=..()))
			if(keypress_next - world.time >= world.tick_lag/10)
				return 0

			keypress_last = world.time
			keypress_next = world.time + keypress_delay

			switch(keybinds_personal[key])
				if("Tab-Target")
					mob.TabTarget()
				if("punch")
					mob:Punch()
				if("glitter")
					mob:Glitterlance()
				if("firearrow")
					mob:Firearrow()
				if("voidspear")
					mob:VoidSpear()
				if("goldenspears")
					mob:GoldSpears()


	proc
		ChangeKeybindPersonal(id, key)
			keybinds_personal[id] = key