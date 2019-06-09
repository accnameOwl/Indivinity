world
	Del()
		OnDel()
		..()
	New()
		..()
		//world.generate_reference()
		OnNew()


world/proc
	OnDel()
		var/savefile/s = new/savefile("bans.txt")
		s << ban_list

	OnNew()
		var/savefile/s = new/savefile("bans.txt")
		s >> ban_list