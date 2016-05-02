-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------

-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
    
    -- Load and initialize the include file.
    include('Mote-Include.lua')
end


-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    state.MagicBurst = M(false, 'Magic Burst')
    state.Spaekona = M(false, 'Spaekona')
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'HighMP')
    state.CastingMode:options('Normal', 'HighMP')
    state.IdleMode:options('Normal', 'HighMP','DT')

    -- Additional local binds
    send_command('bind !` gs c toggle MagicBurst')
    send_command('bind !g gs c toggle Spaekona')
    gear.aspir_body = "Amalric Doublet"
    gear.aspir_hands = {name="Merlinic Dastanas", augments={'Mag. Acc.+6','"Drain" and "Aspir" potency +11','CHR+10',}}
    gear.aspir_legs = "Merlinic Shalwar"
    gear.aspir_feet = { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}}
	gear.fc_head = "Merlinic Hood"
	gear.fc_feet = { name="Merlinic Crackows", augments={'"Fast Cast"+5','"Mag.Atk.Bns."+11',}}
	gear.nuke_head = "Merlinic Hood"
	gear.nuke_body = "Amalric Doublet"
	gear.nuke_legs = "Amalric Slops"
	gear.nuke_feet = { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}}
	gear.burst_head = "Merlinic Hood"
	gear.burst_legs = "Merlinic Shalwar"
	gear.burst_feet = { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}}
    select_default_macro_book()
end

