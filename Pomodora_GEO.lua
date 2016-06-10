-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
	--include('Mote-Include.lua')  
	
    -- VARIABLES --
    auto_action = 'Off'
	geo_mode = 'Frailty'	
	blaze = 'Off'
	indi_mode = 'Fury'
	
	windower.register_event('tp change', function(new, old)
        if new > 349
        and auto_action == 'On' then
            relaxed_play_mode()
        end
    end)

    windower.register_event('time change', function(time)
        if auto_action == 'On' then
            relaxed_play_mode()
        end
    end)
	
	
	
 --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast = {}
    sets.precast.JA = {}	
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic"}
	sets.precast.JA['Full cycle'] = {head="Azimuth Hood"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua sandals"}

	fc_feet = { name="Merlinic Crackows", augments={'Mag. Acc.+17','"Fast Cast"+3','"Mag.Atk.Bns."+2',}}
	fc_head = { name="Merlinic Hood", augments={'Mag. Acc.+4','"Fast Cast"+2','CHR+15','"Mag.Atk.Bns."+6',}}
	
    -- Fast cast sets for spells

    sets.precast.FastCast = {
		range="Dunna",
        head=fc_head,ear1="Etiolation Earring", ear2="Loquacious Earring",
        body="Vanir Cotehardie", ring2="Weatherspoon Ring", hands="Amalric gages",
        back="Lifestream Cape",waist="Cetl Belt",legs="Geomancy Pants",feet=fc_feet
		}

    sets.precast.FastCast.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Sors Shield",back="Pahtli Cape"})

    sets.precast.FastCast['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Bagua mitaines"})

    
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Amar cluster",
        head="Welkin Crown",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Brutal Earring",
        body="Amalric doublet",hands="Amalric gages",ring1="Rajas Ring",ring2="Rufescent Ring",
        back="Buquwik Cape",waist="Fotia Belt",legs="Amalric slops",feet="Battlecast Gaiters"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Flash Nova'] = {ammo="Witchstone",
        head="Welkin Crown",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Barkarole Earring",
        body="Amalric doublet",hands="Amalric gages",ring1="Acumen Ring",ring2="Etana ring",
        back="Toro Cape",waist="Fotia Belt", legs="Amalric slops", feet="Helios boots"}

    sets.precast.WS['Starlight'] = {ear2="Moonshade Earring"}

    sets.precast.WS['Moonlight'] = {ear2="Moonshade Earring"}


    --------------------------------------
    -- Midcast sets
    --------------------------------------

    -- Base fast recast for spells
    sets.midcast = {}
    sets.midcast.FastRecast = {
        head="Nahtirah Hat",ear1="Etiolation Earring", ear2="Loquacious Earring",
        body="Vanir Cotehardie", ring1="Weatherspoon Ring", hands="Amalric gages",
        back="Lifestream Cape",waist="Cetl Belt",legs="Geomancy Pants",feet="Regal Pumps +1"}

    sets.midcast.Geomancy = {main="Solstice", sub="Genbu's Shield",  range="Dunna", 
		head="Azimuth Hood", body="Bagua Tunic", hands="Geomancy Mitaines +1", ear1="Influx Earring", ear2="Gifted Earring", 
		neck="Incanter's torque", ring2="Renaye Ring", feet="Azimuth Gaiters", back="Lifestream Cape"}
		
    sets.midcast.Geomancy.Indi = {main="Solstice", sub="Genbu's Shield", range="Dunna", 
		head="Azimuth Hood", body="Bagua Tunic", ear1="Influx Earring", ear2="Gifted Earring", neck="Incanter's torque",
		legs="Bagua Pants", hands="Geomancy Mitaines +1", feet="Azimuth Gaiters", back="Lifestream Cape"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield", ear1="Novia Earring", ear2="Gifted Earring",
        head="Vanya Hood", body="Vanya Robe",hands="Telchine Gloves", ring1="Sirona's ring", ring2="Lebeche ring",
        legs="Assiduity Pants +1",feet="Hagondes Sabots"}
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast['Enhancing Magic'] = {
        head="Welkin Crown", neck="Sanctity Necklace", ear1="Influx Earring", ear2="Loquacious Earring",
        body="Telchine Chasuble",hands="Amalric gages", ring1="Etana ring", ring2="Leviathan ring",
        back="Pahtli Cape",waist="Refoccillation Stone",legs="Assiduity Pants +1", feet="Telchine Pigaches"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash", neck="Stone gorget"})
    
    sets.midcast['Enfeebling Magic'] = {main="Marin staff", sub="Niobid Strap", range="Dunna",
				head="Bagua Galero", neck="Sanctity Necklace", ear2="Influx Earring", ear1="Moonshade Earring",
                body="Vanya Robe", hands="Amalric gages", ring1="Etana ring", ring2="Leviathan ring",
                back="Lifestream Cape", waist="Ovate Rope", legs="Amalric slops", feet="Bagua Sandals"}
    
    sets.midcast['Elemental Magic'] = {main="Marin staff", sub="Niobid Strap", ammo="Witchstone",
				head="Welkin Crown", neck="Sanctity Necklace", ear1="Barkarole Earring", ear2="Friomisi Earring",
                body="Amalric doublet", hands="Amalric gages", ring1="Acumen Ring", ring2="Shiva Ring",
                back="Toro Cape", waist="Refoccillation Stone", legs="Amalric slops", feet="Helios boots"}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Marin staff", sub="Niobid Strap", range="Dunna",
				head="Bagua Galero", neck="Incanter's Torque", ear1="Barkarole Earring", ear2="Friomisi Earring",
                body="Geomancy Tunic", hands="Amalric gages", ring1="Acumen Ring", ring2="Etana ring",
                back="Lifestream Cape", waist="Cetl Belt", legs="Amalric slops", feet="Helios boots"}

    sets.magic_burst = {main="Marin staff +1", sub="Niobid Strap", ammo="Ghastly Tathlum",
				head="Merlinic hood", neck="Mizu. Kubikazari", lear="Barkarole Earring", rear="Friomisi Earring",
                body="Amalric doublet", hands="Amalric gages", lring="Mujin Band", rring="Locus ring",
                back="Seshaw cape", waist="Refoccilation Stone", legs="Merlinic shalwar", feet="Merlinic Crackows"}
	
				
	sets.obi = {
		Fire = {waist="Karin Obi"},
		Earth = {waist="Dorin Obi"},
		Water = {waist="Suirin Obi"},
		Wind = {waist="Furin Obi"},
		Ice = {waist="Hyorin Obi"},
		Lightning = {waist="Rairin Obi"},
		Light = {waist="Korin Obi"},
		Dark = {waist="Anrin Obi"},
		}				
				
    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
	
    -- Resting sets
    sets.resting = {main="Pluto's Staff", range="Dunna",
				head="Azimuth Hood", neck="Incanter's torque", rear="Etiolation Earring", lear="Ethereal Earring",
                body="Amalric doublet", hands="Bagua Mitaines", lring="Paguroidea Ring", rring="Renaye Ring",
                back="Toro Cape", waist="Refoccilation Stone", legs="Assiduity Pants +1", feet="Azimuth Gaiters"}
	
    -- Idle sets

    sets.idle = {
--	main="Terra's Staff", sub="Volos Strap",
	main="Bolelabunga", sub="Genbu's Shield", 
	range="Dunna",head="Vanya Hood",
        neck="Sanctity Necklace", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Vanya Robe",hands="Bagua Mitaines", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    sets.idle.PDT = {
--	main="Terra's Staff", sub="Volos Strap",
	main="Bolelabunga", sub="Genbu's Shield", 
	range="Dunna",head="Vanya Hood",
        neck="Twilight Torque", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Vanya Robe",hands="Helios Gloves", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet=fc_feet
		}

    -- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {
	main="Terra's Staff", sub="Volos Strap",
--	main="Bolelabunga", sub="Genbu's Shield", 
	range="Dunna",head="Vanya Hood",
        neck="Sanctity Necklace", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet=fc_feet
		}
   
    sets.idle.PDT.Pet = {
	main="Terra's Staff", sub="Volos Strap",
--	main="Bolelabunga", sub="Genbu's Shield", 
	range="Dunna",head="Vanya Hood",
        neck="Twilight Torque", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet=fc_feet
		}

    -- .Indi sets are for when an Indi-spell is active.
    --sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants"})
    --sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs="Bagua Pants"})
    --sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants"})
    --sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {legs="Bagua Pants"})

    sets.idle.Town = {main="Bolelabunga", sub="Genbu's Shield", range="Dunna",head="Vanya Hood",
        neck="Sanctity Necklace", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Vanya Robe",hands="Bagua Mitaines", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    sets.idle.Weak = {main="Bolelabunga", sub="Genbu's Shield", range="Dunna",head="Vanya Hood",
        neck="Sanctity Necklace", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Vanya Robe",hands="Bagua Mitaines", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    sets.Kiting = {feet="Herald's Gaiters"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Bolelabunga", sub="Genbu's Shield", range="Dunna",
        neck="Sanctity Necklace", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}
	
	
