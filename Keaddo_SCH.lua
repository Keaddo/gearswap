-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-- Original LUA by Fenrir.Motenten; edited by Bismarck.Speedyjim
-------------------------------------------------------------------------------------------------------------------

--[[
        Custom commands:64

        Shorthand versions for each strategem type that uses the version appropriate for
        the current Arts.
		In-game macro: /console gs c scholar xxx

                                        Light Arts              Dark Arts

        gs c scholar light              Light Arts/Addendum
        gs c scholar dark                                       Dark Arts/Addendum
        gs c scholar cost               Penury                  Parsimony
        gs c scholar speed              Celerity                Alacrity
        gs c scholar aoe                Accession               Manifestation
        gs c scholar power              Rapture                 Ebullience
        gs c scholar duration           Perpetuance
        gs c scholar accuracy           Altruism                Focalization
        gs c scholar enmity             Tranquility             Equanimity
        gs c scholar skillchain                                 Immanence
        gs c scholar addendum           Addendum: White         Addendum: Black
--]]



-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2

    -- Load and initialize the include file.
    include('Mote-Include.lua')
	include('organizer-lib')
end

-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
    info.addendumNukes = S{"Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
        "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}

    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
    update_active_strategems()
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
	
    info.low_nukes = S{"Stone", "Water", "Aero", "Fire", "Blizzard", "Thunder", 
	                   "Stone II", "Water II", "Aero II", "Fire II", "Blizzard II", "Thunder II",
					   "Stone III", "Water III", "Aero III", "Fire III", "Blizzard III", "Thunder III",
					   "Stone IV", "Water IV", "Aero IV", "Fire IV", "Blizzard IV", "Thunder IV",
	                   "Stone V", "Water V", "Aero V", "Fire V", "Blizzard V", "Thunder V"}
    info.mid_nukes = S{}
    info.high_nukes = S{}

 --   send_command('bind ` input /ma Stun <t>; wait 0.5; input /p Casting STUN → «¶«<t>«¶«.')
	send_command('bind !` gs c toggle MagicBurst')
	send_command('bind ^` gs c scholar skillchain')
	send_command('bind ^- gs c scholar light')
	send_command('bind ^= gs c scholar dark')
	send_command('bind !delete gs c scholar speed')
	send_command('bind !Home gs c scholar duration')
	send_command('bind !End gs c scholar aoe')

    select_default_macro_book()
end

function user_unload()
--	send_command('unbind `')
	send_command('unbind ^`')
	send_command('unbind !`')
	send_command('unbind ^-')
	send_command('unbind ^=')
	send_command('unbind !delete')
	send_command('unbind !end')
	send_command('unbind !home')
end

-- Define sets and vars used by this job file.
function init_gear_sets()

    gear.aspir_body = "Merlinic Jubbah"
    gear.aspir_hands = {name="Merlinic Dastanas", augments={'Mag. Acc.+6','"Drain" and "Aspir" potency +11','CHR+10',}}
    gear.aspir_legs = { name="Merlinic Shalwar", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','CHR+10','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
    gear.aspir_feet = { name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +1','Mag. Acc.+4','"Mag.Atk.Bns."+11',}}
	gear.fc_head = { name="Merlinic Hood", augments={'"Mag.Atk.Bns."+24','"Fast Cast"+5','Mag. Acc.+5',}}
	gear.fc_body = "Merlinic Jubbah"
	gear.fc_feet = { name="Merlinic Crackows", augments={'"Fast Cast"+5','"Mag.Atk.Bns."+11',}}
	gear.nuke_head = { name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst mdg.+9%','MND+1','Mag. Acc.+1',}}
	gear.nuke_body = "Merlinic Jubbah"
	gear.nuke_legs = { name="Merlinic Shalwar", augments={'Mag. Acc.+14 "Mag.Atk.Bns."+14','CHR+10','Mag. Acc.+14','"Mag.Atk.Bns."+13',}}
	gear.nuke_feet = { name="Merlinic Crackows", augments={'Mag. Acc.+25 "Mag.Atk.Bns."+25','"Drain" and "Aspir" potency +1','Mag. Acc.+4','"Mag.Atk.Bns."+11',}}
	gear.burst_head = { name="Merlinic Hood", augments={'Mag. Acc.+21 "Mag.Atk.Bns."+21','Magic burst mdg.+9%','MND+1','Mag. Acc.+1',}}
	gear.burst_legs = { name="Merlinic Shalwar", augments={'Mag. Acc.+16 "Mag.Atk.Bns."+16','Magic burst mdg.+9%','Mag. Acc.+12',}}
	gear.burst_feet = { name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}}
	gear.nuke_back = "Lugh's Cape"
	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Precast Sets
	-- Precast sets to enhance JAs

	sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
	sets.precast.JA['Dark Arts'] = {"Academic's Gown +1"}
	sets.precast.JA['Light Arts'] = {"Academic's Pants +1"}
	
	organizer_items = {agown="Academic's Gown +1"}


	-- Fast cast sets for spells
    -- FC +66%, Quick Magic +10% (cap) 
	sets.precast.FC = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Sapience Orb",
		head=gear.fc_head,
		ear2="Etiolation Earring",
		ear1="Loquacious Earring",
		body=gear.fc_body,
		hands="Merlinic Dastanas",
		ring1="Prolix Ring",
		ring2="Weatherspoon Ring",
		back="Swith Cape",
		legs="Psycloth Lappas",
		feet=gear.fc_feet,
	}

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {
		main="Serenity",
		head="Vanya Hood",
		ear1="Mendicant's Earring",
		body="Vanya Robe",
		hands="Gendewitha Gages +1",
		back="Pahtli Cape",
		legs="Vanya Slops",
		feet="Vanya Clogs"
	})
	
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {
		waist="Siegel Sash"
	})
	
	sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {
		neck="Stoicheion Medal",
		ear1="Barkarole Earring"
	})
	sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {
		head=empty,
		body="Twilight Cloak"
	})
	
	-- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	-- Total MP: 2221 (Outside Escha), ???? (Inside Escha)
    sets.precast.WS['Myrkr'] = {
		main="Akademos",
		sub="Niobid Strap",
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


	-- Midcast Sets

	sets.midcast.FastRecast = {
	back="Swith Cape"
	}

	-- Cure Sets
	
	-- Potency: +51%, Healing Skill: 610 total inc. Light Arts bonus, Enmity: -20, MND: +168, VIT: +87
	sets.midcast.Cure = {
	main="Serenity",
	sub="Curatio Grip",
	ammo="Hydrocera",
	head="Vanya Hood",
	neck="Incanter's Torque",
	ear1="Lifestorm Earring",
	ear2="Loquacious Earring",
	body="Vanya Robe",
	hands="Telchine Gloves",
	ring1="Haoma's Ring",
	ring2="Sirona's Ring",
	back="Tempered Cape +1",
	waist="Bishop's Sash",
	legs="Vanya Slops",
	feet="Vanya Clogs"}
    
	-- Potency: +50%, Healing Skill: 562 total inc. Light Arts Bonus, MND: +160, VIT+ 89
	sets.midcast.CureWithLightWeather = set_combine(sets.midcast.Cure, {
	main="Chatoyant Staff",
	ear2="Mendicant's Earring",
	body="Kaykaus Bliaut",
	hands="Telchine Gloves",
	back="Twilight Cape",
	waist="Hachirin-no-Obi"
	})

	sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Regen = {
	main="Bolelabunga",
	sub="Genbu's Shield",
	ammo="Savant's Treatise",
	head="Arbatel Bonnet +1",
	neck="Incanter's Torque",
	ear1="Andoaa Earring",
	body="Telchine Chasuble",
	hands="Telchine Gloves",
	back="Bookworm's Cape",
	waist="Cascade Belt",
	legs="Telchine Braconi",
	feet="Telchine Pigaches"}
	
	-- Enhancing Magic Sets
	
	sets.midcast['Enhancing Magic'] = {
		main="Grioavolr",
		sub="Niobid Strap",
		ammo="Savant's Treatise",
		head="Telchine Cap",
		body="Telchine Chasuble",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches",
		ear1="Andoaa Earring",
		neck="Incanter's Torque",
		waist="Olympus Sash"}
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {
		ring1="Sheltered Ring"
	})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {
		ring1="Sheltered Ring"
	})
	sets.midcast.Haste = set_combine(sets.midcast.FastRecast, {
		main="Grioavolr",
		sub="Niobid Strap",
		head="Telchine Cap",
		body="Telchine Chasuble",
		hands="Telchine Gloves",
		legs="Telchine Braconi",
		feet="Telchine Pigaches"})	

	sets.midcast.Cursna = {
		main="Gada",
		sub="Genbu's Shield",
		neck="Malison Medallion",
		body="Vanya Robe",
		hands="Pedagogy Bracers +1",
		ring1="Haoma's Ring",
		ring2="Ephedra Ring",
		back="Tempered Cape +1",
		waist="Bishop's Sash",
		legs="Academic's Pants +1",
		feet="Vanya Clogs"}

	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {
		waist="Siegel Sash"
		})
	sets.midcast.Erase = sets.midcast.FastRecast


	-- Custom spell classes
	sets.midcast.MndEnfeebles = {
		main="Akademos",
		sub="Mephitis Grip",
		ammo="Hydrocera",
		head="Amalric Coif",
		neck="Sanctity Necklace",
		ear1="Digni. Earring",
		ear2="Barkarole Earring",
		body="Vanya Robe",
		hands="Amalric Gages",
		ring1="Metamorph Ring",
		ring2="Weatherspoon Ring",
		back="Refraction Cape",
		waist="Rumination Sash",
		legs="Psycloth Lappas",
		feet="Medium's Sabots"
	}

	sets.midcast.IntEnfeebles = sets.midcast.MndEnfeebles
	sets.midcast.ElementalEnfeeble = sets.midcast.IntEnfeebles
	sets.midcast.Kaustra = set_combine(sets.midcast['Elemental Magic'], {
	head="Pixie Hairpin +1"
	})

	sets.midcast['Dark Magic'] = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Hydrocera",
		head=gear.nuke_head,
		neck="Incanter's Torque",
		ear1="Barkarole Earring",
		ear2="Dignitary's Earring",
		body="Psycloth Vest",
		hands="Lurid Mitts",
		ring1="Weatherspoon Ring",
		ring2="Evanescence Ring",
		back="Bookworm's Cape",
		waist="Witful Belt",
		legs="Pedagogy Pants",
		feet="Medium's Sabots"
		}

	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {
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
	})

	sets.midcast.Aspir = sets.midcast.Drain

	sets.midcast.Stun = {
		main="Akademos",
		sub="Niobid Strap",
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
        back=gear.nuke_back,
}

	sets.midcast.Stun.Resistant = set_combine(sets.midcast.Stun, {})


	-- Elemental Magic sets are default for handling all-tier nukes.
	 sets.midcast['Elemental Magic'] = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Pemphredo Tathlum",
		head=gear.nuke_head,
		body=gear.nuke_body,
		hands="Amalric Gages",
		legs="Amalric Slops",
		feet=gear.nuke_feet,
		neck="Saevus Pendant +1",
		ear1="Friomisi Earring",
		ear2="Barkarole Earring",
		ring1="Shiva Ring",
		ring2="Shiva Ring +1",
		back=gear.nuke_back,
		waist=gear.ElementalObi
		}
	--  sub="Zuuxowu Grip",head="Buremte Hat",body="Witching Robe",hands="Otomi Gloves",back="Bookworm's Cape",waist="Tengu-no-Obi",feet="Amalric Nails"

	sets.midcast['Elemental Magic'].Resistant = set_combine(sets.midcast['Elemental Magic'], {
		neck="Sanctity Necklace",
		back="Bookworm's Cape"
	})

	-- Custom refinements for certain nuke tiers (No longer used as of Jan/2016).
	sets.midcast['Elemental Magic'].HighTierNuke = sets.midcast['Elemental Magic']
	sets.midcast['Elemental Magic'].HighTierNuke.Resistant = sets.midcast['Elemental Magic'].Resistant
	
	sets.midcast.Helix = set_combine(sets.midcast['Elemental Magic'], {
		neck="Sanctity Necklace",
	--	back="Bookworm's Cape"
	})
	sets.midcast.Noctohelix = set_combine(sets.midcast.Helix, {
		head="Pixie Hairpin +1"})
	sets.midcast.Luminohelix = set_combine(sets.midcast.Helix, {
		ring1="Weatherspoon Ring"})

	sets.midcast.Impact = {
		main="Akademos",
		sub="Mephitis Grip",
		ammo="Hydrocera",
		head=empty,
		neck="Sanctity Necklace",
		ear1="Barkarole Earring",
		ear2="Gwati Earring",
		body="Twilight Cloak",
		hands=chiro_hands_MAB,
		ring1="Weatherspoon Ring",
		ring2="Sangoma Ring",
		back="Refraction Cape",
		waist="Luminary Sash",
		legs="Chironic Hose",
		feet="Medium's Sabots"}


	-- Sets to return to when not performing an action.

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Mephitis Grip",
		neck="Wiglen Gorget",body="Amalric Doublet",hands="Serpentes Cuffs",
		ring1="Sheltered Ring",ring2="Paguroidea Ring",legs="Assiduity Pants +1",feet="Serpentes Sabots"}


	-- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle.Field = {
		main="Akademos",
		sub="Niobid Strap",
		ammo="Homiliary",
		head="Amalric Coif",
		neck="Sanctity Necklace",
		ear1="Infused Earring",
		ear2="Ethereal Earring",
		body="Vrikodara Jupon",
		hands="Amalric Gages",
		ring1="Sheltered Ring",
		ring2="Paguroidea Ring",
		back="Solemnity Cape", 
		waist="Fucho-no-Obi",
		legs="Assiduity Pants +1",
		feet=gear.nuke_feet
	}		
	
	sets.idle.Town = set_combine(sets.idle.Field,{
		ring1="Defending Ring",
		ring2="Weatherspoon Ring",
		back=gear.nuke_back,
		feet="Herald's Gaiters"})
		
	sets.idle.PDT = set_combine(sets.idle.Field,{
		main="Bolelabunga",
		sub="Genbu's Shield",
		neck="Loricate Torque +1",
		ear1="Etiolation Earring",
		ring2="Gelatinous Ring +1",
		ring1="Defending Ring"
	})	

	sets.idle.Weak = sets.idle.Field
	
	-- Defense sets

	sets.defense.PDT = {
	--	main="Bolelabunga",
	--	sub="Genbu's Shield",
		ammo="Incantor Stone",
		head="Vanya hood",
		neck="Loricate Torque +1",
		ear1="Ethereal Earring",
		body="Vanya Robe",
		hands="Gendewitha Gages +1",
		ring1="Defending Ring",
		ring2="Gelatinous Ring +1",
		back="Solemnity Cape",
		legs="Chironic Hose",
		feet="Vanya Clogs"}

	sets.defense.MDT = {
		head=merl_head_MAB,
		neck="Loricate Torque +1",
		body="Pedagogy Gown +1",
		hands=chiro_hands_MAB,
		ring1="Defending Ring",
		ring2="Shadow Ring",
		back="Umbra Cape",
		legs="Chironic Hose",
		feet="Arbatel Loafers +1"}

	sets.Kiting = {feet="Herald's Gaiters"}
	sets.latent_refresh = {waist="Fucho-no-obi"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {}


	-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
	sets.buff['Ebullience'] = {}
	sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
	sets.buff['Perpetuance'] = {hands="Arbatel Bracers"}
	sets.buff['Immanence'] = {hands="Arbatel Bracers"}
	sets.buff['Penury'] = {legs="Arbatel Pants +1"}
	sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
	sets.buff['Celerity'] = {feet="Pedagogy Loafers +1"}
	sets.buff['Alacrity'] = {head=merl_head_MAB,feet="Pedagogy Loafers +1"}
	sets.buff['Stormsurge'] = {feet="Pedagogy Loafers +1"}
	sets.buff['Klimaform'] = {waist="Hachirin-no-Obi",feet="Arbatel Loafers +1"}

	sets.buff.FullSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown +1",neck="Wiglen Gorget",ring1="Sheltered Ring",ring2="Paguroidea Ring"}
	sets.buff.PDTSublimation = {head="Academic's Mortarboard +1",ear1="Savant's Earring",body="Pedagogy Gown +1"}
	
	sets.magic_burst = {
		main="Akademos",
		sub="Niobid Strap",
		head=gear.burst_head,
		neck="Mizukage-no-Kubikazari",
		ring1="Mujin Band",
	--	ring2="Locus Ring",
		back=gear.nuke_back,
		feet=gear.burst_feet,
		legs=gear.burst_legs
		}
	-- Cap: 40%, Cap-breaking: 23% (Gifts: 13%, Mujin: 5%, Amalric Gages: 5%)
    -- Akademos: 10%, Mizukage: 10%, Merlinic Legs: 10%, Merlinic Boots: 10% = 40%

end

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
function refine_various_spells(spell, action, spellMap, eventArgs)
    aspirs = S{'Aspir','Aspir II'}
    sleeps = S{'Sleep','Sleep II'}
    sleepgas = S{'Sleepga'}
   
    if not sleepgas:contains(spell.english) and not sleeps:contains(spell.english) and not aspirs:contains(spell.english) then
        return
    end
   
    local newSpell = spell.english
    local spell_recasts = windower.ffxi.get_spell_recasts()
    local cancelling = 'All '..spell.english..' spells are on cooldown. Cancelling spell casting.'
    
    if spell_recasts[spell.recast_id] > 0 then
        if aspirs:contains(spell.english) then
            if spell.english == 'Aspir' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
            elseif spell.english == 'Aspir II' then
                newSpell = 'Aspir'
            end         
        elseif sleeps:contains(spell.english) then
            if spell.english == 'Sleep' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
            elseif spell.english == 'Sleep II' then
                newSpell = 'Sleep'
            end
        elseif sleepgas:contains(spell.english) then
            if spell.english == 'Sleepga' then
                add_to_chat(122,cancelling)
                eventArgs.cancel = true
                return
            end
        end
    end
    
    if newSpell ~= spell.english then
        send_command('@input /ma "'..newSpell..'" '..tostring(spell.target.raw))
        eventArgs.cancel = true
        return
    end
end

function job_precast(spell, action, spellMap, eventArgs)	
    refine_various_spells(spell, action, spellMap, eventArgs)
    if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") then
	   if buffactive.Silence then
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
       end
    end	
end	
	
-- Run after the general midcast() is done.
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.action_type == 'Magic' then
        apply_grimoire_bonuses(spell, action, spellMap, eventArgs)
    end
	if spell.skill == 'Elemental Magic' then
        if state.MagicBurst.value then
        equip(sets.magic_burst)
        end
	end
	if spell.skill == 'Elemental Magic' and spell.element == world.day_element or spell.element == world.weather_element then
        equip ({waist="Hachirin-no-Obi"})
    end
end

function job_aftercast(spell)
    if spell.english == 'Sleep' or spell.english == 'Sleepga' then
		send_command('@wait 50;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
	elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
		send_command('@wait 80;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
	elseif spell.english == 'Break' or spell.english == 'Breakga' then
		send_command('@wait 20;input /echo ------- '..spell.english..' is wearing off in 10 seconds -------')
	end
end	

-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------

-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    if buff == "Sublimation: Activated" then
        handle_equipping_gear(player.status)
    end
end

-- Handle notifications of general user state change.
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

-- Custom spell mapping.
function job_get_spell_map(spell, default_spell_map)
    if spell.action_type == 'Magic' then
        if default_spell_map == 'Cure' or default_spell_map == 'Curaga' then
            if world.weather_element == 'Light' then
                return 'CureWithLightWeather'
            end
        elseif spell.skill == 'Enfeebling Magic' then
            if spell.type == 'WhiteMagic' then
                return 'MndEnfeebles'
            else
                return 'IntEnfeebles'
            end
        elseif spell.skill == 'Elemental Magic' then
            if info.low_nukes:contains(spell.english) then
                return 'LowTierNuke'
            elseif info.mid_nukes:contains(spell.english) then
                return 'MidTierNuke'
            elseif info.high_nukes:contains(spell.english) then
                return 'HighTierNuke'
            end
        end
    end
end

function customize_idle_set(idleSet)
    if state.Buff['Sublimation: Activated'] then
        if state.IdleMode.value == 'Normal' then
            idleSet = set_combine(idleSet, sets.buff.FullSublimation)
        elseif state.IdleMode.value == 'PDT' then
            idleSet = set_combine(idleSet, sets.buff.PDTSublimation)
        end
    end

    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end

    return idleSet
end

-- Called by the 'update' self-command.
function job_update(cmdParams, eventArgs)
    if cmdParams[1] == 'user' and not (buffactive['light arts']      or buffactive['dark arts'] or
                       buffactive['addendum: white'] or buffactive['addendum: black']) then
        if state.IdleMode.value == 'Stun' then
            send_command('@input /ja "Dark Arts" <me>')
        else
            send_command('@input /ja "Light Arts" <me>')
        end
    end

    update_active_strategems()
    update_sublimation()
end

-- Function to display the current relevant user state when doing an update.
-- Return true if display was handled, and you don't want the default info shown.
function display_current_job_state(eventArgs)
    display_current_caster_state()
    eventArgs.handled = true
end

-------------------------------------------------------------------------------------------------------------------
-- User code that supplements self-commands.
-------------------------------------------------------------------------------------------------------------------

-- Called for direct player commands.
function job_self_command(cmdParams, eventArgs)
    if cmdParams[1]:lower() == 'scholar' then
        handle_strategems(cmdParams)
        eventArgs.handled = true
    end
end

-------------------------------------------------------------------------------------------------------------------
-- Utility functions specific to this job.
-------------------------------------------------------------------------------------------------------------------

-- Reset the state vars tracking strategems.
function update_active_strategems()
    state.Buff['Ebullience'] = buffactive['Ebullience'] or false
    state.Buff['Rapture'] = buffactive['Rapture'] or false
    state.Buff['Perpetuance'] = buffactive['Perpetuance'] or false
    state.Buff['Immanence'] = buffactive['Immanence'] or false
    state.Buff['Penury'] = buffactive['Penury'] or false
    state.Buff['Parsimony'] = buffactive['Parsimony'] or false
    state.Buff['Celerity'] = buffactive['Celerity'] or false
    state.Buff['Alacrity'] = buffactive['Alacrity'] or false

    state.Buff['Klimaform'] = buffactive['Klimaform'] or false
end

function update_sublimation()
    state.Buff['Sublimation: Activated'] = buffactive['Sublimation: Activated'] or false
end

-- Equip sets appropriate to the active buffs, relative to the spell being cast.
function apply_grimoire_bonuses(spell, action, spellMap)
    if state.Buff.Perpetuance and spell.type =='WhiteMagic' and spell.skill == 'Enhancing Magic' then
        equip(sets.buff['Perpetuance'])
    end
    if state.Buff.Rapture and (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.buff['Rapture'])
    end
    if spell.skill == 'Elemental Magic' then --or spellMap ~= 'ElementalEnfeeble'
        if state.Buff.Ebullience and spell.english ~= 'Impact' then
            equip(sets.buff['Ebullience'])
        end
        if state.Buff.Immanence then
            equip(sets.buff['Immanence'])
        end
        if state.Buff.Klimaform and spell.skill == "Elemental Magic" and spell.element == world.weather_element then
            equip(sets.buff['Klimaform'])
        end
    end

    if state.Buff.Penury then equip(sets.buff['Penury']) end
    if state.Buff.Parsimony then equip(sets.buff['Parsimony']) end
    if state.Buff.Celerity then equip(sets.buff['Celerity']) end
    if state.Buff.Alacrity then equip(sets.buff['Alacrity']) end
end


function display_current_caster_state()
	local msg = ''

	if state.OffenseMode.value ~= 'None' then
		msg = msg .. 'Melee'

		if state.CombatForm.has_value then
			msg = msg .. ' (' .. state.CombatForm.value .. ')'
		end
        
		msg = msg .. ', '
	end

	msg = msg .. 'Idle ['..state.IdleMode.value..'], Casting ['..state.CastingMode.value..']'

	add_to_chat(122, msg)
	local currentStrats = get_current_strategem_count()
	local arts
	if buffactive['Light Arts'] or buffactive['Addendum: White'] then
		arts = 'Light Arts'
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		arts = 'Dark Arts'
	else
		arts = 'No Arts Activated'
	end
	add_to_chat(122, 'Current Available Strategems: ['..currentStrats..'], '..arts..'')
end

-- General handling of strategems in an Arts-agnostic way.
-- Format: gs c scholar <strategem>
function handle_strategems(cmdParams)
    -- cmdParams[1] == 'scholar'
    -- cmdParams[2] == strategem to use
	if not cmdParams[2] then
		add_to_chat(123,'Error: No strategem command given.')
		return
	end

	local currentStrats = get_current_strategem_count()
	local newStratCount = currentStrats - 1
	local strategem = cmdParams[2]:lower()
	
	if currentStrats > 0 and strategem ~= 'light' and strategem ~= 'dark' then
		add_to_chat(122, '***Current Charges Available: ['..newStratCount..']***')
	elseif currentStrats == 0 then
		add_to_chat(122, '***Out of strategems! Canceling...***')
		return
	end

	if strategem == 'light' then
		if buffactive['light arts'] then
			send_command('input /ja "Addendum: White" <me>')
			add_to_chat(122, '***Current Charges Available: ['..newStratCount..']***')
		elseif buffactive['addendum: white'] then
			add_to_chat(122,'Error: Addendum: White is already active.')
		elseif buffactive['dark arts']  or buffactive['addendum: black'] then
			send_command('input /ja "Light Arts" <me>')
			add_to_chat(122, '***Changing Arts! Current Charges Available: ['..currentStrats..']***')
		else
			send_command('input /ja "Light Arts" <me>')
		end
	elseif strategem == 'dark' then
		if buffactive['dark arts'] then
			send_command('input /ja "Addendum: Black" <me>')
			add_to_chat(122, '***Current Charges Available: ['..newStratCount..']***')
        elseif buffactive['addendum: black'] then
			add_to_chat(122,'Error: Addendum: Black is already active.')
		elseif buffactive['light arts'] or buffactive['addendum: white'] then
			send_command('input /ja "Dark Arts" <me>')
			add_to_chat(122, '***Changing Arts! Current Charges Available: ['..currentStrats..']***')
		else
			send_command('input /ja "Dark Arts" <me>')
		end
	elseif buffactive['light arts'] or buffactive['addendum: white'] then
		if strategem == 'cost' then
			send_command('@input /ja Penury <me>')
		elseif strategem == 'speed' then
			send_command('@input /ja Celerity <me>')
		elseif strategem == 'aoe' then
			send_command('@input /ja Accession <me>')
		elseif strategem == 'power' then
			send_command('@input /ja Rapture <me>')
		elseif strategem == 'duration' then
			send_command('@input /ja Perpetuance <me>')
		elseif strategem == 'accuracy' then
			send_command('@input /ja Altruism <me>')
		elseif strategem == 'enmity' then
			send_command('@input /ja Tranquility <me>')
		elseif strategem == 'skillchain' then
			add_to_chat(122,'Error: Light Arts does not have a skillchain strategem.')
		elseif strategem == 'addendum' then
			send_command('@input /ja "Addendum: White" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	elseif buffactive['dark arts']  or buffactive['addendum: black'] then
		if strategem == 'cost' then
			send_command('@input /ja Parsimony <me>')
		elseif strategem == 'speed' then
			send_command('@input /ja Alacrity <me>')
		elseif strategem == 'aoe' then
			send_command('@input /ja Manifestation <me>')
		elseif strategem == 'power' then
			send_command('@input /ja Ebullience <me>')
		elseif strategem == 'duration' then
			add_to_chat(122,'Error: Dark Arts does not have a duration strategem.')
		elseif strategem == 'accuracy' then
			send_command('@input /ja Focalization <me>')
		elseif strategem == 'enmity' then
			send_command('@input /ja Equanimity <me>')
		elseif strategem == 'skillchain' then
			send_command('@input /ja Immanence <me>')
		elseif strategem == 'addendum' then
			send_command('@input /ja "Addendum: Black" <me>')
		else
			add_to_chat(123,'Error: Unknown strategem ['..strategem..']')
		end
	else
		add_to_chat(123,'No arts has been activated yet.')
	end
end

function get_current_strategem_count()
	local allRecasts = windower.ffxi.get_ability_recasts()
	local stratsRecast = allRecasts[231]

	local maxStrategems = math.floor(player.main_job_level + 10) / 20

	local fullRechargeTime = 5*33

	local currentCharges = math.floor(maxStrategems - maxStrategems * stratsRecast / fullRechargeTime)
	
	return currentCharges
end


-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'RDM' then
        set_macro_page(1, 8)
    elseif player.sub_job == 'BLM' then
        set_macro_page(1, 8)	
    elseif player.sub_job == 'WHM' then
        set_macro_page(2, 8)
	end	
end
