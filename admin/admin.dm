var/list/ban_list = list()

proc
	CheckBan(key)
		if(!ban_list[key] || ban_list[key] <= world.realtime)
			return TRUE
		else
			return FALSE

Tools/Admin

	verb
		Realtime()
			world << "<b>[world.realtime]</b>"
		Ban(player as text, duration as num)
			set category = "Tools"

			if(online_players[player] && duration)
				var/mob/player/m = online_players[player]
				if(m)
					//timestamp = duration in hours(36000 ticks in an hour)
					ban_list[m.key] = (duration * 36000) + world.realtime

		Kick(player as text)
			set category = "Tools"

			if(online_players[player])
				var/mob/player/m = online_players[player]
				if(m)
					m.loc = locate(0,0,0)
					alert(m, "You have been kicked!")
					m.Del()
		PlayerKeys()
			set category = "Tools"
			src << "player name - key "
			for(var/i in online_players)
				var/mob/player/m = online_players[i]
				src << "[m.name] : [m.key]"