client
	proc
		UIShow()

			// player health frames
			screen.Add(player_frame,health_frame, mana_frame, experience_frame)
			player_frame.maptext = "<b><font color=white style=font-size:4>[usr.combat_stats["level"].level] [usr.name]</font></b>"
			// UI buttons
			screen.Add(button_options, button_spells, button_save)