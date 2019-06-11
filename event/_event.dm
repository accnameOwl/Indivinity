/*
	Author: Kaiochao
	byond: http://www.byond.com/members/Kaiochao
*/

#define EVENT_ADD(EVENT, OBJECT, CALLBACK) \
	if(!EVENT) EVENT = new; \
	EVENT.Add(OBJECT, CALLBACK)

#define EVENT_REMOVE(EVENT, OBJECT, CALLBACK) if(EVENT) { \
		EVENT.Remove(OBJECT, CALLBACK); \
		if(!EVENT.handlers) EVENT = null; \
	}

#define EVENT_REMOVE_OBJECT(EVENT, OBJECT) if(EVENT) { \
		EVENT.RemoveObject(OBJECT); \
		if(!EVENT.handlers) EVENT = null; \
	}

#if DM_VERSION >= 511
#define EVENT(EVENT, ARGS...) \
	var/tmp/event/EVENT; \
	proc/EVENT(ARGS) if(EVENT) { \
		EVENT.Fire(arglist(args)); \
		if(!EVENT.handlers) EVENT = null \
	}
#endif

event
	var
		handlers[]

	proc
		Add(Object, Callback)
			if(!handlers) handlers = new
			if(!handlers[Object]) handlers[Object] = list()
			handlers[Object] |= Callback

		Remove(Object, Callback)
			if(handlers)
				if(Callback)
					var callbacks[] = handlers[Object]
					if(callbacks)
						callbacks -= Callback
						if(!callbacks.len) RemoveObject(Object)
					else RemoveObject(Object)
				else RemoveObject(Object)

		RemoveObject(Object)
			if(handlers) handlers -= Object
			if(handlers && !handlers.len) handlers = null

		Fire()
			var handler, object, callbacks[], callback

			for(handler in handlers)
				object = istext(handler) ? locate(handler) : handler
				if(!object) continue
				callbacks = handlers[handler]
				if(!(callbacks && callbacks.len))
					RemoveObject(handler)
					continue
				for(callback in callbacks)
					call(object, callback)(arglist(args))
					if(!object) break

			// Clean up null handlers that were deleted at some point
			if(handlers) while(handlers.Remove(null))
			if(handlers && !handlers.len) handlers = null