end

do
    --[[ Author: Arcon
            The three next "do" sections are used to aid in checking recast
            times, can check multiple recast times at once ]]
    local cache = {}

    function j(str)
        if not cache[str] then
            cache[str] = gearswap.res.job_abilities:with('name', str)
        end

        return cache[str]
    end
end

do
    local cache = {}

    function s(str)
        if not cache[str] then
            cache[str] = gearswap.res.spells:with('name', str)
        end

        return cache[str]
    end
end

do
    local ja_types = S(gearswap.res.job_abilities:map(table.get-{'type'}))

    function check_recasts(...)
        local spells = S{...}

        for spell in spells:it() do
            local fn = 'get_' .. (ja_types:contains(spell.type)
                    and 'ability'
                    or 'spell') ..'_recasts'
            if windower.ffxi[fn]()[spell.recast_id] > 0 then
                return false
            end
        end

        return true
    end
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    indi_timer = ''
    indi_duration = 180
	
	
	    -- VARIABLES --
    auto_action = 'Off'
	geo_mode = 'Frailty'
	blaze = 'Off'
	indi_mode = 'Fury'
	
	windower.register_event('tp change', function(new, old)
        if new > 349
        and auto_action == 'On' then
            relaxed_play_mode()
        end
    end)

    windower.register_event('time change', function(time)
        if auto_action == 'On' then
            relaxed_play_mode()
        end
    end)
	
	
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT')

	state.MagicBurst = M(false, 'Magic Burst')
 
    -- Additional local binds
    send_command('bind ^` gs c toggle MagicBurst')
