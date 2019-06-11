var/list/ban_list = list()

proc
	CheckBan(key)
		if(!ban_list[key] || ban_list[key] <= world.realtime)
			return TRUE
		else
			return FALSE

Admin/Admin

	verb
		Realtime()
			world << "<b>[world.realtime]</b>"
		Ban(player as text, duration as num)
			set category = "Admin"

			if(online_players[player] && duration)
				var/mob/player/m = online_players[player]
				if(m)
					//timestamp = duration in hours(36000 ticks in an hour)
					ban_list[m.key] = (duration * 36000) + world.realtime

		Kick(player as text)
			set category = "Admin"

			if(online_players[player])
				var/mob/player/m = online_players[player]
				if(m)
					m.loc = locate(0,0,0)
					alert(m, "You have been kicked!")
					m.Del()
		PlayerKeys()
			set category = "Admin"
			src << "player name - key "
			for(var/i in online_players)
				var/mob/player/m = online_players[i]
				src << "[m.name] : [m.key]"


		Announce(msg as message)
			set category="Admin"
			set desc = "What would you like to Announce to the world?"
			if(!msg) return
			world <<"<b><font color=black>-----------------------------------------------------------------</font>"
			world << "<font color=green><B>Announce by [usr]:</font>"
			world << "<font color=black><B><font size=1>[msg]</font>"
			world << "<b><font color=black>-----------------------------------------------------------------</font>"

		Teleport(/*Phat T*/)
			set category = "Admin"
			switch(input("What type of Teleport would you like to preform?","Teleport") in list("Manual Teleport","Player Teleport","Cancel"))
				if("Cancel") return
				if("Manual Teleport")
					var/x = input("Input X coordinates","X Coordinates")as num|null
					if(!x) return
					var/y = input("Input Y coordinates","Y Coordinates")as num|null
					if(!y) return
					var/z = input("Input Z coordinates","Z Coordinates")as num|null
					if(!z) return
					usr.x = x
					usr.y = y
					usr.z = z

				if("Player Teleport")
					var/list/people = list()
					for(var/mob/M in online_players)
						people += M
					var/mob/M = input("Who would you like to teleport to?","Teleport")as null|anything in people
					if(!M) return
					usr.x = M.x
					usr.y = M.y-1
					usr.z = M.z



		Summon()
			set category = "Admin"

			var/list/people = list()
			for(var/mob/player/M in online_players)
				people += M
			var/mob/M = input("Who would you like to summon?","Summon")as null|anything in people
			if(!M) return
			M.x = usr.x
			M.y = usr.y-1
			M.z = usr.z