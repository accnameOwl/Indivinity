client
	var
		Hud/UI/Chat/Window/chat_window = new

	proc
		TextToChat(_text as text)
			chat_window.AddMaptext(_text)

// By Ter
// http://www.byond.com/forum/post/2466493

Hud/UI/Chat
	appearance_flags = KEEP_TOGETHER
	mouse_opacity = 0
	var
		obj/background
		obj/fill

		width = 0
		height = 0
		orientation = EAST

	New()
		Build()
		vis_contents.Add(background)
		..()

	Del()
		//break relationships
		background.vis_contents -= fill
		..()

	proc
		Build()
			//create constituent objects
			background = new/Hud/UI/Chatpart/bg(null,icon)
			fill = new/Hud/UI/Chatpart/fill(null,icon)

			//arrange constituent objects
			background.vis_contents += fill

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
		AddMaptext(_text)
			fill = _text + "\n"
			fill.maptext += _text

Hud/UI/Chatpart
	layer = FLOAT_LAYER
	plane = FLOAT_PLANE

	bg
		icon_state = "bg"
		appearance_flags = KEEP_TOGETHER
		blend_mode = BLEND_MULTIPLY
	fill
		icon_state = "txt"
		maptext_height = 1400
		maptext_width = 360

	New(loc,icon)
		src.icon = icon
		..()


Hud/UI/Chat/Window
	icon = 'ChatWindow.dmi'
	screen_loc = "EAST-8:-5, SOUTH"
	width = 360
	height = 144
	orientation = SOUTH