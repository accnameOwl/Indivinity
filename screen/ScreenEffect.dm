
//global list of all screen effects.
//resaulting in: screen_effects[/ScreenEffect/Ghost]
var/list/screen_effects = new


client/proc
	AddScreenEffect(effect_type)
		//add new effect_type to global list if non-existing.
		if(!global.screen_effects[effect_type])
			global.screen_effects[effect_type] = new effect_type

		//render it on screen
		screen += global.screen_effects[effect_type]
		LOG("<[src.type]>[src]	AddScreenEffect() effect_type<[effect_type]>")

	RemoveScreenEffect(effect_type)
		//remove screen_effect
		//but effect_type is still existing in global.screen_effects
		screen -= global.screen_effects[effect_type]
		LOG("<[src.type]>[src]	RemoveScreenEffect() effect_type<[effect_type]>")


ScreenEffect

	parent_type = /obj
	layer = SCREENEFFECT_LAYER

	icon = 'effects.dmi'

	Ghost
		icon_state="ghost"
		screen_loc = "SOUTHWEST to NORTHEAST"

	Rain
		icon_state="rain"
		screen_loc = "SOUTHWEST to NORTHEAST"

