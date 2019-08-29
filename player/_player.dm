mob/player

	verb
		OOC(var/t as text)
			for(var/mob/_mob in online_players)
				spawn _mob.client.TextToChat(t)