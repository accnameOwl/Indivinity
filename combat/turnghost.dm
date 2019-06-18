mob/var
	see_ghosts = FALSE

mob/proc
	TurnGhost(flag)
		if( isplayer(src) || ismonster(src) )
			if(flag)
				world.log << "[src] turned to a ghost"

				if( src.client )
					//add ghost effect on screen
					client.AddScreenEffect(/ScreenEffect/Ghost)

				//see ghosts
				see_ghosts(TRUE)
				see_invisible = VIEW_GHOST

				//become a ghost
				invisibility = VIEW_GHOST

			else
				world.log << "[src] came alive!"

				if( isplayer(src) )
					//remove ghost effect from screen
					client.RemoveScreenEffect(/ScreenEffect/Ghost)

//				for(var/ScreenEffect/Ghost/g in client.screen)
//					client.RemoveScreenEffect(g)

				//don't see ghosts
				see_ghosts(FALSE)
				see_invisible = VIEW_ALIVE

				//turn from ghost
				invisibility = VIEW_ALIVE