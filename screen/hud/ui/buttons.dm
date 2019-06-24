client

	var
		Hud/UI/Button/Options/button_options = new
		Hud/UI/Button/Spells/button_spells = new
		Hud/UI/Button/Save/button_save = new

Hud/UI/Button

	icon = 'hud_buttons.dmi'

	New()
		..()
		underlays.Add(image('hud_buttons.dmi',icon_state="bg"))
	Options

		icon_state="options"

		screen_loc = "SOUTH,CENTER+5"


		Click()

			usr << "Options"

	Spells

		icon_state = "spells"

		screen_loc = "SOUTH,CENTER+6"

		Click()

			usr << "Spells"

	Save
		icon_state = "save"
		screen_loc = "SOUTH,CENTER+7"

		Click()
			usr << "Saving..."
			sleep(usr.Save())
			usr << "Saved!"