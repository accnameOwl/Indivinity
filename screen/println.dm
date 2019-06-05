client
	var/println_speed = 0.2

proc/Println(mob/player, text="")
	var/blank = " "

	for(var/Hud/Textbox/txt in player.client.screen)
		txt.maptext = ""
		del(txt)

	var/Hud/Textbox/txt = new
	player.client.screen.Add(txt)

	txt.maptext_x = 36
	txt.maptext_y = 36
	txt.maptext_width = length(text) / length(text)*380
	txt.maptext_height = length(text) / length(text) * 120

	while(length(blank)-2 < length(text)+1)
		sleep(player.client.println_speed)
		blank = addtext(blank, "[getCharacter(text,length(blank))]")
		txt.maptext = "<font face=\"Power Red and Blue\"><font size=2>[blank]"
		if(length(blank) >= length(text))
			break


proc
	getCharacter(string, pos=1)
		return ascii2text(text2ascii(string, pos))