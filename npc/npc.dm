mob/npc/questtest



	verb/getQuest()
		set src in view(1)
		var/mob/player/m = usr
		m.QuestAdd("1")

	verb/TurninQuest()
		set src in view(1)
		var/mob/player/m = usr
		if(m.QuestComplete("1"))
			world << "You completed the quest!"