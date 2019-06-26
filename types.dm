proc
	isplayer( t )
		return istype(t, /mob/player)
	isnpc( t )
		return istype(t, /mob/npc)
	ismonster( t )
		return istype(t, /Monster)
	isscreeneffect( t )
		return istype(t, /ScreenEffect)
	isitem( t )
		return istype(t, /Item)
	isquest( t )
		return istype(t, /Quest)
	isstat( t )
		return istype(t, /Stat)


datum
	proc
		getType()
			. = type