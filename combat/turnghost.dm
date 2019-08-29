
mob
	proc/TurnGhost(flag)
		if(flag)

			if( client )
				//add ghost effect on screen
				client.AddScreenEffect(/ScreenEffect/Ghost)

			//see ghosts
			see_ghosts(TRUE)
			see_invisible = VIEW_GHOST

			//become a ghost
			invisibility = VIEW_GHOST

		else

			if( client )
				//remove ghost effect from screen
				client.RemoveScreenEffect(/ScreenEffect/Ghost)

//				for(var/ScreenEffect/Ghost/g in client.screen)
//					client.RemoveScreenEffect(g)

			//don't see ghosts
			see_ghosts(FALSE)
			see_invisible = VIEW_ALIVE

			//turn from ghost
			invisibility = VIEW_ALIVE