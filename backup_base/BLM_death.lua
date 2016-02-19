
-------------------------------------------------------------------------------------------------------------------
-- Setup functions for this job. Generally should not be modified.
-------------------------------------------------------------------------------------------------------------------
-- Initialization function for this job file.
function get_sets()
mote_include_version = 2
-- Load and initialize the include file.
include('Mote-Include.lua')
end
-- Setup vars that are user-independent. state.Buff vars initialized here will automatically be tracked.
function job_setup()
end
-------------------------------------------------------------------------------------------------------------------
-- User setup functions for this job. Recommend that these be overridden in a sidecar file.
-------------------------------------------------------------------------------------------------------------------
-- Setup vars that are user-dependent. Can override this function in a sidecar file.
function user_setup()
state.OffenseMode:options('Non', 'Normal')
state.CastingMode:options('Normal', 'Resistant', 'Proc')
state.IdleMode:options('Normal', 'PDT')
state.MagicBurst = M(false, 'Magic Burst')
lowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
'Stone III', 'Water III', 'Aero III', 'Fire III', 'Blizzard III', 'Thunder III',
'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga',
'Stonega II', 'Waterga II', 'Aeroga II', 'Firaga II', 'Blizzaga II', 'Thundaga II'}
gear.macc_hagondes = {name="Hagondes Cuffs", augments={'Phys. dmg. taken -3%','Mag. Acc.+29'}}
-- Additional local binds
send_command('bind ^` input /ma Stun <t>')
send_command('bind ^= gs c activate MagicBurst')
select_default_macro_book()
end
-- Called when this job file is unloaded (eg: job change)
function user_unload()
send_command('unbind ^`')
send_command('unbind ^=')
end
-- Define sets and vars used by this job file.
function init_gear_sets()
--------------------------------------
-- Start defining the sets
--------------------------------------
---- Precast Sets ----
-- Precast sets to enhance JAs
sets.precast.JA['Mana Wall'] = {feet="Wicce Sabots"}
sets.precast.JA.Manafont = {body="Sorcerer's Coat +2"}
-- equip to maximize HP (for Tarus) and minimize MP loss before using convert
sets.precast.JA.Convert = {}

-- Fast cast sets for spells
sets.precast.FC = {ammo="Impatiens",
head="Nahtirah Hat",ear1="Enchanter Earring +1",ear2="Loquacious Earring",
body="Vanir Cotehardie",ring1="Prolix Ring", hands="Gendewitha gages +1",back="Swith Cape",waist="Witful Belt",legs="Artsieq Hose",feet="Regal Pumps"}

sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {head="Wicce Petasos",body="Wicce Coat",neck="Stoicheion Medal",hands="Wicce Gloves",legs="Wicce Chausses"})

sets.precast.FC.Cure = set_combine(sets.precast.FC, {body="Heka's Kalasiris", back="Pahtli Cape", hands="Bokwus Gloves", main="Tamaxchi", sub="Sors Shield", feet="Regal Pumps"})
sets.precast.FC.Curaga = sets.precast.FC.Cure

-- Weaponskill sets
-- Default set for any weaponskill that isn't any more specifically defined
sets.precast.WS = {
head="Hagondes Hat",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Rajas Ring",ring2="Patricus Ring",
back="Refraction Cape",waist="Cognition Belt",legs="Hagondes Pants +1",feet="Hagondes Sabots"}

-- Specific weaponskill sets. Uses the base set if an appropriate WSMod version isn't found.
sets.precast.WS['Vidohunir'] = {ammo="Dosis Tathlum",
head="Hagondes Hat",neck="Eddy Necklace",ear1="Friomisi Earring",ear2="Hecate's Earring",
body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Icesoul Ring",ring2="Acumen Ring",
back="Toro Cape",waist="Thunder Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

sets.precast.WS['Myrkr'] = {main="Marin Staff",ammo="Ghastly Tathlum",
head="Kaabnax Hat",neck="Weike Torque",ear1="Influx Earring",ear2="Gifted Earring",
body="Witching Robe",hands="Otomi Gloves",ring1="Prolix Ring",ring2="Star Ring",
back="Bane Cape",waist="Mujin Obi",legs="Helios Spats",feet="Manabyss Pigaches"}

---- Midcast Sets ----
sets.midcast.FastRecast = {head="Nahtirah Hat",body="Witching Robe",ear2="Loquacious Earring",ear1="Enchanter Earring+1",hands="Bokwus Gloves",ring1="Prolix Ring",
back="Swith Cape",waist="Awsang Sash",legs="Lengo Pants",feet="Regal Pumps"}

sets.midcast.Cure = {main="Tamaxchi",sub="Sors Shield",
head="Nahtirah Hat",neck="Enchanter Earring +1",ear2="Loquacious Earring",
body="Heka's Kalasiris",hands="Bokwus Gloves",ring1="Ephedra Ring",ring2="Sirona's Ring",
back="Pahtli Cape",waist=gear.ElementalObi,legs="Hagondes Pants",feet="Hagondes Sabots"}

sets.midcast.Curaga = sets.midcast.Cure
sets.midcast['Enhancing Magic'] = {
neck="Colossus's Torque",
body="Manasa Chasuble",hands="Ayao's Gages",
legs="Portent Pants"}

sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {waist="Siegel Sash"})
sets.midcast['Enfeebling Magic'] = {main="Marin Staff",sub="Mephitis Grip",ammo="Sturm's Report",
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Strendu Ring",ring2="Sangoma Ring",
back="Refraction Cape",legs="Artsieq Hose",feet="Chelona Boots +1"}

