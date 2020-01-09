
#define LIGHT_MASTER_PLANE 0
#define LIGHT_DARKNESS_PLANE 1
#define LIGHT_HUD_PLANE 2

// @BACKDROP
obj
	backdrop
		icon = 'daycyclus.dmi'
		icon_state = "darkness"
		layer = BACKGROUND_LAYER
		plane = LIGHT_DARKNESS_PLANE

		New()
			..()
			transform = matrix(world.view*2+5, MATRIX_SCALE)

// @LIGHT

	light
		mouse_opacity = 0
		icon = 'daycyclusLight.dmi'
		plane = LIGHT_DARKNESS_PLANE
		blend_mode = BLEND_ADD
		appearance_flags = RESET_ALPHA | RESET_TRANSFORM | TILE_BOUND | LONG_GLIDE

		var
			scale_number = ((42 - 250)/2)
			scale_amount = 1

		New()
			..()
			transform = matrix(1,0,scale_number,0,1,scale_number)
			if(scale_amount != 1)
				transform = matrix(scale_amount, MATRIX_SCALE) * transform

// @PLANES
	planes
		master
			plane = LIGHT_MASTER_PLANE
			appearance_flags = PLANE_MASTER
			screen_loc = "CENTER"
		darkness
			plane = LIGHT_DARKNESS_PLANE
			blend_mode = BLEND_MULTIPLY
			appearance_flags = PLANE_MASTER | NO_CLIENT_COLOR
			color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,0, 1,1,1,1)
			mouse_opacity = 0
			screen_loc = "CENTER"
			New()
				..()
				if(global.day_or_night == DAY)
					color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,0, 1,1,1,1)
				if(global.day_or_night == NIGHT)
					color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,0, 0.4,0.4,0.4,1)
				vis_contents += new/obj/backdrop

mob
	var
		day_cyclus = 0
		tmp
			obj
				planes
					master/master_plane
					darkness/darkness_plane
				light/light

	Login()
		..()
		master_plane = new()
		darkness_plane = new()
		light = new()
		client.screen.Add(master_plane, darkness_plane)

		/** SPAWN LIGHT

		if((light in vis_contents)) vis_contents -= light
		else vis_contents += light

		*/

	//	vis_contents += light


	proc
		DarknessLevel(n as num)
			darkness_plane.color = list(1,0,0,0, 0,1,0,0, 0,0,1,0, 0,0,0,0, n/10,n/10,n/10,1)

		ToggleLight()
			if((light in vis_contents)) vis_contents -= light
			else vis_contents += light

		ToggleDay()
			var/i = 4
			while(i <= 10)
				DarknessLevel(i)
				i += global.day_and_night_changerate
				sleep(20/world.fps)
			day_cyclus = DAY
		ToggleNight()
			var/i = 10
			while(i > 4)
				DarknessLevel(i)
				i -= global.day_and_night_changerate
				sleep(20/world.fps)
			day_cyclus = NIGHT
