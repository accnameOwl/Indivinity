turf/outside
	icon = 'MapTurfs.dmi'
	grass
		icon_state = "10"

		north
			icon_state="14"
		south
			icon_state="13"
		east
			icon_state="17"
		west
			icon_state="18"
		northeast
			icon_state="4"
		northwest
			icon_state="3"
		southeast
			icon_state="2"
		southwest
			icon_state="1"
		c_northeast
			icon_state="15"
		c_northwest
			icon_state="16"

		surfaceOne
			icon_state="19"
		surfaceTwo
			icon_state="20"
		surfaceThree
			icon_state="21"

	sand

		icon_state="9"

		north
			icon_state = "64"
		south
			icon_state = "63"
		east
			icon_state = "61"
		west
			icon_state = "62"
		northeast
			icon_state = "8"
		northwest
			icon_state = "7"
		southeast
			icon_state = "6"
		southwest
			icon_state = "5"

		c_northeast
			icon_state = "65"
		c_northwest
			icon_state = "66"
		c_southeast
			icon_state = "68"
		c_southwest
			icon_state = "67"

	tree
		icon='Trees.dmi'
		root
			icon_state = "detector"
			density = 1
		tree1
			icon_state = "1"
			layer = 7

	water
		Cross(atom/movable/a)
			if(a.walk_on_water)
				a.Bump()
		one
			icon_state="49"
		two
			icon_state="58"
		three
			icon_state="59"
		four
			icon_state="60"

	cloud
		icon = 'MapTurfs2.dmi'
		icon_state = "72"

	hills
		density = 1
		icon = 'MapTurfs2.dmi'
		icon_state = "13"
		b_west
			icon_state="13"
		b_center
			icon_state="24"
		b_east
			icon_state="14"

		west
			icon_state = "62"
		center
			icon_state = "20"
		east
			icon_state = "63"

		t_west
			icon_state = "21"
		t_center
			icon_state = "22"
		t_east
			icon_state = "23"

		r_west
			icon_state = "15"
		r_center
			icon_state = "16"
		r_east
			icon_state = "17"
		surface_center
			density = 0
			icon_state = "39"
		surface_t_west
			density = 0
			icon_state = "19"
		surface_t_east
			density = 0
			icon_state = "18"
		surface_t_center
			density = 0
			icon_state = "22"

turf/teleporter
	icon = 'Porter.dmi'
	one
		icon_state="1"
	two
		icon_state="2"
	three
		icon_state="3"
	four
		icon_state="4"
	five
		icon_state="5"
	six
		icon_state="6"
	seven
		icon_state="7"
	eight
		icon_state="8"
	nine
		icon_state="9"
	ten
		icon_state="10"
	eleven
		icon_state="11"
	twelve
		icon_state="12"
	thirtin
		icon_state="13"
map_misc
	parent_type = /obj

	statue
		icon = 'MapTurfs2.dmi'
		layer = MOB_LAYER+1
		one
			density = 1
			icon_state = "66"
			bound_x = 5
			bound_height = 30
			bound_width = 41
		two
			density = 1
			icon_state = "67"
			bound_height = 30
			bound_width = 7
		three
			icon_state = "68"
			bound_x = 6
			bound_width = 40
			bound_height = 44
		four
			icon_state = "69"
			bound_width = 7
			bound_height = 43

	tree
		icon='Trees.dmi'
		root
			icon_state = "detector"
			density = 1
			bound_x = 62
			bound_width = 18
			bound_y = 10
			bound_height = 21
		tree1
			icon_state = "1"
			layer = MOB_LAYER+1