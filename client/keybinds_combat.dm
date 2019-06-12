

client
	var
		list/keybinds_personal = list("punch" = "1",)
	onRawPress(key)
		if((.=..()))
			if(key == keybinds_personal["punch"])
				mob:Punch()

	proc
		ChangeKeybindPersonal(id, key)
			keybinds_personal[id] = key