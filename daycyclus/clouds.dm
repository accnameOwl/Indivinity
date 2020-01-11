

/**     Renders dynamically rendered cloud shadows on the ground around clients in your world! But only on designated turfs!
			You can also disable cloud rendering for specific players by removing them from the [cloudy_clients] list.
			Draw obj/map_markup/cloudy_zone anywhere on the map you want to be able to have clouds exist.
			you can control how many clouds can exist around a given player with the [cloud_limit] var.


			Good luck! Check out DREAM MAKERS DISCORD for developer support!

**/




#define RENDER_CLOUDS 1// set to 0 before compiling to disable cloud rendering in a build.


var
	list
		cloudy_turfs		= new/list()	// a list of all the locs that can have clouds rendered on them.
		cloudy_clients		= new/list()	// a list of clients who should have clouds rendered. Remove from this list \
												to disable cloud rendering on a client.

/////////////////////////////////////
world/New()
	..() 							/// <----------- avoid having multiple world/New()'s. if you have one, plug this into it instead.
	spawn(30)
		cloud_render_loop()

////////////////////////////////





obj/map_markup
	/* objs used strictly for map markup. Get deleted at runtime.
	*/

	cloudy_zone
		// anywhere you want clouds to be able to be rendered; draw this over it in the map editor.
		icon		= 'cloudy_markup.dmi'
		icon_state	= "cloudy1"
		layer		= EFFECTS_LAYER
		New()
			..()
			cloudy_turfs += loc
			del src






obj/weather		// group the cloud_shadow effect with weather just so it gels with my weather library better.

	cloud_shadow
		icon		= 'cloudshadow.dmi'
		icon_state	= "cloudshadow1"
		layer		= EFFECTS_LAYER	//naturally, a cloud's shadow should be drawn over most everything else.
		alpha		= 0
		pixel_x		= 200
		plane		= 1		// this is optional and can be removed if needed/wanted.

		New()
			..()
			transform	= turn((matrix()*pick(2,4)), rand(-180,180)) // this will randomize the cloud shadow's size and rotation \
																			as to add some more variance.



client
	var
		cloud_limit		= 4	//max number of clouds that can be rendered around a givent client at a time.
		cloud_count		= 0	// how many clouds are currently rendered around the client.
	New()
		..()
		cloudy_clients += src



proc
	cloud_render_loop()
		/* this will render cloud effects across the whole map, however only within proximity of clients who have the cloud effects
			enabled. (aka are in the cloud_client list)
		*/
		set waitfor = 0
		sleep 10
		if(RENDER_CLOUDS || !(cloudy_turfs.len))	// if the game version has clouds disabled, then don't bother enabling the mechanics!
			while(cloudy_turfs.len)
			//	world			<< "loop!"
				if(cloudy_clients.len)
					var/client/c	= cloudy_clients[rand(1, cloudy_clients.len)]
					if(c && c.cloud_count < c.cloud_limit)	// if we find [c] and c also has room for clouds around them!
					//	world 		<< "found [c]"
						var/turf/t 	= locate((c.mob.x+rand(30, -30)), (c.mob.y+rand(30, -30)), c.mob.z)
					//	world 		<< t
						if(t && (t in cloudy_turfs))// if t exists and is also in the weather_tiles list!
						//	world << "found [t]"
							cloudy_turfs -= t		// don't want more than one weather effect rendering on the same tile.
							t.draw_cloud(c)
							sleep 10
				else {sleep 5}
				sleep 5



turf
	proc
		draw_cloud(client/m = null)
			set waitfor			= 0
			m.cloud_count ++
			var/obj/weather/c	= new /obj/weather/cloud_shadow // You should try object recycling!!
			c.alpha				= 0
			c.pixel_y			= 200
			c.loc				= src

			animate(c,  pixel_x = 0, alpha = 255, time = 150, loop = 1)		// starts invisible to the far right
			sleep 150
			m.cloud_count --
			animate(c, pixel_x = -200, alpha = 0, time = 150)					// then fades in as it gets to it's "center"
			sleep 150														// then fades out again as it goes left.
			cloudy_turfs += src
			del c	// consider obj recycling!!