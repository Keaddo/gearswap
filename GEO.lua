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
    send_command('bind ^` gs c toggle MagicBurst')

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
	sets.precast.JA['Full cycle'] = {head="Azimuth Hood +1"}
    sets.precast.JA['Radial Arcana'] = {feet="Bagua sandals +1"}
	
    -- Fast cast sets for spells

    sets.precast.FC = {range="Dunna",
        head="Welkin Crown",ear2="Loquacious Earring",
        body="Amalric doublet", ring1="Lebeche Ring", hands="Amalric gages",
        back="Lifestream Cape",waist="Cetl Belt",legs="Geomancy Pants +1",feet="Helios boots"}

    sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Tamaxchi",sub="Sors Shield",back="Pahtli Cape"})

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
        head="Welkin Crown",ear2="Loquacious Earring",
        body="Bagua Tunic",hands="Geomancy Mitaines +1",ring1="Prolix Ring",
        back="Lifestream Cape",waist="Cetl Belt",legs="Geomancy Pants +1",feet="Azimuth Gaiters"}

    sets.midcast.Geomancy = {main="Rubicundity", sub="Culminus", range="Dunna", 
		head="Azimuth Hood +1", body="Bagua Tunic", hands="Geomancy Mitaines +1", lear="Influx Earring", rear="Gifted earring", 
		neck="Incanter's torque", rring="Renaye Ring", feet="Azimuth Gaiters", back="Lifestream Cape"}
    sets.midcast.Geomancy.Indi = {main="Rubicundity", sub="Culminus", range="Dunna", 
		head="Azimuth Hood +1", body="Bagua Tunic", lear="Influx Earring", rear="Gifted earring", neck="Incanter's torque",
		legs="Bagua Pants", hands="Geomancy Mitaines +1", feet="Azimuth Gaiters", back="Lifestream Cape"}

    sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield", lear="Novia Earring", rear="Gifted earring",
        head="Welkin Crown", body="Vanya Robe",hands="Telchine Gloves", lring="Sirona's ring", rring="Lebeche ring",
        legs="Assiduity Pants +1",feet="Hagondes Sabots"}
    
    sets.midcast.Curaga = sets.midcast.Cure

    sets.midcast.Protectra = {ring1="Sheltered Ring"}

    sets.midcast.Shellra = {ring1="Sheltered Ring"}

    sets.midcast['Enhancing Magic'] = {
        head="Welkin Crown", neck="Sanctity Necklace", ear1="Influx Earring", ear2="Loquacious Earring",
        body="Telchine Chasuble",hands="Amalric gages", lring="Etana ring", rring="Leviathan ring",
        back="Pahtli Cape",waist="Refoccillation Stone",legs="Assiduity Pants +1", feet="Telchine Pigaches"}

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash", neck="Stone gorget"})
    
    sets.midcast['Enfeebling Magic'] = {main="Rubicundity", sub="Culminus", range="Dunna",
				head="Bagua Galero", neck="Sanctity Necklace", rear="Influx Earring", lear="Moonshade earring",
                body="Vanya Robe", hands="Amalric gages", lring="Etana ring", rring="Leviathan ring",
                back="Lifestream Cape", waist="Ovate Rope", legs="Amalric slops", feet="Bagua Sandals"}
    
    sets.midcast['Elemental Magic'] = {main="Rubicundity", sub="Culminus", ammo="Witchstone",
				head="Welkin Crown", neck="Sanctity Necklace", lear="Barkarole Earring", rear="Friomisi Earring",
                body="Amalric doublet", hands="Amalric gages", lring="Acumen Ring", rring="Shiva Ring",
                back="Toro Cape", waist="Refoccillation Stone", legs="Amalric slops", feet="Helios boots"}
        
    sets.midcast.Impact = set_combine(sets.midcast['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    sets.midcast['Dark Magic'] = {main="Rubicundity", sub="Culminus", range="Dunna",
				head="Bagua Galero", neck="Deceiver's torque", lear="Barkarole Earring", rear="Friomisi Earring",
                body="Geomancy Tunic", hands="Amalric gages", lring="Acumen Ring", rring="Etana ring",
                back="Lifestream Cape", waist="Cetl Belt", legs="Amalric slops", feet="Helios boots"}

    sets.magic_burst = {main="Rubicundity", sub="Culminus", ammo="Witchstone",
				head="Welkin Crown", neck="Sanctity Necklace", lear="Barkarole Earring", rear="Friomisi Earring",
                body="Amalric doublet", hands="Amalric gages", lring="Mujin Band", rring="Locus ring",
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
				head="Azimuth Hood +1", neck="Sanctity Necklace", rear="Influx Earring", lear="Moonshade earring",
                body="Amalric doublet", hands="Bagua Mitaines", lring="Paguroidea Ring", rring="Renaye Ring",
                back="Toro Cape", waist="Refoccillation Stone", legs="Assiduity Pants +1", feet="Telchine Pigaches"}


    -- Idle sets

    sets.idle = {main="Rubicundity", sub="Culminus", range="Dunna",
        head="Welkin Crown", neck="Sanctity Necklace", rear="Gifted Earring", lear="Moonshade earring",
        body="Amalric doublet",hands="Bagua Mitaines", lring="Paguroidea Ring", rring="Renaye Ring",
        back="Lifestream Cape",waist="Refoccillation Stone",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    sets.idle.PDT = {main="Rubicundity", sub="Culminus",
        head="Welkin Crown",neck="Sanctity Necklace",ear1="Bloodgem Earring",ear2="Moonshade earring",
        body="Amalric doublet",hands="Bagua Mitaines", lring="Paguroidea Ring", rring="Gelatinous Ring +1",
        back="Lifestream Cape",waist="Goading Belt",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    -- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Rubicundity", sub="Culminus", range="Dunna",
        head="Azimuth Hood +1",neck="Sanctity Necklace", rear="Gifted Earring", lear="Moonshade earring",
        body="Amalric doublet",hands="Geomancy Mitaines +1",ring1="Sheltered Ring", rring="Renaye Ring",
        back="Lifestream Cape",waist="Refoccillation Stone",legs="Assiduity Pants +1",feet="Bagua Sandals"}
   
    sets.idle.PDT.Pet = {main="Earth Staff", sub="Volos Strap", range="Dunna",
        head="Azimuth Hood +1",neck="Sanctity Necklace",ear1="Ethereal Earring",ear2="Moonshade earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", lring="Paguroidea Ring", rring="Gelatinous Ring +1",
        back="Lifestream Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}

    -- .Indi sets are for when an Indi-spell is active.
    --sets.idle.Indi = set_combine(sets.idle, {legs="Bagua Pants"})
    --sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {legs="Bagua Pants"})
    --sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {legs="Bagua Pants"})
    --sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {legs="Bagua Pants"})

    sets.idle.Town = {main="Rubicundity", sub="Culminus", range="Dunna",
        head="Welkin Crown",neck="Wiglen Gorget",rear="Moonshade earring", lear="Handler's Earring +1",
        body="Amalric doublet",hands="Bagua Mitaines", lring="Paguroidea Ring", rring="Renaye Ring",
        back="Lifestream Cape",waist="Refoccillation Stone",legs="Assiduity Pants +1",feet="Geomancy Sandals +1"}

    sets.idle.Weak = {main="Rubicundity", sub="Culminus", 
        head="Welkin Crown",neck="Sanctity Necklace",rear="Moonshade earring", lear="Barkarole Earring",
        body="Amalric doublet",hands="Amalric gages", lring="Paguroidea Ring", rring="Renaye Ring",
        back="Lifestream Cape",waist="Slipor sash",legs="Amalric slops",feet="Battlecast Gaiters"}

    -- Defense sets

    sets.defense.PDT = {main="Earth Staff", sub="Volos Strap", range="Dunna",
        head="Azimuth Hood +1",neck="Sanctity Necklace",ear1="Handler's Earring +1", ear2="Ethereal Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", lring="Paguroidea Ring", rring="Gelatinous Ring +1",
        back="Cheviot Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}

    sets.defense.MDT = {main="Earth Staff", sub="Volos Strap", range="Dunna",
        head="Azimuth Hood +1",neck="Wiglen Gorget",ear1="Handler's Earring +1",ear2="Ethereal Earring",
        body="Vanya Robe",hands="Geomancy Mitaines +1", lring="Paguroidea Ring", rring="Renaye Ring",
        back="Lifestream Cape",waist="Slipor sash",legs="Assiduity Pants +1",feet="Battlecast Gaiters"}

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
    sets.engaged = {main="Rubicundity", sub="Culminus", ammo="Amar cluster",
        head="Welkin Crown",neck="Sanctity Necklace",ear1="Brutal Earring",ear2="Ethereal Earring",
        body="Amalric doublet",hands="Amalric gages",ring1="Rajas Ring",ring2="Mars's Ring",
        back="Kayapa Cape",waist="Cetl Belt",legs="Amalric slops",feet="Battlecast Gaiters"}

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
        classes.CustomIdleGroups:clear()
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
        classes.CustomIdleGroups:clear()
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

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    set_macro_page(1, 3)
end