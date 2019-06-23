/*
	@Check

	Update location for Hud/UI/TargetOverlay
	Redo icon
	place icon relative to step_x
*/

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
/*
client
	var/list/target_overlays = list()

	proc
		AddTargetOverlay(mob/ref)
			if(!target_overlays[ref.id])
				var/image/I = image('target_overlay.dmi',usr)
				I.loc = ref
				target_overlays[ref.id] = I
				screen.Add(target_overlays[ref.id])

		RemoveTargetOverlay(mob/ref)
			screen.Remove(target_overlays[ref.id])
			target_overlays.Remove(ref.id)
*/