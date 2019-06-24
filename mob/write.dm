mob/proc
	PreWrite()
	PostWrite()


mob/Write()
	PreWrite()
	..()
	PostWrite()



mob/Read(savefile/f)
	combat_timestamp(0)
	health_regeneration_trigger(FALSE)
	in_combat(FALSE)