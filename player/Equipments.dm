#define ITEM_SLOT_HEAD		1
#define ITEM_SLOT_ARMOR		2
#define ITEM_SLOT_LEGS		3
#define ITEM_SLOT_WEAPON	4
#define ITEM_SLOT_off-hand	5
#define ITEM_SLOT_WEIGHTS 	10

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


		InventoryRemoveItem(Item/Equipment/item)
			equipped_items[item.slot] = null

		InventoryEquipItem(Item/Equipment/item)
			if( !equipped_items[item.slot] )
				equipped_items[item.slot] = item
