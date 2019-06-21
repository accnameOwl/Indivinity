// By Ter
// http://www.byond.com/forum/post/2466493

Hud/UI/Maskbar
	appearance_flags = KEEP_TOGETHER
	mouse_opacity = 0
	var
		obj/foreground
		obj/background
		obj/fill
		obj/mask

		width = 0
		height = 0
		orientation = EAST

	New()
		Build()
		vis_contents.Add(mask,foreground)
		..()

	Del()
		//break relationships
		vis_contents.Remove(mask,foreground)
		background.vis_contents -= fill
		mask.vis_contents -= background
		..()

	proc
		Build()
			//create constituent objects
			foreground = new/Hud/UI/Maskpart/fg(null,icon)
			background = new/Hud/UI/Maskpart/bg(null,icon)
			fill = new/Hud/UI/Maskpart/fill(null,icon)
			mask = new/Hud/UI/Maskpart/mask(null,icon)

			//arrange constituent objects
			background.vis_contents += fill
			mask.vis_contents += background

		setValue(ratio=1.0,duration=0)
			//constrain the ratio between 0 and 1
			ratio = min(max(ratio,0),1)

			//apply orientation factors for fill bar offsets
			var/fx = 0, fy = 0
			switch(orientation)
				if(EAST)
					fx = -1
				if(WEST)
					fx = 1
				if(SOUTH)
					fy = 1
				if(NORTH)
					fy = -1

			//calculate the offset of the fill bar.
			var/invratio = 1-ratio
			var/epx = width * invratio * fx
			var/epy = height * invratio * fy

			//apply the offset to the fill bar
			if(duration)
				//if a time value has been supplied, animate the transition from the current position
				animate(fill,pixel_w=epx,pixel_z=epy,time=duration)
			else
				//if a time value has not been supplied, instantly set to the new position
				fill.pixel_w = epx
				fill.pixel_z = epy

Hud/UI/Maskpart
	layer = FLOAT_LAYER
	plane = FLOAT_PLANE

	bg
		icon_state = "bg"
		appearance_flags = KEEP_TOGETHER
		blend_mode = BLEND_MULTIPLY
	fg
		icon_state = "fg"
	fill
		icon_state = "fill"
	mask
		icon_state = "mask"

	New(loc,icon)
		src.icon = icon
		..()
client
	var
		Hud/UI/Maskbar/Healthframe/health_frame = new
		Hud/UI/Maskbar/Manaframe/mana_frame = new
		Hud/UI/Maskbar/Staminaframe/stamina_frame = new	//Not added

	proc
		UI_Show()
			screen.Add(health_frame, mana_frame)

Hud/UI/Maskbar/Healthframe
	icon = 'health_frame.dmi'
	screen_loc = "WEST:15,NORTH:22"
	width = 300
	height = 20
	orientation = EAST

Hud/UI/Maskbar/Manaframe
	icon = 'mana_frame.dmi'
	screen_loc = "WEST:15,NORTH"
	width = 300
	height = 20
	orientation = EAST
Hud/UI/Maskbar/Staminaframe
	icon = 'stamina_frame.dmi'
	screen_loc = "WEST:15,NORTH:-22"