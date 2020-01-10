/*

	Source: 	Ter13.Cooldownlib
	Hub:	http://www.byond.com/developer/Ter13/CooldownLib

	Credit of this file goes to Ter13@BYOND

*/

#define PRESERVE_NONE 0
#define PRESERVE_WORLDTIME 1
#define PRESERVE_REALTIME 2
mob
	var
		list/cooldowns
		list/cooldown_preserve

	proc
		GetCooldown( id )
			if( !cooldowns ) return -1#INF
			return cooldowns[id] || -1#INF

		OnCooldown()
			if( !cooldowns ) return 0
			. = -1#INF
			for(var/id in args)
				. = max(cooldowns[id], .)
			return . > world.time
		GetCooldowns()
			if( !cooldowns ) return -1#INF
			. = -1#INF
			for(var/id in args)
				. = max(cooldowns[id] || -1#INF)
			return .

		SetCooldown( id, duration, offset=1, preserve=PRESERVE_REALTIME)
			if( !cooldowns )
				cooldowns = list()
				cooldown_preserve = list()
			cooldowns[id] = (offset ? world.time + duration : duration)
			cooldown_preserve[id] = preserve

	Read(var/savefile/F,neversave=null)
		..(F,neversave)
		var/timeoffset = world.time
		var/realoffset = world.realtime + timeoffset
		var/list/cdl = cooldowns, list/cdp = cooldown_preserve, ncd
		for(var/id in cdl)
			switch(cooldown_preserve)
				if(PRESERVE_NONE)
					ncd = world.time
				if(PRESERVE_WORLDTIME)
					ncd = cdl[id]+timeoffset
				if(PRESERVE_REALTIME)
					ncd = cdl[id]+realoffset
			if(ncd>world.time)
				cdl[id] = ncd
			else
				cdl -= id
				cdp -= id
		if(!cdl.len)
			cooldowns = null
			cooldown_preserve = null