-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind !')
    send_command('unbind !g')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

    ---- Idle Sets ----
    sets.idle = {
		ammo="Pemphredo Tathlum",
		head="Amalric Coif",
		neck="Sanctity Necklace",
		ear1="Infused Earring",
		ear2="Ethereal Earring",
		body="Vrikodara Jupon",
		hands="Amalric Gages",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring",
		back="Solemnity Cape", 
		waist="Refoccilation Stone",
		legs="Assiduity Pants +1",
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}}
	}

    sets.idle.HighMP = {
        ammo="Psilomene",
        head="Amalric Coif",
        neck="Loricate Torque +1",
        ear1="Etiolation Earring",
        ear2="Loquacious Earring",
        body="Amalric Doublet",
        hands="Amalric Gages",
        ring1="Defending Ring",
        ring2="Gelatinous Ring +1",
        back="Bane Cape",
        waist=gear.ElementalObi,
        legs="Amalric Slops",
        feet="Amalric Nails",
	}
	
    sets.idle.Town =                                                        set_combine(sets.idle,{
		ring1="Defending Ring",
		ring2="Weatherspoon Ring",
		back="Taranus's Cape",
		feet="Herald's Gaiters"})
		
    sets.defense.PDT =                                                      set_combine(sets.idle,{
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ring1="Gelatinous Ring +1",
		ring2="Defending Ring"
		})

    ---- Precast Sets ----
    sets.precast.FC = {
		ammo="Impatiens",
		head=gear.fc_head,
		ear1="Etiolation Earring",
		ear2="Loquacious Earring",
		body="Vrikodara Jupon",
		ring1="Prolix Ring",
		ring2="Weatherspoon Ring",
		back="Swith Cape",
		legs="Psycloth Lappas",
		feet=gear.fc_feet,
    }
    
    sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty, body="Twilight Cloak"})

    sets.precast.FC.HighMP = {
        ammo="Impatiens",
        head="Merlinic Hood",
		body="Vrikodara Jupon",
        hands="Amalric Gages",
        legs="Psycloth Lappas",
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+5','"Mag.Atk.Bns."+11',}},
        neck="Orunmila's Torque",
		waist="Witful Belt",
        left_ear="Etiolation Earring",
        right_ear="Loquac. Earring",
        left_ring="Mephitas's Ring",
        right_ring="Mephitas's Ring +1",
        back="Bane Cape",
    }

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC['Elemental Magic'].HighMP = set_combine(sets.precast.FC, {})

    ---- Midcast Sets ----
    sets.midcast.Myrkr = {
        ammo="Psilomene",
        head="Amalric Coif",
        neck="Sanctity Necklace",
        ear1="Etiolation Earring",
        ear2="Loquacious Earring",
        body="Amalric Doublet",
        hands="Amalric Gages",
        ring1="Mephitas's Ring",
        ring2="Mephitas's Ring +1",
        back="Bane Cape",
        waist="Refoccilation Stone",
        legs="Amalric Slops",
        feet="Amalric Nails",
    }

    sets.midcast.Cure = {
	body="Vrikodara Jupon",
	back="Solemnity Cape",
	waist=gear.ElementalObi
	}

    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Stoneskin = {
		head="Umuthi Hat",
		legs="Shedir Seraweels",
		waist="Siegel Sash"}

    sets.midcast.Stoneskin.HighMP = set_combine(sets.midcast.Stoneskin, {
        back="Bane Cape"
    })
    
    sets.midcast.Aquaveil = {
		head="Amalric Coif",
		legs="Shedir Seraweels"
	}
    
    sets.midcast.Aquaveil.HighMP = set_combine(sets.midcast.Aquaveil, {
        back="Bane Cape"
    })

    sets.midcast['Enfeebling Magic'] = {
	ammo="Pemphredo Tathlum",
	head="Amalric Coif",
	neck="Sanctity Necklace",
	ear1="Digni. Earring",
	ear2="Barkarole Earring",
	body="Amalric Doublet",
	hands="Amalric Gages",
	ring1="Metamorph Ring",
	ring2="Weatherspoon Ring",
	back="Refraction Cape",
	waist="Porous Rope",
	legs="Psycloth Lappas",
	feet="Medium's Sabots"
    }

    sets.midcast.Aspir = {
		ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",
		neck="Mizu. Kubikazari",
		ear1="Hirudinea Earring",
		ear2="Barkarole Earring",
        body=gear.aspir_body,
        hands=gear.aspir_hands,
		ring1="Evanescence Ring",
		ring2="Weatherspoon Ring",	
		back="Bane Cape",
		waist="Fucho-no-Obi",
        legs=gear.aspir_legs,
		Feet=gear.aspir_feet
    }
	


    sets.midcast.Aspir.HighMP = set_combine(sets.midcast.Aspir,{
		ammo="Psilomene",
		neck="Incanter's Torque",
		legs="Amalric Slops",
		ring2="Mephitas Ring +1"
    })

    sets.midcast.Drain = sets.midcast.Aspir

    sets.midcast['Elemental Magic'] = {
		ammo="Pemphredo Tathlum",
		head=gear.nuke_head,
		body="Amalric Doublet",
		hands="Amalric Gages",
		legs="Amalric Slops",
		feet=gear.nuke_feet,
		neck="Saevus Pendant +1",
		ear1="Friomisi Earring",
		ear2="Barkarole Earring",
		ring1="Shiva Ring",
		ring2="Shiva Ring",
		back="Taranus's Cape",
		waist=gear.ElementalObi
    }

    sets.midcast.Impact = {
        ammo="Seraphic Ampulla",
        body="Twilight Cloak",
        hands={name="Merlinic Dastanas", augments={'Mag. Acc.+9','"Occult Acumen"+10','INT+6','"Mag.Atk.Bns."+4',}},
        legs="Perdition Slops",
        feet={name="Merlinic Crackows", augments={'Mag. Acc.+30','"Occult Acumen"+11','"Mag.Atk.Bns."+1',}},
        neck="Combatant's Torque",
        waist=gear.ElementalObi,
        left_ear="Dedition Earring",
        right_ear="Telos Earring",
        left_ring="Petrov Ring",
        right_ring="Rajas Ring",
        back="Taranus's Cape",
    }
        
    sets.midcast['Elemental Magic'].Comet = set_combine(sets.midcast['Elemental Magic'], {
        head="Pixie Hairpin +1",
        left_ring="Archon Ring",
    })

    sets.midcast.ElementalEnfeeble = sets.midcast['Elemental Magic']

    sets.midcast.Death = {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body=gear.nuke_body,
        hands="Amalric Gages",
        legs="Amalric Slops",
		feet=gear.nuke_Feet,
        neck="Saevus Pendant +1",
        waist=gear.ElementalObi,
        left_ear="Barkaro. Earring",
        right_ear="Friomisi Earring",
        left_ring="Archon Ring",
        right_ring="Mephitas's Ring +1",
        back="Taranus's Cape",
    }

    sets.midcast.Death.HighMP = {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body=gear.nuke_body,
        hands="Amalric Gages",
        legs="Amalric Slops",
		feet=gear.nuke_Feet,
        neck="Saevus Pendant +1",
        waist=gear.ElementalObi,
        left_ear="Barkaro. Earring",
        right_ear="Friomisi Earring",
        left_ring="Archon Ring",
        right_ring="Mephitas's Ring +1",
        back="Taranus's Cape",
    }
    
    sets.midcast.Stun = {
        ammo="Pemphredo Tathlum",
        head=gear.nuke_head,
        body="Zendik Robe",
        hands="Hagondes Cuffs +1",
        legs=gear.nuke_legs,
        feet=gear.nuke_feet,
        neck="Incanter's Torque",
        waist="Refoccilation Stone",
        left_ear="Barkaro. Earring",
        right_ear="Digni. Earring",
        left_ring="Evanescence Ring",
        right_ring="Vertigo Ring",
        back="Taranus's Cape",
    }

    ---- Magic Burst Sets ----
    sets.magic_burst = {}
    sets.magic_burst['Elemental Magic'] = {
		head=gear.burst_head,
		neck="Mizukage-no-Kubikazari",
		ring1="Mujin Band",
--		ring2="Locus Ring",
		back="Taranus's Cape",
		legs=gear.burst_legs
	}
    
    sets.magic_burst['Elemental Magic'].Comet = {
		neck="Mizukage-no-Kubikazari",
		ring2="Locus Ring",
		back="Taranus's Cape"
	}

    sets.magic_burst.Death = {
		neck="Mizukage-no-Kubikazari",
		ring2="Locus Ring",
    }

    sets.magic_burst.Death.HighMP = {
		neck="Mizukage-no-Kubikazari",
    }
    
    sets.magic_burst.Aspir = {
        neck="Mizukage-no-Kubikazari",
        back="Taranus's Cape",
    }
    
    sets.magic_burst.Aspir.HighMP = {
        neck="Mizukage-no-Kubikazari",
    }

    -- Engaged sets
    sets.engaged = sets.idle
    sets.engaged.HighMP = sets.idle.HighMP

    sets.Kiting = {feet="Herald's Gaiters"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if spellMap == 'Cure' or spellMap == 'Curaga' then
        gear.default.obi_waist = "Pythia Sash"
    elseif spell.skill == 'Elemental Magic' or spell.name == 'Death' and (not spell.name == 'Impact') then
        gear.default.obi_waist = "Refoccilation Stone"
    elseif spellMap == 'Aspir' or spellMap == 'Drain' then
        gear.default.obi_waist = "Fucho-no-Obi"
    end
end

function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.MagicBurst.value and not (spell.name == 'Impact') then
        if spell.skill == 'Elemental Magic' then
            if spell.name == 'Comet' then
                equip(sets.magic_burst['Elemental Magic'].Comet)
            else
                equip(sets.magic_burst['Elemental Magic'])
            end
        elseif spell.name == 'Death' then
            if state.CastingMode.current == 'Normal' then
                equip(sets.magic_burst.Death)
            else
                equip(sets.magic_burst.Death.HighMP)
            end
        end
        if spellMap == 'Aspir' or spellMap == 'Drain' then
            if state.CastingMode.current == 'Normal' then
                equip(sets.magic_burst.Aspir)
            else
                equip(sets.magic_burst.Aspir.HighMP)
            end
        end
    end
    if spell.skill == 'Elemental Magic' and state.Spaekona.value and not (spell.name == 'Impact') then
        equip({body="Spaekona's Coat +1"})
    end
end



-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

function job_buff_change(buff, gain)
    if buff == "Mana Wall" then
        handle_equipping_gear(player.status)
    end
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

function customize_idle_set(idleSet)
    if buffactive['Mana Wall'] then 
        return set_combine(idleSet, {feet='Wicce Sabots +1', back="Taranus's Cape"})
    else
        return idleSet
    end
end

function customize_melee_set(meleeSet)
    if buffactive['Mana Wall'] then 
        return set_combine(meleeSet, {feet='Wicce Sabots +1', back="Taranus's Cape"})
    else
        return meleeSet
    end
end

-- Function to display the current relevant user state when doing an update.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 15)
end