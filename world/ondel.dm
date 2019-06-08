world
	Del()
		OnDel()
		..()
	New()
		..()
		OnNew()


world/proc
	OnDel()
		var/savefile/s = new/savefile("bans.txt")
		s << ban_list

	OnNew()
		var/savefile/s = new/savefile("bans.txt")
		s >> ban_list