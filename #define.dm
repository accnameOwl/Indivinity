#define DEBUG

//#define LOG

#ifdef LOG
	#define LOG(x) world.log << x
#else
	#define LOG(x)
#endif


//define default constructor values for /Stat
//used in Stat.New() - File "/combat/Stat.dm"
#define STAT_DEFAULT_VALUE 1
#define STAT_DEFAULT_LIMIT 1
#define STAT_DEFAULT_LEVEL 1
#define STAT_DEFAULT_LIMITEXPERIENCE 100
#define STAT_DEFAULT_EXPERIENCE 0
#define STAT_DEFAULT_EXPERIENCEMULTIPLIER 1.1
#define STAT_DEFAULT_VALUEMULTIPLIER 1.1


//regeneration
#define REGEN_EXPERIENCE_GAIN round(5+(Stats_Get("regen","level")))
#define REGEN_SLEEPTIME_CAP world.time+5

//health
#define HEALTH_EXPERIENCE_GAIN round(5+(Stats_Get("health","level")/1.5))

//combat related
#define OUT_OF_COMBAT 0
#define ENTERED_COMBAT 1
//npc ai function, for losing aggro of target
#define EXITED_COMBAT 2
#define DROP_COMBAT_TIMER -50 //13 seconds after last hit.

//ghost related
#define VIEW_GHOST 7 // plane of invisibility to turn players when they turn into ghosts
#define VIEW_ALIVE 0

//AI trigger
//#define AREATRIGGER_ICON



//UI
#define UI_LAYER 45
#define SCREENEFFECT_LAYER 35

//#define AREATRIGGER_ICON
