

client
	var
		list/keybinds_personal = list("Tab" = "Tab-Target", "1" = "voidspear","2" = "glitter", "3" = "firearrow", "4" = "goldenspears")
	onRawPress(key)
		if((.=..()))

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