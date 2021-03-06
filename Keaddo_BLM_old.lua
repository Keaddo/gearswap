-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job.  Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
 
-- Initialization function for this job file.
function get_sets()
    mote_include_version = 2
     
    -- Load and initialize the include file.
    include('Mote-Include.lua')
    -- Load organizer add on to grab all gear associated with lua.
    include('organizer-lib')
end
 
 
-- Setup vars that are user-independent.  state.Buff vars initialized here will automatically be tracked.
function job_setup()
 
end
 
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job.  Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
 
-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
  --  state.OffenseMode:options('None', 'Normal')
    state.CastingMode:options('Normal', 'Resistant', 'Spaekona', 'HighMP')
    state.IdleMode:options('Normal', 'PDT', 'HighMP')
    state.MagicBurst = M(false, 'Magic Burst')
     
    lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
                    'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
                    'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
                    'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
                    'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
     
    -- Additional local binds
    send_command('bind ^` input /ma Stun <t>;input /echo Target <t> Stunned')
    send_command('bind !` gs c toggle MagicBurst')
 
    select_default_macro_book()
end
 
-- Called when this job file is unloaded (eg: job change)
function user_unload()
    send_command('unbind ^`')
    send_command('unbind !`')
end
 
 
-- Define sets and vars used by this job file.
function init_gear_sets()
-------------------------------------------------------------------------------------------------------------------
-- Start defining the sets
-------------------------------------------------------------------------------------------------------------------
                                                                         
-- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS =                                                       {}
                                                                             
-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    -- Rock Crusher Modifiers: STR:20% INT:20% --       
    sets.precast.WS['Rock Crusher'] =                                       set_combine(sets.precast.WS,{})
                                                                             
    -- Spirit Taker Modifiers: INT:50% MND:50% --
    sets.precast.WS['Spirit Taker'] =                                       set_combine(sets.precast.WS,{})
                                                                             
    -- Cataclysm Modifiers: STR:30% INT:30% --
    sets.precast.WS['Cataclysm'] =                                          set_combine(sets.precast.WS,{})
                                                                             
    -- Retribution Modifiers: STR:30%; MND:50% --
    sets.precast.WS['Retribution'] =                                        set_combine(sets.precast.WS,{})
                                                                             
    -- Gate of Tartarus Modifiers: INT:80% --
    sets.precast.WS['Gate of Tartarus'] =                                   set_combine(sets.precast.WS,{
                                                                            })
                                                                             
    -- Myrkr Modifiers: None --
    sets.precast.WS['Myrkr'] =                                              set_combine(sets.precast.WS,{})
                                                                             
    -- Shattersoul Modifiers: INT:20~100%, depending on merit points upgrades. --
    sets.precast.WS['Shattersoul'] =                                        set_combine(sets.precast.WS,{})
                                                                             
-- Precast sets
    -- Precast sets to enhance JAs
    sets.precast.JA['Mana Wall'] =                                          {
	back="Taranus's Cape"}
     
    sets.precast.JA['Manafont'] =                                           {}
     
 
    -- Fast cast sets for spells
    sets.precast.FC =                                                       {
	ammo="Impatiens",
	head="Amalric Coif",
	ear1="Etiolation Earring",
	ear2="Loquacious Earring",
	body="Vrikodara Jupon",
	ring1="Prolix Ring",
	ring2="Weatherspoon Ring",
	back="Swith Cape",
	legs="Psycloth Lappas",
	feet={ name="Merlinic Crackows", augments={'"Fast Cast"+5','"Mag.Atk.Bns."+11',}}}
	
    sets.precast.FC.HighMP = {
        ammo="Impatiens",
        head="Merlinic Hood",
		body="Vrikodara Jupon",
        hands={name="Amalric Gages", priority=13},
        legs="Psycloth Lappas",
		feet={ name="Merlinic Crackows", augments={'"Fast Cast"+5','"Mag.Atk.Bns."+11',}},
        neck={name="Orunmila's Torque", priority=12},
		waist="Witful Belt",
        left_ear={name="Etiolation Earring", priority=16},
        right_ear={name="Loquac. Earring", priority=15},
        left_ring={name="Mephitas's Ring", priority=14},
        right_ring={name="Mephitas's Ring +1", priority=8},
        back="Bane Cape",
    }
	
                                                                             
    -- Stoneskin
    sets.precast.Stoneskin =                                                set_combine(sets.precast.FC,{
})
     
    -- Cure Magic
    sets.precast.Cure =                                                     set_combine(sets.precast.FC,{
	ear1="Mendi. Earring"})
     
    -- Elemental Magic
    sets.precast.FCElementalMagic =                                         set_combine(sets.precast.FC,{})
     
    -- Ancient Magic
    sets.precast.AncientMagic =                                             set_combine(sets.precast.FCElementalMagic,{})
                                                     