sets.midcast.ElementalEnfeeble = sets.midcast['Enfeebling Magic']
sets.midcast['Dark Magic'] = {main="Marin Staff",sub="Mephitis Grip",ammo="Sturm's Report",
head="Befouled Crown",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Angha Ring",ring2="Sangoma Ring",
back="Bane Cape",waist="Goading Belt",legs="Wicce Chausses",feet="Wicce Sabots"}

sets.midcast.Drain = {main="Marin Staff",sub="Mephitis Grip",ammo="Sturm's Report",
head="Befouled Crown",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Angha Ring",ring2="Sangoma Ring",
back="Bane Cape",waist="Fucho-no-Obi",legs="Wicce Chausses",feet="Wicce Sabots"}

sets.midcast.Aspir = sets.midcast.Drain
sets.midcast.Stun = {main="Marin Staff",sub="Mephitis Grip",ammo="Sturm's Report",
head="Befouled Crown",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Angha Ring",ring2="Sangoma Ring",
back="Bane Cape",waist="Fucho-no-Obi",legs="Wicce Chausses",feet="Wicce Sabots"}

sets.midcast.Death = {main="Marin Staff",sub="Mephitis Grip",ammo="Sturm's Report",
head="Befouled Crown",neck="Aesir Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Angha Ring",ring2="Sangoma Ring",
back="Bane Cape",waist="Fucho-no-Obi",legs="Wicce Chausses",feet="Wicce Sabots"}

sets.midcast.BardSong = {main="Lehbrailg +2",sub="Mephitis Grip",ammo="Sturm's Report",
head="Nahtirah Hat",neck="Weike Torque",ear1="Psystorm Earring",ear2="Lifestorm Earring",
body="Vanir Cotehardie",hands="Hagondes Cuffs",ring1="Angha Ring",ring2="Sangoma Ring",
back="Refraction Cape",legs="Bokwus Slops",feet="Bokwus Boots"}

-- Elemental Magic sets
sets.midcast['Elemental Magic'] = {main="Marin Staff",sub="Mephitis Grip",ammo="Ghastly Tathlum",
head="Hagondes Hat",neck="Eddy Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
body="Spaekona's Coat +1",hands="Wicce Gloves",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
back="Toro Cape",waist="Aswang Sash",legs="Hagondes Pants",feet="Tutyr Sabots"}

sets.midcast['Elemental Magic'].Resistant = {main="Marin Staff",sub="Zuuxowu Grip",ammo="Ghastly Tathlum",
head="Hagondes Hat",neck="Eddy Necklace",ear1="Barkarole Earring",ear2="Friomisi Earring",
body="Artsieq Jubbah",hands="Hagondes Cuffs",ring1="Strendu Ring",ring2="Angha Ring",
back="Bane Cape",waist="Aswang Sash",legs="Wicce Chausses",feet="Spaekona Sabots +1"}
sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})
sets.midcast['Elemental Magic'].HighTierNuke.Resistant = set_combine(sets.midcast['Elemental Magic'], {sub="Wizzan Grip"})

-- Minimal damage gear for procs.
sets.midcast['Elemental Magic'].Proc = {main="Marin Staff", sub="Mephitis Grip",ammo="Ghastly Tathlum",
head="Hagondes Hat",neck="Stoicheion Medal",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Spaekona's Coat +1",hands="Serpentes Cuffs",ring1="Strendu Ring",ring2="Angha Ring",
back="Swith Cape",waist="Witful Belt",legs="Hagondes Pants +1",feet="Chelona Boots +1"}

-- Sets to return to when not performing an action.
-- Resting sets
sets.resting = {main="Chatoyant Staff",ammo="Clarus Stone",
head="Nefer Khat +1",neck="Grandiose Chain",
body="Spaekona's Coat +1",hands="Serpentes Cuffs",ring1="Star Ring",ring2="Angha Ring",
waist="Hierarch Belt",legs="Assiduity pants +1",feet="Serpentes Sabots"}

