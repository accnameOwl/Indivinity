mob
	var/mob/target

	verb/TabTarget()
		var/list/_l = list()
		for(var/mob/m in oview(src, 15))
			if(target !=m && !m.dead())
				_l.Add(m)
		SetTarget(_l[1])

	proc/SetTarget(mob/m)
		target = m
		. = client && target ? client.AddTargetUI() : client.RemoveTargetUI()

	Click()
		var/mob/player/p = usr
		if(src != p && src != p.target)
			p.SetTarget(src)
