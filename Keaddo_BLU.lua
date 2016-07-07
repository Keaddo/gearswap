--[[***************************************************************************
    Change Log:
		06/04/2016 - First edit/preparation, thanks to the maker of the original
	
        08/23/2015  - Changed naming magic haste capped and uncapped for DW
        07/21/2015  - Removed Realmrazer gear set

        07/03/2015  - Added June spells to spall map
                    - Updated AzureSet spells

        03/09/2015  - Adjusted how attack speed gear is changed based on
                        accuracy needs, this should allow you to stay as close
                        to delay cap as possible no matter accuracy level and
                        marches
                    - Renamed DelayCap to "Magic Haste Uncapped" and
                        "Magic Haste Uncapped" to better clarify what they are
                    - Lowered the TP threshold from 749 to 349 in the
                        'tp change' to allow for quicker event actions after
                        engaging target

        03/07/2015  - Adjusted the relaxed_play_mode() logic

        03/02/2015  - Removed Waltz gear and rule to equip it

        03/01/2015  - Adjusted Normal and DelayCap set gear
                    - Simplified the Augments listed to just one, used the one
                        that was the main defining augment for the item

        02/28/2015  - Moved Final Sting to AGI and Self Destruct to Nuke
                    - Removed MAXHP and combined the additional HP+ gear used
                        for White Wind to HealingMAXHP
                    - Added NukeLightAff and Moved: Diffusion Ray, Rail Cannon,
                        Retinal Glare to use Weather. Ring due to the +10 Light
                        Affinity when nuking

        02/20/2015  - Convert all instances of buffactive to check_buffs()
                    - Convert all instances of cancel_buff number ID to
                        proper name
                    - With the aid of Arcon moved recast timer logic to three
                        "do" statements to handle both spells and job abilities
                        using spell name instead of the recast ID

        02/01/2015  - Changed sub sword to Usonmunku

        01/17/2015  - Removed WARSERK help text, refined commenting
                    - Refined how recast time check is handled, added new
                        function to allow multiple checks at once

        01/05/2015  - Changed spell.prefix == '/jobability' and
                        spell.prefix == '/weaponskill' to:
                        sets.precast.JA[spell.name]
                        sets.precast.WS[spell.name]

        01/03/2015  - New function: relaxed_play_mode(), this acts like a
                        miniature bot allowing job ability, spell casting, and
                        weaponskill use based on rules set
                        the two new register_event: tp change and time change
                        go along with this new function
                    - Added new varible toggle: auto_action, used to turn on
                        and off the call function for relaxed_play_mode()
                    - Added two new AutoExec style events that work with new
                        relaxed_play_mode() function:
                        tp change: will call on any tp change above 749 tp
                        time change: Moved Hasso activation to here, this will
                            reapply while still engaged during long fights
                            since tp change only parses when you gain or loss
                            tp a time check was added if sitting at 3000 tp

        12/31/2014  - Changed check_buff to check_buffs
                    - Moddified the spell set check introduced in 12/11/2014
                        update to work as a function check: check_set_spells

        12/28/2014  - Ygnas's Resolve +1 when in Reives:
                        Added gear set for item and two rules to check of it
                        locations of rules are gear_sets() idle check and
                        during weaponskill set check
                    - Added Weather. Ring to appropriate sets

        12/11/2014  - Added AzureSets spellsets to comment section to give an
                        idea of what sets on could use
                    - Dual Wield IV check added, if all spells are set along
                        with Haste II and one March then will use
                        Windbuffet Belt +1

        12/09/2014  - Added spells to map: Atra. Libations, Molting Plumage,
                        Nectarous Deluge, Sweeping Gouge
                    - Added set: SkillDarkAff for the spell Atra. Libations
                    - Adjusted set names: MagicAcc is now MagicACC
                    - Removed AutoExe style event that was added 11/07/2014,
                        kept the gear_change_ok check.

        11/07/2014  - Added SphereRefresh set and moved Mekosu. Harness to that
                        set, Idle refresh body is now Hagondes Coat +1
                    - Added party count check for the set mentioned above
                    - Added new AutoExe style event:
                        When 100% MP is reached while idle gear will change
                        from refresh to more DT- pieces
                    - Added new gear_change_ok, this is used in new event to
                        allow gear to change but only if no action is taking
                        place; this also allows for no gear changing if you are
                        in the middle of casting but your status changes
                        This usually happens when casting but the enemy dies
                        forcing a gear change
                    - Changed else to elseif in gear_modes() when checking
                        Idle status, Idle gear shouldn't try and change when
                        Dead/Zoning
                    - Changed variable naming from PascalCase to snake_case
                        to reflect the internal naming conversions
                            NOTE: Your ingame macro toggles for the various
                            modes will need renaming

        11/04/2014  - Refined most spells that use wildcard expression to
                        startswith

        11/02/2014  - Refined count_msg_mecisto

        10/25/2014  - Removed pretarget() and re-added slot_disabling()
                    - Added a counter to display a reminder message that
                        back slot is disabled when using Mecistopins mantle

        10/24/2014  - Moved comments into their own functions to facilitate
                        better readability and cleaner look when folding code
                    - Moved all maps to new function called get_maps()

        10/23/2014  - Adjusted Berserk/Warcry automation by adding
                        a check_buff() function and spell map
                        WARSERK comment tag added to serve as a link between
                        the sections

        10/22/2014  - Adopted 80 character width for right margin and began
                        reworking all areas


    <?xml version="1.1" ?>
    <settings>
        <global>
            <language>English</language>
            <spellsets>
            <dps1200>
                <slot01>tail slap</slot01>
                <slot02>paralyzing triad</slot02>
                <slot03>empty thrash</slot03>
                <slot04>barbed crescent</slot04>
                <slot05>white wind</slot05>
                <slot06>occultation</slot06>
                <slot07>sickle slash</slot07>
                <slot08>diffusion ray</slot08>
                <slot09>sudden lunge</slot09>
                <slot10>nat. meditation</slot10>
                <slot11>thrashing assault</slot11>
                <slot12>subduction</slot12>
                <slot13>delta thrust</slot13>
                <slot14>heavy strike</slot14>
                <slot15>fantod</slot15>
                <slot16>barrier tusk</slot16>
                <slot17>erratic flutter</slot17>
                <slot18>sinker drill</slot18>
                <slot19>dream flower</slot19>
                <slot20>cocoon</slot20>
            </dps1200>
            <mageybase>
                <slot01>retinal glare</slot01>
                <slot02>tenebral crush</slot02>
                <slot03>spectral floe</slot03>
                <slot04>barbed crescent</slot04>
                <slot05>magic fruit</slot05>
                <slot06>occultation</slot06>
                <slot07>entomb</slot07>
                <slot08>diamondhide</slot08>
                <slot09>blinding fulgor</slot09>
                <slot10>sound blast</slot10>
                <slot11>magic hammer</slot11>
                <slot12>subduction</slot12>
                <slot13>delta thrust</slot13>
                <slot14>memento mori</slot14>
                <slot15>cursed sphere</slot15>
                <slot16>barrier tusk</slot16>
                <slot17>erratic flutter</slot17>
                <slot18>dream flower</slot18>
                <slot19>cocoon</slot19>
            </mageybase>
            <tenzen>
                <slot01>quad. continuum</slot01>
                <slot02>delta thrust</slot02>
                <slot03>barbed crescent</slot03>
                <slot04>empty thrash</slot04>
                <slot05>heavy strike</slot05>
                <slot06>thrashing assault</slot06>
                <slot07>sudden lunge</slot07>
                <slot08>barrier tusk</slot08>
                <slot09>cocoon</slot09>
                <slot10>battery charge</slot10>
                <slot11>nat. meditation</slot11>
                <slot12>erratic flutter</slot12>
                <slot13>magic fruit</slot13>
                <slot14>molting plumage</slot14>
                <slot15>blazing bound</slot15>
                <slot16>fantod</slot16>
                <slot17>diffusion ray</slot17>
                <slot18>silent storm</slot18>
                <slot19>dream flower</slot19>
                <slot20>occultation</slot20>
            </tenzen>			
            </spellsets>
        </global>
    </settings>




    Recommended in game macros to use:
            Macro Syntax             States
    -----------------------|----------------------
    /con gs c auto_action  |  Off / On
    /con gs c cure         |  Dynamic Cure macro - Will use currently set spell
    /con gs c dt_mode      |  None / Active
    /con gs c tp_mode      |  Normal / Accuracy Mid / Accuracy High
    /con gs c weapon_combo |  Tizona / Medeina


    TIMERS PLUGIN: File includes custom timers:
          Type                 Location
    ------------------|--------------------------
    Mythic Aftermath  |  buff_change / aftercast
    Dream Flower      |  aftercast
    Transcendency     |  buff_change
    Weakness          |  buff_change


    F10 is bound as a weaponskill macro, I use a controller and remap the R1
    button to F10 for fast weaponskills
*****************************************************************************]]


