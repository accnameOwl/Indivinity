

proc/RenderDamageText(text, location, offset_x, offset_y)

	var/tmp/obj/new_obj = new

	new_obj.layer = MOB_LAYER+2
	new_obj.step_x = rand(-20,20) + offset_x
	new_obj.step_y += offset_y
	new_obj.maptext_width = 200
	new_obj.maptext = text
	new_obj.loc = location

	spawn(15)
		new_obj.loc = null
	while(new_obj)
		new_obj.step_y++

		sleep(10/world.fps)