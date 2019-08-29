mob/player
	Write(var/savefile/F,var/list/neversave=null)

		. = ..(F,neversave)

		src.overlays.Cut()
		var/ocd = F.cd
		F.cd = "location"
		F << src.x
		F << src.y
		F << src.z
		F.cd = ocd

		return .

	Read(var/savefile/F,var/list/neversave=null)

		. = ..(F,neversave)

		var/ocd = F.cd
		F.cd = "location"
		F >> src.x
		F >> src.y
		F >> src.z
		F.cd = ocd

		return .