end

function self_command(str)
    -- Use an in game macro "/con gs c auto_action" to toggle bot Off and On
							--macro: "/con send Anukk gs c auto_action"
    if str == 'auto_action' then
		if auto_action == 'Off' then
			auto_action = 'On'
		else
			auto_action  = 'Off'
		end
		windower.add_to_chat(8,'Event set to: '..auto_action)
		windower.send_command('input /tell Keaddo Si mangia? '..auto_action)

	elseif str == 'status' then
		windower.add_to_chat(8, 'Indi mode: '..indi_mode..', Geo mode: '..geo_mode)
		windower.send_command('input /tell Keaddo Indi mode: '..indi_mode..', Geo Mode: '..geo_mode)
	
	elseif str == 'indi_mode' then
		if indi_mode == 'Fury' then
			indi_mode = 'Attunement'
			geo_mode = 'Vex'
		elseif indi_mode == 'Attunement' then
			indi_mode = 'Acumen'
			geo_mode = 'Malaise'
		elseif indi_mode == 'Acumen' then
			indi_mode = 'Precision'
			geo_mode = 'Torpor'
		elseif indi_mode == 'Precision' then
			indi_mode = 'Focus'
			geo_mode = 'Languor'
		elseif indi_mode == 'Focus' then
			indi_mode = 'Barrier'
			geo_mode = 'Wilt'
		elseif indi_mode == 'Barrier' then
			indi_mode = 'Haste'
			geo_mode = 'None'
		elseif indi_mode == 'Haste' then
			indi_mode = 'Fury'
			geo_mode = 'Frailty'			
		end		
		windower.add_to_chat(8,'Indi set mode: '..indi_mode..',Geo set mode: '..geo_mode)		
		windower.send_command('input /tell Keaddo Indi_mode: '..indi_mode..', Geo_mode: '..geo_mode)
	
	elseif str == 'geo_mode' then
		if geo_mode == 'Frailty' then
			geo_mode = 'Vex'
		elseif geo_mode == 'Vex' then
			geo_mode = 'Malaise'
		elseif geo_mode == 'Malaise' then
			geo_mode = 'Torpor'
		elseif geo_mode == 'Torpor' then
			geo_mode = 'Languor'
		elseif geo_mode == 'Languor' then
			geo_mode = 'Wilt'
		elseif geo_mode == 'Wilt' then
			geo_mode = 'None'
		elseif geo_mode == 'None' then
			geo_mode = 'Frailty'			
		end		
		windower.add_to_chat(8,'Geo set mode: '..geo_mode)		
		windower.send_command('input /tell Keaddo Geo_mode: '..geo_mode)
		
	elseif str == 'entrust_acc' then
		if not check_buffs('silence', 'mute')
		and check_recasts(s('Indi-Precision'))
		and check_recasts(s('Entrust')) then
			windower.send_command('Entrust <me>;wait 1;Indi-Precision <p1>')				
		end
		
	elseif str == 'entrust_focus' then
		if not check_buffs('silence', 'mute')
		and check_recasts(s('Indi-Focus'))
		and check_recasts(s('Entrust')) then
			windower.send_command('Entrust <me>;wait 1;Indi-Focus <p1>')				
		end		

	elseif str == 'entrust_fury' then
		if not check_buffs('silence', 'mute')
		and check_recasts(s('Indi-Fury'))
		and check_recasts(s('Entrust')) then
			windower.send_command('Entrust <me>;wait 1;Indi-Fury <p1>')				
		end	

	elseif str == 'entrust_haste' then
		if not check_buffs('silence', 'mute')
		and check_recasts(s('Indi-Haste'))
		and check_recasts(s('Entrust')) then
			windower.send_command('Entrust <me>;wait 1;Indi-Haste <p1>')				
		end	

	elseif str == 'blaze' then
		if not check_buffs('silence', 'mute')
		and player.mp > 379
		and check_recasts(s('Radial Arcana'))
		and check_recasts(s('Blaze of Glory'))
		and check_recasts(s('Dematerialize')) then
			blaze = 'On'
		end	
		
	end
