mob/var/list/quest_list = list()

Quest
	var
		_id = 0
		_type = QUEST_TYPE_NULL
		_state = QUEST_STATE_NULL

		reward = FALSE

		list/point_of_interest = list("count" = 0,"max_count" = 10,"target_id")

		list/rewards = list("xp", "gold")
	New()
		world.log << "Quest was createad! [src.type]"
		if(_id && _type)
			Start()

	proc
		Start()
			if( !_state)
				_state = QUEST_STATE_INPROGRESS
				world.log << "[src] - start() : Successfully started quest [_state]"
		Cancel()
			_state = QUEST_STATE_INPROGRESS | QUEST_STATE_COMPLETED ? QUEST_STATE_CANCELED : _state
			if(_state < QUEST_STATE_CANCELED)
				world.log << "[src] - Cancle() : Could not cancle quest"
			else
				return TRUE

		Complete(mob/player)
			if(_state < QUEST_STATE_COMPLETED)
				world.log << "[src] Completed!"
				_state = QUEST_STATE_COMPLETED
				Reward(player)
				return TRUE

		Reward(mob/player)
			player << "Reward"

		ComparePointOfInterestTarget(id = "")
			if(id == point_of_interest["target_id"])
				. = TRUE
		ComparePointOfInterestCount(count)
			if(count == point_of_interest["count"])
				. = TRUE
		AddPointOfInterestCount(mob/m)
			if(m && point_of_interest["count"])
				world.log << "[src._id] - AddPointOfInterestCount()"
				point_of_interest["count"]++
				if(point_of_interest["count"] >= point_of_interest["max_count"])
					. = Complete(m)
		CompareIDWithPOI(mob/player, id)
			world.log << "[src._id] - CheckOnKill()"
			if(player && id)
				. = ComparePointOfInterestTarget(id) ? AddPointOfInterestCount(player) : null



mob
	proc
		/**
			Called when comparing an objective towards a quest, in the scope of /mob
		*/
		QuestPeekType(_type)
			if(!_type)
				world.log << "<[src.type]> [src] - QuestPeekTargetType() : Incorrect argument value. Expecting item type as argument, got [_type]"
				return
			for(var/Quest/q in quest_list)
				if(q._type == QUEST_TYPE_NULL || q._state != QUEST_STATE_INPROGRESS || q.point_of_interest["target"] != _type)
					continue
				else
					q.CompareIDWithPOI(src, _type)
					world.log << "<[src.type]>[src] - QuestSearchForKill([_type]) : successfully found quest."
		QuestCancel(quest_id)
			if(quest_list[quest_id])
				quest_list[quest_id] = null


/**
	@QUESTS
*/
Quest/q1 //Test quest
	_id = "q1"
	_type = QUEST_TYPE_KILL
	_state = QUEST_STATE_PENDING
	point_of_interest = list("target" = /Monster/monster4, "max_count" = 5)

Quest/q2
	_type = QUEST_TYPE_GATHER
	_state = QUEST_STATE_PENDING
	point_of_interest = list("target" = /Item/Equipment/Weights, "max_count" = 1)
