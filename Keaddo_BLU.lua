function get_sets()
 
        send_command('bind f9 gs c toggle TP set')
        send_command('bind f10 gs c toggle Idle set')
        send_command('bind f11 gs c toggle CDC set')
        send_command('bind f12 gs c PDT')
        send_command('bind !f12 gs c toggle Rea set')
	send_command('bind ^` gs c toggle MB set')
       
        function file_unload()
     
 
        send_command('unbind ^f9')
        send_command('unbind ^f10')
                send_command('unbind ^f11')
                send_command('unbind ^f12')
		send_command('unbind ^`')
       
        send_command('unbind !f9')
        send_command('unbind !f10')
                send_command('unbind !f11')
        send_command('unbind !f12')
 
        send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind f11')
        send_command('unbind f12')
 
       
 
        end    
		
	Cities = S{
                        "Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
                        "Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
                        "Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
                        "Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
                        "Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
                        "Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Tavnazia"}		
               
        --Idle Sets--  
        sets.Idle = {}
       
        sets.Idle.index = {'Standard','DT'}
        Idle_ind = 1                   
       
        sets.Idle.Standard = {ammo="Ginsen",
                                                  head="Rawhide Mask",neck="Sanctity Necklace", ear1="Infused Earring", ear2="Ethereal Earring",
                                                  body="Amalric Doublet",hands="Herculean Gloves",ring1="Sheltered Ring",ring2="Paguroidea ring",
                                                  back="Cheviot Cape",waist="Flume Belt",legs="Carmine Cuisses",feet={ name="Herculean Boots", augments={'STR+14','Rng. Atk.+20','Damage taken -4%',}}}
                                                 
        sets.Idle.DT = {ammo="Vanir Battery",
                                	head="Dampening Tam",neck="Twilight Torque", ear1="Merman's Earring", ear2="Ethereal Earring",
                                        body="Emet Harness",hands="Herculean Gloves",ring1="Defending Ring",ring2="Gelatinous Ring +1",
                                        back="Cheviot Cape",waist="Flume belt",legs="Carmine Cuisses",feet={ name="Herculean Boots", augments={'STR+14','Rng. Atk.+20','Damage taken -4%',}}}
 
		sets.Town = set_combine(sets.Idle.Standard,{
		ear1="Odnowa Earring +1",
		ring1="Defending Ring",
		ring2="Weatherspoon Ring",
		back="Lupine Cape",
		waist="Windbuffet Belt +1"
		})

       
        --TP Sets--
        sets.TP = {}
 
        sets.TP.index = {'Standard', 'AccuracyLite', 'AccuracyMedium', 'AccuracyFull', 'AccuracyExtreme', 'CantHitShit', 'DT', 'DTAccuracy', 'MDTAccuracy','TH'}
        --1=Standard, 2=Solo, 3=Marches, 4=AccuracyLite, 5=AccuracyFull, 6=DT, 7=DTAccuracy--
        TP_ind = 1
       
        sets.TP.Standard = {ammo="Ginsen",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Asperity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Petrov Ring",
    back="Bleating Mantle",
}
                                       
        sets.TP.AccuracyLite = {ammo="Ginsen",
    head="Adhemar Bonnet",
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
    back="Bleating Mantle",
}
	sets.TP.AccuracyMedium = {ammo="Amar Cluster",
    head="Dampening Tam",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Petrov Ring",
    back="Bleating Mantle",
}
       
        sets.TP.AccuracyFull = {ammo="Amar Cluster",
    head="Dampening Tam",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Sanctity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Petrov Ring",
    back="Lupine Cape",
}
                                                       
        sets.TP.AccuracyExtreme = {ammo="Amar Cluster",
    head="Dampening Tam",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Sanctity Necklace",
    waist="Olseni Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Petrov Ring",
    back="Kayapa Cape",
}
	sets.TP.CantHitShit = {ammo="Amar Cluster",
    head="Dampening Tam",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Sanctity Necklace",
    waist="Olseni Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Cacoethic Ring +1",
    right_ring="Enlivened Ring",
    back="Kayapa Cape",
}
                                                       
        sets.TP.DT = {ammo="Vanir Battery",
                                head="Dampening Tam",
								neck="Twilight Torque", 
								ear1="Merman's earring", 
								ear2="Ethereal Earring",
                                body="Emet Harness",
								hands="Herculean Gloves",
								ring1="Defending Ring",
								ring2="Gelatinous Ring +1",
                                back="Cheviot Cape",
								waist="Flume belt",
								legs="Herculean Trousers",
								feet={ name="Herculean Boots", augments={'STR+14','Rng. Atk.+20','Damage taken -4%',}}
}
                                 
        sets.TP.DTAccuracy = {ammo="Vanir Battery",
                                head="Dampening Tam",
								neck="Twilight Torque", 
								ear1="Ethereal earring", 
								ear2="Brutal Earring",
                                body="Emet Harness",
								hands="Adhemar Wristbands",
    right_ring="Yacuruna Ring",
                                back="Cheviot Cape",
								waist="Flume belt",
								legs="Herculean Trousers",
								feet={ name="Herculean Boots", augments={'STR+14','Rng. Atk.+20','Damage taken -4%',}}
}
        sets.TP.MDTAccuracy = {ammo="Vanir Battery",
                                head="Dampening Tam",neck="Twilight Torque", ear1="Etiolation earring", ear2="Cryptic Earring",
                                        body="Emet Harness",hands="Herculean Gloves",ring2="Yacuruna ring",
                                        back="Mubvumbamiri Mantle",waist="Flume belt",legs="Herculean Trousers",feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
}
            
		sets.TP.TH = set_combine(sets.TP.Standard, {
		hands={ name="Herculean Gloves", augments={'Accuracy+15','Pet: STR+7','"Treasure Hunter"+2','Accuracy+17 Attack+17',}},
		feet={ name="Herculean Boots", augments={'MND+8','"Mag.Atk.Bns."+10','"Treasure Hunter"+2','Accuracy+10 Attack+10','Mag. Acc.+6 "Mag.Atk.Bns."+6',}}
		})       
       
        --Weaponskill Sets--
        sets.WS = {}
       
        sets.Requiescat = {}
       
        sets.Requiescat.index = {'Attack','Accuracy'}
        Requiescat_ind = 1
       
        sets.Requiescat.Attack = {ammo="Hydrocera",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Santity Necklace",
    waist="Windbuffet Belt +1",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Rajas Ring",
    back="Bleating Mantle",
}
                                                                 
        sets.Requiescat.Accuracy = {ammo="Falcon Eye",
                                                        head="Whirlpool mask",neck="Fotia gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                                            body="Luhlaza jubbah +1",hands="Qaaxo mitaines",ring1="Epona's ring",ring2="Levia. ring",
                                                            back="Letalis mantle",waist="Fotia belt",legs="Quiahuiz trousers",feet="Assim. charuqs +1"}
                                                         
        sets.ChantDuCygne = {}
       
        sets.ChantDuCygne.index = {'Attack','Accuracy','HighAcc'}
        ChantDuCygne_ind = 1
       
        sets.ChantDuCygne.Attack = {ammo="Jukukik Feather",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Asperity Necklace",
    waist="Snow Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Epona's Ring",
    right_ring="Apate Ring",
    back="Rancorous Mantle",
}
                                                           
        sets.ChantDuCygne.Accuracy = {ammo="Falcon Eye",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Sanctity Necklace",
    waist="Snow Belt",
    left_ear="Suppanomimi",
    right_ear="Brutal Earring",
    left_ring="Epona's Ring",
    right_ring="Ramuh Ring",
    back="Bleating Mantle",
}

        sets.ChantDuCygne.Accuracy = {ammo="Falcon Eye",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Sanctity Necklace",
    waist="Snow Belt",
    left_ear="Steelflash Earring",
    right_ear="Bladeborn Earring",
    left_ring="Enlived Ring",
    right_ring="Ramuh Ring",
    back="Bleating Mantle",
}
                                                           
        sets.WS.SanguineBlade = {}
       
        sets.WS.SanguineBlade = {ammo="Pemphredo Tathlum",
    head="Herculean Helm",
    body="Amalric Doublet",
    hands="Amalric Gages",
    legs="Amalric Slops",
    feet="Amalric Nails",
    neck="Sanctity Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring",
    back="Cornflower Cape",
}
               
        sets.WS.CircleBlade = {}               
                       
        sets.WS.CircleBlade = {ammo="Mantoptera Eye",
                                                   head="Adhemar Bonnet",neck="Caro Necklace",ear1="Ishvara earring",ear2="Moonshade earring",
                                                   body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's ring",ring2="Rufescent ring",
                                                   back="Buquwik Cape",waist="Prosilio Belt",legs="Samnuha Tights",feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}}}
                                                   
        sets.WS.Expiacion = {}         
                       
        sets.WS.Expiacion = {ammo="Mantoptera Eye",
                                                   head="Adhemar Bonnet",neck="Caro Necklace",ear1="Ishvara earring",ear2="Moonshade earring",
                                                   body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Epona's ring",ring2="Rufescent ring",
                                                   back="Buquwik Cape",waist="Prosilio Belt",legs="Samnuha Tights",feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}}}

	sets.WS.VorpalBlade = {}
	
	sets.WS.VorpalBlade = {ammo="Mantoptera Eye",
                                                   head="Adhemar Bonnet",neck="Fotia Gorget",ear1="Brutal earring",ear2="Moonshade earring",
                                                   body="Abnoba Kaftan",hands="Adhemar Wristbands",ring1="Epona's ring",ring2="Rufescent ring",
                                                   back="Rancorous Mantle",waist="Fotia Belt",legs="Samnuha Tights",feet="Thereoid Greaves"}
                                                 
        sets.Realmrazer = {}
       
        sets.Realmrazer.index = {'Attack','Accuracy'}
        Realmrazer_ind = 1
       
        sets.Realmrazer.Attack = {ammo="Hydrocera",
                                                      head="Dampening Tam",neck="Fotia gorget",ear1="Bladeborn earring",ear2="Steelflash Earring",
                                                          body="Adhemar Jacket",hands="Adhemar Wristbands",ring1="Rajas ring",ring2="Rufescent ring",
                                                          back="Buquwik Cape",waist="Fotia belt",legs="Amalric Slops",feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}}}
                                                         
        sets.Realmrazer.Accuracy = {ammo="Falcon Eye",
                                                        head="Whirlpool mask",neck="Fotia gorget",ear1="Bladeborn earring",ear2="Steelflash earring",
                                                            body="Luhlaza jubbah +1",hands="Luh. Bazubands +1",ring1="Levia. ring",ring2="Aquasoul ring",
                                                            back="Letalis mantle",waist="Fotia belt",legs="Quiahuiz trousers",feet="Assim. charuqs +1"}
                                                       
        sets.WS.FlashNova = {}
       
        sets.WS.FlashNova = {ammo="Ghastly Tathlum",
    head="Amalric Coif",
    body="Amalric Doublet",
    hands="Amalric Gages",
    legs="Amalric Slops",
    feet="Amalric Nails",
    neck="Sanctity Necklace",
    waist="Salire Belt",
    left_ear="Friomisi Earring",
    right_ear="Hecate's Earring",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring",
    back="Cornflower Cape",
}
                                                               
                                                               
        --Magic Burst Sets--

	sets.Burst = {}
	sets.Burst.index = {'BA', 'MB'}
	Burst_ind = 1                                                       
                                                               
                                                               
        --Blue Magic Sets--
        sets.BlueMagic = {}
       
        sets.BlueMagic.STR = {ammo="Mantoptera Eye",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Herculean Gloves",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'STR+14','Rng. Atk.+20','Damage taken -4%',}},
    neck="Caro Necklace",
    waist="Prosilio Belt",
    left_ear="Bladeborn Earring",
    right_ear="Ethereal Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Apate Ring",
    back="Cornflower cape",
}
                                                 
        sets.BlueMagic.STRDEX = {ammo="Mantoptera Eye",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Caro Necklace",
    waist="Prosilio Belt",
    left_ear="Bladeborn Earring",
    right_ear="Ethereal Earring",
    left_ring="Apate Ring",
    right_ring="Rajas Ring",
    back="Cornflower cape",
}
                                                       
        sets.BlueMagic.STRVIT = {ammo="Mantoptera Eye",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Caro Necklace",
    waist="Prosilio Belt",
    left_ear="Bladeborn Earring",
    right_ear="Ethereal Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Apate Ring",
    back="Cornflower cape",
}
                                                         
        sets.BlueMagic.STRMND = {ammo="Mantoptera Eye",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Caro Necklace",
    waist="Prosilio Belt",
    left_ear="Bladeborn Earring",
    right_ear="Ethereal Earring",
    left_ring="Pyrosoul Ring",
    right_ring="Apate Ring",
    back="Cornflower cape",
}
                                                               
        sets.BlueMagic.AGI = {ammo="Mantoptera Eye",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Adhemar Wristbands",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Caro Necklace",
    waist="Prosilio Belt",
    left_ear="Bladeborn Earring",
    right_ear="Ethereal Earring",
    left_ring="Apate Ring",
    right_ring="Rajas Ring",
    back="Cornflower cape",
}
                                                 
        sets.BlueMagic.INT = {ammo="Pemphredo Tathlum",
    head="Herculean Helm",
    body="Amalric Doublet",
    hands="Amalric Gages",
    legs="Amalric Slops",
    feet="Amalric Nails",
    neck="Sanctity Necklace",
    waist="Salire Belt",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring",
    back="Cornflower cape",
}

	sets.BlueMagic.Dark = {ammo="Ghastly Tathlum",
    head="Amalric Coif",
    body="Amalric Doublet",
    hands="Amalric Gages",
    legs="Amalric Slops",
    feet="Amalric Nails",
    neck="Sanctity Necklace",
    waist="Salire Belt",
    left_ear="Hecate's Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring",
    right_ring="Shiva Ring",
    back="Cornflower cape",
}
                                                 
        sets.BlueMagic.Cures = {ammo="Hydrocera",
    head="Amalric Coif",
    body="Amalric Doublet",
    hands="Telchine Gloves",
    legs="Psycloth Lappas",
    feet="Medium's Sabots",
    neck="Phalaina Locket",
    waist="Pythia Sash",
    left_ear="Mendi. Earring",
    right_ear="Lifestorm Earring",
    left_ring="Levia. Ring",
    right_ring="Levia. Ring",
    back="Cornflower Cape",
}
                                                       
        sets.BlueMagic.SelfCures = {ammo="Hydrocera",
    head="Amalric Coif",
    body="Amalric Doublet",
    hands="Telchine Gloves",
    legs="Psycloth Lappas",
    feet="Medium's Sabots",
    neck="Phalaina Locket",
    waist="Pythia Sash",
    left_ear="Mendi. Earring",
    right_ear="Lifestorm Earring",
    left_ring="Kunaji Ring",
    right_ring="Levia. Ring",
    back="Cornflower Cape",
}
                                                       
        sets.BlueMagic.Stun = {ammo="Falcon Eye",
    head="Dampening Tam",
    body="Amalric Doublet",
    hands="Rawhide Gloves",
    legs="Miasmic Pants",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Sanctity Necklace",
    waist="Eschan Stone",
    left_ear="Gwati Earring",
    right_ear="Steelflash Earring",
    left_ring="Vertigo Ring",
    right_ring="Sangoma Ring",
    back="Cornflower cape",
}
                                                   
        sets.BlueMagic.HeavyStrike = {ammo="Mantoptera Eye",
    head="Adhemar Bonnet",
    body="Adhemar Jacket",
    hands="Rawhide Gloves",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Subtlety Spec.",
    waist="Chuq'aba Belt",
    left_ear="Heartseeker Earring",
    right_ear="Steelflash Earring",
    left_ring={ name="Dark Ring", augments={'Magic dmg. taken -4%','Phys. dmg. taken -4%','Breath dmg. taken -3%',}},
    right_ring="Rajas Ring",
    back="Cornflower cape",
}
                                                                 
        sets.BlueMagic.ChargedWhisker = {ammo="Ghastly Tathlum",
    head="Adhemar Bonnet",
    body="Amalric Doublet",
    hands="Amalric Gages",
    legs="Amalric Slops",
    feet="Hashishin Basmak +1",
    neck="Sanctity Necklace",
    waist="Yamabuki-no-Obi",
    left_ear="Crematio Earring",
    right_ear="Friomisi Earring",
    left_ring="Shiva Ring +1",
    right_ring="Shiva Ring +1",
    back="Cornflower cape",
}
       
        sets.BlueMagic.WhiteWind = {ammo="Egoist's Tathlum",
    head="Amalric Coif",
    body="Amalric Doublet",
    hands="Telchine Gloves",
    legs="Psycloth Lappas",
    feet="Luhlaza Charuqs",
    neck="Phalaina Locket",
    waist="Pythia Sash",
    left_ear="Mendi. Earring",
    right_ear="Lifestorm Earring",
    left_ring="Levia. Ring",
    right_ring="Levia. Ring",
    back="Cornflower Cape",
}
                                                                         
        sets.BlueMagic.MagicAccuracy = {ammo="Pemphredo Tathlum",
    head="Amalric Coif",
    body="Amalric Doublet",
    hands="Leyline Gloves",
    legs="Psycloth Lappas",
    feet="Amalric Nails",
    neck="Sanctity Necklace",
    waist="Salire Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Gwati Earring",
    left_ring="Shiva Ring",
    right_ring="Weatherspoon Ring",
    back="Cornflower cape",
}

	sets.BlueMagic.Enmity = {ammo="Sapience Orb",
    head="Rabid Visor",
    body="Emet Harness",
    hands="Leyline Gloves",
    legs="Obatala Subligar",
    feet="Dux Greaves",
    neck="Warder's Charm",
    waist="Goading Belt",
    left_ear="Friomisi Earring",
    right_ear="Cryptic Earring",
    left_ring="Vexer Ring +1",
    right_ring="Petrov Ring",
    back="Mubvumbamiri Mantle",
}

	sets.BlueMagic.ConserveMP = {ammo="Sapience Orb",
    head="Telchine Cap",
    body="Amalric Doublet",
    hands="Leyline Gloves",
    legs="Miasmic Pants",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Deviant Necklace",
    waist="Pythia Sash",
    left_ear="Gwati Earring",
    right_ear="Mendi. Earring",
    left_ring="Prolix Ring",
    right_ring="Lebeche Ring",
    back="Swith Cape",
}

	sets.BlueMagic.Refresh = {ammo="Sapience Orb",
    head="Amalric Coif",
    body="Amalric Doublet",
    hands="Amalric Gages",
    legs="Psycloth Lappas",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Deviant Necklace",
    waist="Gishdubar Sash",
    left_ear="Gwati Earring",
    right_ear="Mendi. Earring",
    left_ring="Prolix Ring",
    right_ring="Lebeche Ring",
    back="Grapevine Cape",
}
                                                                         
        sets.BlueMagic.Skill = {ammo="Mavi Tathlum",
     head="Luhlaza Keffiyeh",
    body="Assimilator's Jubbah +1",
    hands="Rawhide Gloves",
    legs="Psycloth Lappas",
    feet="Luhlaza Charuqs",
    neck="Phalaina Locket",
    waist="Pythia Sash",
    left_ear="Mendi. Earring",
    right_ear="Loquacious Earring",
    left_ring="Levia. Ring",
    right_ring="Weatherspoon Ring",
    back="Cornflower Cape",
}
                                                       
        sets.BlueMagic.SkillRecast = {ammo="Mavi Tathlum",
     head="Luhlaza Keffiyeh",
    body="Assimilator's Jubbah +1",
    hands="Rawhide Gloves",
    legs="Psycloth Lappas",
    feet="Luhlaza Charuqs",
    neck="Phalaina Locket",
    waist="Pythia Sash",
    left_ear="Mendi. Earring",
    right_ear="Loquacious Earring",
    left_ring="Levia. Ring",
    right_ring="Weatherspoon Ring",
    back="Cornflower Cape",
}
                                                                 
                                                                 
                                                                 
                                                                 
                                               
                                               
        --Utility Sets--
        sets.Utility = {}
	
	sets.Utility.Weather = {waist="Hachirin-no-obi",back="Twilight Cape"}

	sets.Utility.MB = {head="Herculean Helm",body="Samnuha Coat",ear1="Static Earring",ring1="Locus Ring",ring2="Mujin Band"}
 
       
        sets.Utility.Stoneskin = {head="Haruspex hat",neck="Stone Gorget",ear1="Loquac. earring",ear2="Earthcry earring",
                                                          body="Assim. jubbah +1",hands="Stone Mufflers",ring1="Prolix ring",
                                                          back="Swith cape",waist="Siegel sash",legs="Haven hose",feet="Iuitl gaiters"}
                                                         
        sets.Utility.Phalanx = {head="Haruspex hat",neck="Colossus's torque",ear1="Loquac. earring",ear2="Augment. earring",
                                                    body="Assim. jubbah +1",hands="Ayao's gages",ring1="Prolix ring",
                                                        back="Swith cape",waist="Pythia sash +1",legs="Portent pants",feet="Iuitl gaiters"}
                                                       
        sets.Utility.Steps = {ammo="Falcon Eye",
    head="Dampening Tam",
    body="Adhemar Jacket",
    hands="Rawhide Gloves",
    legs="Samnuha Tights",
    feet={ name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}},
    neck="Subtlety Spec.",
    waist="Chaac Belt",
    left_ear="Heartseeker Earring",
    right_ear="Steelflash Earring",
    left_ring="Yacuruna Ring",
    right_ring="Rajas Ring",
    back="Grounded Mantle",
}
                                                 
        sets.Utility.PDT = {head="Whirlpool mask",neck="Twilight torque",ear1="Ethereal earring",
                                                body="Iuitl vest",hands="Umuthi gloves",ring1="Dark ring",ring2="Dark ring",
                                                back="Mollusca mantle",waist="Flume belt",legs="Iuitl Tights +1",feet="Iuitl gaiters"}
                                               
        sets.Utility.MDT = {head="Whirlpool mask",neck="Twilight torque",
                                                body="Assim. jubbah +1",hands="Umuthi gloves",ring1="Dark ring",ring2="Dark ring",
                                                back="Mollusca mantle",legs="Quiahuiz trousers",feet="Luhlaza charuqs"}
                                                       
       
       
       
       
       
        --Job Ability Sets--
       
        sets.JA = {}
       
        sets.JA.ChainAffinity = {feet="Assim. charuqs +1"}
       
        sets.JA.BurstAffinity = {feet="Hashishin Basmak +1"}
       
        sets.JA.Efflux = {legs="Mavi tayt +2"}
       
        sets.JA.AzureLore = {hands="Luh. bazubands +1"}
       
        sets.JA.Diffusion = {feet="Luhlaza Charuqs"}
                                                               
                                                               
                       
                       
                       
                       
        --Precast Sets--
        sets.precast = {}
       
        sets.precast.FC = {}
       
        sets.precast.FC.Standard = {ammo="Impatiens",
    head="Amalric Coif",
    body="Samnuha Coat",
    hands="Leyline Gloves",
    legs="Psycloth Lappas",
    feet="Amalric Nails",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Weatherspoon Ring",
    back="Swith Cape",
}
       
        sets.precast.FC.Blue = {ammo="Impatiens",
    head="Amalric Coif",
    body="Hashishin Mintan",
    hands="Hashishin Bazubands",
    legs="Psycloth Lappas",
    feet="Amalric Nails",
    neck="Voltsurge Torque",
    waist="Witful Belt",
    left_ear="Enchntr. Earring +1",
    right_ear="Loquac. Earring",
    left_ring="Prolix Ring",
    right_ring="Weatherspoon Ring",
    back="Swith Cape",
}
end
 
 
 
 
 
 
function precast(spell)
        if spell.action_type == 'Magic' then
                equip(sets.precast.FC.Standard)
                               
                if spell.skill == 'Blue Magic' then
                equip(sets.precast.FC.Blue)
                end
        end
       
        if spell.english == 'Azure Lore' then
                equip(sets.JA.AzureLore)
        end
       
        if spell.english == 'Requiescat' then
                equip(sets.Requiescat[sets.Requiescat.index[Requiescat_ind]])
        end
       
        if spell.english == 'Chant du Cygne' then
                equip(sets.ChantDuCygne[sets.ChantDuCygne.index[ChantDuCygne_ind]])
        end
       
        if spell.english == 'Circle Blade' or spell.english == 'Savage Blade' then
                equip(sets.WS.CircleBlade)
        end
               
        if spell.english == 'Expiacion' then
                equip(sets.WS.Expiacion)
        end

	if spell.english == 'Vorpal Blade' then
		equip(sets.WS.VorpalBlade)
	end
       
        if spell.english == 'Sanguine Blade' then
                equip(sets.WS.SanguineBlade)
		if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
        end
       
        if spell.english == 'Box Step' then
                equip(sets.Utility.Steps)
        end
       
        if spell.english == 'Realmrazer' then
                equip(sets.Realmrazer[sets.Realmrazer.index[Realmrazer_ind]])
        end
       
        if spell.english == 'Flash Nova' then
                equip(sets.WS.FlashNova)
        	if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
	end
