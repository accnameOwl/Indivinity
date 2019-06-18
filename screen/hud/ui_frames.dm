client
	var

		Hud/UI/Healthframe/Background/hf_bg = new
		Hud/UI/Healthframe/Foreground/hf_fg = new
		Hud/UI/Manaframe/Background/mf_bg 	= new
		Hud/UI/Manaframe/Foreground/mf_fg	= new

	proc

		UI_ShowHealthFrame()
			screen.Add(hf_bg, hf_fg)
		UI_ShowManaFrame()
			screen.Add(mf_bg, mf_fg)

Hud

	UI

		Healthframe
			var/percentage

			screen_loc = "2,16:10"

			Background
				layer = UI_LAYER
				icon = 'healthframe.dmi'
				icon_state="background"
				screen_loc = "2,16:12"

			Foreground
				layer = UI_LAYER+1
				icon = 'healthframe.dmi'
				icon_state = "foreground"
		//		maptext = "<font style=\"color: white;text-shadow: 1px, 1px, 1px;\"><b>Health</b></font>"
		//		maptext_x = 3

				Update(var/perc_arg)
					if(percentage != perc_arg)
						percentage = perc_arg
						transform = new/matrix()\
							.Translate(300/2,1)\
							.Scale(percentage/100,1)\
							.Translate(-300/2,1)
		Manaframe
			var/percentage

			screen_loc = "2,16:-9"

			Background
				layer = UI_LAYER
				icon = 'manaframe.dmi'
				icon_state="background"
				screen_loc = "2,16:-7"

			Foreground
				layer = UI_LAYER+1
				icon = 'manaframe.dmi'
				icon_state = "foreground"
		//		maptext = "<font style=\"color: white;text-shadow: 1px black, 1px black, 1px black;\"><b>Mana</b></font>"
		//		maptext_x = 3

				Update(var/perc_arg)
					if(percentage != perc_arg)
						percentage = perc_arg
						var/matrix/m = new
						m.Translate(300/2, 1)
						m.Scale(percentage/100, 1)
						m.Translate(-300/2, 1)
						transform = new/matrix()\
							.Translate(300/2,1)\
							.Scale(percentage/100, 1)\
							.Translate(-300/2,1)
						//transform = new/matrix().Scale(percentage/100,1).Translate(percentage/100,1)