-- Midcast Sets
    -- Day Weather Bonus
    sets.midcast.Bonus =                                                    {}
                                                         
    -- Fastrecast
    sets.midcast.FastRecast =                                               {}
     
    -- Cure
    sets.midcast.Cure =                                                     {
	body="Vrikodara Jupon",
	back="Solemnity Cape"}
 
    sets.midcast.Curaga =                                                   sets.midcast.Cure
                                                                             
    sets.midcast['Enhancing Magic'] =                                       {
	head="Umuthi Hat"}
 
    sets.midcast['Enhancing Magic'].Stoneskin =                             set_combine(sets.midcast['Enhancing Magic'],{
		legs="Shedir Seraweels",
		waist="Siegel Sash"})
                                                                             
    sets.midcast['Enhancing Magic'].Aquaveil =                              set_combine(sets.midcast['Enhancing Magic'],{
	head="Amalric Coif",
	legs="Shedir Seraweels"})                                                                         
 
 
    sets.midcast['Enfeebling Magic'] =                                      {
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
	feet="Medium's Sabots"}
	
                                                                             
    sets.midcast['Enfeebling Magic'].Mnd =                                  set_combine(sets.midcast['Enfeebling Magic'],{})
       
    sets.midcast.ElementalEnfeeble =                                        sets.midcast['Enfeebling Magic']
 
    sets.midcast['Dark Magic'] =                                            {
	ammo="Pemphredo Tathlum",
	head="Pixie Hairpin +1",
	neck="Mizu. Kubikazari",
	ear1="Hirudinea Earring",
	ear2="Barkarole Earring",
	body="Amalric Doublet",
	hands="Amalric Gages",
	ring1="Evanescence Ring",
	ring2="Weatherspoon Ring",	
	back="Bane Cape",
	waist="Fucho-no-Obi",
	legs="Merlinic Shalwar",
	Feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}}}
                                                                             
    sets.midcast['Dark Magic'].Drain =                                      set_combine(sets.midcast['Dark Magic'],{})
                                                                             
    sets.midcast['Dark Magic'].Aspir =                                      sets.midcast['Dark Magic'].Drain    

	sets.midcast['Dark Magic'].Aspir.HighMP =								set_combine(sets.midcast['Dark Magic'].Aspir,{
		ammo="Psilomene",
		neck="Incanter's Torque",
		legs="Amalric Slops",
		ring2="Mephitas Ring +1"
	})
                                                                             
 
    sets.midcast['Dark Magic'].Stun =                                       set_combine(sets.midcast['Dark Magic'],{})
 
    -- Elemental Magic sets
    sets.midcast.LowTierNuke =                                              {
	ammo="Pemphredo Tathlum",
	head="Merlinic Hood",
	body="Amalric Doublet",
	hands="Amalric Gages",
	legs="Amalric Slops",
	feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}},
	neck="Saevus Pendant +1",
	ear1="Friomisi Earring",
	ear2="Barkarole Earring",
	ring1="Shiva Ring",
	ring2="Shiva Ring",
	back="Taranus's Cape",
	waist="Refoccilation Stone"
	}
 
    sets.midcast.LowTierNuke.Resistant =                                    set_combine(sets.midcast.LowTierNuke,{
	head="Amalric Coif",
	neck="Sanctity Necklace",
	ring1="Weatherspoon Ring"})
	
	sets.midcast.LowTierNuke.Spaekona =										set_combine(sets.midcast.LowTierNuke,{
	body="Spae. Coat +1"})                                                                         
                                                                             
    sets.midcast.HighTierNuke =                                             set_combine(sets.midcast.LowTierNuke,{})
                                                                             
    sets.midcast.HighTierNuke.Resistant =                                   set_combine(sets.midcast.LowTierNuke.Resistant,{
	ear1="Digni.Earring"
	})

	sets.midcast.HighTierNuke.Spaekona =									set_combine(sets.midcast.LowTierNuke,{
	body="Spae. Coat +1"})
	
    sets.midcast.Death = {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body="Amalric Doublet",
        hands="Amalric Gages",
        legs="Amalric Slops",
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}},
        neck="Saevus Pendant +1",
        waist="Refoccilation Stone",
        left_ear="Barkaro. Earring",
        right_ear="Friomisi Earring",
        left_ring="Archon Ring",
        right_ring="Mephitas's Ring +1",
        back="Taranus's Cape",
    }
 
    sets.midcast.Death.HighMP = {
        ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",
        body="Amalric Doublet",
        hands="Amalric Gages",
        legs="Amalric Slops",
		feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}},
        neck="Saevus Pendant +1",
        waist="Refoccilation Stone",
        left_ear="Barkaro. Earring",
        right_ear="Friomisi Earring",
        left_ring="Archon Ring",
        right_ring="Mephitas's Ring +1",
        back="Taranus's Cape",
    }
	
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
	
