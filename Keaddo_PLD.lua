-- Last Updated: 11/06/2015 --

function get_sets()
	include('organizer-lib')
	AccIndex = 1
	AccArray = {"LowACC","MidACC","HighACC"} -- Default ACC Set is Low --
	ShieldIndex = 1
	ShieldArray = {"Ochain","Aegis","Priwen"} -- Default Shield Set is Ochain --
	IdleIndex = 4
	IdleArray = {"Movement","Regen","Refresh","Hybrid"} -- Default Idle Set Is Hybrid --
	Armor = 'None'
	Twilight = 'None'
	Repulse = 'OFF' -- Set Default Repulse ON or OFF Here --
	Capa = 'OFF' -- Set Default Capacity Points+ Mantle ON or OFF Here --
	target_distance = 6 -- Set Default Distance Here --
	select_default_macro_book() -- Change Default Macro Book At The End --

	Cure_Spells = {"Cure","Cure II","Cure III","Cure IV"} -- Cure Degradation --
	sc_map = {SC1="Flash", SC2="UtsusemiNi", SC3="UtsusemiIchi"} -- 3 Additional Binds. Can Change Whatever JA/WS/Spells You Like Here. Remember Not To Use Spaces. --
	EnmityBlueMagic = S{"Jettatura","Sheep Song","Soporific","Blank Gaze","Geist Wall"} -- BlueMagic --
	
	Cities = S{
                        "Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
                        "Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
                        "Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
                        "Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
                        "Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
                        "Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Tavnazia"}

	sets.Idle = {}
	-- Idle/Town Sets --
	sets.Idle.Regen = {
			ammo="Homiliary",
			head="Jumalik Helm",
			neck="Coatl Gorget +1",
			ear1="Infused Earring",
			ear2="Ethereal Earring",
			body="Chozoron Coselete",
			hands="Souveran Handschuhs",
			ring1="Paguroidea Ring",
			ring2="Sheltered Ring",
			back="Weard Mantle",
			waist="Flume Belt +1",
			legs="Carmine Cuisses +1",
			feet="Amm Greaves"}
	sets.Idle.Regen.Ochain = set_combine(sets.Idle.Regen,{
			main="Burtgang",
			sub="Ochain"})
	sets.Idle.Regen.Aegis = set_combine(sets.Idle.Regen,{
			main="Burtgang",
			sub="Aegis"})
	sets.Idle.Regen.Priwen = set_combine(sets.Idle.Regen,{
			main="Burtgang",
			sub="Priwen"})
	sets.Idle.Movement = set_combine(sets.Idle.Regen,{})
	sets.Idle.Movement.Ochain = set_combine(sets.Idle.Movement,{
			main="Burtgang",
			sub="Ochain"})
	sets.Idle.Movement.Aegis = set_combine(sets.Idle.Movement,{
			main="Burtgang",
			sub="Aegis"})
	sets.Idle.Movement.Priwen = set_combine(sets.Idle.Movement,{
			main="Burtgang",
			sub="Priwen"})
	sets.Idle.Refresh = set_combine(sets.Idle.Regen,{
			head="Baghere Salade",
			body="Ares' Cuirass +1",
			hands="Ogier's Gauntlets",
			feet="Ogier's Leggings"})
	sets.Idle.Refresh.Ochain = set_combine(sets.Idle.Refresh,{
			main="Burtgang",
			sub="Ochain"})
	sets.Idle.Refresh.Aegis = set_combine(sets.Idle.Refresh,{
			main="Burtgang",
			sub="Aegis"})
	sets.Idle.Refresh.Priwen = set_combine(sets.Idle.Refresh,{
			main="Burtgang",
			sub="Priwen"})
	sets.Town = set_combine(sets.Idle.Hybrid,{
		--	head="Cab. Coronet +1", --
		--	body="Councilor's Garb", --
		--	hands="Souv. Handsch. +1", --
		 	ring1="Defending Ring",
		--	ring2="Vocane Ring",
			feet="Souveran Schuhs +1"})

	sets.Resting = set_combine(sets.Idle.Regen)

	sets.Twilight = {head="Twilight Helm",body="Twilight Mail"}
	
	sets.Idle.Hybrid = set_combine(sets.Idle.Regen,{
			neck="Coatl Gorget +1",
			ring2="Sheltered Ring",
			back="Weard Mantle",
			legs="Carmine Cuisses +1"})
			
	-- TP Base Set --
	sets.TP = {}

	-- Ochain TP Sets --
	sets.TP.Ochain = {
			main="Burtgang",
			sub="Ochain",
			ammo="Ginsen",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Lissome Necklace",
    waist="Tempus Fugit",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",			}
	sets.TP.Ochain.MidACC = set_combine(sets.TP.Ochain,{
			ammo="Amar Cluster",
			neck="Lissome Necklace",
			hands="Leyline Gloves",
			back="Grounded Mantle"})
	sets.TP.Ochain.HighACC = set_combine(sets.TP.Ochain.MidACC,{
			neck="Subtlety Spec.",
			ear1="Zwazo Earring",
			ring2="Cacoethic Ring +1",
			waist="Olseni Belt"})

	-- Aegis TP Sets --
	sets.TP.Aegis = {
			main="Burtgang",
			sub="Aegis",
			ammo="Ginsen",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Lissome Necklace",
    waist="Tempus Fugit",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",}
	sets.TP.Aegis.MidACC = set_combine(sets.TP.Aegis,{
			ammo="Amar Cluster",
			neck="Lissome Necklace",
			hands="Leyline Gloves",
			back="Grounded Mantle"})	
	sets.TP.Aegis.HighACC = set_combine(sets.TP.Aegis.MidACC,{
			neck="Subtlety Spec.",
			ear1="Zwazo Earring",
			ring2="Cacoethic Ring +1",
			waist="Olseni Belt"})
			
	-- Priwen TP Sets --
	sets.TP.Priwen = {
			main="Burtgang",
			sub="Priwen",
			ammo="Ginsen",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Lissome Necklace",
    waist="Tempus Fugit",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",	}		
	sets.TP.Priwen.MidACC = set_combine(sets.TP.Priwen,{
			ammo="Amar Cluster",
			neck="Lissome Necklace",
			hands="Leyline Gloves",
			back="Grounded Mantle"})
	sets.TP.Priwen.HighACC = set_combine(sets.TP.Priwen.MidACC,{
			neck="Subtlety Spec.",
			ear1="Zwazo Earring",
			ring2="Cacoethic Ring +1",
			waist="Olseni Belt"})

	-- Ragnarok TP Sets --
	sets.TP.Ragnarok = {}
	sets.TP.Ragnarok.MidACC = set_combine(sets.TP.Ragnarok,{})	
	sets.TP.Ragnarok.HighACC = set_combine(sets.TP.Ragnarok.MidACC,{})

	-- Ragnarok(Ionis) TP Sets --
	sets.TP.Ragnarok.Ionis = set_combine(sets.TP.Ragnarok,{})
	sets.TP.Ragnarok.MidACC.Ionis = set_combine(sets.TP.Ragnarok.Ionis,{})	
	sets.TP.Ragnarok.HighACC.Ionis = set_combine(sets.TP.Ragnarok.MidACC.Ionis,{})

	-- PDT/MDT/DT Sets --												
												
	sets.PDT = {}
	sets.PDT.Ochain = {
			sub="Ochain",
			ammo="Angha Gem", -- 2 PDT --
			head="Loess Barbuta +1", -- 5 PDT --
			neck="Loricate Torque +1", -- 5 DT --
			ear1="Zwazo Earring",
			ear2="Ethereal Earring",
			body="Souveran Cuirass", -- 9 DT [Upgrade: Tartarus Platemail -10% DT] --
			hands="Souveran Handschuhs", -- 3 PDT 2/5 Souv. Set --
			ring1="Defending Ring", -- 4 PDT --
			ring2="Gelatinous Ring +1", -- 7 PDT --
			back="Weard Mantle", -- 3 DT --
			waist="Flume Belt +1", -- 4 PDT --
			legs="Souveran Diechlings", -- 4 PDT --
			feet="Souveran Schuhs"} -- 4 PDT --
							-- Total -17% DT + -33% PDT = -50% Reduction --
												-- Primary ACC 815 --
	sets.PDT.Aegis = {
			sub="Aegis",
			ammo="Angha Gem",
			head="Loess Barbuta +1",
			neck="Loricate Torque +1",
			ear1="Zwazo Earring",
			ear2="Ethereal Earring",
			body="Souveran Cuirass", 
			hands="Souveran Handschuhs", 
			ring1="Defending Ring", 
			ring2="Gelatinous Ring +1", 
			back="Weard Mantle", 
			waist="Flume Belt +1 +1", 
			legs="Souveran Diechlings",
			feet="Souveran Schuhs"}
			
	sets.PDT.Priwen = {
			sub="Priwen",
			ammo="Angha Gem",
			head="Loess Barbuta +1",
			neck="Loricate Torque +1",
			ear1="Zwazo Earring",
			ear2="Ethereal Earring",
			body="Souveran Cuirass", 
			hands="Souveran Handschuhs", 
			ring1="Defending Ring", 
			ring2="Gelatinous Ring +1", 
			back="Weard Mantle", 
			waist="Flume Belt +1 +1", 
			legs="Souveran Diechlings",
			feet="Souveran Schuhs"}

	sets.MDT = {}
	sets.MDT.Ochain = {
			sub="Ochain",
			ammo="Vanir Battery", -- MDB 4 --
			head="Loess Barbuta +1", -- MDB 2 / MDT 5 --
			neck="Loricate Torque +1", -- 5 DT --
			ear1="Odnowa Earring +1", -- MDT 2 --
			ear2="Ethereal Earring", 
			body="Souveran Cuirass", -- 9 DT --
			hands="Souveran Handschuhs", -- MDB 1 / MDT 5 --
			ring1="Defending Ring",
			ring2="Praan Ring",
			back="Engulfer Cape +1", -- 4 MDT --
			waist="Flume Belt +1",
			legs="Souveran Diechlings", -- MDB 4 --
			feet="Amm Greaves"} -- MDB 2 / DT 3 --
								-- Total -17% DT + -16% MDT = -33% Reduction / +13 MDB --

	sets.MDT.Aegis = {
			sub="Aegis",
			ammo="Vanir Battery", 
			head="Loess Barbuta +1", 
			neck="Loricate Torque +1",
			ear1="Odnowa Earring +1", 
			ear2="Ethereal Earring", 
			body="Souveran Cuirass", 
			hands="Souveran Handschuhs", 
			ring1="Defending Ring",
			ring2="Praan Ring",
			back="Engulfer Cape +1", 
			waist="Flume Belt +1",
			legs="Souveran Diechlings", 
			feet="Amm Greaves"}
								
	sets.MDT.Priwen = {
			sub="Priwen",
			ammo="Vanir Battery", 
			head="Loess Barbuta +1", 
			neck="Loricate Torque +1",
			ear1="Odnowa Earring +1", 
			ear2="Ethereal Earring", 
			body="Souveran Cuirass", 
			hands="Souveran Handschuhs", 
			ring1="Defending Ring",
			ring2="Praan Ring",
			back="Engulfer Cape +1", 
			waist="Flume Belt +1",
			legs="Souveran Diechlings", 
			feet="Amm Greaves"}

	sets.DT = {}
	sets.DT.Ochain = {
			sub="Ochain",
			ammo="Vanir Battery", 
			head="Loess Barbuta +1", 
			neck="Loricate Torque +1",
			ear1="Odnowa Earring +1", 
			ear2="Ethereal Earring", 
			body="Souveran Cuirass", 
			hands="Souveran Handschuhs", 
			ring1="Defending Ring",
			ring2="Gelatinous Ring +1",
			back="Weard Mantle", 
			waist="Flume Belt +1",
			legs="Souveran Diechlings", 
			feet="Souveran Schuhs"}
			
	sets.DT.Aegis = {
			sub="Aegis",
			ammo="Vanir Battery", 
			head="Loess Barbuta +1", 
			neck="Loricate Torque +1",
			ear1="Odnowa Earring +1", 
			ear2="Ethereal Earring", 
			body="Souveran Cuirass", 
			hands="Souveran Handschuhs", 
			ring1="Defending Ring",
			ring2="Gelatinous Ring +1",
			back="Weard Mantle", 
			waist="Flume Belt +1",
			legs="Souveran Diechlings", 
			feet="Souveran Schuhs"}
			
	sets.DT.Priwen = {
			sub="Priwen",
			ammo="Vanir Battery", 
			head="Loess Barbuta +1", 
			neck="Loricate Torque +1",
			ear1="Odnowa Earring +1", 
			ear2="Ethereal Earring", 
			body="Souveran Cuirass", 
			hands="Souveran Handschuhs", 
			ring1="Defending Ring",
			ring2="Gelatinous Ring +1",
			back="Weard Mantle", 
			waist="Flume Belt +1",
			legs="Souveran Diechlings", 
			feet="Souveran Schuhs"}

	-- Weakness/Kiting/Repulse Sets --
	sets.Weakness = {}
	sets.Weakness.Ochain = set_combine(sets.PDT.Ochain,{})
	sets.Weakness.Aegis = set_combine(sets.PDT.Aegis,{})
	sets.Weakness.Priwen = set_combine(sets.PDT.Priwen,{})

	sets.Kiting = {}
	sets.Kiting.Ochain = set_combine(sets.PDT.Ochain,{legs="Carmine Cuisses +1"})
	sets.Kiting.Aegis = set_combine(sets.PDT.Aegis,{legs="Carmine Cuisses +1"})
	sets.Kiting.Priwen = set_combine(sets.PDT.Priwen,{legs="Carmine Cuisses +1"})

	sets.Repulse = {}
	sets.Repulse.Ochain = {sub="Ochain",back="Repulse Mantle"}
	sets.Repulse.Aegis = {sub="Aegis",back="Repulse Mantle"}
	sets.Repulse.Priwen = {sub="Priwen",back="Repulse Mantle"}

	-- Hybrid/Shield Skill Sets --
	sets.TP.Hybrid = {}
	sets.TP.Hybrid.MidACC = set_combine(sets.TP.Hybrid,{})
	sets.TP.Hybrid.HighACC = set_combine(sets.TP.Hybrid.MidACC,{})

	sets.TP.ShieldSkill = {}

	-- WS Base Set --
	sets.WS = {
			ammo="Jukukik Feather",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",}

	-- WS Sets --
	sets.WS["Chant du Cygne"] = {
			ammo="Jukukik Feather",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",}
	sets.WS["Chant du Cygne"].MidACC = set_combine(sets.WS["Chant du Cygne"],{
			waist="Fotia Belt"})
	sets.WS["Chant du Cygne"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{})
			
	sets.WS["Savage Blade"] = {
			ammo="Jukukik Feather",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",}
	sets.WS["Savage Blade"].MidACC = set_combine(sets.WS["Chant du Cygne"],{
			waist="Fotia Belt"})
	sets.WS["Savage Blade"].HighACC = set_combine(sets.WS["Chant du Cygne"].MidACC,{})

	sets.WS.Requiescat = {
			ammo="Jukukik Feather",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",}
	sets.WS.Requiescat.MidACC = set_combine(sets.WS.Requiescat,{})
	sets.WS.Requiescat.HighACC = set_combine(sets.WS.Requiescat.MidACC,{})

	sets.WS.Resolution = {
			ammo="Jukukik Feather",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",}
	sets.WS.Resolution.MidACC = set_combine(sets.WS.Resolution,{})
	sets.WS.Resolution.HighACC = set_combine(sets.WS.Resolution.MidACC,{})

	sets.WS.Atonement = {
			ammo="Jukukik Feather",
    head="Sulevia's Mask +1",
    body="Sulevia's Plate. +1",
    hands="Sulev. Gauntlets +1",
    legs="Sulevi. Cuisses +1",
    feet="Sulev. Leggings +1",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Digni. Earring",
    right_ear="Brutal Earring",
    left_ring="Petrov Ring",
    right_ring="Rajas Ring",}

	sets.WS["Knights of Round"] = {
			ammo="Cheruski Needle",
			head="Otomi Helm",
			neck="Fotia Gorget",
			ear1="Moonshade Earring",
			ear2="Brutal Earring",
			body="Acro Surcoat",
			hands="Acro Gauntlets",
			ring1="Ifrit Ring +1",
			ring2="Ifrit Ring +1",
			back="Bleating Mantle",
			waist="Metalsinger Belt",
			legs="Acro Breeches",
			feet="Eschite Greaves"}

	sets.WS["Sanguine Blade"] = {}

	sets.WS["Aeolian Edge"] = {}

	sets.Enmity = { -- +10 from Brilliance  --
			ammo="Sapience Orb", -- 2 --
			head="Loess Barbuta +1", -- 9-14 --
			neck="Unmoving Collar", -- 9 --
			ear1="Friomisi Earring", -- 2 --
			ear2="Ethereal Earring", -- 7 --
			body="Souveran Cuirass", -- 10 --
			hands="Odyssean Gauntlets", -- 14 --
			ring1="Apeile Ring", -- 4~8 --
			ring2="Apeile Ring +1", -- 5~9 --
			back="Weard Mantle", -- 7 --
			waist="Sulla Belt", -- 3 --
			legs="Souveran Diechlings", -- 7 --
			feet="Eschite Greaves"} -- 15 --
									-- Total Enmity+ = 94~107 --

	-- JA Sets --
	sets.JA = {}
	sets.JA["Shield Bash"] = set_combine(sets.Enmity,{hands="Cab. Gauntlets +1"})
	sets.JA.Sentinel = set_combine(sets.Enmity,{feet="Cab. Leggings +1"})
	sets.JA["Holy Circle"] = set_combine(sets.Enmity,{feet="Rev. Leggings +1"})
	sets.JA["Divine Emblem"] = set_combine(sets.Enmity,{feet="Chev. Sabatons +1"})
	sets.JA.Fealty = set_combine(sets.Enmity,{body="Cab. Surcoat +1"})
	sets.JA.Invincible = set_combine(sets.Enmity,{legs="Cab. Breeches +1"})
	sets.JA.Cover = {head="Rev. Coronet +1",body="Cab. Surcoat +1"}
	sets.JA.Palisade = set_combine(sets.Enmity)
	sets.JA.Provoke = set_combine(sets.Enmity)
	sets.JA.Warcry = set_combine(sets.Enmity)
	sets.JA.Souleater = set_combine(sets.Enmity)
	sets.JA["Last Resort"] = set_combine(sets.Enmity)
	sets.JA.Chivalry = {
			ammo="Quartz Tathlum +1",
			head="Rev. Coronet +1",
			body="Cab. Surcoat +1",
			hands="Umuthi Gloves",
			ring1="Levia. Ring +1",
			legs="Cab. Breeches +1",
			feet="Whirlpool Greaves"}
	sets.JA.Rampart = set_combine(sets.Enmity,{head="Cab. Coronet +1"})

	-- Sublimation --
	sets.Sublimation = {}

	-- Flourish --
	sets.Flourish = set_combine(sets.Enmity)

	-- Step --
	sets.Step = set_combine(sets.Enmity)

	-- Waltz --
	sets.Waltz = {}

	sets.Precast = {}
	--Fastcast Set --
	sets.Precast.FastCast = {
			ammo="Impatiens",
			head="Carmine Mask",
			neck="Orunmila's Torque",
			ear1="Etiolation Earring",
			ear2="Loquac. Earring",
			body="Odyssean Chestplate",
			hands="Leyline Gloves",
			ring1="Prolix Ring",
			ring2="Weatherspoon Ring",
			back="Weard Mantle",
			waist="Goading Belt",
			legs={name="Odyssean Cuisses",augments={"STR+5", "Accuracy+10", "Attack+11", "Fast Cast+5"}},
			feet={name="Odyssean Greaves",augments={"INT+11", "Fast Cast+5"}}
			}

	-- Precast Enhancing Magic --
	sets.Precast['Enhancing Magic'] = set_combine(sets.Precast.FastCast,{waist="Olympus Sash"})

	-- Cure Precast Set --
	sets.Precast.Cure = set_combine(sets.Precast.FastCast,{ear2="Nourish. Earring +1"})

	-- Midcast Base Set --
	sets.Midcast = {}

	-- Spells Recast --
	sets.Midcast.Recast = {
			ammo="Impatiens",
			head="Carmine Mask",
			neck="Orunmila's Torque",
			ear1="Enchntr. Earring +1",
			ear2="Loquac. Earring",
			body="Chozoron Coselete",
			hands="Leyline Gloves",
			ring1="Prolix Ring",
			ring2="Weatherspoon Ring",
			back="Weard Mantle",
			waist="Goading Belt",
			legs={name="Odyssean Cuisses",augments={"STR+5", "Accuracy+10", "Attack+11", "Fast Cast+5"}},
			feet={name="Odyssean Greaves",augments={"INT+11", "Fast Cast+5"}}
			}

	-- Divine Magic --
	sets.Midcast['Divine Magic'] = set_combine(sets.Midcast.Recast,{
			head="Jumalik Helm",})

	-- Cure Set --
	sets.Midcast.Cure = {
			ammo="Impatiens",
			head="Shabti Armet +1",
			neck="Phalaina Locket",
			ear1="Oneiros Earring",
			ear2="Nourish. Earring +1",
			body="Jumalik Mail",
			hands="Macabre Gaunt. +1",
			ring1="Eihwaz Ring",
			ring2="Kunaji Ring",
			back="Fierabras's Mantle",
			waist="Chuq'aba Belt",
			legs={name="Yorium Cuisses",augments={"STR+5", "Accuracy+10", "Attack+11", "Fast Cast+5"}},
			feet="Souveran Schuhs"}

	-- Self Cure Set --
	sets.Midcast.SelfCure = set_combine(sets.Midcast.Cure,{})

	-- Flash Set --
	sets.Midcast.Flash = { -- 10 brilliance --
			ammo="Sapience Orb", -- 2 --
			head="Loess Barbuta +1", -- 7 --
			neck="Unmoving Collar", -- 9 --
			ear1="Friomisi Earring", -- 2 --
			ear2="Ethereal Earring", -- 7 --
			body="Souveran Cuirass", -- 10 --
			hands="Odyssean Gauntlets", -- 14 --
			ring1="Apeile Ring", -- 4~8 --
			ring2="Apeile Ring +1", -- 5~9 --
			back="Weard Mantle", -- 7 --
			waist="Flume Belt +1", --  --
			legs={name="Odyssean Cuisses",augments={"STR+5", "Accuracy+10", "Attack+11", "Fast Cast+5"}}, -- 4 --
			feet="Eschite Greaves"} -- 15 --
									-- Total Enmity+ = 89~97 --

	-- Enhancing Magic --
	sets.Midcast['Enhancing Magic'] = set_combine(sets.Midcast.Recast,{
			ammo="Impatiens",
			neck="Colossus's Torque",
			ear1="Andoaa Earring",
			ear2="Augment. Earring",
			body="Shabti Cuirass",
			back="Merciful Cape",
			waist="Olympus Sash",
			legs="Rev. Breeches +1"})

	-- Stoneskin --
	sets.Midcast.Stoneskin =  set_combine(sets.Midcast['Enhancing Magic'],{})

	-- Reprisal --
	sets.Midcast.Reprisal = {
			ammo="Impatiens",
			head="Founder's Corona",
			neck="Dualism Collar",
			ear1="Oneiros Earring",
			ear2="Ethereal Earring",
			body="Souveran Cuirass",
			hands="Souveran Handschuhs",
			ring1="Kunaji Ring",
			ring2="Praan Ring",
			back="Xucau Mantle",
			waist="Eschan Stone",
			legs="Eschite Cuisses",
			feet="Souveran Schuhs"}
			
	-- Lock Capa Mantle --
	sets.Capa = {
			back="Mecisto. Mantle"}
			
	-- Organizer Items --
	organizer_items = {
		head={name="Yorium Barbuta",augments={"Phalanx+2"}},
		legs={name="Yorium Cuisses",augments={"Dbl. Atk.+2","Phalanx+2"}}}
end

function pretarget(spell,action)
	if (spell.type:endswith('Magic') or spell.type == "Ninjutsu") and buffactive.silence then -- Auto Use Echo Drops If You Are Silenced --
		cancel_spell()
		send_command('input /item "Echo Drops" <me>')
	elseif spell.english:ifind("Cure") and player.mp<actualCost(spell.mp_cost) then
		degrade_spell(spell,Cure_Spells)
	elseif spell.english == "Berserk" and buffactive.Berserk then -- Cancel Berserk If Berserk Is On --
		send_command('cancel Berserk')
	elseif spell.english == "Defender" and buffactive.Defender then -- Cancel Defender If Defender Is On --
		send_command('cancel Defender')
	elseif spell.english == "Souleater" and buffactive.Souleater then -- Cancel Souleater If Souleater Is On --
		send_command('cancel Souleater')
	elseif spell.english == "Last Resort" and buffactive["Last Resort"] then -- Cancel Last Resort If Last Resort Is On --
		send_command('cancel Last Resort')
	elseif spell.type == "WeaponSkill" and spell.target.distance > target_distance and player.status == 'Engaged' then -- Cancel WS If You Are Out Of Range --
		cancel_spell()
		add_to_chat(123, spell.name..' Canceled: [Out of Range]')
		return
	elseif buffactive['Light Arts'] or buffactive['Addendum: White'] then
		if spell.english == "Light Arts" and not buffactive['Addendum: White'] then
			cancel_spell()
			send_command('input /ja Addendum: White <me>')
		elseif spell.english == "Manifestation" then
			cancel_spell()
			send_command('input /ja Accession <me>')
		elseif spell.english == "Alacrity" then
			cancel_spell()
			send_command('input /ja Celerity <me>')
		elseif spell.english == "Parsimony" then
			cancel_spell()
			send_command('input /ja Penury <me>')
		end
	elseif buffactive['Dark Arts'] or buffactive['Addendum: Black'] then
		if spell.english == "Dark Arts" and not buffactive['Addendum: Black'] then
			cancel_spell()
			send_command('input /ja Addendum: Black <me>')
		elseif spell.english == "Accession" then
			cancel_spell()
			send_command('input /ja Manifestation <me>')
		elseif spell.english == "Celerity" then
			cancel_spell()
			send_command('input /ja Alacrity <me>')
		elseif spell.english == "Penury" then
			cancel_spell()
			send_command('input /ja Parsimony <me>')
		end
	end
end

function precast(spell,action)
	if spell.type == "WeaponSkill" then
		if player.status ~= 'Engaged' then -- Cancel WS If You Are Not Engaged. Can Delete It If You Don't Need It --
			cancel_spell()
			add_to_chat(123,'Unable To Use WeaponSkill: [Disengaged]')
			return
		else
			equipSet = sets.WS
			if equipSet[spell.english] then
				equipSet = equipSet[spell.english]
			end
			if equipSet[AccArray[AccIndex]] then
				equipSet = equipSet[AccArray[AccIndex]]
			end
			if player.tp > 2999 then
				if spell.english == "Resolution" then -- Equip Kokou's Earring When You Have 3000 TP --
					equipSet = set_combine(equipSet,{ear1="Kokou's Earring"})
				elseif spell.english == "Chant du Cygne" then -- Equip Jupiter's Pearl When You Have 3000 TP --
					equipSet = set_combine(equipSet,{ear1="Jupiter's Pearl"})
				end
			end
			equip(equipSet)
		end
	elseif spell.type == "JobAbility" then
		if sets.JA[spell.english] then
			equip(sets.JA[spell.english])
		end
	elseif spell.type == "Rune" then
		equip(sets.Enmity)
	elseif spell.type:endswith('Magic') or spell.type == "Ninjutsu" then
		if buffactive.silence or spell.target.distance > 16+target_distance then -- Cancel Magic or Ninjutsu If You Are Silenced or Out of Range --
			cancel_spell()
			add_to_chat(123, spell.name..' Canceled: [Silenced or Out of Casting Range]')
			return
		else
			if string.find(spell.english,'Cur') and spell.english ~= "Cursna" then
				equip(sets.Precast.Cure)
			elseif spell.english == "Reprisal" then
				if buffactive['Blaze Spikes'] or buffactive['Ice Spikes'] or buffactive['Shock Spikes'] then -- Cancel Blaze Spikes, Ice Spikes or Shock Spikes When You Cast Reprisal --
					cast_delay(0.2)
					send_command('cancel Blaze Spikes,Ice Spikes,Shock Spikes')
				end
				equip(sets.Precast.FastCast)
			elseif string.find(spell.english,'Utsusemi') then
				if buffactive['Copy Image (3)'] or buffactive['Copy Image (4)'] then
					cancel_spell()
					add_to_chat(123, spell.name .. ' Canceled: [3+ Images]')
					return
				else
					equip(sets.Precast.FastCast)
				end
			elseif sets.Precast[spell.skill] then
				equip(sets.Precast[spell.skill])
			else
				equip(sets.Precast.FastCast)
			end
		end
	elseif string.find(spell.type,'Flourish') then
		if spell.english == "Animated Flourish" then
			equip(sets.Enmity)
		else
			equip(sets.Flourish)
		end
	elseif spell.type == "Step" then
		equip(sets.Step)
	elseif spell.type == "Waltz" then
		refine_waltz(spell,action)
		equip(sets.Waltz)
	elseif spell.english == 'Spectral Jig' and buffactive.Sneak then
		cast_delay(0.2)
		send_command('cancel Sneak')
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
	if Capa == 'ON' then
		equip(sets.Capa)
	end
end

function midcast(spell,action)
	equipSet = {}
	if spell.type:endswith('Magic') or spell.type == 'Ninjutsu' then
		equipSet = sets.Midcast
		if equipSet[spell.english] then
			equipSet = equipSet[spell.english]
		elseif (string.find(spell.english,'Cur') or spell.english == "Wild Carrot" or spell.english == "Healing Breeze") and spell.english ~= "Cursna" then
			if spell.target.name == player.name then
				equipSet = equipSet.SelfCure
			else
				equipSet = equipSet.Cure
			end
		elseif string.find(spell.english,'Protect') or string.find(spell.english,'Shell') then
			if spell.target.name == player.name then
				equipSet = set_combine(equipSet,{ring2="Sheltered Ring"})
			end
		elseif spell.english == "Phalanx" then
			equipSet = set_combine(sets.Midcast['Enhancing Magic'],{head={name="Yorium Barbuta",augments={"Phalanx+2"}},hands="Souveran Handschuhs",back="Weard Mantle",legs={name="Yorium Cuisses",augments={"Dbl. Atk.+2","Phalanx+2"}},feet="Souveran Schuhs"})
		elseif spell.english == "Stoneskin" then
			if buffactive.Stoneskin then
				send_command('@wait 1.7;cancel stoneskin')
			end
			equipSet = equipSet.Stoneskin
		elseif spell.english == "Sneak" then
			if spell.target.name == player.name and buffactive['Sneak'] then
				send_command('cancel sneak')
			end
			equipSet = equipSet.Recast
		elseif string.find(spell.english,'Banish') then
			equipSet = set_combine(equipSet,{ring1=""})
		elseif EnmityBlueMagic:contains(spell.english) or spell.english == "Stun" or string.find(spell.english,'Absorb') or spell.english == 'Aspir' or spell.english == 'Drain' then
			if buffactive.Sentinel then
				equipSet = equipSet.Recast
			else
				equipSet = equipSet.Flash
			end
		elseif string.find(spell.english,'Spikes') then
			equipSet = equipSet.Recast
		elseif string.find(spell.english,'Utsusemi') then
			if spell.english == 'Utsusemi: Ichi' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
				send_command('@wait 1.7;cancel Copy Image*')
			end
			equipSet = equipSet.Recast
		elseif spell.english == 'Monomi: Ichi' then
			if buffactive['Sneak'] then
				send_command('@wait 1.7;cancel sneak')
			end
			equipSet = equipSet.Recast
		elseif equipSet[spell.skill] then
			equipSet = equipSet[spell.skill]
		end
	elseif equipSet[spell.english] then
		equipSet = equipSet[spell.english]
	end
	equip(equipSet)
	if Capa == 'ON' then
		equip(sets.Capa)
	end
end

function aftercast(spell,action)
	if not spell.interrupted then
		if spell.type == "WeaponSkill" then
			send_command('wait 0.2;gs c TP')
		elseif spell.english == "Banish II" then -- Banish II Countdown --
			send_command('@wait 20;input /echo Banish Effect: [WEARING OFF IN 10 SEC.]')
		elseif spell.english == "Holy Circle" then -- Holy Circle Countdown --
			send_command('wait 260;input /echo '..spell.name..': [WEARING OFF IN 10 SEC.];wait 10;input /echo '..spell.name..': [OFF]')
		end
	end
	status_change(player.status)
end

function status_change(new,old)
	check_equip_lock()
	if Armor == 'PDT' then
		equip(sets.PDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'MDT' then
		equip(sets.MDT[ShieldArray[ShieldIndex]])
	elseif Armor == 'Kiting' then
		equip(sets.Kiting[ShieldArray[ShieldIndex]])
	elseif Armor == 'Weakness' then
		equip(sets.Weakness[ShieldArray[ShieldIndex]])
	elseif Armor == 'DT' then
		equip(sets.DT[ShieldArray[ShieldIndex]])
	elseif buffactive["Sublimation: Activated"] then
		equip(sets.Sublimation)
	elseif new == 'Engaged' then
		equipSet = sets.TP
		if Armor == 'Hybrid' and equipSet["Hybrid"] then
			equipSet = equipSet["Hybrid"]
		end
		if equipSet[player.equipment.main] then
			equipSet = equipSet[player.equipment.main]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
		if equipSet[AccArray[AccIndex]] then
			equipSet = equipSet[AccArray[AccIndex]]
		end
		if buffactive.Ionis and equipSet["Ionis"] then
			equipSet = equipSet["Ionis"]
		end
		if Armor == 'ShieldSkill' then
			equipSet = set_combine(equipSet,sets.TP.ShieldSkill)
		end
		equip(equipSet)
	elseif new == 'Idle' then
		equipSet = sets.Idle
		if equipSet[IdleArray[IdleIndex]] then
			equipSet = equipSet[IdleArray[IdleIndex]]
		end
		if equipSet[ShieldArray[ShieldIndex]] then
			equipSet = equipSet[ShieldArray[ShieldIndex]]
		end
	if buffactive['Reive Mark'] then -- Equip Ygnas's Resolve +1 During Reive --
		equipSet = set_combine(equipSet,{neck="Ygnas's Resolve +1"})
	end
	if world.area:endswith('Adoulin') then
		equipSet = set_combine(equipSet,{body="Councilor's Garb"})
	end
		equip(equipSet)
	elseif new == 'Resting' then
		equip(sets.Resting)
	end
	if Repulse == 'ON' then -- Use Repulse Toggle To Lock Repulse Mantle --
		equip(sets.Repulse[ShieldArray[ShieldIndex]])
	end
	if Twilight == 'Twilight' then
		equip(sets.Twilight)
	end
	if Capa == 'ON' then
		equip(sets.Capa)
	end
	if Cities:contains(world.area) then
		equipSet = equip(sets.Town)
	end
end

function buff_change(buff,gain)
	buff = string.lower(buff)
	if buff == "aftermath: lv.3" then -- AM3 Timer/Countdown --
		if gain then
			send_command('timers create "Aftermath: Lv.3" 180 down;wait 120;input /echo Aftermath: Lv.3 [WEARING OFF IN 60 SEC.];wait 30;input /echo Aftermath: Lv.3 [WEARING OFF IN 30 SEC.];wait 20;input /echo Aftermath: Lv.3 [WEARING OFF IN 10 SEC.]')
		else
			send_command('timers delete "Aftermath: Lv.3"')
			add_to_chat(123,'AM3: [OFF]')
		end
	elseif buff == 'weakness' then -- Weakness Timer --
		if gain then
			send_command('timers create "Weakness" 300 up')
		else
			send_command('timers delete "Weakness"')
		end
	end
	if buff == "sleep" and gain and player.hp > 200 and player.status == "Engaged" then -- Equip Berserker's Torque When You Are Asleep & Have 200+ HP --
		equip({neck=""})
	else
		if not midaction() then
			status_change(player.status)
		end
	end
end

--Macros--
-- send_command('bind f9 gs c C7') --PDT--
send_command('bind f9 gs c C17') --DT--
send_command('bind f7 gs c C2') --Ochain/Aegis/Priwen--
--send_command('bind f6 gs c C1') --ACC Level--
--send_command('bind f5 gs c C3') --Twilight--
--send_command('bind f10 gs c C4') --Capa Mantle--

function file_unload()
    if binds_on_unload then
        binds_on_unload()
    end

--	send_command('unbind f10')
  --  send_command('unbind f9')
    send_command('unbind f9')
	send_command('unbind f7')
--	send_command('unbind f6')
--	send_command('unbind f5')
end


-- In Game: //gs c (command), Macro: /console gs c (command), Bind: gs c (command) --
function self_command(command)
	if command == 'C1' then -- Accuracy Level Toggle --
		AccIndex = (AccIndex % #AccArray) + 1
		status_change(player.status)
		add_to_chat(158,'Accuracy Level: '..AccArray[AccIndex])
	elseif command == 'C5' then -- Auto Update Gear Toggle --
		status_change(player.status)
		add_to_chat(158,'Auto Update Gear')
	elseif command == 'C2' then -- Shield Type Toggle --
		ShieldIndex = (ShieldIndex % #ShieldArray) + 1
		status_change(player.status)
		add_to_chat(158,'Shield Type: '..ShieldArray[ShieldIndex])
	elseif command == 'C9' then -- Hybrid Toggle --
		if Armor == 'Hybrid' then
			Armor = 'None'
			add_to_chat(123,'Hybrid Set: [Unlocked]')
		else
			Armor = 'Hybrid'
			add_to_chat(158,'Hybrid Set: '..AccArray[AccIndex])
		end
		status_change(player.status)
	elseif command == 'C7' then -- PDT Toggle --
		if Armor == 'PDT' then
			Armor = 'None'
			add_to_chat(123,'PDT Set: [Unlocked]')
		else
			Armor = 'PDT'
			add_to_chat(158,'PDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C15' then -- MDT Toggle --
		if Armor == 'MDT' then
			Armor = 'None'
			add_to_chat(123,'MDT Set: [Unlocked]')
		else
			Armor = 'MDT'
			add_to_chat(158,'MDT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C12' then -- Kiting Toggle --
		if Armor == 'Kiting' then
			Armor = 'None'
			add_to_chat(123,'Kiting Set: [Unlocked]')
		else
			Armor = 'Kiting'
			add_to_chat(158,'Kiting Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C4' then -- Capa Back Toggle --
		if Capa == 'ON' then
			Capa = 'OFF'
			add_to_chat(123,'Capacity Mantle: [Unlocked]')
		else
			Capa = 'ON'
			add_to_chat(158,'Capacity Mantle: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C10' then -- Weakness Set Toggle --
		if Armor == 'Weakness' then
			Armor = 'None'
			add_to_chat(123,'Weakness Set: [Unlocked]')
		else
			Armor = 'Weakness'
			add_to_chat(158,'Weakness Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C17' then -- DT Toggle --
		if Armor == 'DT' then
			Armor = 'None'
			add_to_chat(123,'DT Set: [Unlocked]')
		else
			Armor = 'DT'
			add_to_chat(158,'DT Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C16' then -- Repulse Mantle Toggle --
		if Repulse == 'ON' then
			Repulse = 'OFF'
			add_to_chat(123,'Repulse Mantle: [Unlocked]')
		else
			Repulse = 'ON'
			add_to_chat(158,'Repulse Mantle: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C11' then -- Shield Skill Toggle --
		if Armor == 'ShieldSkill' then
			Armor = 'None'
			add_to_chat(123,'Shield Skill Set: [Unlocked]')
		else
			Armor = 'ShieldSkill'
			add_to_chat(158,'Shield Skill Set: [Locked]')
		end
		status_change(player.status)
	elseif command == 'C3' then -- Twilight Toggle --
		if Twilight == 'Twilight' then
			Twilight = 'None'
			add_to_chat(123,'Twilight Set: [Unlocked]')
		else
			Twilight = 'Twilight'
			add_to_chat(158,'Twilight Set: [locked]')
		end
		status_change(player.status)
	elseif command == 'C8' then -- Distance Toggle --
		if player.target.distance then
			target_distance = math.floor(player.target.distance*10)/10
			add_to_chat(158,'Distance: '..target_distance)
		else
			add_to_chat(123,'No Target Selected')
		end
	elseif command == 'C6' then -- Idle Toggle --
		IdleIndex = (IdleIndex % #IdleArray) + 1
		status_change(player.status)
		add_to_chat(158,'Idle Set: '..IdleArray[IdleIndex])
	elseif command == 'TP' then
		add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
	elseif command:match('^SC%d$') then
		send_command('//' .. sc_map[command])
	end
end

function check_equip_lock() -- Lock Equipment Here --
	if player.equipment.left_ring == "Warp Ring" or player.equipment.left_ring == "Capacity Ring" or player.equipment.right_ring == "Warp Ring" or player.equipment.right_ring == "Capacity Ring" then
		disable('ring1','ring2')
	elseif player.equipment.back == "Mecisto. Mantle" or player.equipment.back == "Aptitude Mantle +1" or player.equipment.back == "Aptitude Mantle" then
		disable('back')
	else
		enable('ring1','ring2','back')
	end
end

function actualCost(originalCost)
	if buffactive["Penury"] then
		return originalCost*.5
	elseif buffactive["Light Arts"] then
		return originalCost*.9
	else
		return originalCost
	end
end

function degrade_spell(spell,degrade_array)
	spell_index = table.find(degrade_array,spell.name)
	if spell_index>1 then
		new_spell = degrade_array[spell_index - 1]
		change_spell(new_spell,spell.target.raw)
		add_to_chat(8,spell.name..' Canceled: ['..player.mp..'/'..player.max_mp..'MP::'..player.mpp..'%] Casting '..new_spell..' instead.')
	end
end

function change_spell(spell_name,target)
	cancel_spell()
	send_command('//'..spell_name..' '..target)
end

function refine_waltz(spell,action)
	if spell.type ~= 'Waltz' then
		return
	end

	if spell.name == "Healing Waltz" or spell.name == "Divine Waltz" or spell.name == "Divine Waltz II" then
		return
	end

	local newWaltz = spell.english
	local waltzID

	local missingHP

	if spell.target.type == "SELF" then
		missingHP = player.max_hp - player.hp
	elseif spell.target.isallymember then
		local target = find_player_in_alliance(spell.target.name)
		local est_max_hp = target.hp / (target.hpp/100)
		missingHP = math.floor(est_max_hp - target.hp)
	end

	if missingHP ~= nil then
		if player.sub_job == 'DNC' then
			if missingHP < 40 and spell.target.name == player.name then
				add_to_chat(123,'Full HP!')
				cancel_spell()
				return
			elseif missingHP < 150 then
				newWaltz = 'Curing Waltz'
				waltzID = 190
			elseif missingHP < 300 then
				newWaltz = 'Curing Waltz II'
				waltzID = 191
			else
				newWaltz = 'Curing Waltz III'
				waltzID = 192
			end
		else
			return
		end
	end

	local waltzTPCost = {['Curing Waltz'] = 20, ['Curing Waltz II'] = 35, ['Curing Waltz III'] = 50, ['Curing Waltz IV'] = 65, ['Curing Waltz V'] = 80}
	local tpCost = waltzTPCost[newWaltz]

	local downgrade

	if player.tp < tpCost and not buffactive.trance then

		if player.tp < 20 then
			add_to_chat(123, 'Insufficient TP ['..tostring(player.tp)..']. Cancelling.')
			cancel_spell()
			return
		elseif player.tp < 35 then
			newWaltz = 'Curing Waltz'
		elseif player.tp < 50 then
			newWaltz = 'Curing Waltz II'
		elseif player.tp < 65 then
			newWaltz = 'Curing Waltz III'
		elseif player.tp < 80 then
			newWaltz = 'Curing Waltz IV'
		end

		downgrade = 'Insufficient TP ['..tostring(player.tp)..']. Downgrading to '..newWaltz..'.'
	end

	if newWaltz ~= spell.english then
		send_command('@input /ja "'..newWaltz..'" '..tostring(spell.target.raw))
		if downgrade then
			add_to_chat(158, downgrade)
		end
		cancel_spell()
		return
	end

	if missingHP > 0 then
		add_to_chat(158,'Trying to cure '..tostring(missingHP)..' HP using '..newWaltz..'.')
	end
end

function find_player_in_alliance(name)
	for i,v in ipairs(alliance) do
		for k,p in ipairs(v) do
			if p.name == name then
				return p
			end
		end
	end
end

function sub_job_change(newSubjob, oldSubjob)
	select_default_macro_book(13)
end

function set_macro_page(set,book)
	if not tonumber(set) then
		add_to_chat(123,'Error setting macro page: Set is not a valid number ('..tostring(set)..').')
		return
	end
	if set < 1 or set > 10 then
		add_to_chat(123,'Error setting macro page: Macro set ('..tostring(set)..') must be between 1 and 10.')
		return
	end

	if book then
		if not tonumber(book) then
			add_to_chat(123,'Error setting macro page: book is not a valid number ('..tostring(book)..').')
			return
		end
		if book < 1 or book > 20 then
			add_to_chat(123,'Error setting macro page: Macro book ('..tostring(book)..') must be between 1 and 20.')
			return
		end
		send_command('@input /macro book '..tostring(book)..';wait .1;input /macro set '..tostring(set))
	else
		send_command('@input /macro set '..tostring(set))
	end
end

function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'WAR' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'DNC' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 13)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 13)
	else
		set_macro_page(1, 13)
	end
end