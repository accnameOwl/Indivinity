client
	proc

		UIUpdate()
			set waitfor = 0

			health_frame.foreground.maptext = "<b>[mob.Stats_Get("health","value")]/[mob.Stats_Get("health","limit")]</b>"
			mana_frame.foreground.maptext = "<b>[mob.Stats_Get("mana","value")]/[mob.Stats_Get("mana","limit")]</b>"


			//old values, in percentage
			var
				old_health = mob.combat_stats["health"].value / mob.combat_stats["health"].limit
				old_mana = mob.combat_stats["mana"].value / mob.combat_stats["mana"].limit
				old_exp = 1
				old_thealth = 1
				old_tmana = 1
				mob/trg


			while(health_frame && mana_frame && experience_frame)
				//dir : screen/hud/ui_frames.dm

				// updated itteration of health and manak
				var/new_health = mob.combat_stats["health"].value / mob.combat_stats["health"].limit
				var/new_mana = mob.combat_stats["mana"].value / mob.combat_stats["mana"].limit
				var/new_exp = mob.combat_stats["level"].experience	/ mob.combat_stats["level"].limit_experience
				var/new_thealth = 1
				var/new_tmana = 1

				trg = mob.target ? mob.target : null


				//update health frame
				if(new_health != old_health)
					health_frame.setValue(new_health,1)
					old_health = new_health
					health_frame.foreground.maptext = "<b>[mob.combat_stats["health"].value]/[mob.combat_stats["health"].limit]</b>"

				//update mana frame
				if(new_mana != old_mana)
					mana_frame.setValue(new_mana,1)
					old_mana = new_mana
					mana_frame.foreground.maptext = "<b>[mob.combat_stats["mana"].value]/[mob.combat_stats["mana"].limit]</b>"
				if(new_exp != old_exp)
					experience_frame.setValue(new_exp,1)
					old_exp = new_exp
					player_frame.maptext = "<b><font color=white style=font-size:4>[mob.combat_stats["level"].level] [mob.name]</font></b>"

				//update target frames
				if(trg)
					new_thealth = trg.combat_stats["health"].value/trg.combat_stats["health"].limit
					new_tmana = trg.combat_stats["mana"].value/trg.combat_stats["mana"].limit
					t_health_frame.foreground.maptext = "<b>[trg.combat_stats["health"].value]/[trg.combat_stats["health"].limit]</b>"
					t_mana_frame.foreground.maptext = "<b>[trg.combat_stats["mana"].value]/[trg.combat_stats["mana"].limit]</b>"
					if(new_thealth != old_thealth)
						t_health_frame.setValue(new_thealth, 1)
						old_thealth = new_thealth
					if(new_tmana != old_tmana)
						t_mana_frame.setValue(new_tmana, 1)
						old_tmana = new_tmana
				sleep(10/world.fps)