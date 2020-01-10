var/list/auras = new

mob
	var/list
		buffs
		debuffs
	proc
		AddAura(aura)
			if(istype(aura, /AURA/Buff))
				if(buffs[aura])
					buffs[aura].AddStack()
				else
					buffs += new aura(usr)
			if(istype(/AURA/Debuff, aura))
				if(debuffs[aura])
					debuffs[aura].AddStack()
				else
					debuffs += new aura(usr)

		RemoveAura(AURA/aura)
			if(debuffs[aura])
				debuffs[aura] = null
			if(buffs[aura])
				buffs[aura] = null


AURA
	parent_type = /obj
	var
		mob/attached_to
		ID
		description
		max_stacks = 1
		current_stacks = 1
		duration = 0
		time_init = -1#INF
		time_left = -1#INF

	New(mob/m)
		m.client.screen += src
		attached_to = m
		InitEffect()

	Del()
		DelEffect()
		..()


	proc
		StartDuration()
			if(!duration)
				return FALSE
			time_init = world.time
			while(time_init)
				if(world.time >= time_init + duration)
					time_init = -1#INF
					break
				sleep(5)
			del(src)

		AddStack(amount = 1)
			time_init = world.time
			if(max_stacks == 1) return
			current_stacks = max_stacks - current_stacks ? current_stacks++ : current_stacks


		InitEffect()
			attached_to.AddAura(src)

		DelEffect()
			attached_to.client.screen -= src
			attached_to.RemoveAura(src)
	Buff

		New(mob/m)
			..(m)
			StartDuration()


		StrongInArms
			ID = 1
			duration = 10*10

			max_stacks = 5

			icon = 'strongarms.dmi'
			screen_loc = "15x15"

			var/buff_ratio = 1.5
			var/buff_pratio = 0.5

			AddStack()
				..()
				attached_to.Stats_Multiply("strenght", "value",buff_ratio)

			InitEffect()
				..()
				attached_to.Stats_Multiply("strenght", "value",buff_ratio)

			DelEffect()
				..()
				attached_to.Stats_Multiply("strenght", "value",buff_pratio * current_stacks)

	Debuff

		LingeringCurse
			ID = 2
			var/debuff_ratio = 0.9
			var/debuff_pratio = 1.1

			InitEffect()
				attached_to.combat_stats["health"].Multiply("limit",debuff_ratio)
				attached_to.combat_stats["health"].Multiply("value",debuff_ratio)

			DelEffect()
				attached_to.combat_stats["health"].Multiply("limit",debuff_pratio)
				attached_to.combat_stats["health"].Multiply("value",debuff_pratio)