end
       
function midcast(spell,act)
        if spell.english == 'Vertical Cleave' or spell.english == 'Death Scissors' or spell.english == 'Empty Thrash' or spell.english == 'Dimensional Death' or spell.english == 'Quadrastrike' or spell.english == 'Bloodrake' then
                equip(sets.BlueMagic.STR)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
               
        if spell.english == 'Disseverment' or spell.english == 'Hysteric Barrage' or spell.english == 'Frenetic Rip' or spell.english == 'Seedspray' or spell.english == 'Vanity Dive' or spell.english == 'Goblin Rush' or spell.english == 'Paralyzing Triad' or spell.english == 'Thrashing Assault' then
                equip(sets.BlueMagic.STRDEX)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Quad. Continuum' or spell.english == 'Delta Thrust' or spell.english == 'Cannonball' or spell.english == 'Glutinous Dart' then
                equip(sets.BlueMagic.STRVIT)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Whirl of Rage' then
                equip(sets.BlueMagic.STRMND)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Benthic Typhoon' or spell.english == 'Final Sting' or spell.english == 'Spiral Spin' then
                equip(sets.BlueMagic.AGI)
                if buffactive['Chain Affinity'] then
                        equip(sets.JA.ChainAffinity)
                end
                if buffactive['Efflux'] then
                        equip(sets.JA.Efflux)
                end
        end
       
        if spell.english == 'Gates of Hades' or spell.english == 'Lunge' or spell.english == 'Swipe' or spell.english == 'Leafstorm' or spell.english == 'Firespit' or spell.english == 'Acrid Stream' or spell.english == 'Regurgitation' or spell.english == 'Corrosive Ooze' or spell.english == 'Thermal Pulse' or spell.english == 'Magic Hammer' 
	or spell.english == 'Evryone. Grudge' or spell.english == 'Water Bomb' or spell.english == 'Dark Orb' or spell.english == 'Thunderbolt' or spell.english == 'Tem. Upheaval' or spell.english == 'Embalming Earth' or spell.english == 'Foul Waters' or spell.english == 'Rending Deluge' 
	or spell.english == 'Droning Whirlwind' or spell.english == 'Subduction' or spell.english == 'Anvil Lightning' or spell.english == 'Blinding Fulgor' or spell.english == 'Entomb' or spell.english == 'Palling Salvo' or spell.english == 'Scouring Spate' 
	or spell.english == 'Searing Tempest' or spell.english == 'Silent Storm' or spell.english == 'Diffusion Ray' or spell.english == 'Spectral Floe' then
                equip(sets.BlueMagic.INT)
		if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
                if buffactive['Burst Affinity'] then
			if Burst_ind == 1 then	
                        equip(sets.JA.BurstAffinity)
			elseif Burst_ind == 2 then
			equip(sets.Utility.MB)
		end
                end
        end

	if spell.english == 'Tenebral Crush' or spell.english == 'Palling Salvo' then
		equip(sets.BlueMagic.Dark)
		if spell.element == world.day_element or spell.element == world.weather_element then
			      equip(sets.Utility.Weather)
		        end
                if buffactive['Burst Affinity'] then
			if Burst_ind == 1 then	
                        equip(sets.JA.BurstAffinity)
			elseif Burst_ind == 2 then
			equip(sets.Utility.MB)
		end
                end
        end
       
        if spell.english == 'Magic Fruit' or spell.english == 'Plenilune Embrace' or spell.english == 'Wild Carrot' or spell.english == 'Pollen' or spell.english == 'Cure III' or spell.english == 'Cure IV' then
                equip(sets.BlueMagic.Cures)
			if spell.target.name == player.name and string.find(spell.english, 'Magic Fruit') or string.find(spell.english, 'Plenilune Embrace') or string.find(spell.english, 'Wild Carrot') or string.find(spell.english, 'Cure III') or string.find(spell.english, 'Cure IV') then
                                equip(sets.BlueMagic.SelfCures)
                        end
			
        end
       
        if spell.english == 'White Wind' then
                equip(sets.BlueMagic.WhiteWind)
        end
       
        if spell.english == 'Head Butt' or spell.english == 'Sudden Lunge' or spell.english == 'Tourbillion' or spell.english == 'Saurian Slide' or spell.english == 'Sweeping Gouge' or spell.english == 'Frypan' then
                equip(sets.BlueMagic.Stun)
        end
       
        if spell.english == 'Heavy Strike' then
                equip(sets.BlueMagic.HeavyStrike)
        end
       
        if spell.english == 'Charged Whisker' then
                equip(sets.BlueMagic.ChargedWhisker)
                if buffactive['Burst Affinity'] then
                        equip(sets.JA.BurstAffinity)
                end
        end
       
        if spell.english == 'Frightful Roar' or spell.english == 'Infrasonics' or spell.english == 'Chaotic Eye' or spell.english == 'Auroral Drape' or spell.english == 'Sheep Song' or spell.english == 'Barbed Crescent' 
	or spell.english == 'Tourbillion' or spell.english == 'Cimicine Discharge' or spell.english == 'Sub-zero smash' or spell.english == 'Filamented Hold' or spell.english == 'Mind Blast' or spell.english == 'Sandspin' 
	or spell.english == 'Hecatomb Wave' or spell.english == 'Blank Gaze' or spell.english == 'Cold Wave' or spell.english == 'Terror Touch' or spell.english == 'Retinal Glare' or spell.english == 'Dream Flower' 
	or spell.english == 'Geist Wall' or spell.english == 'Absolute Terror' or spell.english == 'Blistering Roar' then
                equip(sets.BlueMagic.MagicAccuracy)
        end
       
        if spell.english == 'MP Drainkiss' or spell.english == 'Mighty Guard' or spell.english == 'Digest' or spell.english == 'Blood Saber' or spell.english == 'Blood Drain' or spell.english == 'Osmosis' or spell.english == 'Occultation' or spell.english == 'Magic Barrier' or spell.english == 'Diamondhide' or spell.english == 'Metallic Body' then
                equip(sets.BlueMagic.SkillRecast)
                if buffactive['Diffusion'] then
                        equip(sets.JA.Diffusion)
                end
        end
	
	if spell.english == 'Fantod' or spell.english =='Jettatura' or spell.english =='Wind Breath' or spell.english =='Exuviation' then
                equip(sets.BlueMagic.Enmity)
                
        end
	
	if spell.english == 'Mighty Guard' or spell.english == 'Erratic Flutter' or spell.english == 'Nat. Meditation' or spell.english == 'Uproot' or spell.english == 'Saline Coat' or spell.english == 'Barrier Tusk' then
		equip(sets.BlueMagic.ConserveMP)
	end
	
	if spell.english == 'Battery Charge' or spell.english == 'Refresh' then
		equip(sets.BlueMagic.Refresh)
	end
       
        if spell.english == 'Cocoon' or spell.english == 'Mighty Guard' or spell.english == 'Harden Shell' or spell.english == 'Animating Wail' or spell.english == 'Battery Charge' or spell.english == 'Nat. Meditation' or spell.english == 'Carcharian Verve' or spell.english == 'O. Counterstance' or spell.english == 'Barrier Tusk' or spell.english == 'Saline Coat' or spell.english == 'Regeneration' or spell.english == 'Erratic Flutter' then
                if buffactive['Diffusion'] then
                        equip(sets.JA.Diffusion)
                end
        end
