//#define LOG

#ifdef LOG
	#define LOG(x) world.log << "[world.time]:\ [t];"
#else
	#define LOG(x)
#endif
