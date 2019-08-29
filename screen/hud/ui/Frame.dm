
client
	var
		Hud/UI/Frame/Player/player_frame = new
		Hud/UI/Maskbar/Healthframe/health_frame = new
		Hud/UI/Maskbar/Manaframe/mana_frame = new
		Hud/UI/Maskbar/Experienceframe/experience_frame = new

		Hud/UI/Frame/Target/target_frame = new
		Hud/UI/Maskbar/t_Healthframe/t_health_frame = new
		Hud/UI/Maskbar/t_Manaframe/t_mana_frame = new


Hud/UI/Frame/Player
	icon = 'player_frame.dmi'

	screen_loc = "WEST,NORTH-1"
	maptext_y = 62
	maptext_x = 13
	maptext_width = 200


Hud/UI/Frame/Target
	icon = 'player_frame.dmi'

	screen_loc = "EAST-6:-10,NORTH-1"

	maptext_y = 62
	maptext_x = 13
	maptext_width = 200


Hud/UI/Maskbar/Healthframe
	icon = 'health_frame.dmi'
	screen_loc = "WEST:10,NORTH-1:40"
	width = 300
	height = 20
	orientation = EAST

Hud/UI/Maskbar/Manaframe
	icon = 'mana_frame.dmi'
	screen_loc = "WEST:10,NORTH-1:18"
	width = 300
	height = 20
	orientation = EAST


Hud/UI/Maskbar/Experienceframe
	icon = 'experience_frame.dmi'
	screen_loc = "WEST:10,NORTH-1:5"
	width = 300
	height = 10
	orientation = EAST

	maptext_x = 0
	maptext_y = -10
	maptext_height = 10
	maptext_width = 200

Hud/UI/Maskbar/t_Healthframe
	icon='health_frame.dmi'
	screen_loc = "EAST-6,NORTH-1:40"
	width = 300
	height = 20
	orientation = WEST

Hud/UI/Maskbar/t_Manaframe
	icon='mana_frame.dmi'
	screen_loc = "EAST-6,NORTH-1:18"
	width = 300
	height = 20
	orientation = WEST

Hud/UI/Maskbar/TargetHealthbar

	icon = 'target_healthbar.dmi'
	height = 10
	width = 92
	orientation = EAST

	maptext_y = 6

	var/Monster/owner

	New(Monster/m)
		..()
		owner = m

		while(src)
			loc = owner.loc
			sleep(1)