-- Idle sets
-- Normal refresh idle set
sets.idle = {main="Marin Staff",sub="Mephitis Grip",ammo="Ghastly Tathlum",
head="Befouled Crown",neck="Twilight Torque",ear1="Enchanter Earring +1",ear2="Moonshade Earring",
body="Witching Robe",hands="Yaoyotl Gloves",ring1="Vocane Ring",ring2="Patricus Ring",
back="Iximulew Cape",waist="Cetl Belt",legs="Assiduity pants +1",feet="Spaekona Sabots +1"}

-- Idle mode that keeps PDT gear on, but doesn't prevent normal gear swaps for precast/etc.
sets.idle.PDT = {main="Earth Staff", sub="Zuuxowu Grip",ammo="Impatiens",
head="Hagondes Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Spaekona Coat +1",hands="Hagondes cuffs",ring1="Vocane Ring",ring2="Patricus Ring",
back="Iximulew Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Spaekona Sabots +1"}

-- Idle mode scopes:
-- Idle mode when weak.
sets.idle.Weak = {main="Bolelabunga",sub="Genbu's Shield",ammo="Impatiens",
head="Hagondes Hat",neck="Twilight Torque",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Paguroidea Ring",
back="Umbra Cape",waist="Hierarch Belt",legs="Nares Trews",feet="Hagondes Sabots"}

-- Town gear.
sets.idle.Town = {main="Lehbrailg +2", sub="Zuuxowu Grip",ammo="Impatiens",
head="Hagondes Hat",neck="Wiglen Gorget",ear1="Bloodgem Earring",ear2="Loquacious Earring",
body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Sheltered Ring",ring2="Paguroidea Ring",
back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Herald's Gaiters"}

-- Defense sets
sets.defense.PDT = {main="Earth Staff",sub="Zuuxowu Grip",
head="Nahtirah Hat",neck="Twilight Torque",
body="Hagondes Coat",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Patricus Ring",
back="Umbra Cape",waist="Hierarch Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}

sets.defense.MDT = {ammo="Demonry Stone",
head="Nahtirah Hat",neck="Twilight Torque",
body="Vanir Cotehardie",hands="Yaoyotl Gloves",ring1="Defending Ring",ring2="Shadow Ring",
back="Tuilha Cape",waist="Hierarch Belt",legs="Bokwus Slops",feet="Hagondes Sabots"}
sets.Kiting = {feet="Herald's Gaiters"}
sets.latent_refresh = {waist="Fucho-no-obi"}
-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
sets.buff['Mana Wall'] = {feet="Wicce Sabots"}
sets.magic_burst = {neck="Mizukage-no-Kubikazari"}
-- Engaged sets
-- Variations for TP weapon and (optional) offense/defense modes. Code will fall back on previous
-- sets if more refined versions aren't defined.
-- If you create a set with both offense and defense modes, the offense mode should be first.
-- EG: sets.engaged.Dagger.Accuracy.Evasion
-- Normal melee group
sets.engaged = {
head="Zelus Tiara",neck="Asperity Necklace",ear1="Bladeborn Earring",ear2="Steelflash Earring",
body="Hagondes Coat",hands="Bokwus Gloves",ring1="Rajas Ring",ring2="K'ayres Ring",
back="Umbra Cape",waist="Goading Belt",legs="Hagondes Pants",feet="Hagondes Sabots"}
end
-------------------------------------------------------------------------------------------------------------------
-- Job-specific hooks for standard casting events.
-------------------------------------------------------------------------------------------------------------------
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
-- Set eventArgs.useMidcastGear to true if we want midcast gear equipped on precast.
function job_precast(spell, action, spellMap, eventArgs)
if spellMap == 'Cure' or spellMap == 'Curaga' then
gear.default.obi_waist = "Goading Belt"
elseif spell.skill == 'Elemental Magic' then
gear.default.obi_waist = "Sekhmet Corset"
if state.CastingMode.value == 'Proc' then
classes.CustomClass = 'Proc'
end
end
end
-- Set eventArgs.handled to true if we don't want any automatic gear equipping to be done.
function job_midcast(spell, action, spellMap, eventArgs)
end
function job_post_midcast(spell, action, spellMap, eventArgs)
if spell.skill == 'Elemental Magic' and state.MagicBurst.value then
equip(sets.magic_burst)
end
end
function job_aftercast(spell, action, spellMap, eventArgs)
-- Lock feet after using Mana Wall.
if not spell.interrupted then
if spell.english == 'Mana Wall' then
enable('feet')
equip(sets.buff['Mana Wall'])
disable('feet')
elseif spell.skill == 'Elemental Magic' then
state.MagicBurst:reset()
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
--[[ No real need to differentiate with current gear.
if lowTierNukes:contains(spell.english) then
return 'LowTierNuke'
else
return 'HighTierNuke'
end
--]]
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