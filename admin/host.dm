Tools/Host

	verb
		Reboot()
			set category = "Tools"

			world << "<b><h1><center>World reboot</center></h1></b>"
			world << "<b><h3><center>30 seconds...</center></h3></b>"
			sleep(100)

			world << "<b><h3><center>20 seconds...</center></h3></b>"
			sleep(100)

			world << "<b><h3><center>10 seconds...</center></h3></b>"
			sleep(50)

			world << "<b><h3><center>5 seconds...</center></h3></b>"
			sleep(10)
			world << "<b><h3><center>4 seconds...</center></h3></b>"
			sleep(10)
			world << "<b><h3><center>3 seconds...</center></h3></b>"
			sleep(10)
			world << "<b><h3><center>2 seconds...</center></h3></b>"
			sleep(10)
			world << "<b><h3><center>1 seconds...</center></h3></b>"
			sleep(10)
			world.log << "src = [src] : world.Reboot()"
			world.Reboot()


		OpenPort()
			set category = "Tools"
			var/a = alert("Warning: if you are not familiar with hosting, advert from using this command!", ,"Ok","Cancel")
			if(a == "Ok")
				var/p = input("Which port would you like to open:") as num
				world.OpenPort(p)

		Repop()
			set category = "Tools"
			world.log << "src = [src] : world.Repop()"
			world.Repop()