function get_sets()
    -- Spell maps are moved to their own function to assit in easier navigation
    get_maps()

    windower.send_command('input /macro book 1; wait .1; input /macro set 1')
    windower.send_command('input /echo [ Job Changed to BLU ]')
    windower.send_command('bind ^1 gs c tryweaponskill')
    windower.send_command('bind f9 gs c tp_mode')
    windower.send_command('bind f10 gs c dt_mode')
    windower.send_command('bind f12 gs c weapon_combo')
	windower.send_command('bind !` gs c cure')
 --   windower.send_command('input /blockhelp on')

	function file_unload()
	
         send_command('unbind !f9')
        send_command('unbind !f10')
        send_command('unbind ^1')
        send_command('unbind !f12')
		send_command('unbind !`')
		
		end
		
	Cities = S{
                        "Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
                        "Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
                        "Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
                        "Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
                        "Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
                        "Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Tavnazia"}			
						

    windower.register_event('tp change', function(new, old)
        if new > 349
                and auto_action == 'On'
                and player.status == 'Engaged' then
            relaxed_play_mode()
        end
    end)

    windower.register_event('time change', function(time)
        if player.tp == 3000
                and auto_action == 'On'
                and player.status == 'Engaged' then
            relaxed_play_mode()
        end
    end)
	
	-- TREASURE HUNTER
    windower.register_event('tp change', function(new, old)
	    if player.status == 'Engaged' then
        if TH_ind == 1 then
            if EngagedTP > -1 and player.tp > (EngagedTP+80) and player.status == 'Engaged' then
                windower.send_command('gs c TPchange')
            end
        end
    end
	end)

	
	-- local binds
	    cdc_back = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Crit.hit rate+10',}}
		tp_back = { name="Rosmerta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
		cdc_hands = { name="Herculean Gloves", augments={'Crit.hit rate+4','DEX+8','Accuracy+13','Attack+14',}}
		exp_hands = { name="Herculean Gloves", augments={'Accuracy+23 Attack+23','Crit.hit rate+1','STR+10','Attack+5',}}
		dt_head = { name="Herculean Helm", augments={'Accuracy+3 Attack+3','Phys. dmg. taken -4%','Accuracy+9','Attack+5',}}
		dt_hands = { name="Herculean Gloves", augments={'AGI+8','Accuracy+9','Damage taken -3%',}}
		dt_feet = { name="Herculean Boots", augments={'STR+14','Rng.Atk.+20','Damage taken-4%',}}
		th_hands = { name="Herculean Gloves", augments={'Accuracy+15','Pet: STR+7','"Treasure Hunter"+2','Accuracy+17 Attack+17',}}
		th_feet = { name="Herculean Boots", augments={'MND+8','"Mag.Atk.Bns."+10','"Treasure Hunter"+2','Accuracy+10 Attack+10','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}

    -- Start defining actual gear sets to be used below --
    -- WEAPON TYPES --
    sets.weapon = {}
    sets.weapon.Tizona = {
        main="Tizona",
        sub="Almace"}
		
	sets.weapon.Almace = {
		main="Almace",
		sub="Colada"}
		
    sets.weapon.Medeina = {
        main="Vampirism",
        sub="Vampirism"}
		

    -- MISCELLANEOUS SETS --
    sets.misc = {}
    sets.misc.DT = {}
    sets.misc.DT.None = {}
    sets.misc.DT.Active = {
			ammo="Staunch Tathlum",
			head="Dampening Tam",
			neck="Loricate Torque +1", 
			ear1="Genmei Earring", 
			ear2="Ethereal Earring",
			body="Emet Harness",
			hands=dt_hands,
			ring1="Defending Ring",
			ring2="Warden's Ring",
			back="Solemnity Cape",
			waist="Flume Belt +1",
			legs="Herculean Trousers",
			feet=dt_feet
			}

    sets.misc['Burst Affinity'] = {
        feet="Hashi. Basmak"}

    sets.misc['Chain Affinity'] = {
        feet="Assim. Charuqs"}

    sets.misc.Efflux = {
        head="Hashishin Kavuk",
        legs="Hashishin Tayt"}

    sets.misc.Diffusion = {
        feet="Luhlaza Charuqs"}

    sets.misc.Movement = {
        legs="Carmine Cuisses +1"}

    sets.misc.Learn = {
        ammo="Mavi Tathlum",
        head="Luhlaza Keffiyeh",
        body="Assim. Jubbah +1",
        hands="Magus Bauzbands",
        back="Cornflower Cape",
        legs="Hashishin Tayt",
        feet="Luhlaza Charuqs"}

    sets.misc.Cape_Obi = {
        back="Twilight Cape",
        waist="Hachirin-no-Obi"}

    sets.misc.Reive = {
        neck="Ygnas's Resolve +1"}


    -- PRECAST SETS --
    sets.precast = {}
    sets.precast.JA = {}
    sets.precast.JA['Azure Lore'] = {
        hands="Luh. Bazubands +1"}

    sets.precast.WS = {}
    sets.precast.WS['Chant du Cygne'] = {
    head="Adhemar Bonnet",
    body="Abnoba Kaftan",
    hands=cdc_hands,
    legs="Samnuha Tights",
    feet="Thereoid Greaves",
    neck="Fotia Gorget",
    waist="Fotia Belt",
    left_ear="Moonshade Earring",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Begrudging Ring",
    back=cdc_back}

    sets.precast.WS['Expiacion'] = {
		ammo="Amar Cluster",
		head="Lilitu Headpiece",
		neck="Caro Necklace",
		ear1="Moonshade earring",
		ear2="Ishvara earring",
		body="Adhemar Jacket",
		hands=exp_hands,
		ring1="Epona's ring",
		ring2="Rufescent ring",
		back=cdc_back,
		waist="Prosilio Belt +1",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'STR+14','Rng. Atk.+20','Damage taken -4%',}}
		}

    sets.precast.WS['Requiescat'] = {
		head="Carmine Mask",
		body="Adhemar Jacket",
		hands="Carmine Finger Gauntlets",
		legs="Carmine Cuisses +1",
		feet="Carmine Greaves",
		neck="Fotia Gorget",
		waist="Fotia Belt",
		left_ear="Moonshade Earring",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Rufescent Ring",
		back="Bleating Mantle",
	}

    sets.precast.WS['Sanguine Blade'] = {
		ammo="Pemphredo Tathlum",
		head="Herculean Helm",
		body="Amalric Doublet",
		hands="Amalric Gages",
		legs="Amalric Slops",
		feet="Amalric Nails",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Friomisi Earring",
		right_ear="Hecate's Earring",
		left_ring="Shiva Ring",
		right_ring="Shiva Ring +1",
		back="Cornflower Cape"
	}

    sets.precast.WS['Savage Blade'] = set_combine(sets.precast.WS['Expiacion'], {})

    sets.precast.FastCast = {
		ammo="Impatiens",
		head="Amalric Coif",
		body="Vrikodara Jupon",
		hands="Leyline Gloves",
		legs="Psycloth Lappas",
		feet="Amalric Nails",
		neck="Voltsurge Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Loquac. Earring",
		left_ring="Prolix Ring",
		right_ring="Weatherspoon Ring",
		back="Swith Cape"
		}

    sets.precast.FastCast.BlueMagic =
            set_combine(sets.precast.FastCast, {
			body="Hashishin Mintan"
	})


    -- MIDCAST SETS --
    sets.midcast = {}
    sets.midcast.BlueMagic = {}
    sets.midcast.BlueMagic.Skill = {
		ammo="Mavi Tathlum",
		head="Luhlaza Keffiyeh",
		body="Assimilator's Jubbah +1",
		hands="Rawhide Gloves",
		feet="Luhlaza Charuqs",
		back="Cornflower Cape"}

    sets.midcast.BlueMagic.SkillDarkAff =
            set_combine(sets.midcast.BlueMagic.Skill, {
        head="Pixie Hairpin +1",
        lring="Evanescence Ring"})

    sets.midcast.BlueMagic.STR =
            set_combine(sets.midcast.BlueMagic.Skill, {
		ammo="Amar Cluster",
		head="Adhemar Bonnet",
		body="Adhemar Jacket",
		hands=exp_hands,
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'STR+14','Rng. Atk.+20','Damage taken -4%',}},
		neck="Caro Necklace",
		waist="Prosilio Belt +1",
		left_ear="Bladeborn Earring",
		right_ear="Ethereal Earring",
		left_ring="Pyrosoul Ring",
		right_ring="Apate Ring",
		back="Cornflower cape",})

    sets.midcast.BlueMagic.DEX =
            set_combine(sets.midcast.BlueMagic.STR, {
        })

    sets.midcast.BlueMagic.VIT =
            set_combine(sets.midcast.BlueMagic.STR, {
        })

    sets.midcast.BlueMagic.AGI =
            set_combine(sets.midcast.BlueMagic.STR, {
        })

    sets.midcast.BlueMagic.MND =
            set_combine(sets.midcast.BlueMagic.STR, {
        ammo="Quartz Tathlum +1",
        neck="Phalaina Locket",
        hands="Luh. Bazubands +1",
        rring="Levia. Ring +1",
        legs="Hashishin Tayt +1"})

    sets.midcast.BlueMagic.INT =
            set_combine(sets.midcast.BlueMagic.STR, {
		ammo="Pemphredo Tathlum",
		head="Herculean Helm",
		body="Amalric Doublet",
		hands="Amalric Gages",
		legs="Amalric Slops",
		feet="Amalric Nails",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring",
		right_ring="Shiva Ring +1",
		back="Cornflower cape",
        })

    sets.midcast.BlueMagic.CHR =
            set_combine(sets.midcast.BlueMagic.STR, {
        })

    sets.midcast.BlueMagic.PhysACC =
            set_combine(sets.midcast.BlueMagic.STR, {
        ammo="Hasty Pinion +1",
        lear="Dignitary Earring",
        body="Mekosu. Harness"})

    sets.midcast.BlueMagic.MagicACC =
            set_combine(sets.midcast.BlueMagic.Skill, {
		ammo="Pemphredo Tathlum",
		head="Amalric Coif",
		body="Amalric Doublet",
		hands="Leyline Gloves",
		legs="Psycloth Lappas",
		feet="Amalric Nails",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Enchntr. Earring +1",
		right_ear="Dignitary Earring",
		left_ring="Metamorph Ring",
		right_ring="Weatherspoon Ring",
		back="Cornflower cape"})

    sets.midcast.BlueMagic.PhysMagicACC =
            set_combine(sets.midcast.BlueMagic.MagicACC, {
        neck="Combatant's Torque",
        rear="Dignitary Earring",
        lear="Cessance Earring",
        body="Mekosu. Harness",
        hands="Leyline Gloves",
        waist="Olseni Belt"})

    sets.midcast.BlueMagic.Nuke = {
		ammo="Pemphredo Tathlum",
		head="Herculean Helm",
		body="Amalric Doublet",
		hands="Amalric Gages",
		legs="Amalric Slops",
		feet="Amalric Nails",
		neck="Sanctity Necklace",
		waist="Eschan Stone",
		left_ear="Hecate's Earring",
		right_ear="Friomisi Earring",
		left_ring="Shiva Ring",
		right_ring="Shiva Ring +1",
		back="Cornflower cape",	
		}

    sets.midcast.BlueMagic.NukeDarkAff =
            set_combine(sets.midcast.BlueMagic.Nuke, {
        head="Pixie Hairpin +1",
    })

    sets.midcast.BlueMagic.NukeLightAff =
            set_combine(sets.midcast.BlueMagic.Nuke, {
        rring="Weather. Ring"})

    sets.midcast.BlueMagic.Breath =
            set_combine(sets.midcast.BlueMagic.Nuke, {
        ammo="Mavi Tathlum",
        head="Luh. Keffiyeh +1"})

    sets.midcast.BlueMagic.Healing = {
		ammo="Hydrocera",
		head="Amalric Coif",
		body="Vrikodara Jupon",
		hands="Telchine Gloves",
		legs="Psycloth Lappas",
		feet="Medium's Sabots",
		neck="Phalaina Locket",
		waist="Pythia Sash",
		left_ear="Mendi. Earring",
		right_ear="Lifestorm Earring",
		left_ring="Levia. Ring",
		right_ring="Levia. Ring",
		back="Solemnity Cape"
	}

    sets.midcast.BlueMagic.Healing.Self =
            set_combine(sets.midcast.BlueMagic.Healing, {
        lring="Kunaji Ring",
        rring='Asklepian Ring',
        waist="Gishdubar Sash"})

    sets.midcast.BlueMagic.HealingMAXHP =
            set_combine(sets.midcast.BlueMagic.Healing.Self, {
        ammo="Egoist's Tathlum",
        head="Rawhide Mask",
        lear="Odnowa Earring +1",
        rear="Etiolation Earring",
        lring="Meridian Ring",
        rring="K'ayres Ring",
        back="Xucau Mantle",
        waist="Oneiros Belt"})

    sets.midcast.BlueMagic.Recast = {
		hands="Hashishin Bazubands"}


    -- AFTERCAST SETS --
    -- Labelled to show either TP or idle --
    --[[ After looking into different ways to set_combine the different levels
            of Accuracy and Uncapped/Capped Magic Haste it seemed cleaner and
            easier to hardcode each set
            There is a fair amount of redundancy however this way should be
            easier on the end user ]]
    sets.TP = {}
    sets.TP['Dual Wield'] = {}
    sets.TP['Multiattack'] = {}
    sets.TP['Dual Wield']['Normal'] = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'STR+9','Accuracy+20','Triple Atk.+4',}},
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Suppanomimi",
		right_ear="Eabani Earring",
		left_ring="Epona's Ring",
		right_ring="Petrov Ring",
		back=tp_back
	}

    sets.TP['Multiattack']['Normal'] = {
		ammo="Ginsen",
		head="Adhemar Bonnet",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'STR+9','Accuracy+20','Triple Atk.+4',}},
		neck="Asperity Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Suppanomimi",
		right_ear="Brutal Earring",
		left_ring="Epona's Ring",
		right_ring="Petrov Ring",
		back=tp_back
		}

    sets.TP['Dual Wield']['Accuracy Mid'] = {
		ammo="Amar Cluster",
	    head="Dampening Tam",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
		neck="Lissome Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Suppanomimi",
		right_ear="Eabani Earring",
		left_ring="Cacoethic Ring +1",
		right_ring="Petrov Ring",
		back=tp_back
		}

    sets.TP['Multiattack']['Accuracy Mid'] = {
		ammo="Amar Cluster",
	    head="Dampening Tam",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Samnuha Tights",
		feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
		neck="Lissome Necklace",
		waist="Windbuffet Belt +1",
		left_ear="Suppanomimi",
		right_ear="Brutal Earring",
		left_ring="Cacoethic Ring +1",
		right_ring="Petrov Ring",
		back=tp_back
		}

    sets.TP['Dual Wield']['Accuracy High'] = {
		ammo="Amar Cluster",
	    head="Dampening Tam",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Carmine Cuisses +1",
		feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
		neck="Sanctity Necklace",
		waist="Olseni Belt",
		left_ear="Cessance Earring",
		right_ear="Dignitary Earring",
		left_ring="Cacoethic Ring +1",
		right_ring="Petrov Ring",
		back=tp_back
		}

    sets.TP['Multiattack']['Accuracy High'] = {
		ammo="Amar Cluster",
	    head="Dampening Tam",
		body="Adhemar Jacket",
		hands="Adhemar Wristbands",
		legs="Carmine Cuisses +1",
		feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
		neck="Sanctity Necklace",
		waist="Olseni Belt",
		left_ear="Cessance Earring",
		right_ear="Dignitary Earring",
		left_ring="Cacoethic Ring +1",
		right_ring="Petrov Ring",
		back=tp_back
		}

	sets.TH = set_combine(sets.TP['Multiattack']['Normal'],{
		hands={ name="Herculean Gloves", augments={'Accuracy+15','Pet: STR+7','"Treasure Hunter"+2','Accuracy+17 Attack+17',}},
		feet={ name="Herculean Boots", augments={'MND+8','"Mag.Atk.Bns."+10','"Treasure Hunter"+2','Accuracy+10 Attack+10','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}
		})
	sets.TH.spell = set_combine(sets.midcast.BlueMagic.Nuke,{
		hands = th_hands,
		feet = th_feet})
    TH_ind = 1
	
    sets.idle = {
			ammo="Staunch Tathlum",
			head="Rawhide Mask",
			neck="Sanctity Necklace", 
			ear1="Infused Earring", 
			ear2="Ethereal Earring",
			body="Vrikodara Jupon",
			hands="Herculean Gloves",
			ring1="Sheltered Ring",
			ring2="Paguroidea ring",
			back="Solemnity Cape",
			waist="Flume Belt +1",
			legs="Carmine Cuisses +1",
			feet=dt_feet
			}

    sets.idle.SphereRefresh = {
        body="Mekosu. Harness"}

    sets.idle.under_50mpp = {
        waist="Fucho-no-Obi"}
		
		sets.Town = set_combine(sets.Idle,{
		body="Abnoba Kaftan",
		ear1="Genmei Earring",
		neck="Loricate Torque +1",
		ring1="Defending Ring",
		ring2="Weatherspoon Ring",
		waist="Windbuffet Belt +1",
		back=cdc_back
		})

    -- VARIABLES --
    auto_action = 'Off'
    count_msg_mecisto = 0
    dt_mode = 'None'
    gear_change_ok = true
    shadow_type = 'None'
    tp_mode = 'Normal'
    weapon_combo = 'Tizona'
end

function get_maps()
    -- Map for Aftermath times
    mythic_aftermath_times = {
        ["Aftermath: Lv.1"]=90,
        ["Aftermath: Lv.2"]=270,
        ["Aftermath: Lv.3"]=180}

    -- Map for auto activation of Berserk/Warcry based
    -- on Weaponskills listed
    berserk_warcry_automation = S{
        'Chant du Cygne',
        'Expiacion',
        'Realmrazer',
        'Requiescat'}

    -- Maps Blue Mage spell Stats per spell for the midcast function,
    -- Currently 178 spells mapped, can change mapping as needed
    modifiers = {}
    -- PHYSICAL MODIFIERS
    modifiers.STR = S{
        'Battle Dance',
        'Bloodrake',
        'Death Scissors',
        'Dimensional Death',
        'Empty Thrash',
        'Quadrastrike',
        'Sinker Drill',
        'Smite of Rage',
        'Spinal Cleave',
        'Uppercut',
        'Vertical Cleave'}
    modifiers.DEX = S{
        'Amorphic Spikes',
        'Asuran Claws',
        'Barbed Crescent',
        'Claw Cyclone',
        'Disseverment',
        'Foot Kick',
        'Frenetic Rip',
        'Goblin Rush',
        'Hysteric Barrage',
        'Paralyzing Triad',
        'Seedspray',
        'Sickle Slash',
        'Terror Touch',
        'Thrashing Assault',
        'Vanity Dive'}
    modifiers.VIT = S{
        'Body Slam',
        'Cannonball',
        'Delta Thrust',
        'Glutinous Dart',
        'Grand Slam',
        'Power Attack',
        'Quad. Continuum',
        'Saurian Slide',
        'Sprout Smack',
        'Sub-zero Smash'}
    modifiers.AGI = S{
        'Benthic Typhoon',
        'Feather Storm',
        'Final Sting',
        'Helldive',
        'Hydro Shot',
        'Jet Stream',
        'Pinecone Bomb',
        'Spiral Spin',
        'Wild Oats'}
    modifiers.INT = S{
        'Mandibular Bite',
        'Queasyshroom'}
    modifiers.MND = S{
        'Ram Charge',
        'Screwdriver'}
    modifiers.CHR = S{
        'Bludgeon'}
    modifiers.PhysACC = S{
        'Heavy Strike'}
    modifiers.PhysMagicACC = S{
        'Bilgestorm',
        'Frypan',
        'Head Butt',
        'Sudden Lunge',
        'Sweeping Gouge',
        'Tail Slap',
        'Whirl of Rage'}

    -- MAGICAL MODIFIERS
    modifiers.MagicACC = S{
        '1000 Needles',
        'Absolute Terror',
        'Actinic Burst',
        'Auroral Drape',
        'Awful Eye',
        'Blank Gaze',
        'Blistering Roar',
        'Blitzstrahl',
        'Chaotic Eye',
        'Cimicine Discharge',
        'Cold Wave',
        'Corrosive Ooze',
        'Demoralizing Roar',
        'Dream Flower',
        'Enervation',
        'Feather Tickle',
        'Filamented Hold',
        'Frightful Roar',
        'Geist Wall',
        'Infrasonics',
        'Jettatura',
        'Light of Penance',
        'Lowing',
        'Mind Blast',
        'Mortal Ray',
        'Mysterious Light',
        'Polar Roar',
        'Reaving Wind',
        'Sandspin',
        'Sandspray',
        'Sheep Song',
        'Soporific',
        'Sound Blast',
        'Stinking Gas',
        'Temporal Shift',
        'Tourbillion',
        'Venom Shell',
        'Voracious Trunk',
        'Yawn'}
    modifiers.Nuke = S{
        'Acrid Stream',
        'Anvil Lightning',
        'Blastbomb',
        'Blazing Bound',
        'Bomb Toss',
        'Charged Whisker',
        'Crashing Thunder',
        'Cursed Sphere',
        'Droning Whirlwind',
        'Embalming Earth',
        'Entomb',
        'Firespit',
        'Foul Waters',
        'Gates of Hades',
        'Ice Break',
        'Leafstorm',
        'Maelstrom',
        'Magic Hammer',
        'Molting Plumage',
        'Nectarous Deluge',
        'Regurgitation',
        'Rending Deluge',
        'Scouring Spate',
        'Searing Tempest',
        'Self-Destruct',
        'Silent Storm',
        'Spectral Floe',
        'Subduction',
        'Tempest Upheaval',
        'Thermal Pulse',
        'Thunderbolt',
        'Uproot',
        'Water Bomb'}
    modifiers.NukeDarkAff = S{
        'Blood Drain',
        'Blood Saber',
        'Dark Orb',
        'Death Ray',
        'Digest',
        'Evryone. Grudge',
        'Eyes On Me',
        'MP Drainkiss',
        'Osmosis',
        'Palling Salvo',
        'Tenebral Crush'}
    modifiers.NukeLightAff = S{
        'Blinding Fulgor',
        'Diffusion Ray',
        'Rail Cannon',
        'Retinal Glare'}
    modifiers.Breath = S{
        'Bad Breath',
        'Flying Hip Press',
        'Frost Breath',
        'Heat Breath',
        'Hecatomb Wave',
        'Magnetite Cloud',
        'Poison Breath',
        'Radiant Breath',
        'Thunder Breath',
        'Vapor Spray',
        'Wind Breath'}
    modifiers.Skill = S{
        'Barrier Tusk',
        'Diamondhide',
        'Magic Barrier',
        'Metallic Body',
        'Occultation',
        'Plasma Charge',
        'Pyric Bulwark',
        'Reactor Cool'}
    modifiers.SkillDarkAff = S{
        'Atra. Libations'}
    modifiers.Healing = S{
        'Healing Breeze',
        'Magic Fruit',
        'Plenilune Embrace',
        'Pollen',
        'Restoral',
        'Wild Carrot'}
    modifiers.HealingMAXHP = S{
        'White Wind'}
    modifiers.Recast = S{
        'Amplification',
        'Animating Wail',
        'Battery Charge',
        'Carcharian Verve',
        'Cocoon',
        'Erratic Flutter',
        'Exuviation',
        'Fantod',
        'Feather Barrier',
        'Harden Shell',
        'Memento Mori',
        'Mighty Guard',
        'Nat. Meditation',
        'Orcish Counterstance',
        'Refueling',
        'Regeneration',
        'Saline Coat',
        'Triumphant Roar',
        'Warm-Up',
        'Winds of Promy.',
        'Zephyr Mantle'}

    physical = S{
        'STR',
        'DEX',
        'VIT',
        'AGI',
        'INT',
        'MND',
        'CHR',
        'PhysACC',
        'PhysMagicACC'}
    magical = S{
        'MagicACC',
        'Nuke',
        'NukeDarkAff',
        'NukeLightAff',
        'Breath',
        'Skill',
        'SkillDarkAff',
        'Healing',
        'HealingMAXHP',
        'Recast'}
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

function self_command(str)
    -- Use an in game macro "/con gs c auto_action" to toggle bot Off and On
    if str == 'auto_action' then
        if auto_action == 'Off' then
            auto_action = 'On'
        else
            auto_action  = 'Off'
        end
        windower.add_to_chat(8,'Si mangia? '..auto_action)

    --[[ Use an in game macro "/con gs c cure" to dynamically use currently set
            cure spell
            The list below is limited to the most used spells, can expand list
            as needed
            Please be aware if multiple cures are set the first one listed will
            be the one used so plan accordingly ]]
    elseif str == 'cure' then
        if check_set_spells('Magic Fruit') then
            if party.count > 1 then
                windower.send_command('input /ma "Magic Fruit" <stpc>')
            else
                windower.send_command('input /ma "Magic Fruit" <me>')
            end
        elseif check_set_spells('Plenilune Embrace') then
            if party.count > 1 then
                windower.send_command('input /ma "Plenilune Embrace" <stpc>')
            else
                windower.send_command('input /ma "Plenilune Embrace" <me>')
            end
        elseif check_set_spells('Restoral') then
            windower.send_command('restoral')
        elseif check_set_spells('White Wind') then
            windower.send_command('white wind')
        else
            if player.sub_job == 'RDM' then
                 if party.count > 1 then
                    windower.send_command('input /ma "Cure IV" <stpc>')
                else
                    windower.send_command('input /ma "Cure IV" <me>')
                end
            else
                windower.add_to_chat(8,'WARNING: No Cure spell is'
                    ..' currently set!')
            end
        end

    -- Use an in game macro "/con gs c dt_mode" to toggle Damage Taken set
    elseif str == 'dt_mode' then
        if dt_mode == 'None' then
            dt_mode = 'Active'
        else
            dt_mode = 'None'
        end
        windower.add_to_chat(8,'Damage taken set to: '..dt_mode)
        gear_modes()

    -- Use an in game macro "/con gs c tp_mode"
    -- to cycle between Normal and Accuracy sets
    elseif str == 'tp_mode' then
        if tp_mode == 'Normal' then
            tp_mode = 'Accuracy Mid'
        elseif tp_mode == 'Accuracy Mid' then
            tp_mode = 'Accuracy High'
        else
            tp_mode = 'Normal'
        end
        windower.add_to_chat(8,'Engaged melee set mode: '..tp_mode)
        gear_modes()

    -- Will call function when F10 in pressed, initial bind is performed near
    -- the top of this file
    elseif str == 'tryweaponskill' then
        try_weaponskill()
		
    -- Use an in game macro "/con gs c weapon_combo" to set weapon preference,
    -- Swords or Clubs. Useful when enemy uses TP move to remove them
    elseif str == 'weapon_combo' then
        if weapon_combo == 'Tizona' then
            weapon_combo = 'Almace'
			windower.send_command('equip main "";wait 1;equip main Almace;wait 1;equip sub Colada')
		elseif weapon_combo == 'Almace' then
			weapon_combo = 'Medeina'
			windower.send_command('equip main "";wait 1;equip main Vampirism;wait 1;equip sub Vampirism')
        else
            weapon_combo = 'Tizona'
			windower.send_command('equip main "";wait 1;equip main Tizona;wait 1;equip sub Almace')
        end
        windower.add_to_chat(8,'Weapon type set to: '..weapon_combo)
	--	equip(sets.weapon[weapon_combo])
    end
	
	-- Treasure hunter tag
    if str == "TPchange" then
        EngagedTP = -1
        gear_modes()
    elseif str == "TH" then
        if TH_ind == 0 then TH_ind = 1 
            windower.add_to_chat(8,'----Auto TH swaps activated.----')
        else TH_ind = 0 
            windower.add_to_chat(8,'----Auto TH swaps disabled.----')
        end
    end
	
end

function gear_modes()
    -- User created bridge for aftercast and status_change functions
    -- Sequential gear sets used to easily allow for changing player needs
    slot_disabling()

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
        equip(sets.TP[attack_preference][tp_mode], sets.misc.DT[dt_mode])
    elseif player.status == 'Idle' then
        equip(sets.idle, sets.misc.DT[dt_mode], sets.misc.Movement)
        if dt_mode == 'None' then
            --print(party.count)
--            if party.count > 1 then
 --               equip(sets.idle.SphereRefresh)
 --           end
            if player.mpp < 50 then
                equip(sets.idle.under_50mpp)
            end
            if check_buffs('Reive Mark') then
                equip(sets.misc.Reive)
            end
        end
    end

   -- Will inform you if no weapon is equiped and re-equip once able
    if player.equipment.main == 'empty' then
        equip(sets.weapon[weapon_combo])
        windower.add_to_chat(8,'No Weapon, trying to re-equip: '..weapon_combo)
    end
end

function relaxed_play_mode()
    -- This can be used as a mini bot to automate actions
    if not midaction() then
        if player.hpp < 50
                and not check_buffs('silence', 'mute')
                and check_recasts(s('White Wind')) then
            windower.send_command('white wind')

     --   elseif player.target.hpp < 40
     --           and player.target.hpp > 15
     --           and not check_buffs('silence', 'mute')
     --           and player.target.distance < 5 then
     --       windower.send_command('sinker drill')

        elseif not check_buffs('Haste')
                and not check_buffs('silence', 'mute')
                and check_recasts(s('Erratic Flutter')) then
            windower.send_command('erratic flutter')

     --   elseif not check_buffs('Attack Boost')
       --         and not check_buffs('silence', 'mute')
         --       and check_recasts(s('Nat. Meditation')) then
           -- windower.send_command('nat. meditation')

        elseif player.equipment.main == 'Tizona'
                and not check_buffs('Aftermath: Lv.3')
                and player.tp < 3000 then
            return

        elseif player.equipment.main == 'Tizona'
                and not check_buffs('Aftermath: Lv.3')
                and player.target.hpp > 40
                and player.tp == 3000 then
            windower.send_command('expiacion')

        elseif player.tp > 999
     --           and player.target.hpp > 40
                and player.target.distance < 5 then
            windower.send_command('chant du cygne')
        end
    end
end

-- function status_catch_f()
    -- This can be used as a status catch
--	if catch == 1
--		if player.hpp < 50 then
--			catch = catch + 1
--			windower.send_command('/con send Frullata /cure4 Keaddo')
--		elseif check_buffs('silence', 'mute') then
 --           windower.send_command('/con send Frullata /silena Keaddo')
	--	elseif check_buffs('paralyze') then
		--	windower.send_command('/con send Frullata /paralyna Keaddo')
--		elseif check_buffs('slow') then
	--		windower.send_command('/con send Frullata /erase Keaddo')
		--elseif check_buffs('blind') then
			--windower.send_command('/con send Frullata /blindna Keaddo')
--		end
	--end
--end

function try_weaponskill()
    --[[ F10 bind:
            One button press has the ability to perform one of three
            Weaponskills:
            Chant du Cygne will change to Expiacion when AM3 is down and at
            3000 TP and will hold TP if over 2000 but below 3000
            A Club in main hand it will change to Realmrazer,
            If Idle and F10 is pressed you will change to current Idle/DT set,
            useful as a fast way to equip proper gear ]]
    if player.status == 'Engaged' then
        if player.equipment.main == 'Tizona' then
            if player.tp == 3000 and not check_buffs('Aftermath: Lv.3') then
                windower.send_command('expiacion')
            elseif player.tp > 2000 and not check_buffs('Aftermath: Lv.3') then
                windower.add_to_chat(8,'Holding TP til 3000'
                    ..' to gain Aftermath: Lv.3')
                return
            else
                windower.send_command('chant du cygne')
            end
        else
            windower.send_command('chant du cygne')
        end
    else
        gear_modes()
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
        if count_msg_mecisto == 0 then
            windower.add_to_chat(8,'REMINDER:  '
                ..'Mecistopins mantle equiped on back')
        end
        count_msg_mecisto = (count_msg_mecisto + 1) % 30
    else
        enable('back')
        count_msg_mecisto = 0
    end
end

function status_change(new,old)
    if T{'Idle','Engaged'}:contains(new) and gear_change_ok then
		if Cities:contains(world.area) then
			equip(sets.Town)
			elseif new == 'Engaged' and TH_ind == 1 then
				equip(sets.TH)
				EngagedTP = player.tp
			else
			gear_modes()
		end
	end	
end

function buff_change(buff,gain)
    -- When encumbrance wears off will re-equip current gear set
    if buff == 'encumbrance' and not gain then
        gear_modes()

    -- TIMERS PLUGIN: Create and delete custom timers for aftermath levels
    elseif player.equipment.main == 'Tizona'
            and buff:startswith('Aftermath') then
        if gain then
            windower.send_command('timers c "'..buff..'" '
                ..mythic_aftermath_times[buff]..' down abilities/00027.png')
        else
            windower.send_command('timers d "'..buff..'"')
        end

    -- TIMERS PLUGIN: Primeval Brew (Transcendency)
    elseif buff == 'Transcendency' then
        if gain then
            windower.send_command('timers c "Transcendency" 180'
                ..'down abilities/00018.png')
        else
            windower.send_command('timers d "Transcendency"')
        end

    -- If you have spells under a different macro set in game this will let
    -- you change to that set quickly and then change back once finished
    elseif buff:startswith('Unbridled') and not gain then
        windower.send_command('input /macro set 1')

    -- TIMERS PLUGIN: Weakness
    elseif buff == 'weakness' then
        if gain then
            windower.send_command('timers c "Weakness" 300 down'
                ..'abilities/00255.png')
        else
            windower.send_command('timers d "Weakness"')
        end
    end
end

function precast(spell,arg)
    gear_change_ok = false
    slot_disabling()

    -- Automates Berserk/Warcry for Warrior sub job
    if berserk_warcry_automation:contains(spell.name)
            and player.status == 'Engaged'
            and player.sub_job == 'WAR'
            and check_recasts(j('Berserk'))
            and not check_buffs(
                'Amnesia',
                'Berserk',
                'Obliviscence',
                'Paralysis') then
        windower.send_command('berserk; wait 1; warcry; wait 1;'
            ..spell.name..' '..spell.target.raw)
        cancel_spell()
        return
    end

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
    for key, set in pairs(modifiers) do
        if set:contains(spell.name) then
            stat = key
        end
    end

    local physical = stat and physical:contains(stat)
    local magical = stat and magical:contains(stat)

    -- Magic spell gear handling(Midcast)
    if physical then
        equip(sets.midcast.BlueMagic[stat])
        if check_buffs('Chain Affinity') then
            equip(sets.misc['Chain Affinity'])
        end
        if check_buffs('Efflux') then
            equip(sets.misc.Efflux)
        end
        if tp_mode == 'Accuracy High' and stat ~= 'PhysMagicACC' then
            equip(sets.midcast.BlueMagic.PhysACC)
        end
    elseif magical then
        equip(sets.midcast.BlueMagic[stat])
        if stat == 'Healing' and spell.target.type == 'SELF' then
            equip(sets.midcast.BlueMagic.Healing.Self)
        elseif stat == 'Nuke' then
            if check_buffs('Burst Affinity') then
                equip(sets.misc['Burst Affinity'])
            end
            if spell.element == world.day_element
                    or spell.element == world.weather_element then
                equip(sets.misc.Cape_Obi)
            end
			if spell.name:startswith('Subduction') then
				equip(sets.TH.spell)
			end
        elseif check_buffs('Diffusion') then
            equip(sets.misc.Diffusion)
        end
    end

    if spell.skill == 'Healing Magic' or spell.skill == 'Enhancing Magic'
            or spell.type == 'Trust' then
        equip(sets.midcast.BlueMagic.Recast)
        if spell.name:startswith('Cure') then
            equip(sets.midcast.BlueMagic.Healing)
            if spell.target.type == 'SELF' then
                equip(sets.midcast.BlueMagic.Healing.Self)
            end
        end
    elseif spell.skill == 'Elemental Magic' then
        equip(sets.midcast.BlueMagic.Nuke)
    end

    if spell.name:startswith('Utsusemi') then
        equip(sets.misc.DT.Active)
    end
end

function aftercast(spell,arg)
    gear_change_ok = true
    gear_modes()

    -- Gear info, useful if using DressUp or BlinkMeNot
    if Cities:contains(world.area) then
						equip(sets.Town)
	elseif dt_mode ~= 'None' or tp_mode ~= 'Normal' then
        windower.add_to_chat(8,'Melee = '..tp_mode..
            '  |  Damage Taken = '..dt_mode)
    end

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