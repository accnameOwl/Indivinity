mob/player
	var/*
		head = 1
		armor = 2
		legs = 3
		weapon = 4
		off-hand = 5

		weights = 10
		*/
		list/equipped_items = list()

	proc
		EquipItem(Item/Equipment/item)
			if(item.slot == 10)
				step_size = 1
			equipped_items["[item.slot]"] = item


		RemoveItem(Item/Equipment/item)
			if(item.slot == 10)
				step_size = 2
			equipped_items[item.slot] = null