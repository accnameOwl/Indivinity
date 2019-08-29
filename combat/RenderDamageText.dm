#define DAMAGETEXT_WIDTH 300

proc/RenderDamageText(text, location, offset_x, offset_y)

	var/tmp/obj/new_obj = new

	new_obj.layer = MOB_LAYER+2
	new_obj.loc = location
	new_obj.step_x = rand(-60,60) + offset_x - DAMAGETEXT_WIDTH/2
	new_obj.step_y += rand(-20,20) + offset_y
	new_obj.maptext_width = DAMAGETEXT_WIDTH
	new_obj.maptext = "<CENTER>[text]</CENTER>"

	spawn(15)
		new_obj.loc = null
	while(new_obj)
		new_obj.step_y++

		sleep(10/world.fps)