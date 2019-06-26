/*
	@Check

	Update location for Hud/UI/TargetOverlay
	Redo icon
	place icon relative to step_x
*/

client
	proc/AddTargetUI()
		screen.Add(target_frame, t_health_frame, t_mana_frame)
		target_frame.maptext = "<b><font color=white style=font-size:4>[mob.target.combat_stats["level"].level] [mob.target.name]</font></b>"

	proc/RemoveTargetUI()
		screen.Remove(target_frame, t_health_frame, t_mana_frame)


Hud/UI/TargetOverlay

	icon = 'target_overlay.dmi'
	var/mob/holder
	New(mob/m)
		holder = m

		spawn()
			while(src)
				loc = holder.loc
				step_x = holder.step_x
				step_y = holder.step_y
				if(holder.dead())
					break
				sleep(10/world.fps)
			loc = null