end
	
function relaxed_play_mode()
    -- This can be used as a mini bot to automate actions
    if not midaction() then
        if player.hpp < 70
		and player.sub_job == 'RDM'
                and not check_buffs('silence', 'mute')
                and check_recasts(s('cure4')) then
				windower.send_command('cure4 <me>')
				
		elseif player.hpp > 90 
				and player.sub_job == 'RDM'
                and player.mpp < 10
                and check_recasts(s('Convert')) then
				windower.send_command('Convert;wait 1;cure4 <me>')
				
		elseif not check_buffs('Refresh')
				and player.sub_job == 'RDM'
                and not check_buffs('silence', 'mute')
                and check_recasts(s('Refresh')) then
				windower.send_command('Refresh <me>')
														
		--Indi		
		elseif not check_buffs('Attack Boost')
                and not check_buffs('silence', 'mute')
				and indi_mode == 'Fury'
                and check_recasts(s('Indi-Fury')) then
				windower.send_command('Indi-Fury')
			
		elseif not check_buffs('Magic Evasion Boost')
                and not check_buffs('silence', 'mute')
				and indi_mode == 'Attunement'
                and check_recasts(s('Indi-Attunement')) then
				windower.send_command('Indi-Attunement')
			
		elseif not check_buffs('Magic Atk. Boost')
                and not check_buffs('silence', 'mute')
				and indi_mode == 'Acumen'
                and check_recasts(s('Indi-Acumen')) then
				windower.send_command('Indi-Acumen')

		elseif not check_buffs('Accuracy Boost')
                and not check_buffs('silence', 'mute')
				and indi_mode == 'Precision'
                and check_recasts(s('Indi-Precision')) then
				windower.send_command('Indi-Precision')				

		elseif not check_buffs('Magic Acc. Boost')
                and not check_buffs('silence', 'mute')
				and indi_mode == 'Focus'
                and check_recasts(s('Indi-Focus')) then
				windower.send_command('Indi-Focus')	
		elseif not check_buffs('Defense Boost')
				and not check_buffs('silence', 'mute')
				and indi_mode == 'Barrier'
				and check_recasts(s('Indi-Barrier')) then
				windower.send_command('Indi-Barrier')
		elseif not check_buffs('Haste')
				and not check_buffs('silence', 'mute')
				and indi_mode == 'Haste'
				and check_recasts(s('Indi-Haste')) then
				windower.send_command('Indi-Haste')
				
		--blaze of glory
		elseif blaze == 'On'
				and not check_buffs('silence', 'mute')
				and check_recasts(s('Geo-Frailty'))
				and player.mp > 379 
				and check_recasts(s('Radial Arcana'))
				and check_recasts(s('Blaze of Glory'))
				and check_recasts(s('Dematerialize')) then
					if geo_mode == 'Frailty' then
						windower.send_command('Radial Arcana <me>;wait 1;Blaze of Glory <me>;wait 2;Geo-Frailty <bt>;wait 6;Dematerialize <me>;wait 1;Life Cycle <me>;wait 1;Lasting Emanation <me>;wait 1;Dia2 <bt>')
					elseif geo_mode == 'Vex' then
						windower.send_command('Radial Arcana <me>;wait 1;Blaze of Glory <me>;wait 2;Geo-Vex <bt>;wait 6;Dematerialize <me>;wait 1;Life Cycle <me>;wait 1;Lasting Emanation <me>;wait 1;Dia2 <bt>')
					elseif geo_mode == 'Malaise' then
						windower.send_command('Radial Arcana <me>;wait 1;Blaze of Glory <me>;wait 2;Geo-Malaise <bt>;wait 6;Dematerialize <me>;wait 1;Life Cycle <me>;wait 1;Lasting Emanation <me>;wait 1;Dia2 <bt>')
					elseif geo_mode == 'Torpor' then
						windower.send_command('Radial Arcana <me>;wait 1;Blaze of Glory <me>;wait 2;Geo-Torpor <bt>;wait 6;Dematerialize <me>;wait 1;Life Cycle <me>;wait 1;Lasting Emanation <me>;wait 1;Dia2 <bt>')
					elseif geo_mode == 'Languor' then
						windower.send_command('Radial Arcana <me>;wait 1;Blaze of Glory <me>;wait 2;Geo-Languor <bt>;wait 6;Dematerialize <me>;wait 1;Life Cycle <me>;wait 1;Lasting Emanation <me>;wait 1;Dia2 <bt>')
					elseif geo_mode == 'Wilt' then
						windower.send_command('Radial Arcana <me>;wait 1;Blaze of Glory <me>;wait 2;Geo-Wilt <bt>;wait 6;Dematerialize <me>;wait 1;Life Cycle <me>;wait 1;Lasting Emanation <me>')
					elseif geo_mode == 'None' then
					end
					blaze = 'Off'
		
		--Geo
		elseif not pet.isvalid
				and not check_buffs('silence', 'mute')
				and check_recasts(s('Geo-Frailty'))
				and check_recasts(s('Geo-Vex'))
				and check_recasts(s('Geo-Malaise'))
				and check_recasts(s('Geo-Torpor'))
				and check_recasts(s('Geo-Barrier')) then
					if player.mp > 305	and geo_mode == 'Frailty' then
						windower.send_command('wait 2;Geo-Frailty <bt>;wait 7;Dia2 <bt>')					
					elseif player.mp > 302	and geo_mode == 'Vex' then
						windower.send_command('wait 2;Geo-Vex <bt>;wait 7;Dia2 <bt>')
					elseif player.mp > 379 and geo_mode == 'Malaise' then
						windower.send_command('wait 2;Geo-Malaise <bt>;wait 7;Dia2 <bt>')	
					elseif player.mp > 203 and geo_mode == 'Torpor' then
						windower.send_command('wait 2;Geo-Torpor <bt>;wait 7;Dia2 <bt>')
					elseif player.mp > 249 and geo_mode == 'Languor' then
						windower.send_command('wait 2;Geo-Languor <bt>;wait 7;Dia2 <bt>')	
					elseif player.mp > 250 and geo_mode == 'Barrier' then
						windower.send_command('wait 2;Geo-Barrier <me>')
					elseif geo_mode == 'None' then
					end
		
		end
	end
	
	if not midaction() then
		if not check_buffs('Stoneskin')
			and player.sub_job == 'RDM'
			and not check_buffs('silence', 'mute')
			and check_recasts(s('Stoneskin')) then
			windower.send_command('Stoneskin')	
		end
		--if not check_buffs('Phalanx')
		--	and not check_buffs('silence', 'mute')
		--	and check_recasts(s('Phalanx')) then
		--	windower.send_command('Phalanx')	
		--end		
	end
	
