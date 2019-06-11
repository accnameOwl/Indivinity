/* Tracks the press times of buttons of a button tracker.
	Also has an OnRepeat event called every tick when any buttons are being held.
*/
button_timer
	var
		button_tracker/tracker
		tick_lag

	New(button_tracker/tracker, tick_lag)
		..()
		src.tracker = tracker
		src.tick_lag = tick_lag || world.tick_lag
		EVENT_ADD(tracker.OnPressed, src, .proc/ButtonPressed)
		EVENT_ADD(tracker.OnReleased, src, .proc/ButtonReleased)

	Del()
		if(tracker)
			EVENT_REMOVE(tracker.OnPressed, src, .proc/ButtonPressed)
			EVENT_REMOVE(tracker.OnReleased, src, .proc/ButtonReleased)
		..()

	EVENT(OnRepeat, button_timer/timer)

	proc
		ButtonPressed(button_tracker/tracker, button)
			// Track the press time of this button.
			if(!press_times) press_times = new
			press_times[button] = world.time

			// Start the Repeat loop if it isn't already running.
			if(!_repeating)
				_repeating = TRUE
				spawn(-1)
					// Repeat as long as any buttons are being pressed.
					while(length(press_times))
						Repeat()
						sleep tick_lag
					_repeating = FALSE

		ButtonReleased(button_tracker/tracker, button)
			// Remove the button's press time.
			if(press_times)
				press_times -= button
				if(!length(press_times)) press_times = null

		/* How long has this button been held for?
		*/
		HoldTime(button)
			var press_time = PressTime(button)
			return press_time && world.time - press_time

		/* When was this button pressed?
		*/
		PressTime(button)
			return PressTimes()[button]

		PressTimes()
			return press_times?.Copy() || list()

		/* Called every tick while any buttons are pressed.
		*/
		Repeat()
			OnRepeat(src)

	var
		tmp
			list/press_times
			_repeating = FALSE
