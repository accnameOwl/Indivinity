var/list/quest_list = list("1" = /Quest/Intro1)

#define QUEST_OBJECTIVE_FLAG_NULL null
#define QUEST_OBJECTIVE_FLAG_KILL 1
#define QUEST_OBJECTIVE_FLAG_ITEM 2
#define QUEST_OBJECTIVE_FLAG_LOCATION 3
#define QUEST_OBJECTIVE_FLAG_TALKTO 4

//initial quest system

Quest
	var
		id = ""
		desc = ""
		complete = FALSE
		list/interraction_text_list = list()
		questlog_text = ""
		objective_flag = QUEST_OBJECTIVE_FLAG_NULL
		Objective/objective

		list/target_type_list = list()
		objective_count_current = 0
		objective_count = 0

	New()
		objective = new/Objective(id, desc, objective_flag, target_type_list, objective_count)

Objective
	parent_type = /Quest

	New(id = "", desc = "", objective_flag = QUEST_OBJECTIVE_FLAG_NULL, list/target_type_list = list(), objective_count)
		src.id = id
		src.desc = desc
		src.objective_flag = objective_flag
		AddTargetType(target_type_list)
		src.objective_count = objective_count

// Quest procs
Quest/proc
	AddTargetType(type)
		target_type_list += type

	WriteQuestText()
		return interraction_text_list

	AddObjectiveCount(amount)
		if(!complete)
			objective_count_current += amount
			if(objective_count_current >= objective_count)
				complete = TRUE
		else
			return
	GetComplete()
		if(args.len)
			complete = !complete
		else
			. = complete
mob/player
	var/list/quest_list = list()

	proc
		QuestAdd(_id)
			src.quest_list[_id] = new type(global.quest_list[_id])
			QuestShow(src.quest_list[_id])

		QuestShow(Quest/quest)
			world << quest.id
			world << quest.desc
			world << quest.target_type_list
			world << quest.objective_flag
			world << quest.objective_count + " : " + quest.objective_count_current
			world << "\n"
			for(var/i = 0, i <= quest.interraction_text_list.len, i++)
				world << quest.interraction_text_list[i]
				sleep(5)

		QuestUpdate(quest_id)
			switch( args[1] )
				if("add_objective_count")
					quest_list[quest_id].AddObjectiveCount()

		QuestGet(id)
			. = quest_list[id]
			if(!.)
				return FALSE

		QuestComplete(id)
			. = quest_list[id].complete

		QuestAddCount(id, amount)
			quest_list[id].AddObjectiveCount(amount)