end

function relaxed_play_mode2()
    -- Skillup Elemental/Enfeebling/Dark
    if not midaction() then
        if player.hpp < 70
                and not check_buffs('silence', 'mute')
                and check_recasts(s('cure4')) then
				windower.send_command('cure4 <me>')

		elseif player.hpp > 90 
                and player.mpp < 10
                and check_recasts(s('Convert')) then
				windower.send_command('Convert;wait 1;cure4 <me>')

		elseif not check_buffs('Regen')
                and not check_buffs('silence', 'mute')
                and check_recasts(s('Indi-Regen')) then
				windower.send_command('Indi-Regen')				
     			
		elseif not pet.isvalid
                and not check_buffs('silence', 'mute')
                and check_recasts(s('Geo-Refresh')) then
				windower.send_command('Geo-Refresh <me>')
			
		elseif not check_buffs('silence', 'mute') then
				--windower.send_command('fire <bt>')
				--windower.send_command('dia <bt>')
				windower.send_command('bio <bt>')
									
        end
    end
end


-- Define sets and vars used by this job file.
-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Geomancy' then
            if spell.english:startswith('Indi') then
                return 'Indi'
            end
        end
    end
end


function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    classes.CustomIdleGroups:clear()
    if player.indi then
        classes.CustomIdleGroups:append('Indi')
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    local msg = 'Offense'
    msg = msg .. ': [' .. state.OffenseMode.value .. '], '
    msg = msg .. 'Casting'
    msg = msg .. ': [' .. state.CastingMode.value .. '], '
    msg = msg .. 'Idle'
    msg = msg .. ': [' .. state.IdleMode.value .. '], '

    if state.MagicBurst.value == true then
        msg = msg .. 'Magic Burst: [On]'
    elseif state.MagicBurst.value == false then
        msg = msg .. 'Magic Burst: [Off]'
    end

    add_to_chat(122, msg)

    eventArgs.handled = true
