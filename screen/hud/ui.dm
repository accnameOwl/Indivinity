client
	proc

		UIUpdate()
			set waitfor = 0

			//old values, in percentage
			var/old_health = mob.Stats_Get("health","value") / mob.Stats_Get("health","limit")
			var/old_mana = mob.Stats_Get("mana","value") / mob.Stats_Get("mana","limit")

			while(health_frame && mana_frame)
				//dir : screen/hud/ui_frames.dm

				// updated itteration of health and manak
				var/new_health = mob.Stats_Get("health","value") / mob.Stats_Get("health","limit")
				var/new_mana = mob.Stats_Get("mana","value") / mob.Stats_Get("mana","limit")

				//update health frame
				if(new_health != old_health)
					health_frame.setValue(new_health)
					old_health = new_health

				//update mana frame
				if(new_mana != old_mana)
					mana_frame.setValue(new_mana)
					old_mana = new_mana

				sleep(20/world.fps)