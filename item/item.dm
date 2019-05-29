Item
	parent_type = /obj

	Armor
		name = "armor"
	Sword
		name = "sword"



mob/player
	verb
		viewContents()
			set name = "view contents"
			set category = "debug"

			for(var/Item/i in contents)
				src << "[i.name] : [i.type]"