end

function job_post_midcast(spell, action, spellMap, eventArgs)
	if spell.action_type == "Magic" then
        if spell.element == world.weather_element or spell.element == world.day_element then
            equip(sets.obi[spell.element])
        end
    end
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end

function check_buffs(...)
    --[[ Function Author: Arcon
            Simple check before attempting to auto activate Job Abilities that
            check active buffs and debuffs ]]
    return table.any({...}, table.get+{buffactive})
end

function check_set_spells(...)

    --[[ Function Author: Arcon
            Used to pull list of currently set spells, this is useful for
            determining traits such as Dual Wield IV
            Also used to determine the Cure spell set, when used with a
            self_command ]]
    set_spells = set_spells
        or gearswap.res.spells:type('BlueMagic'):rekey('name')
        return table.all({...}, function(name)
        return S(windower.ffxi.get_mjob_data().spells)
        :contains(set_spells[name].id)
    end)
end

function gear_modes()
    -- User created bridge for aftercast and status_change functions
    -- Sequential gear sets used to easily allow for changing player needs
    --slot_disabling()

    local attack_preference = 'null'

    if player.status == 'Engaged' then
        --[[ This will adjust the amount of Dual Wield used based on if Magic
                Haste is capped from March song, It is assumed that March is
                sung with an instrument that will allow you to hit the cap ]]
        if (check_buffs('Haste') and check_buffs('March')) or
                    (check_buffs('Haste') and check_buffs('Mighty Guard')) or
                    buffactive.haste == 2 then
            attack_preference = 'Multiattack'
        else
            attack_preference = 'Dual Wield'
        end
        equip(sets.engaged)
    elseif player.status == 'Idle' then
		if pet.isvalid then
			equip(sets.idle.Pet)
		else
			equip(sets.idle)
		end
