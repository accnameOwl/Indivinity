//global list referencing all the shopkeepers in the game.
var/list/shopkeepers = list()

mob/npc/shopkeeper
	//
	var/list/sales_list = list()

	OnNew()
		//if shopkeeper doesn't exist in the global shopkeepers list, add him
		if( !global.shopkeepers[src])
			global.shopkeepers[src] = src

		//if sales_list hasn't been initialized from the get-go, make it a new, empty list
		if( !length(sales_list) )
			sales_list = list()

		invinsible(TRUE)

	proc
		GetItemFromSaleslist(Item/item)
			. = sales_list[item]
			if(!.)
				return FALSE

		GetSaleslist()
			. = sales_list
			if( !length(.) )
				return FALSE

		AddToSaleslist()
			for(var/i in args)
				if(isitem(i) && !sales_list[i])
					sales_list[i] = i

		SellTo(mob/player/ref, Item/item)
			var/Item/i = GetItemFromSaleslist(item)
			ref.contents += new i

		AddItem(Item/i)
			if( !sales_list[i] )
				sales_list[i] = i
	verb
		Shop()
			set src in view(1)
			var/list_of_items = input("What would you like to buy", "Shop list") in sales_list + list("cancel")
			switch(list_of_items)
				if("cancel")
					return FALSE
				else
					SellTo(usr, list_of_items)


mob/npc/shopkeeper
	shopkeeper1
		name = "Shopkeeper"
		sales_list = list("Weights" = /Item/Equipment/Weights)