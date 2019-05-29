Castbar
	parent_type = /obj

	icon = 'castbar.dmi'

	proc
		DrawBorder(thickness = 3)
			//size in pixels, default is 3
		Draw( width = 32, height = 32, color = rgb(0,0,0) )
			//width = pixels in width
			//height = pixels in height
			//color = color in rgb
		Scale( width = 32, height = 32 )



	Scale( width, height )
		transform = new/matrix().Scale(width, height)

	Draw( width = 32, height = 32, color )

		Scale(width, height)
