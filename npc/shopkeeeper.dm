mob/npc/shopkeeper

	var/list/sales_list




	OnNew()
		if( !length(sales_list) )
			sales_list = list()
