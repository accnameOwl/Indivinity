
/*

Monster
	var
		Hud/UI/Maskbar/TargetHealthbar/health_bar = new
	proc
		UpdateHealthbar()
			set waitfor = 0

			health_bar.maptext = "<b>[Stats_Get("health","value")]/[Stats_Get("health","limit")]</b>"

			//old values, in percentage
			var
				old_health = Stats_Get("health","value") / Stats_Get("health","limit")

			while(health_bar)
				//dir : screen/hud/ui_frames.dm

				// updated itteration of health and manak
				var/new_health = Stats_Get("health","value") / Stats_Get("health","limit")

				//update health frame
				if(new_health != old_health)
					health_bar.setValue(new_health,1)
					health_bar.maptext = "<b>[Stats_Get("health","value")]/[Stats_Get("health","limit")]</b>"
					old_health = new_health


				sleep(10/world.fps)
*/