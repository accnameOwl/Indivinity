//#define DEBUG
//#define TEST_MODE
//#define NO_AI

//define default constructor values for /Stat
//used in Stat.New() - File "/combat/Stat.dm"
#define STAT_DEFAULT_VALUE 1
#define STAT_DEFAULT_LIMIT 1
#define STAT_DEFAULT_LEVEL 1
#define STAT_DEFAULT_LIMITEXPERIENCE 100
#define STAT_DEFAULT_EXPERIENCE 0
#define STAT_DEFAULT_EXPERIENCEMULTIPLIER 1.1
#define STAT_DEFAULT_VALUEMULTIPLIER 1.1

#define COMBAT_FLAG_DEAD		combat_flags["dead"]
#define COMBAT_FLAG_CANRESPAWN	combat_flags["can_respawn"]
#define COMBAT_FLAG_RESPAWNTIME combat_flags["respawn_time"]
#define COMBAT_FLAG_SEEGHOSTS	combat_flags["see_ghosts"]
#define COMBAT_FLAG_INCOMBAT	combat_flags["in_combat"]
#define COMBAT_FLAG_TIMESTAMP	combat_flags["combat_timestamp"]
#define COMBAT_FLAG_HRT			combat_flags["health_regeneration_trigger"]
#define COMBAT_FLAG_INVINSIBLE	combat_flags["invinsible"]

//regeneration
#define REGEN_EXPERIENCE_GAIN round(5+(Stats_Get("regen","level")))
#define REGEN_SLEEPTIME_CAP world.time+5

//health
#define HEALTH_EXPERIENCE_GAIN round(5+(Stats_Get("health","level")/1.5))

//combat related
#define OUT_OF_COMBAT 0
#define ENTERED_COMBAT 1
#define EXITED_COMBAT -1
#define DROP_COMBAT_TIMER -50 //5 seconds after last hit.

//ghost related
#define VIEW_GHOST 7 // plane of invisibility to turn players when they turn into ghosts
#define VIEW_ALIVE 0

//AI trigger
#define AREATRIGGER_CROSSED_AI

//UI
#define UI_LAYER 45
#define SCREENEFFECT_LAYER 35


//Quest system
#define QUEST_OBJECTIVE_FLAG_NULL null
#define QUEST_OBJECTIVE_FLAG_KILL 1
#define QUEST_OBJECTIVE_FLAG_ITEM 2
#define QUEST_OBJECTIVE_FLAG_LOCATION 3
#define QUEST_OBJECTIVE_FLAG_TALKTO 4

#define QUEST_TYPE_NULL 	0
#define QUEST_TYPE_KILL		1
#define QUEST_TYPE_GATHER	2
#define QUEST_TYPE_ESCORT	3
#define QUEST_TYPE_FEDX		4
#define QUEST_TYPE_DEFEND	5
#define QUEST_TYPE_PROFIT	6
#define QUEST_TYPE_ACTIVATE	7
#define QUEST_TYPE_SEARCH	8

#define QUEST_STATE_NULL 		null
#define QUEST_STATE_PENDING		0
#define QUEST_STATE_INPROGRESS	1
#define QUEST_STATE_COMPLETED	2
#define QUEST_STATE_DONE		3
#define QUEST_STATE_CANCELED	4






#ifdef WORLD_LOG_FILE
world
	New()
		log = file("world.log")
#endif



/**
*	Logging:
*/

//#define WORLD_LOG_FILE
#ifdef DEBUG
	#define LOG
	#define LOGCOMBAT
	#define LOGAI
#endif

#ifdef LOG
	#define LOG(x) world.log << "[world.time]:\ [x];"
#else
	#define LOG(x)
#endif


#ifdef LOGCOMBAT
	#define LOGCOMBAT(source, method, text) world.log << "[world.time]-[source]::[method]{[text]}"
#else
	#define LOGCOMBAT(source, method, text)
#endif

#ifdef LOGAI //x = source, y=method, z = args
	#define LOGAI(x,y,z)	world.log << "[x]::[y], arguments: [z]"
#else
	#define LOGAI(x,y,z)
#endif