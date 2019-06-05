mob/player/OnLogin()
	..()
	var/Hud/Playerframe/Portrait/p = new
	src.client.screen += p

Hud/Playerframe

	Portrait
		icon = 'healthbar_portrait.png'
		screen_loc = "NORTHWEST"
	Bar



		Background
			layer = 49
			icon = 'healthbar_bar_background.png'

		Health

			icon = 'healthbar_health_true.png'

		Mana

			icon = 'healthbar_mana_true.png'

		Experience

			icon = 'healthbar_experience_true.png'

	Tail

		Health

			icon = 'healthbar_health_tail.png'

		Mana

			icon = 'healthbar_mana_tail.png'

		Experience

			icon = 'healthbar_experience_tail.png'


