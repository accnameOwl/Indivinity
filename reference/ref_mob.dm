REF/mob_proc_on_damage
	name = "/mob/proc/OnDamage"
	title = "OnDamage proc (mob)"
	see_also = list("/mob/proc/DealDamage","/mob/proc/EnteredCombat","/mob/proc/ExitedCombat")

	description = "Called when recieving damage."
	format = "OnDamage(source)"
	args = "source: The source who dealt damage"
	returns = "Nothing."

REF/mob_proc_deal_damage
	name = "/mob/proc/DealDamage"
	title = "DealDamage proc (mob)"
	see_also = list("/mob/proc/OnDamage","/mob/proc/EnteredCombat","/mob/proc/ExitedCombat")

	description = "Deals damage to a target"
	format = "DealDamage(target, damage)"
	args = "target: /mob, damage: Amount of damage, as num"
	returns = "Nothing."

REF/mob_proc_entered_combat
	name = "/mob/proc/EnteredCombat"
	title = "EnteredCombat proc (mob)"
	see_also = list("/mob/proc/DealDamage","/mob/proc/OnDamage","/mob/proc/ExitedCombat","/mob/proc/combat_timestamp")

	description = "Puts src into combat state"
	format = "EnteredCombat()"
	args = ""
	returns = "Nothing."

REF/mob_proc_exited_combat
	name = "/mob/proc/ExitedCombat"
	title = "ExitedCombat proc (mob)"
	see_also = list("/mob/proc/DealDamage","/mob/proc/OnDamage","/mob/proc/EnteredCombat")

	description = "Puts src out of combat state"
	format = "ExitedCombat()"
	args = ""
	returns = ""

