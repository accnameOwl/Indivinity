// ROLES
#define CLASS_TANK        list("role"="Tank")
#define CLASS_HEALER      list("role"="Healer")
#define CLASS_DPS         list("role"="DPS")
// CLASS
#define CLASS_WARRIOR     list("class"="Warrior")
#define CLASS_MAGE        list("class"="Mage")
#define CLASS_PALADIN     list("class"="Paladin")
// TALENT
#define TALENT(a,s,d,f,g)     list("talent1"=##a, "talent2"=##s, "talent3"=##d, "talent4"=##f, "talent5"=##g)


#define ARRAY_SIZE 3

mob
	var 
		list/class_spec = new(ARRAY_SIZE)
	proc
		cs_add(id, value)
			class_spec[hash(id)][id] = value
		cs_get(id)
			return class_spec[hash(id)][id]
	
	player/proc
		cs_Role(list/x)
			if(x["role"])
				cs_add("role", x)
		cs_Class(x)
			if(x["class"])
				cs_add("class", x)
		cs_BaseTalents()
			cs_add("Talent", TALENT(0.00, 0.00, 0.00, 0.00, 0.00))



#undef ARRAY_SIZE