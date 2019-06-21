
mob/Click()
	var/mob/player/p = usr
	if(src != p && src != p.target)
		p.target = src
		p << "target: [p.target]"

mob/player/verb

	Glitterlance()

		set name = "Glitter lance"
		set category = "Combat"

		if( target )
			new/obj/spell/glitterlance(target.loc, target, Stats_Get("strength","value"))




obj/spell/glitterlance

	icon = 'Glitterlance.dmi'
//	icon_state = "Explode"

	layer = MOB_LAYER+1


	bound_width = 256
	bound_height = 256

	step_x = -128

	var/damage = 0

	New(location, mob/m, _damage)

		spawn if(src)
			damage = _damage
			Attack(m)
		spawn(12)
			if(src) src.loc = null

	proc/Attack(mob/m)
		if( m != src)
			flick("Explode",src)
			usr.DealDamage(m, damage)
		while(src)
			if(src.loc == null)
				break
			src.loc = m.loc
			src.step_x = m.step_x-128
			src.step_y = m.step_y
			sleep(10/world.fps)