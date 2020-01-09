mob
	var/mob/target

	verb/TabTarget()
		var/list/_l = list()
		for(var/Monster/m in oview(src, 15))
			if(target !=m && !m.COMBAT_FLAG_DEAD)
				_l.Add(m)
		SetTarget(_l[1])

	proc/SetTarget(mob/m)
		target = m
		LOGCOMBAT(src,"SetTarget()","target=[target];")
		. = client && target ? client.AddTargetUI() : client.RemoveTargetUI()

	Click()
		var/mob/player/p = usr
		if(src != p && src != p.target)
			p.SetTarget(src)
