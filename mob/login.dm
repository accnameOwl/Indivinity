mob/proc
	OnLogin()
		src.Load()

mob/Login()
	..()
	OnLogin()