-- Sets to return to when not performing an action.
    -- Resting sets
    sets.resting =                                                          {
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
	feet={ name="Merlinic Crackows", augments={'"Mag.Atk.Bns."+25','Magic burst mdg.+9%','CHR+6','Mag. Acc.+13',}}}
     
    -- Idle sets
     
    -- Normal refresh idle set
    sets.idle =                                                             sets.resting
 
    -- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
    sets.idle.PDT =                                                         set_combine(sets.resting,{
	neck="Loricate Torque +1",
	ring1="Gelatinous Ring +1",
	ring2="Defending Ring"})
 
    -- Idle mode when weak.
    sets.idle.Weak =                                                        sets.idle.PDT
     
    -- Town gear.
    sets.idle.Town =                                                        set_combine(sets.resting,{
	ring1="Defending Ring",
	ring2="Weatherspoon Ring",
	back="Taranus's Cape",
	feet="Herald's Gaiters"})
	
	-- DEATH idle set --
	
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
        waist="Fucho-no-Obi",
        legs="Amalric Slops",
        feet="Amalric Nails",
	}
         
    -- Defense sets
 
    sets.defense.PDT =                                                      set_combine(sets.resting,{
	neck="Loricate Torque +1",
	ring1="Gelatinous Ring +1",
	ring2="Defending Ring"})
 
    sets.defense.MDT =                                                      set_combine(sets.resting,{})
 
    sets.Kiting =                                                           {
	feet="Herald's Gaiters"}
 
    sets.latent_refresh =                                                   {}
 
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
     
    sets.buff['Mana Wall'] =                                                {
	back="Taranus's Cape"}
 
    sets.magic_burst =                                                      set_combine(sets.midcast.LowTierNuke,{
	ring1="Mujin Band",
	ring2="Locus Ring",
	neck="Mizu. Kubikazari",
	head="Merlinic Hood",
	body="Spae. Coat +1",
	back="Taranus's Cape",
	legs="Merlinic Shalwar"
	})
	
	sets.magic_burst.Spaekona =												set_combine(sets.magic_burst, {
	
	body="Spae. Coat +1"
	})
	
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
 
    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
     
    -- Normal melee group
    sets.engaged = sets.idle
    sets.engaged.HighMP = sets.idle.HighMP
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
    if player.tp > 1000 then
        disable('main','sub')
    elseif (spellMap == 'Cure' or spellMap == 'Curaga') then
        equip(sets.precast.Cure)
        if (world.weather_element == 'Light' or world.day_element == 'Light') then
            equip({waist="Hachirin-no-Obi"})
        end
    elseif spellMap == 'Freeze II' or spellMap == 'Tornado II' or spellMap == 'Quake II' or spellMap == 'Burst II' or spellMap == 'Flood II' or spellMap == 'Flare II' then
        equip(sets.precast.AncientMagic)
    elseif spellMap == 'Stoneskin' then
        equip(sets.precast.Stoneskin)
    elseif spell.skill == 'Elemental Magic' then
        equip(sets.precast.FCElementalMagic)
    end
end
 
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and (spell.element == world.weather_element or spell.element == world.day_element) then
        equip(sets.midcast.Bonus)
    elseif spellMap == 'Slow' or spellMap == 'Silence' or spellMap == 'Paralyze' then
        equip(sets.midcast['Enfeebling Magic'].Mnd)
    end
end
 
function job_post_midcast(spell, action, spellMap, eventArgs)
    if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
        equip(sets.magic_burst)
    end
end
 
function job_aftercast(spell, action, spellMap, eventArgs)
    if player.tp < 1000 then
        enable('main','sub')
    elseif not spell.interrupted then
        if spell.english == 'Mana Wall' then
            enable('feet')
            equip(sets.buff['Mana Wall'])
            disable('feet')
        elseif spell.skill == 'Elemental Magic' and state.MagicBurst.value then
            state.MagicBurst:reset()
        elseif spell.english == 'Sleep' or spell.english == 'Sleepga' then
            send_command('@wait 55;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        elseif spell.english == 'Sleep II' or spell.english == 'Sleepga II' then
            send_command('@wait 85;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        elseif spell.english == 'Break' or spell.english == 'Breakga' then
            send_command('@wait 25;input /echo ------- '..spell.english..' is wearing off in 5 seconds -------')
        end
    end
end
 
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for non-casting events.
-------------------------------------------------------------------------------------------------------------------
 
-- Called when a player gains or loses a buff.
-- buff == buff gained or lost
-- gain == true if the buff was gained, false if it was lost.
function job_buff_change(buff, gain)
    -- Unlock feet when Mana Wall buff is lost.
    if buff == "Mana Wall" and not gain then
        enable('feet')
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
    if spell.skill == 'Elemental Magic' and default_spell_map ~= 'ElementalEnfeeble' then
        if lowTierNukes:contains(spell.english) then
            return 'LowTierNuke'
        else
            return 'HighTierNuke'
        end
    end
end
 
 

 
-- Modify the default idle set after it was constructed.
function customize_idle_set(idleSet)
    if player.mpp < 51 then
        idleSet = set_combine(idleSet, sets.latent_refresh)
    end
     
    return idleSet
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