end
 
function aftercast(spell)
        if player.status == 'Engaged' then
                equip(sets.TP[sets.TP.index[TP_ind]])
			elseif Cities:contains(world.area) then
						equip(sets.Town)
					else
						equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
       
        if spell.action_type == 'Weaponskill' then
                add_to_chat(158,'TP Return: ['..tostring(player.tp)..']')
        end
end
 
function status_change(new,old)
        if new == 'Engaged' then
                equip(sets.TP[sets.TP.index[TP_ind]])
			elseif Cities:contains(world.area) then
						equip(sets.Town)
					else
						equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
end
 
function self_command(command)
        if command == 'toggle TP set' then
                TP_ind = TP_ind +1
                if TP_ind > #sets.TP.index then TP_ind = 1 end
                send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
                equip(sets.TP[sets.TP.index[TP_ind]])
        elseif command == 'PDT' then
                if TP_ind == 7 then
					TP_ind = 1
                send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
				equip(sets.TP[sets.TP.index[TP_ind]])
                else
					TP_ind = 7
                send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
                equip(sets.TP[sets.TP.index[TP_ind]])
				end
        elseif command == 'toggle Idle set' then
                Idle_ind = Idle_ind +1
                if Idle_ind > #sets.Idle.index then Idle_ind = 1 end
                send_command('@input /echo <----- Idle Set changed to '..sets.Idle.index[Idle_ind]..' ----->')
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        elseif command == 'toggle Req set' then
                Requiescat_ind = Requiescat_ind +1
                if Requiescat_ind > #sets.Requiescat.index then Requiescat_ind = 1 end
                send_command('@input /echo <----- Requiescat Set changed to '..sets.Requiescat.index[Requiescat_ind]..' ----->')
        elseif command == 'toggle CDC set' then
                ChantDuCygne_ind = ChantDuCygne_ind +1
                if ChantDuCygne_ind > #sets.ChantDuCygne.index then ChantDuCygne_ind = 1 end
                send_command('@input /echo <----- Chant du Cygne Set changed to '..sets.ChantDuCygne.index[ChantDuCygne_ind]..' ----->')
        elseif command == 'toggle Rea set' then
                Realmrazer_ind = Realmrazer_ind +1
                if Realmrazer_ind > #sets.Realmrazer.index then Realmrazer_ind = 1 end
                send_command('@input /echo <----- Realmrazer Set changed to '..sets.Realmrazer.index[Realmrazer_ind]..' ----->')
	elseif command == 'toggle MB set' then
		Burst_ind = Burst_ind +1
		if Burst_ind > #sets.Burst.index then Burst_ind = 1 end
		send_command('@input /echo [MB Set changed to '..sets.Burst.index[Burst_ind]..']')
        elseif command == 'equip TP set' then
                equip(sets.TP[sets.TP.index[TP_ind]])
        elseif command == 'equip Idle set' then
                equip(sets.Idle[sets.Idle.index[Idle_ind]])
        end
end