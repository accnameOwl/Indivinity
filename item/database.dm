#define STATS(a,s,d,i)	list("attack"=##a, "str"=##s, "def"=##d, "int"=##i)
#define MELEE			list("slot"="Weapon","style"="Melee")
#define MAGIC			list("slot"="Weapon","style"="Magic")
#define HEAD			list("slot"="Head")
#define CHEST			list("slot"="Chest")
#define LEGS			list("slot"="Legs")
#define FEET			list("slot"="Feet")
#define HANDS			list("slot"="Hands")
#define MOD(x)			list("mod"=##x)
#define TWOHANDED		list("twohanded")

/*
proc/db_add(item,value)     // Adds the item to the db pointing to its value
proc/db_get(item)           // Gets all the items variables
proc/db_mix(item1,item2)    // Combines both items together; Iron + Dagger = Iron Dagger
proc/db_itl(list/A,list/B)  // Combines A and B together calling db_mix on all elements.
proc/db_deb(v)              // Shows the entire database, use a number for a specific location.
proc/db_len()               // Returns the length of the entire database
*/

var item_db_size = 16
var list/item_db = new(item_db_size)


//hash for item_db IDs
proc/hash(s)
	var r = 0
	for(var/p = 1 to length(s)) r += text2ascii(s,p)
	return (r%item_db_size) + 1

//Database in itself
proc
	item_db_add(item,value)	{item_db[hash(item)][item] = value}
	item_db_get(item)		{return item_db[hash(item)][item]}
	item_db_mix(item1,item2)
		var id = "[item2] [item1]", list/c = new
		var list/a = item_db_get(item1), list/b = item_db_get(item2)
		if("mod" in b)
			var mul = b["mod"]
			for(var/i in a)
				if(isnum(a[i]))
					c[i] = round(a[i]*mul)
				else
					c[i] = a[i]
		c.Remove("mod")
		item_db[hash(id)][id] = c
	item_db_deb(CH)
		var list/l, list/q, p, i
		if(CH)
			p = CH
			l = item_db[p]
			for(i in l)
				q = l[i]
		else
			for(p = 1 to item_db_size)
				l = item_db[p]
				for(i in l)
					q = l[i]
	item_db_itl(list/A, list/B)
		var a,b
		for(a in A)
			for(b in B)
				item_db_mix(a,b)
	item_db_len()
		var r = 0
		for(var/p = 1 to item_db_size)
			r += item_db[p].len
		return r

//Bases
proc/item_dbi_Bases()
	//Melee
	item_db_add("Dagger",	MELEE + STATS(5,2,0,0))
	item_db_add("Sword",	MELEE + STATS(4,4,0,0))
	item_db_add("Hammer",	MELEE + STATS(2,5,2,0) + TWOHANDED)
	item_db_add("Axe",		MELEE + STATS(3,5,0,0))
	//Magic
	item_db_add("Staff",	MAGIC + STATS(6,0,0,2) + TWOHANDED)
	item_db_add("Wand",		MAGIC + STATS(5,0,0,3))
proc/item_dbi_Mods()
	//Melee
	item_db_add("Bronze",	MOD(0.7))
	item_db_add("Iron",		MOD(1.00))
	item_db_add("Steel", 	MOD(1.40))
	item_db_add("Gilded",	MOD(2.00))
	item_db_add("Mythril",	MOD(2.80))
	item_db_add("Obsidian",	MOD(3.80))
	item_db_add("Dragonbone",MOD(5.00))
	//Magic
	item_db_add("Practician",MOD(0.70))
	item_db_add("Adept",	MOD(1.00))
	item_db_add("Wizard",	MOD(1.50))
	item_db_add("Mage",		MOD(2.00))
	item_db_add("Sage",		MOD(2.80))
	item_db_add("Mystical",	MOD(3.80))
	item_db_add("Archetype",MOD(5.00))


world/New()
	for(.=1 to item_db_size)
		item_db[.] = list()
	var/list
		melee_tiers	= list("Bronze", "Iron", "Steel", "Gilded", "Mythril","Obsidian","Dragonbone")
		magic_tiers = list("Practician", "Adept", "Wizard", "Mage", "Sage", "Mystical", "Archetype")
		melee_weps	= list("Dagger","Sword","Hammer","Axe")
		magic_weps	= list("Staff","Wand")
	item_dbi_Bases()
	item_dbi_Mods()
	item_db_itl(melee_weps, melee_tiers)
	item_db_itl(magic_weps, magic_tiers)
	..()

