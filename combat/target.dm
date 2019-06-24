mob
	var
		mob/target

	verb

		TabTarget()
			var/list/_l = list()
			for(var/mob/m in oview(src, 15))
				if(target !=m && !m.dead())
					_l.Add(m)
			SetTarget(_l[1])


	proc

		SetTarget(mob/m)
			target = m
			. = client && target ? client.AddTargetUI() : client.RemoveTargetUI()

client/proc
	AddTargetUI()
		screen.Add(target_frame, t_health_frame, t_mana_frame)
		target_frame.maptext = "<b><font color=white style=font-size:4>[mob.target.combat_stats["level"].level] [mob.target.name]</font></b>"

	RemoveTargetUI()
		screen.Remove(target_frame, t_health_frame, t_mana_frame)