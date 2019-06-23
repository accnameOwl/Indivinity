mob
	var
		mob/target

	verb

		TabTarget()
			var/list/_l = list()
			for(var/mob/m in oview(src, 20))
				if(target !=m && !m.dead())
					_l.Add(m)
			SetTarget(_l[1])


	proc

		SetTarget(mob/m)

			if(client)
				if(m)
					client.screen.Add(client.target_frame, client.t_health_frame, client.t_mana_frame)
					client.target_frame.maptext = "<b><font color=white style=font-size:4>[m.combat_stats["level"].level] [m.name]</font></b>"
				else
					client.screen.Remove(client.target_frame, client.t_health_frame, client.t_mana_frame)

			target = m
