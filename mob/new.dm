var/mob_id_count = 1

mob/proc
	OnNew()

mob
	var
		id
	New()
		..()
		id = "[src.name]-[mob_id_count]"
		mob_id_count++
		OnNew()