--      if dt_mode == 'None' then
  --          --print(party.count)
    --        if party.count > 1 then
      --          equip(sets.idle.SphereRefresh)
        --    end
          --  if player.mpp < 50 then
            --    equip(sets.idle.under_50mpp)
--            end
  --          if check_buffs('Reive Mark') then
    --            equip(sets.misc.Reive)
      --      end
   --     end
    end

   -- Will inform you if no weapon is equiped and re-equip once able
    if player.equipment.main == 'empty' then
        equip(sets.weapon[weapon_combo])
        windower.add_to_chat(8,'No Weapon, trying to re-equip: '..weapon_combo)
    end
end

function precast(spell,arg)
    gear_change_ok = false
    slot_disabling()


    --[[ Generic equip command for Job Abilities and Weaponskills that have
            a gear set listed in get_sets()
            If Idle and a weaponskill macro is pressed you will change to
            current Idle/DT set, useful as a fast way to equip proper gear
            For then in game macros the quotations("") and <t> aren't needed
            EX: /ws Expiacion ]]
    if sets.precast.JA[spell.name] then
        equip(sets.precast.JA[spell.name])
    elseif sets.precast.WS[spell.name] then
        if player.status == 'Engaged' then
            equip(sets.precast.WS[spell.name])
            if check_buffs('Reive Mark') then
                equip(sets.misc.Reive)
            end
        else
            cancel_spell()
            gear_modes()
            return
        end
    end

    -- Magic spell gear handling(Precast)
    if spell.prefix == '/magic'
            or spell.prefix == '/ninjutsu'
            or spell.prefix == '/song' then
        if spell.type == 'BlueMagic' then
            equip(sets.precast.FastCast.BlueMagic)
        else
            equip(sets.precast.FastCast)
        end
        if spell.name == 'Utsusemi: Ichi'
                and check_recasts(spell)
                and shadow_type == 'Ni' then
            if check_buffs(
                    'Copy Image',
                    'Copy Image (2)',
                    'Copy Image (3)') then
                windower.send_command('cancel copy image;'
                    ..'cancel copy image (2); cancel copy image (3)')
            end
        elseif (spell.name == 'Monomi: Ichi' or spell.name == 'Sneak')
                and check_buffs('Sneak')
                and check_recasts(spell)
                and spell.target.type == 'SELF' then
            windower.send_command('cancel sneak')
        elseif (spell.name == 'Diamondhide'
                or spell.name == 'Metallic body'
                or spell.name == 'Stoneskin')
                and check_buffs('Stoneskin')
                and check_recasts(spell) then
            windower.send_command('cancel stoneskin')
        end
    end

    -- Dancer Sub Job
    if spell.name == 'Spectral Jig'
            and check_buffs('Sneak')
            and check_recasts(spell) then
        windower.send_command('cancel sneak')
        cast_delay(0.3)
    elseif windower.wc_match(spell.name,'*Step') then
        equip(sets.TP['Accuracy High'])
    end
