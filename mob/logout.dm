mob/proc
	OnLogout()
		src.Save()

mob/Logout()
	OnLogout()
	..()