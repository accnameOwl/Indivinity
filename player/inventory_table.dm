
client/var/update_inventory = 1

client/Stat()
	while(!update_inventory)
		sleep(5)
	if(statpanel("Inventory"))
		stat(mob.contents)
		update_inventory = 0