REF/mob_proc_combat_flags
	name = "/mob/var/combat_flags"
	title = "combat_flags var (mob)"
	see_also = list(\
		"/mob/proc/in_combat",
		"/mob/proc/can_respawn",
		"/mob/proc/respawn_time",
		"/mob/proc/see_ghosts",
		"/mob/proc/dead",
		"/mob/proc/combat_timestamp",
		"/mob/proc/health_regeneration_trigger",
		"/mob/proc/invinsible")

	description = "A list containing flags related to combat functions"
	default_value = {"list("dead" = FALSE,
	"can_respawn" = TRUE,
	"respawn_time" = 50,
	"see_ghosts" = FALSE,
	"in_combat" = FALSE,
	"combat_timestamp" = 0,
	"health_regeneration_trigger" = FALSE,
	"invinsible" = FALSE,"}

REF/mob_proc_in_combat
	name = "/mob/proc/in_combat"
	title = "in_combat proc (mob)"
	see_also = list(\
		"/mob/var/combat_flags",
		"/mob/proc/can_respawn",
		"/mob/proc/respawn_time",
		"/mob/proc/see_ghosts",
		"/mob/proc/dead",
		"/mob/proc/combat_timestamp",
		"/mob/proc/health_regeneration_trigger",
		"/mob/proc/invinsible")

	description = "set or get combat_flag(in_combat)."
	default_value = "FALSE"
	format = "in_combat(flag)"
	args = "flag: sets combat flag to argument's value. Expecting TRUE or FALSE"
	returns = {"If no arguments, returns combat_flag("in_combat")"}

REF/mob_proc_can_respawn
	name = "/mob/proc/can_respawn"
	title = "can_respawn proc (mob)"
	see_also = list(\
		"/mob/var/combat_flags",
		"/mob/proc/in_combat",
		"/mob/proc/respawn_time",
		"/mob/proc/see_ghosts",
		"/mob/proc/dead",
		"/mob/proc/combat_timestamp",
		"/mob/proc/health_regeneration_trigger",
		"/mob/proc/invinsible")

	description = "set or get combat_flag(can_respawn)."
	default_value = "TRUE"
	format = "can_respawn(flag)"
	args = "flag: sets combat flag to argument's value. Expecting TRUE or FALSE"
	returns = {"If no arguments, returns combat_flag("can_respawn")"}

REF/mob_proc_respawn_time
	name = "/mob/proc/respawn_time"
	title = "respawn_time proc (mob)"
	see_also = list(\
		"/mob/var/combat_flags",
		"/mob/proc/in_combat",
		"/mob/proc/can_respawn",
		"/mob/proc/see_ghosts",
		"/mob/proc/dead",
		"/mob/proc/combat_timestamp",
		"/mob/proc/health_regeneration_trigger",
		"/mob/proc/invinsible")

	description = {"set or get combat_flag("respawn_time").<br>This is the duration, which determines how long you are dead."}
	default_value = "50"
	format = "respawn_time(flag)"
	args = "flag: sets combat flag to argument's value. Expecting num"
	returns = {"If no arguments, returns combat_flag("respawn_time")"}

REF/mob_proc_see_ghosts
	name = "/mob/proc/see_ghosts"
	title = "see_ghosts proc (mob)"
	see_also = list(\
		"/mob/var/combat_flags",
		"/mob/proc/in_combat",
		"/mob/proc/can_respawn",
		"/mob/proc/respawn_time",
		"mob/proc/dead",
		"mob/proc/combat_timestamp",
		"mob/proc/health_regeneration_trigger",
		"mob/proc/invinsible")

	description = "set or get combat_flag(see_ghosts). Describes if you are seing ghosts or not. this is updated through OnDeath()"
	default_value = "FALSE"
	format = "see_ghosts(flag)"
	args = "flag: sets combat flag to argument's value. Expecting TRUE or FALSE"
	returns = {"If no arguments, returns combat_flag("see_ghosts")"}

REF/mob_proc_dead
	name = "/mob/proc/dead"
	title = "dead proc (mob)"
	see_also = list(\
		"/mob/var/combat_flags",
		"/mob/proc/in_combat",
		"/mob/proc/can_respawn",
		"/mob/proc/respawn_time",
		"/mob/proc/see_ghosts",
		"/mob/proc/combat_timestamp",
		"/mob/proc/health_regeneration_trigger",
		"/mob/proc/invinsible")

	description = {"set or get combat_flag("dead"). <br>Describes if src is dead or alive"}
	default_value = "FALSE"
	format = "dead(flag)"
	args = "flag: sets combat flag to argument's value. Expecting TRUE or FALSE"
	returns = {"If no arguments, returns combat_flag("dead")"}

REF/mob_proc_combat_timestamp
	name = "/mob/proc/combat_timestamp"
	title = "combat_timestamp proc (mob)"
	see_also = list(\
		"/mob/var/combat_flags",
		"/mob/proc/in_combat",
		"/mob/proc/can_respawn",
		"/mob/proc/respawn_time",
		"/mob/proc/see_ghosts",
		"/mob/proc/dead",
		"/mob/proc/health_regeneration_trigger",
		"/mob/proc/invinsible")

	description = {"set or get combat_flag("combat_timestamp").<br>Describes in time, when you where in combat the last time. This flag gets updated every time a mob deals or recieves damage."}
	default_value = "world.time + duration(1/10 seconds)"
	format = "combat_timestamp(flag)"
	args = "flag: sets combat flag to argument's value."
	returns = {"If no arguments, returns combat_flag("combat_timestamp")"}

REF/mob_proc_health_regeneration_trigger
	name = "/mob/proc/health_regeneration_trigger"
	title = "health_regeneration_trigger proc (mob)"
	see_also = list(\
		"/mob/var/combat_flags",
		"/mob/proc/in_combat",
		"/mob/proc/can_respawn",
		"/mob/proc/respawn_time",
		"/mob/proc/see_ghosts",
		"/mob/proc/dead",
		"/mob/proc/combat_timestamp",
		"/mob/proc/invinsible")

	description = {"set or get combat_flag("health_regeneration_trigger").<br>Describes if you are regenerating health or not. Updated through EnteredCombat() & ExitedCombat()"}
	default_value = "FALSE"
	format = "health_regeneration_trigger(flag)"
	args = "flag: sets combat flag to argument's value. Expecting TRUE or FALSE"
	returns = {"If no arguments, returns combat_flag("health_regeneration_trigger")"}

REF/mob_proc_invinsible
	name = "/mob/proc/invinsible"
	title = "invinsible proc (mob)"
	see_also = list(\
		"/mob/var/combat_flags",
		"/mob/proc/in_combat",
		"/mob/proc/can_respawn",
		"/mob/proc/respawn_time",
		"/mob/proc/see_ghosts",
		"/mob/proc/dead",
		"/mob/proc/combat_timestamp",
		"/mob/proc/health_regeneration_trigger")

	description = {"set or get combat_flag("invinsible").<br>Describes if you are an indestructable mob. Used for NPCs who are indestructable"}
	default_value = "FALSE"
	format = "invinsible(flag)"
	args = "flag: sets combat flag to argument's value. Expecting TRUE or FALSE"
	returns = {"If no arguments, returns combat_flag("invinsible")"}

REF/mob_proc_on_death
	name = "/mob/proc/OnDeath"
	title = "OnDeath proc (mob)"
	see_also = list("/mob/proc/OnRespawn","/mob/proc/OnDamage","/mob/proc/TurnGhost")

	description = "Called from /mob/proc/OnDamage(), if health is at or below zero."
	format = "OnDeath(from)"
	args = "from: Source who killed you."
	returns = "Nothing."
REF/mob_proc_on_respawn
	name = "/mob/proc/OnRespawn"
	title = "OnRespawn proc (mob)"
	see_also = list("/mob/proc/OnDeath","/mob/proc/OnDamage", "/mob/proc/TurnGhost", "/mob/proc/respawn_time")

	description = "Called from /mob/proc/OnDeath(), after a span of spawntime duration."
	format = "OnRespawn()"
	args = ""
	returns = "Nothing."


REF/mob_proc_on_login
	name = "/mob/proc/OnLogin"
	title = "OnLogin proc (mob)"
	see_also = list("/mob/New")

	description = "Called by /mob/New(). Used for specific tasks"
	format = "OnLogin()"
	args = ""
	returns = "Nothing."

REF/client_proc_add_screen_effect
	name = "/client/proc/AddScreenEffect"
	title = "AddScreenEffect proc (client)"
	see_also = list("/client/proc/RemoveScreenEffect")

	description = "Adds a screen effect. Screen effects are stored in global.screen_effects"
	format = "AddScreenEffect(effect_type)"
	args = "effect_type: an effects type."
	example = "client.AddScreenEffect(/ScreenEffect/Ghost)"

REF/client_proc_remove_screen_effect
	name = "/client/proc/RemoveScreenEffect"
	title = "RemoveScreenEffect proc (client)"
	see_also = list("/client/proc/AddScreenEffect")

	description = "Removes a screen effect. Screen effects are stored in global.screen_effects"

REF
	stat_var_name
		name = "/Stat/var/name"
		title = "name var (Stat)"
		see_also = list("/Stat/var", "/Stat/proc")
		description = "Name of Stat"
		default_value = {" "" "}

	stat_var_level
		name = "/Stat/var/level"
		title = "level var (Stat)"
		see_also = list("/Stat/var", "/Stat/proc")
		description = "Level is the current level of this stat. You can level up stats by calling Stat.AddExperience(exp)"
		default_value = 0
	stat_var_value
		name = "/Stat/var/value"
		title = "value var (Stat)"
		see_also = list("/Stat/var", "/Stat/proc")
		description = "Holds information of how much in quantity is stored withing the stat. This is the primal value for the stat."
		default_value = 0
	stat_var_limit
		name = "/Stat/var/limit"
		title = "value var (Stat)"
		see_also = list("/Stat/var", "/Stat/proc")
		description = "limit is essentially the same as value, but the seiling value. As an example, if Stat is health then value is current health and limit is max health."
		default_value = "src.value"
		example = "value <= limit"
	stat_var_experience
		name = "/Stat/var/experience"
		title = "experience var (Stat)"
		see_also = list("/Stat/var", "/Stat/proc")
	stat_var_limitexperience
		name = "/Stat/var/limit_experience"
		title = "limit_experience var (Stat)"
		see_also = list("/Stat/var", "/Stat/proc")
	stat_var_totalexperience
		name = "/Stat/var/total_experience"
		title = "total_experience var (Stat)"
		see_also = list("/Stat/var", "/Stat/proc")
	stat_var_experience_multiplier
		name = "/Stat/var/experience_multiplier"
		title = "experience_multiplier var (Stat)"
		see_also = list("/Stat/var", "/Stat/proc")
		default_value = "1.1(10%)"
		description = "Puts a number on stat evolvement after levelig up. This creates an exponential gain in required experience for the next level. Percentage values, pr decimal"
	stat_var_value_multiplier
		name = "/Stat/var/value_multiplier"
		title = "value_multiplier var (Stat)"
		see_also = list("/Stat/var", "/Stat/proc")
		default_value = "1.1(10%)"
		description = "Puts a number on stat evolvement after levelig up. This creates an exponential gain in value after gaining a level. Percentage values, pr decimal"

