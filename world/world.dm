/*
	These are simple defaults for your project.
 */

world
	fps = 40		// 25 frames per second
	icon_size = 32	// 32x32 icon size by default

	view = "41x23"		// show up to 6 tiles outward from center (13x13 view)


// Make objects move 8 pixels per tick when walking

mob
	step_size = 8

obj
	step_size = 8

world
	mob = /mob/player

