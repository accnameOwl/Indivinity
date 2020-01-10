/**
*	Savefile system
*
*	Override /mob/Write() & /mob/Read()
*
*
*
*/
datum
	Write(var/savefile/F, var/list/neversave=null)
		if(neversave != null && istype(neversave, /list) && neversave.len >= 1)
			var/i
			for(var/v in neversave)
				if(!issaved(vars[v]))
					neversave.Remove(v)
				else
					i = initial(vars[v])
					if(i != vars[v])
						neversave[v] = vars[v]
						vars[v] = i
					else
						neversave.Remove(v)
			. = ..(F)
			for(var/v in neversave)
				vars[v] = neversave[v]
			return
		else
			return ..(F)
	Read(var/savefile/F, var/list/neversave=null)
		if(neversave != null && istype(neversave,/list) && neversave.len >= 1)
			for(var/v in neversave)
				if(!issaved(vars[v]))
					neversave.Remove(v)
				else
					neversave[v] = vars[v]
			. = ..(F)
			for(var/v in neversave)
				vars[v] = neversave[v]
			return
		else
			return ..(F)

	proc
		NeverSave(var/list/L)
			return L

atom
	NeverSave(var/list/L)
		//deploy list of data not to store
		L.Add("icon","icon_state","overlays","underlays", "buffs","debuffs")
		return ..(L)
	Write(var/savefile/F,var/list/neversave=null)
		if(neversave==null)
			neversave = src.NeverSave(list())
		var/list/ol
		var/list/ul
		if(src.overlays!=initial(overlays)&&neversave.Find("overlays"))
			ol = overlays.Copy(1,0)
			overlays = initial(overlays)
			neversave.Remove("overlays")
		if(underlays!=initial(underlays)&&neversave.Find("underlays"))
			ul = underlays.Copy(1,0)
			underlays = initial(underlays)
			neversave.Remove("underlays")
		. = ..(F,neversave)
		if(ol!=null&ol.len)
			overlays.Add(ol)
		if(ul!=null&&ul.len)
			underlays.Add(ul)
	Read(var/savefile/F,var/list/neversave=null)
		if(neversave==null)
			neversave = NeverSave(list())
		return ..(F,neversave)
	movable
		NeverSave(var/list/L)
			L.Add("screen_loc")
			return ..(L)
 /////////////////////
/////////////////////
world
	mob = /mob/logging
	Del()
		for(var/mob/player/p in world)
			del p
mob
	logging
		Login()
			spawn()
				if(fexists("saves/[copytext(src.ckey,1,2)]/[src.ckey].sav"))
					var/savefile/F = new/savefile("saves/[copytext(src.ckey,1,2)]/[src.ckey].sav")
					var/mob/player/p = null
					F >> p
					p.key = client.key
					del src
				else
					client.mob = new/mob/player()
			return 1
	player
		NeverSave(var/list/L)
			L = ..(L)
			L.Remove("icon")
			return L
		Write(var/savefile/F,var/list/neversave=null)
			. = ..(F,neversave)
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

		Login()
			spawn(10)
				src.save()
			return ..()
		Del()
			src.save()
			return ..()
		proc
			save()
				var/savefile/F = new/savefile("saves/[copytext(src.ckey,1,2)]/[src.ckey].sav")
				F << src
			load()
				if(fexists("saves/[copytext(src.ckey,1,2)]/[src.ckey].sav"))
					var/savefile/F = new/savefile("saves/[copytext(src.ckey,1,2)]/[src.ckey].sav")
					F >> src