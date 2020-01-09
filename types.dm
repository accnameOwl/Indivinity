/** Edit
--
	> Changed return value from all type checkers, old value:
	 	return istype(t, /mob/npc)
*/

proc
	isplayer( datum/t )
		. = FALSE
		if(t.type == /mob/player)
			. = TRUE
	isnpc( datum/t )
		. = FALSE
		if(t.type == /mob/npc)
			. = TRUE
	ismonster( datum/t )
		. = FALSE
		if(t.type == /Monster)
			. = TRUE
	isscreeneffect( datum/t )
		. = FALSE
		if(t.type == /ScreenEffect)
			. = TRUE
	isitem( datum/t )
		. = FALSE
		if(t.type == /Item)
			. = TRUE
	isquest( datum/t )
		. = FALSE
		if(t.type == /Quest)
			. = TRUE
	isstat( datum/t )
		. = FALSE
		if(t.type == /Stat)
			. = TRUE

datum
	proc
		getType()
			. = type