Quest
	Intro1

		id = "1"
		desc = "Welcome back"

		interraction_text_list = list("Welcome back! I see you are still alive...",\
		"huh...? You don't recognize me?!",
		"Oh my, this is bad! sir, do you remember your name",
		"Your nerves seems to be unstable, go outside and kill a small black ball for me and test your strength!")

		questlog_text = "Monster1 killed:"

		objective_flag = QUEST_OBJECTIVE_FLAG_KILL

		list/target_type_list = list(/monster/monster1,)
		objective_count = 1