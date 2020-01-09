/*
	Author: Kaiochao


	This library adds procs to /atom that return what's known as
		"world pixel coordinates" or "absolute pixel coordinates"
		of the atom. When not using tile-based movement, it's best
		to think in terms of these coordinates and

			forget that tile movement is a thing.

		(See my Sub-Pixel Movement library for another way
		to avoid tile-based code

	* Size()
	* Width()
	* Height()
		The width and height of the atom, in pixels.
		For example, by default, all atoms are 32x32,
			so the Width() and Height() are 32.
		For turfs, this is the same as world.icon_size.
		For movables, this returns bound_width or bound_height.

	* LowerPosition()
	* LowerX()
	* LowerY()
		The lower x and y coordinates of the atom, in pixels.
		The bottom-left corner of the world is (1, 1).

	* CenterPosition()
	* CenterX()
	* CenterY()
		The central x and y coordinates of the atom, in pixels.
		This depends on the position of the atom as well as
			the size of the atom's bounding box, which is defined by
			the bounds variables (bound_width, bound_height).
*/

atom
	proc
		/*
			Width of the atom, in pixels.
		*/
		Width()
			return TileWidth

		/*
			Height of the atom, in pixels.
		*/
		Height()
			return TileHeight

		/*
			World pixel x-coordinate of the left edge of this atom, in pixels.
		*/
		LowerX()
			return 1 + (x - 1) * TileWidth

		/*
			World pixel y-coordinate of the bottom edge of this atom, in pixels.
		*/
		LowerY()
			return 1 + (y - 1) * TileHeight

		/*
			World pixel x-coordinate of the center of this atom, in pixels.
		*/
		CenterX()
			return LowerX() + Width() / 2

		/*
			World pixel y-coordinate of the center of this atom, in pixels.
		*/
		CenterY()
			return LowerY() + Height() / 2

		/* World pixel coordinates of the lower corner of the bounding box.
		*/
		LowerPosition()
			return new/vector2(LowerX(), LowerY())

		/* World pixel coordinates of the center of the bounding box.
		*/
		CenterPosition()
			return new/vector2(CenterX(), CenterY())

		/* Size of the atom, in pixels.
		*/
		Size()
			return new/vector2(Width(), Height())

	/*
		Movables have finer details, such as different sizes and
			not being aligned with the tile grid,
			so these overrides include that information.
	*/
	movable
		Width()
			return bound_width

		Height()
			return bound_height

		LowerX()
			return ..() + bound_x + step_x

		LowerY()
			return ..() + bound_y + step_y

