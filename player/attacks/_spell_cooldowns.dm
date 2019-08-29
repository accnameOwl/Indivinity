#define GCD_CD 1

#define GLITTERLANCE_CD spell_cooldowns["GLITTERLANCE"]
#define FIREARROW_CD spell_cooldowns["FIREARROW"]
#define VOIDSPEAR_CD spell_cooldowns["VOIDSPEAR"]
#define GOLDENSPEARS_CD spell_cooldowns["GOLDENSPEARS"]


mob/player/var/list
	spell_cooldowns = list(\
		"GLITTERLANCE" = 5,
		"FIREARROW" = 5,
		"VOIDSPEAR" = 5,
		"GOLDENSPEARS" = 5)