end

function midcast(spell,arg)
    -- Special handling for Spell Mappings outlined in get_maps()
    local stat
	
	if spell.english:startswith('Indi') or spell.english:startswith('Geo') then
		equip(sets.midcast.Geomancy)
	end
	
    if spell.skill == 'Healing Magic' or spell.type == 'Trust' then
        equip(sets.midcast.FastRecast)
        if spell.name:startswith('Cure') then
            equip(sets.midcast.Cure)
            if spell.target.type == 'SELF' then
                equip(sets.midcast.Cure)
            end
        end
	end
	if spell.skill == 'Enhancing Magic' then
		equip(sets.midcast['Enhancing Magic'])
	end
    if spell.skill == 'Elemental Magic' then
        equip(sets.midcast['Elemental Magic'])
    end
	if spell.skill == 'Enfeebling Magic' then
		equip(sets.midcast['Enfeebling Magic'])
	end
	if spell.skill == 'Dark Magic' then
		equip(sets.midcast['Dark Magic'])
	end	
    if spell.name:startswith('Utsusemi') then
        equip(sets.misc.DT.Active)
	end

end

function aftercast(spell,arg)
    gear_change_ok = true
    gear_modes()

    -- Gear info, useful if using DressUp or BlinkMeNot

    if not spell.interrupted then
        -- Changes shadow type variable to allow cancel Copy Image
        -- if last cast was Utsusemi: Ni
        if spell.name == 'Utsusemi: Ni' then
            shadow_type = 'Ni'
        elseif spell.name == 'Utsusemi: Ichi' then
            shadow_type = 'Ichi'
        end

        -- If you have spells under a different macro set in game this will let
        -- you change to that set quickly and then change back once finished
        if spell.name:startswith('Unbridled') then
            windower.send_command('input /macro set 3')
        end

        -- TIMERS PLUGIN: Dream Flower
        if spell.name == 'Dream Flower' then
            windower.add_to_chat(8,'NOTE: 1:30 general timer set, '
                ..'max sleep can last 2:00')
            windower.send_command('timers c "Dream Flower" 90 down'
                ..'spells/00521.png')
        end

        -- TIMERS PLUGIN: Since Aftermath: Lv.1 can overwrite itself this
        -- will delete and re-create this specific timer
        if spell.name == 'Expiacion' and player.equipment.main == 'Tizona'
                and check_buffs('Aftermath: Lv.1') then
            windower.send_command('timers d "Aftermath: Lv.1"; wait 0.3;'
                ..'timers c "Aftermath: Lv.1" 90 down abilities/00027.png')
        end
    end
end

function slot_disabling()
    -- Disable slots for items you don't want removed when performing actions
    if player.equipment.head == 'Reraise Hairpin' then
        disable('head')
        windower.add_to_chat(8,'Reraise Hairpin equiped on head')
    else
        enable('head')
    end

    if player.equipment.left_ear == 'Reraise Earring' then
        disable('left_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on left ear')
    else
        enable('left_ear')
    end

    if player.equipment.right_ear == 'Reraise Earring' then
        disable('right_ear')
        windower.add_to_chat(8,'Reraise Earring equiped on right ear')
    else
        enable('right_ear')
    end

    --[[ count_msg_mecisto can be adjusted to the value you want for periodic
            reminders that you have slot locked, count is incresed twice by
            most actions due to slot_disabling() being called in precast
            and again after the cast in gear_modes() ]]
    if player.equipment.back == 'Mecisto. Mantle' then
        disable('back')
   --     if count_msg_mecisto == 0 then
    --        windower.add_to_chat(8,'REMINDER:  '
      --          ..'Mecistopins mantle equiped on back')
    --    end
    --    count_msg_mecisto = (count_msg_mecisto + 1) % 30
    else
        enable('back')
   --     count_msg_mecisto = 0
    end
end

function status_change(new,old)
    if T{'Idle','Engaged'}:contains(new) and gear_change_ok then
        gear_modes()
    end
end