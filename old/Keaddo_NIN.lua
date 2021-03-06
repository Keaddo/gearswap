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
    state.Buff.Migawari = buffactive.migawari or false
    state.Buff.Doom = buffactive.doom or false
    state.Buff.Yonin = buffactive.Yonin or false
    state.Buff.Innin = buffactive.Innin or false
    state.Buff.Futae = buffactive.Futae or false

    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------

-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal', 'Acc')
    state.HybridMode:options('Normal', 'Evasion', 'PDT')
    state.WeaponskillMode:options('Normal', 'Acc', 'Mod')
    state.CastingMode:options('Normal', 'Resistant')
    state.PhysicalDefenseMode:options('PDT', 'Evasion')

    gear.MovementFeet = {name="Danzo Sune-ate"}
    gear.DayFeet = "Danzo Sune-ate"
    gear.NightFeet = "Ninja Kyahan"
    
    select_movement_feet()
    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA['Mijin Gakure'] = {legs="Mochizuki Hakama"}
    sets.precast.JA['Futae'] = {legs="Iga Tekko +2"}
    -- mystuff sets.precast.JA['Sange'] = {legs="Mochizuki Chainmail"}

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {}
	-- sets.precast.Waltz = {ammo="Sonia's Plectrum",
    --   head="Felistris Mask",
    --    body="Hachiya Chainmail +1",hands="Buremte Gloves",ring1="Spiral Ring",
    --    back="Iximulew Cape",waist="Caudata Belt",legs="Nahtirah Trousers",feet="Otronif Boots +1"}
        -- Uk'uxkaj Cap, Daihanshi Habaki
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Set for acc on steps, since Yonin drops acc a fair bit
	sets.precast.Step = {}
    -- sets.precast.Step = {
    --    head="Whirlpool Mask",neck="Ej Necklace",
    --    body="Otronif Harness +1",hands="Buremte Gloves",ring1="Patricius Ring",
    --    back="Yokaze Mantle",waist="Chaac Belt",legs="Manibozho Brais",feet="Otronif Boots +1"}

	sets.precast.Flourish1 = {}
    -- sets.precast.Flourish1 = {waist="Chaac Belt"}

    -- Fast cast sets for spells
    
    sets.precast.FC = {}
	--ammo="Impatiens",ear2="Loquacious Earring",hands="Thaumas Gloves",ring1="Prolix Ring"}
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Mochizuki Chainmail"})

    -- Snapshot for ranged
    sets.precast.RA = {hands="Manibozho Gloves",legs="Nahtirah Trousers",feet="Wurrukatte Boots"}
       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Amar Cluster",
        head="Adhemar Bonnet",
		neck="Asperity Necklace",
		ear1="Steelflash Earring",
		ear2="Bladeborn Earri",
        body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		ring1="Thunder Ring",
		ring2="Rajas Ring",
        back="Yokaze Mantle",
		waist="Windbuffet Belt +1",
		legs="Samnuha Tights",
		feet="Herculean Boots"}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, {ammo="Jukukik Feather",hands="Buremte Gloves",
        back="Yokaze Mantle"})

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Blade: Jin'] = set_combine(sets.precast.WS,
        {neck="Rancor Collar",ear1="Brutal Earring",ear2="Moonshade Earring",feet="Daihanshi Habaki"})

    sets.precast.WS['Blade: Hi'] = set_combine(sets.precast.WS,
        {back="Blithe Mantle", ring1="Stormsoul Ring"})

    sets.precast.WS['Blade: Shun'] = set_combine(sets.precast.WS, {feet="Herculean Boots"})


    sets.precast.WS['Aeolian Edge'] = {
        head="Wayfarer Circlet",neck="Stoicheion Medal",ear1="Friomisi Earring",ear2="Moonshade Earring",
        body="Wayfarer Robe",hands="Wayfarer Cuffs",ring1="Acumen Ring",ring2="Demon's Ring",
        back="Toro Cape",waist="Thunder Belt",legs="Shneddick Tights +1",feet="Daihanshi Habaki"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {
        head="Taeon Chapeau",ear1="Loquacious Earring",
        body="Samnuha Coat",hands="Koga Tekko +2",ring2="Weatherspoon Ring",
        legs="Taeon Tights",feet="Herculean Boots"}
        
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {body="Mochizuki Chainmail", feet="Iga Kyahan +2"})

    sets.midcast.ElementalNinjutsu = {
        head="Adhemar Bonnet",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Samnuha Coat",hands="Iga Tekko +2",ring1="Fenrir Ring",ring2="Fenrir Ring",
        back="Toro Cape",waist=gear.ElementalObi,legs="Samnuha Tights",feet="Herculean Boots"}

    sets.midcast.ElementalNinjutsu.Resistant = set_combine(sets.midcast.Ninjutsu, {ear1="Lifestorm Earring",ear2="Psystorm Earring",
        back="Yokaze Mantle"})

    sets.midcast.NinjutsuDebuff = {
        head="Adhemar Bonnet",neck="Sanctity Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
        body="Samnuha Coat",hands="Iga Tekko +2",ring1="Fenrir Ring",ring2="Fenrir Ring",
        back="Yokaze Mantle",feet="Hachiya Kyahan"}

    sets.midcast.NinjutsuBuff = {neck="Ej Necklace",back="Yokaze Mantle"}

    sets.midcast.RA = {
        head="Taeon Chapeau",neck="Ej Necklace",
        body="Taeon Tabard",hands="Koga Tekko +2",ring1="Beeline Ring",
        back="Yokaze Mantle",legs="Nahtirah Trousers",feet="Qaaxo Leggings"}
    -- Hachiya Hakama/Thurandaut Tights +1

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {neck="Wiglen Gorget",
        ring1="Sheltered Ring",ring2="Paguroidea Ring"}
    
    -- Idle sets
    sets.idle = {ammo="Hachiya Shuriken",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Leyline Gloves",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.MovementFeet}

    sets.idle.Town = {ammo="Hachiya Shuriken",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Leyline Gloves",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.MovementFeet}
    
    sets.idle.Weak = {ammo="Hachiya Shuriken",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Leyline Gloves",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.MovementFeet}
    
    -- Defense sets
    sets.defense.Evasion = {ammo="Hachiya Shuriken",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}

    sets.defense.PDT = {ammo="Iron Gobbet",
        head="Outrider Mask",neck="Twilight Torque",
        body="Outrider Mail",hands="Outrider mittens",ring1="Defending Ring",ring2=gear.DarkRing.physical,
        back="Shadow Mantle",waist="Flume Belt",legs="Herculean Trousers",feet="Herculean Boots"}

    sets.defense.MDT = {ammo="Demonry Stone",
        head="Rawhide Mask",neck="Sanctity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}


    sets.Kiting = {feet=gear.MovementFeet}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Hachiya Shuriken",
        head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
    sets.engaged.Acc = {ammo="Hachiya Shuriken",
        head="Adhemar Bonnet",neck="Sanctity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
    sets.engaged.Evasion = {ammo="Hachiya Shuriken",
        head="Adhemar Bonnet",neck="Asperity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
    sets.engaged.Acc.Evasion = {ammo="Hachiya Shuriken",
        head="Adhemar Bonnet",neck="Sanctity Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Herculean Boots"}
    sets.engaged.PDT = {ammo="Hachiya Shuriken",
        head="Outrider Mask",neck="Twilight torque",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Outrider Mail",hands="Outrider mittens",ring1="Epona's Ring",ring2="Rajas Ring",
        back="Yokaze Mantle",waist="Twilight Belt",legs="Herculean Trousers",feet="Herculean Boots"}
    sets.engaged.Acc.PDT = {ammo="Hachiya Shuriken",
        head="Outrider Mask",neck="Twilight torque",ear1="Iga mimikazari",ear2="Suppanomimi",
        body="Outrider Mail",hands="Outrider mittens",ring1="Rajas Ring",ring2="Epona's Ring",
        back="Yokaze Mantle",waist="Twilight Belt",legs="Herculean Trousers",feet="Herculean Boots"}

-- Not Yet, Restore as Needed
    -- Custom melee group: High Haste (~20% DW)


    --------------------------------------
    -- Custom buff sets
    --------------------------------------

    sets.buff.Migawari = {body="Iga Ningi +2"}
    sets.buff.Doom = {ring2="Saida Ring"}
    sets.buff.Yonin = {legs="Iga Hakama +2"}
    sets.buff.Innin = {head="Iga Zukin +2"}
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

-- Run after the general midcast() is done.
-- eventArgs is the same one used in job_midcast, in case information needs to be persisted.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if state.Buff.Doom then
        equip(sets.buff.Doom)
    end
end


-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted and spell.english == "Migawari: Ichi" then
        state.Buff.Migawari = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- If we gain or lose any haste buffs, adjust which gear set we target.
    if S{'haste','march','embrava','haste samba'}:contains(buff:lower()) then
        determine_haste_group()
        handle_equipping_gear(player.status)
    elseif state.Buff[buff] ~= nil then
        handle_equipping_gear(player.status)
    end
end

function job_status_change(new_status, old_status)
    if new_status == 'Idle' then
        select_movement_feet()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- User code that supplements standard library decisions.
-------------------------------------------------------------------------------------------------------------------

-- Get custom spell maps
function job_get_spell_map(spell, default_spell_map)
    if spell.skill == "Ninjutsu" then
        if not default_spell_map then
            if spell.target.type == 'SELF' then
                return 'NinjutsuBuff'
            else
                return 'NinjutsuDebuff'
            end
        end
    end
end

-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if state.Buff.Migawari then
        idleSet = set_combine(idleSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        idleSet = set_combine(idleSet, sets.buff.Doom)
    end
    return idleSet
end


-- Modify the default melee set after it was constructed.
function customize_melee_set(meleeSet)
    if state.Buff.Migawari then
        meleeSet = set_combine(meleeSet, sets.buff.Migawari)
    end
    if state.Buff.Doom then
        meleeSet = set_combine(meleeSet, sets.buff.Doom)
    end
    return meleeSet
end

-- Called by the default 'update' self-command.
function job_update(cmdParams, eventArgs)
    select_movement_feet()
    determine_haste_group()
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

function determine_haste_group()
    -- We have three groups of DW in gear: Hachiya body/legs, Iga head + Patentia Sash, and DW earrings
    
    -- Standard gear set reaches near capped delay with just Haste (77%-78%, depending on HQs)

    -- For high haste, we want to be able to drop one of the 10% groups.
    -- Basic gear hits capped delay (roughly) with:
    -- 1 March + Haste
    -- 2 March
    -- Haste + Haste Samba
    -- 1 March + Haste Samba
    -- Embrava
    
    -- High haste buffs:
    -- 2x Marches + Haste Samba == 19% DW in gear
    -- 1x March + Haste + Haste Samba == 22% DW in gear
    -- Embrava + Haste or 1x March == 7% DW in gear
    
    -- For max haste (capped magic haste + 25% gear haste), we can drop all DW gear.
    -- Max haste buffs:
    -- Embrava + Haste+March or 2x March
    -- 2x Marches + Haste
    
    -- So we want four tiers:
    -- Normal DW
    -- 20% DW -- High Haste
    -- 7% DW (earrings) - Embrava Haste (specialized situation with embrava and haste, but no marches)
    -- 0 DW - Max Haste
    
    classes.CustomMeleeGroups:clear()
    
    if buffactive.embrava and (buffactive.march == 2 or (buffactive.march and buffactive.haste)) then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.march == 2 and buffactive.haste then
        classes.CustomMeleeGroups:append('MaxHaste')
    elseif buffactive.embrava and (buffactive.haste or buffactive.march) then
        classes.CustomMeleeGroups:append('EmbravaHaste')
    elseif buffactive.march == 1 and buffactive.haste and buffactive['haste samba'] then
        classes.CustomMeleeGroups:append('HighHaste')
    elseif buffactive.march == 2 then
        classes.CustomMeleeGroups:append('HighHaste')
    end
end


function select_movement_feet()
    if world.time >= 17*60 or world.time < 5*60 then
        gear.MovementFeet.name = gear.NightFeet
    else
        gear.MovementFeet.name = gear.DayFeet
    end
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(4, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(5, 3)
    else
        set_macro_page(4, 3)
    end
end

