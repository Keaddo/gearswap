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
    indi_timer = ''
	indi_duration = 324
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
    send_command('bind !` gs c toggle MagicBurst')

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()

    --------------------------------------
    -- Precast sets
    --------------------------------------

    -- Precast sets to enhance JAs
    sets.precast.JA.Bolster = {body="Bagua Tunic"}
    sets.precast.JA['Life cycle'] = {body="Geomancy Tunic"}
	sets.precast.JA['Full cycle'] = {head="Azimuth Hood"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua sandals"}
	
    -- Fast cast sets for spells

    sets.precast.FC = {range="Dunna",
        head="Nahtirah Hat",ear1="Etiolation Earring", ear2="Loquacious Earring",
        body="Vanir Cotehardie", ring2="Weatherspoon Ring", hands="Amalric gages",
        back="Lifestream Cape",waist="Cetl Belt",legs="Geomancy Pants",feet="Regal Pumps+1"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Genbu's Shield",back="Pahtli Cape"})

    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {neck="Stoicheion Medal"})

    
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
    sets.midcast.FastRecast = {
        head="Nahtirah Hat",ear1="Etiolation Earring", ear2="Loquacious Earring",
        body="Vanir Cotehardie", ring1="Weatherspoon Ring", hands="Amalric gages",
        back="Lifestream Cape",waist="Cetl Belt",legs="Geomancy Pants",feet="Regal Pumps +1"}

    sets.midcast.Geomancy = {main="Bolelabunga", range="Dunna", 
		head="Azimuth Hood", body="Bagua Tunic", hands="Geomancy Mitaines", ear1="Influx Earring", ear2="Gifted Earring", 
		neck="Incanter's torque", ring2="Renaye Ring", feet="Azimuth Gaiters", back="Lifestream Cape"}
    sets.midcast.Geomancy.Indi = {main="Bolelabunga", range="Dunna", 
		head="Azimuth Hood", body="Bagua Tunic", ear1="Influx Earring", ear2="Gifted Earring", neck="Incanter's torque",
		legs="Bagua Pants", hands="Geomancy Mitaines", feet="Azimuth Gaiters", back="Lifestream Cape"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Genbu's Shield", ear1="Novia Earring", ear2="Gifted Earring",
        head="Welkin Crown", body="Vanya Robe",hands="Telchine Gloves", ring1="Sirona's ring", ring2="Lebeche ring",
        legs="Assiduity Pants +1",feet="Hagondes Sabots"}
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast['Enhancing Magic'] = {
        head="Welkin Crown", neck="Sanctity Necklace", ear1="Influx Earring", ear2="Loquacious Earring",
        body="Telchine Chasuble",hands="Amalric gages", ring1="Etana ring", ring2="Leviathan ring",
        back="Pahtli Cape",waist="Refoccillation Stone",legs="Assiduity Pants +1", feet="Telchine Pigaches"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash", neck="Stone gorget"})
    
    sets.midcast['Enfeebling Magic'] = {main="Rubicundity", sub="Culminus", range="Dunna",
				head="Bagua Galero", neck="Sanctity Necklace", ear2="Influx Earring", ear1="Moonshade Earring",
                body="Vanya Robe", hands="Amalric gages", ring1="Etana ring", ring2="Leviathan ring",
                back="Lifestream Cape", waist="Ovate Rope", legs="Amalric slops", feet="Bagua Sandals"}
    
    sets.midcast['Elemental Magic'] = {main="Rubicundity", sub="Culminus", ammo="Witchstone",
				head="Welkin Crown", neck="Sanctity Necklace", ear1="Barkarole Earring", ear2="Friomisi Earring",
                body="Amalric doublet", hands="Amalric gages", ring1="Acumen Ring", ring2="Shiva Ring",
                back="Toro Cape", waist="Refoccillation Stone", legs="Amalric slops", feet="Helios boots"}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Rubicundity", sub="Culminus", range="Dunna",
				head="Bagua Galero", neck="Deceiver's torque", ear1="Barkarole Earring", ear2="Friomisi Earring",
                body="Geomancy Tunic", hands="Amalric gages", ring1="Acumen Ring", ring2="Etana ring",
                back="Lifestream Cape", waist="Cetl Belt", legs="Amalric slops", feet="Helios boots"}

    sets.magic_burst = {main="Rubicundity", sub="Culminus", ammo="Witchstone",
				head="Welkin Crown", neck="Sanctity Necklace", ear1="Barkarole Earring", ear2="Friomisi Earring",
                body="Amalric doublet", hands="Amalric gages", ring1="Mujin Band", ring2="Locus ring",
                back="Seshaw cape", waist="Refoccillation Stone", legs="Amalric slops", feet="Helios boots"}
	
				
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
				head="Azimuth Hood +1", neck="Sanctity Necklace", ear2="Influx Earring", ear1="Moonshade Earring",
                body="Amalric doublet", hands="Bagua Mitaines", ring1="Paguroidea Ring", ring2="Renaye Ring",
                back="Toro Cape", waist="Refoccillation Stone", legs="Assiduity Pants +1", feet="Telchine Pigaches"}


    -- Idle sets

    sets.idle = {main="Bolelabunga", sub="Genbu's Shield", range="Dunna",
        neck="Sanctity Necklace", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Respite Cloak",hands="Bagua Mitaines", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Geomancy Sandals"}

    sets.idle.PDT = {main="Bolelabunga", sub="Genbu's Shield", range="Dunna",
        neck="Twilight Torque", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Respite Cloak",hands="Helios Gloves", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Regal Pumps +1"}

    -- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Bolelabunga", sub="Genbu's Shield", range="Dunna",
        neck="Sanctity Necklace", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Respite Cloak",hands="Bagua Mitaines", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Geomancy Sandals"}
   
    sets.idle.PDT.Pet = {main="Bolelabunga", sub="Genbu's Shield", range="Dunna",
        neck="Twilight Torque", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Respite Cloak",hands="Helios Gloves", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Regal Pumps +1"}

    -- .Indi sets are for when an Indi-spell is active.
    sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants"})
    sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs="Bagua Pants"})
    sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants"})
    sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {legs="Bagua Pants"})

    sets.idle.Town = {main="Bolelabunga", sub="Genbu's Shield", range="Dunna",
        neck="Sanctity Necklace", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Respite Cloak",hands="Bagua Mitaines", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Geomancy Sandals"}

    sets.idle.Weak = {main="Rubicundity", sub="Culminus", 
        head="Welkin Crown",neck="Sanctity Necklace",ear2="Moonshade Earring", ear1="Barkarole Earring",
        body="Amalric doublet",hands="Amalric gages", ring1="Paguroidea Ring", ring2="Renaye Ring",
        back="Lifestream Cape",waist="Slipor sash",legs="Amalric slops",feet="Battlecast Gaiters"}

    -- Defense sets

    sets.defense.PDT = {main="Bolelabunga", sub="Genbu's Shield", range="Dunna",
        neck="Twilight Torque", ear1="Etiolation Earring", ear2="Zennaroi Earring",
        body="Respite Cloak",hands="Helios Gloves", ring1="Defending Ring", ring2="Patricius Ring",
        back="Lifestream Cape",waist="Fucho-no-obi",legs="Assiduity Pants +1",feet="Regal Pumps +1"}

    sets.defense.MDT = {main="Earth Staff", sub="Volos Strap", range="Dunna",
        head="Azimuth Hood +1",neck="Wiglen Gorget",ear1="Handler's Earring +1",ear2="Ethereal Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", ring1="Paguroidea Ring", ring2="Renaye Ring",
        back="Lifestream Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}

    sets.Kiting = {feet="Geomancy Sandals"}

    sets.latent_refresh = {waist="Fucho-no-obi"}


    --------------------------------------
    -- Engaged sets
    --------------------------------------

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Bolelabunga", sub="Genbu's Shield", ammo="Amar cluster",
        head="Nahtirah Hat",neck="Iqabi Necklace",ear1="Steelflash Earring",ear2="Bladeborn Earring",
        body="Witching Robe",hands="Helios Gloves",ring1="Patricius Ring",ring2="Rajas Ring",
        back="Kayapa Cape",waist="Cetl Belt",legs="Assiduity Pants +1",feet="Regal Pumps +1"}

    --------------------------------------
    -- Custom buff sets
    --------------------------------------

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------

