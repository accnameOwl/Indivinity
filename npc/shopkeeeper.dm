//global list referencing all the shopkeepers in the game.
var/list/shopkeepers

mob/npc/shopkeeper

	//
	var/list/sales_list

	OnNew()
		//if shopkeeper doesn't exist in the global shopkeepers list, add him
		if( !global.shopkeepers[src] || global.shopkeepers[src] != src )
			global.shopkeepers[src] = src

		//if sales_list hasn't been initialized from the get-go, make it a new, empty list
		if( !length(sales_list) )
			sales_list = list()

	proc
		GetSaleslist()
			. = 0
			if( length(sales_list) )
				. = sales_list

		AddToSaleslist()
			for(var/i in args)
				if(isitem(i) && !sales_list[i])
					sales_list[i] = i


