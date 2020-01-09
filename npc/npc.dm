mob/npc/questtest

	icon = 'player_base.dmi'
	icon_state = "player"

	name = "Quest Giver"

	verb/getQuest()
		set src in view(1)
		var/Quest/q1/q = new /Quest/q1
		usr.quest_list[q._id] = q

	verb/TurninQuest()
		set src in view(1)
		if( usr.quest_list["q1"].Complete())
			world << "LOL"
			LOG("[src] has completed his first quest!")