function job_aftercast(spell, action, spellMap, eventArgs)
    if not spell.interrupted then
        if spell.english:startswith('Indi') then
            if not classes.CustomIdleGroups:contains('Indi') then
                classes.CustomIdleGroups:append('Indi')
            end
            send_command('@timers d "'..indi_timer..'"')
            indi_timer = spell.english
            send_command('@timers c "'..indi_timer..'" '..indi_duration..' down spells/00136.png')
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 60 down spells/00220.png')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@timers c "'..spell.english..' ['..spell.target.name..']" 90 down spells/00220.png')
        end
    elseif not player.indi then
        classes.CustomIdleGroups:cear1()
    end
end


-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if player.indi and not classes.CustomIdleGroups:contains('Indi')then
        classes.CustomIdleGroups:append('Indi')
        handle_equipping_gear(player.status)
    elseif classes.CustomIdleGroups:contains('Indi') and not player.indi then
        classes.CustomIdleGroups:cear1()
        handle_equipping_gear(player.status)
    end
end

function job_state_change(stateField, newValue, oldValue)
    if stateField == 'Offense Mode' then
        if newValue == 'Normal' then
            disable('main','sub','range')
        else
            enable('main','sub','range')
        end
    end
end

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
    classes.CustomIdleGroups:cear1()
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

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 3)
end