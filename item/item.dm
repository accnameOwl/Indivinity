Item
	parent_type = /obj

	Equipment
		name = "Equipment"
		/*
		head = 1
		armor = 2
		legs = 3
		weapon = 4
		off-hand = 5

		weights = 10
		*/
		var/slot = 0

		verb
			PickUp()
				set name = "Pick up"
				set src in view(1)
				src.loc = usr

		Weights
			name = "Weights"
			slot = 10






mob/player
	verb
		viewContents()
			set name = "view contents"
			set category = "debug"

			for(var/Item/i in contents)
				src << "[i.name] : [i.type]"
