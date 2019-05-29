proc
	isplayer( t )
		return istype(t, /mob/player)
	isnpc( t )
		return istype(t, /mob/npc)
	ismonster( t )
		return istype(t, /monster)
	isscreeneffect( t )
		return istype(t, /ScreenEffect)