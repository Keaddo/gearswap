function get_sets()

	Cities = S{
                        "Ru'Lude Gardens","Upper Jeuno","Lower Jeuno","Port Jeuno",
                        "Port Windurst","Windurst Waters","Windurst Woods","Windurst Walls","Heavens Tower",
                        "Port San d'Oria","Northern San d'Oria","Southern San d'Oria",
                        "Port Bastok","Bastok Markets","Bastok Mines","Metalworks",
                        "Aht Urhgan Whitegate","Nashmau","Tavanazian Safehold",
                        "Selbina","Mhaura","Norg","Eastern Adoulin","Western Adoulin","Kazham","Tavnazia"}	


	-- gear
	refresh_hands = { name="Herculean Gloves", augments={'Magic burst mdg.+7%','Enmity-2','"Refresh"+1','Accuracy+13 Attack+13',}}
	dt_head = { name="Herculean Helm", augments={'Accuracy+3 Attack+3','Phys. dmg. taken -4%','Accuracy+9','Attack+5',}}
	dt_feet = { name="Herculean Boots", augments={'STR+14','Rng. Atk.+20','Damage taken -4%',}}
	tp_feet = { name="Herculean Boots", augments={'STR+9','Accuracy+20','Triple Atk.+4',}}
	tp_acc_feet = { name="Herculean Boots", augments={'Accuracy+30','Triple Atk.+3',}}
	str_hands = { name="Herculean Gloves", augments={'Accuracy+23 Attack+23','Crit.hit rate+1','STR+10','Attack+5',}}
				
				--Idle Sets--
				sets.Idle = {               
					ammo="Homiliary",
					head="Erilaz Galea +1",
					neck="Sanctity Necklace",
					ear1="Infused Earring",
					ear2="Ethereal Earring",   
					body="Futhark coat +1",
					hands=refresh_hands,
					ring2="Paguroidea Ring",
					ring1="Sheltered Ring",     
					back="Evasionist's Cape",
					waist="Flume Belt +1",
					legs="Carmine Cuisses +1",
					feet=dt_feet
				}   
				
				sets.Town = set_combine(sets.Idle,{
					body="Runeist Coat +1",
					ear1="Etiolation Earring",
					neck="Loricate Torque +1",
					ring1="Defending Ring",
					ring2="Weatherspoon Ring",
					waist="Flume Belt +1",
					back="Ogma's Cape"
				})
                                   
                --TP Sets--
                sets.TP = {}
                sets.TP.index = {'Standard', 'Accuracy', 'DTacc'}
                TP_ind = 1
				
                --offensive melee set
				
                sets.TP.Standard = {        
					ammo="Ginsen",
					head="Adhemar Bonnet",
					neck="Asperity Necklace",
					ear1="Brutal Earring",
					ear2="Cessance Earring",
					body="Adhemar Jacket",
					hands="Adhemar Wristbands",
					ring1="Epona's Ring",
					ring2="Petrov Ring",
					back="Bleating Mantle",
					waist="Windbuffet Belt +1",
					legs="Samnuha Tights",
					feet=tp_feet
				}    
					
                --high accuracy/DT hybrid set
				
                sets.TP.Accuracy = {        
					ammo="Falcon Eye",
					head="Dampening Tam",
					neck="Twilight Torque",
					ear1="Dignitary Earring",
					ear2="Cessance Earring",      
					body="Emet Harness +1",
					hands="Erilaz Gauntlets +1",
					ring2="Patricius Ring",
					ring1="Defending Ring",   
					back="Evasionist's Cape",
					waist="Olseni Belt",
					legs="Taeon Tights",
					feet=tp_acc_feet
				}   
					                
				
                --DT acc melee set
				
                sets.TP.DTacc = {          ammo="Falcon Eye",          
                                    head="Dampening Tam",neck="Twilight Torque",ear1="Steelflash Earring",ear2="Zennaroi Earring",          
                                    body="Rawhide Vest",hands="Erilaz Gauntlets +1",ring1="Shadow Ring",ring2="Defending Ring",         
                                    back="Evasionist's Cape",waist="Olseni Belt",legs="Runeist Trousers +1",feet="Taeon Boots"}         
 
    sets.misc = {}
    sets.misc.DT = {}
    sets.misc.DT.None = {}
    sets.misc.DT.Active = {
					ammo="Vanir Battery",			-- 4 MDEF     
					head="Erilaz Galea +1",			-- 
					neck="Loricate Torque +1",		-- 6 DT
					ear1="Eabani Earring",			-- 8 meva
					ear2="Genmei Earring",			-- 2 PDT 
					body="Futhark Coat +1",			-- 7 DT
					hands="Kurys Gloves",			-- 2 DT
					ring2="Patricius Ring",			-- 5 PDT
					ring1="Defending Ring",			-- 10 DT
					back="Ogma's Cape",				-- (5 DT 3 PDT)
					waist="Flume Belt +1",			-- 4 PDT
					legs="Erilaz Leg Guards +1",	-- 7 PDT
					feet="Erilaz Greaves +1"		-- 5 PDT
				}  
			
													-- 25 DT + 23 PDT + 5% PDT2 + 3 DT grip
			
    sets.misc.Movement = {
        legs="Carmine Cuisses +1"}

 
                --Weaponskill Sets--
				
                sets.WS = {}     
				
                --multi, carries FTP
				
                sets.Resolution = {                     
					ammo="Seething Bomblet +1",             
					head="Adhemar Bonnet",
					neck="Fotia Gorget",
					ear2="Brutal earring",
					ear1="Moonshade Earring",
					body="Adhemar Jacket",
					hands=str_hands,
					ring1="Epona's Ring",
					ring2="Rajas Ring",
					back="Bleating Mantle",
					waist="Fotia Belt",
					legs="Samnuha Tights",
					feet=dt_feet
				} 
				
                --single, doesn't carry FTP
				
                sets.Single = {                         
					ammo="Seething Bomblet +1",             
					head="Adhemar Bonnet",
					neck="Fotia Gorget",
					ear2="Brutal earring",
					ear1="Moonshade Earring",
					body="Adhemar Jacket",
					hands="Adhemar Wristbands",
					ring1="Epona's Ring",
					ring2="Rajas Ring",
					back="Evasionist's Cape",
					waist="Fotia Belt",
					legs="Samnuha Tights",
					feet="Thereoid Greaves"
				}  
					
                --single hit, benefits from DA
                sets.Cleave = {
					ammo="Seething Bomblet +1",             
					head="Adhemar Bonnet",
					neck="Fotia Gorget",
					ear2="Brutal earring",
					ear1="Moonshade Earring",
					body="Adhemar Jacket",
					hands="Adhemar Wristbands",
					ring1="Epona's Ring",
					ring2="Rajas Ring",
					back="Evasionist's Cape",
					waist="Fotia Belt",
					legs="Samnuha Tights",
					feet=dt_feet
				}
				
                --added effect
				
                sets.Shockwave = {                      
					ammo="Falcon Eye",       
					head="Adhemar Bonnet",
					neck="Fotia Gorget",
					ear2="Brutal earring",
					ear1="Moonshade Earring",
					body="Adhemar Jacket",
					hands="Adhemar Wristbands",
					ring1="Epona's Ring",
					ring2="Rajas Ring",
					back="Evasionist's Cape",
					waist="Fotia Belt",
					legs="Samnuha Tights",
					feet=dt_feet}  
					
                --Requiescat
				
                sets.Req = {
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
                --crit based
                sets.Vorp = {                           ammo="Qirmiz Tathlum",
                                          head="Dampening Tam",neck="Fotia Gorget",ear1="Brutal earring",ear2="Moonshade Earring",
                                          body="Rawhide Vest",hands="Rawhide Gloves",ring1="Epona's Ring",ring2="Rajas Ring",
                                          back="Evasionist's Cape",waist="Fotia Belt",legs="Lustratio Subligar +1",feet="Lustratio Leggings +1"}
                --magic WS
                sets.HercSlash = {                      ammo="Seething Bomblet +1",
                                          head="Highwing Helm",neck="Deviant Necklace",lear="Hecate's Earring",rear="Friomisi earring",
                                          body="Samnuha Coat",hands="Leyline Gloves",ring1="Acumen Ring",
                                          back="Argochampsa Mantle",waist="Eschan Stone",legs="Limbo Trousers",feet="Adhemar Gamashes"}  
                 
                sets.Utility = {}   
				
                --full PDT set for when stunned, etc.
				
                sets.Utility.PDT =  set_combine(sets.misc.DT.Active,{
				})       
				
                --full MDT set for when stunned, etc
				
                sets.Utility.MDT = set_combine(sets.misc.DT.Active,{
				})
				
				sets.Utility.Enhancing = {
				head="Erilaz Galea +1",
				hands="Runeist Mitons +1",
				waist="Olympus Sash",
				legs="Futhark Trousers +1"
				}
				
				sets.Utility.Doom = {
				waist = "Gishdubar Sash",
				ring1 = "Saida Ring"
				}
                         
                --Job Ability Sets--
                sets.JA = {}
                sets.JA.Lunge = {
					ammo="Seething Bomblet +1",
					head="Highwing Helm",
					neck="Deviant Necklace",
					lear="Hecate's Earring",
					rear="Friomisi earring",      
					body="Samnuha Coat",
					hands="Leyline Gloves",
					ring1="Acumen Ring",                         
					back="Toro Cape",
					waist="Eschan Stone",
					legs="Limbo Trousers",
					feet="Adhemar Gamashes"
				}
				
                sets.JA.Vallation = {body="Runeist Coat +1",legs="Futhark Trousers +1", back="Ogma's Cape"}       
                sets.JA.Gambit = {hands="Runeist mitons +1"}
                sets.JA.Rayke = {feet="Futhark bottes +1"}  
                sets.JA.Battuta = {head="Futhark bandeau +1"}      
                sets.JA.Pflug = {feet="Runeist bottes +1"}              
                sets.JA.Pulse = {head="Erilaz Galea +1",legs="Runeist Trousers +1"}
                                
                --Precast Sets--
                -- Cast set
				
                sets.precast = {
					ammo = "Sapience Orb",
					head="Runeist bandeau +1",
					body="Samnuha Coat",
					hands="Leyline Gloves",
					legs="Limbo Trousers",
					ear1="Etiolation Earring",
					ear2="Loquacious Earring",
					ring1="Prolix Ring",
					ring2="Weatherspoon Ring"
				}
				
                sets.Phalanx = {
					head="Futhark bandeau +1",
					legs="Futhark Trousers +1"
				}
				
                --Enmity set for high hate generating spells and JAs                
                sets.Enmity =  {
					ammo = "Sapience Orb",			-- 2 
					head="Rabid Visor",				-- 6
					neck="Unmoving Collar",			-- 9
					ear1="Friomisi earring",		-- 2 
					body="Emet Harness",			-- 9
					hands="Kurys Gloves",			-- 9             
					back="Ogma's Cape",				-- 10 
					legs="Erilaz Leg Guards +1",	-- 11
					feet="Erilaz Greaves +1",		-- 6
					ring1="Petrov Ring",			-- 4
					ring2="Begrudging Ring"			-- 5 
				}
					
										-- TOTAL ENMITY: 73  
										
                --Magic acc for enfeebles, handy for VW
                sets.MagicAcc = {head="Dampening Tam",ear1="Gwati Earring",
                                body="Samnuha Coat",hands="Leyline Gloves",
                                waist="Salire Belt",legs="Runeist Trousers +1",feet="Iuitl Gaiters +1"}             
                 
                --Toggle TP sets button, change if you want; currently ALT+F9 toggles forward, CTRL+F9 toggles backwards
                send_command('bind f9 gs c toggle TP set')
				windower.send_command('bind f10 gs c dt_mode')
               -- send_command('bind ^f9 gs c reverse TP set')
				dt_mode = 'None'
                --other stuff, don't touch
                ShadowType = 'None'
end
 
 	function file_unload()
	
         send_command('unbind f9')
        send_command('unbind f10')
        send_command('unbind ^1')
        send_command('unbind !f12')
		send_command('unbind !`')
		
		end
 
--the following section looks at the weather/day to see if the Hachirin-no-Obi is worth using
--add the following line to a section to have it check the element and equip the obi:
-->>>  mid_obi(spell.element,spell.name)
function mid_obi(spelement,spellname)
    if spelement == nil then
    spelement = "Light"
    end
    if spellname == nil then
    spellname = "Cure"
    end   
    elements = {}
        elements.list = S{'Fire','Ice','Wind','Earth','Lightning','Water','Light','Dark'}
        elements.number = {[0]="Fire",[1]="Ice",[2]="Wind",[3]="Earth",[4]="Lightning",[5]="Water",[6]="Light",[7]="Dark"}
        elements.weak = {['Light']='Dark', ['Dark']='Light', ['Fire']='Water', ['Ice']='Fire', ['Wind']='Ice', ['Earth']='Wind',
    ['Lightning']='Earth', ['Water']='Lightning'}
        weather = world.weather_element
        intensity = 1 + (world.weather_id % 2)
        day = world.day
        boost = 0
        obi = nil
        
       for _,buff in pairs (windower.ffxi.get_player().buffs) do
            if buff > 177 and buff < 186 then
                weather = elements.number[(buff - 178)]
                intensity = 1
            elseif buff > 588 and buff < 597 then
                weather = elements.number[(buff - 589)]
                intensity = 2
            end
            if spellname == "Swipe" or spellname == "Lunge" or spellname == "Vivacious Pulse" then
                if buff > 522 and buff < 531 then
                spelement = elements.number[(buff - 523)]
                end
            end
        end
        if weather == spelement then
        boost = boost + intensity
        elseif weather == elements.weak[spelement] then
        boost = boost - intensity
        end
        if day == spelement then
        boost = boost + 1
        elseif day == elements.weak[spelement] then
        boost = boost - 1
        end
        if boost > 0 then
            if player.inventory["Hachirin-no-Obi"] or player.wardrobe["Hachirin-no-Obi"] then
                equip({waist="Hachirin-no-Obi"})
            end
        end
end
                
function precast(spell,abil)
        --equips favorite weapon if disarmed
        if player.equipment.main == "empty" or player.equipment.sub == "empty" then
                equip({main="Epeolatry",sub="Bloodrain Strap"})
        end
        if spell.action_type == 'Magic' then 
                equip(sets.Utility.PDT,sets.precast)            
        end  
        if spell.skill == 'Enhancing Magic' then
                equip({legs="Futhark Trousers +1"})
        end
		if spell.name == 'Refresh' then
				equip({waist="Gishdubar Sash"})
		end
        if string.find(spell.name,'Utsusemi') then
                equip({neck="Magoraga Beads"})
        end  
        if spell.name == 'Lunge' or spell.name == 'Swipe' then
                equip(sets.JA.Lunge)
                mid_obi(spell.element,spell.name)
        end      
        --prevents Valiance/Vallation/Liement from being prevented by each other (cancels whichever is active)
        if spell.name == 'Valiance' or spell.name == 'Vallation' or spell.name == 'Liement' then
                if buffactive['Valiance'] then
                    cast_delay(0.2)
                    windower.ffxi.cancel_buff(535)
                elseif buffactive['Vallation'] then
                    cast_delay(0.2)
                    windower.ffxi.cancel_buff(531)
                elseif buffactive['Liement'] then
                    cast_delay(0.2)
                    windower.ffxi.cancel_buff(537)
                end
        end
        if spell.name == 'Vallation' or spell.name == 'Valiance' then
                equip(sets.Enmity,sets.JA.Vallation)
        end  
        if spell.name == 'Pflug' then
                equip(sets.Enmity,sets.JA.Pflug)
        end      
        if spell.name == 'Elemental Sforzo' or spell.name == 'Liement' then
                equip(sets.Enmity,{body="Futhark Coat +1"})
        end      
        if spell.name == 'Gambit' then
                equip(sets.Enmity,sets.JA.Gambit)
        end
        if spell.name == 'Rayke' then
                equip(sets.Enmity,sets.JA.Rayke)
        end
        if spell.name == 'Battuta' then
                equip(sets.Enmity,sets.JA.Battuta)
        end
        if spell.name == 'Vivacious Pulse' then
                equip(sets.Enmity,sets.JA.Pulse)
                mid_obi(spell.element,spell.name)
        end
        if spell.name == 'One for All' or spell.name == 'Embolden' or spell.name == 'Odyllic Subterfuge' or spell.name == 'Warcry' 
        or spell.name == 'Swordplay' or spell.name == 'Rayke' or spell.name == 'Meditate' or spell.name == 'Provoke' then   
                equip(sets.Enmity)
        end
        if spell.name == 'Resolution' or spell.name == 'Ruinator'  then
                equip(sets.Resolution)
        end
        if spell.name == 'Spinning Slash' 
        or spell.name == 'Ground Strike'
        or spell.name == 'Upheaval' 
        or spell.name == 'Dimidiation' 
        or spell.name == 'Steel Cyclone'    
        or spell.name == 'Savage Blade' then
                equip(sets.Single)
        end
        if spell.name == 'Shockwave' then
            equip(sets.Shockwave)
        end
        if spell.name == 'Fell Cleave' or spell.name == 'Circle Blade' then
                equip(sets.Cleave)
        end
        if spell.name == 'Requiescat' then
                equip(sets.Req)
        end
        if spell.name == 'Vorpal Blade' or spell.name == 'Rampage' then
                equip(sets.Vorp)
        end
        if spell.name == 'Herculean Slash' 
        or spell.name == 'Freezebite'  
        or spell.name == 'Sanguine Blade' 
        or spell.name == 'Red Lotus Blade'
        or spell.name == 'Seraph Blade' then
                equip(sets.HercSlash)
                mid_obi(spell.element,spell.name)
        end
        --prevents casting Utsusemi if you already have 3 or more shadows
        if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' and (buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) then
            cancel_spell()
        end
        if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
                if TP_ind == 4 then
                equip(sets.Utility.MDT) else
                equip(sets.Utility.PDT)
                end
        end
        if buffactive.sleep and player.hp > 100 and player.status == "Engaged" then 
                equip({head="Frenzy Sallet"})
        end
		if buffactive['doom'] then
				equip(sets.Utility.Doom)
		end
end            
  
function midcast(spell,act,arg) 
        if spell.action_type == 'Magic' then 
                equip(sets.Utility.PDT,{head="Runeist bandeau +1"})         
        end  
        if spell.skill == 'Enhancing Magic' then
                equip(sets.Utility.Enhancing)
                if spell.name == "Blink" or spell.name == "Stoneskin" or string.find(spell.name,'Utsusemi') then
                    equip(sets.Utility.PDT,{head="Runeist bandeau +1",hands="Leyline Gloves"})
                elseif string.find(spell.name,'Bar') or spell.name=="Temper" then
                    equip({hands="Runeist Mitons +1"})
                end
                if buffactive.embolden then
                    equip({back="Evasionist's Cape"})
                end 
        end
        if spell.name == 'Foil' or spell.name == 'Flash' or spell.name == "Stun" then 
                equip(sets.Enmity,{head="Runeist bandeau +1"})
        end 
        if spell.name == 'Phalanx' then
                equip(sets.Phalanx)
        end      
        if string.find(spell.name,'Regen') then
                equip({head="Runeist bandeau +1"})
        end
        if spell.name == "Repose" or spell.skill == 'Enfeebling Magic' or spell.skill == 'Dark Magic' then
                equip(sets.MagicAcc)
        end
        if spell.skill == 'Elemental Magic' then
                equip(sets.JA.Lunge)
                mid_obi(spell.element,spell.name)
        end
        --cancels Ni shadows (if there are only 1 or 2) when casting Ichi
        if spell.name == 'Utsusemi: Ichi' and ShadowType == 'Ni' and (buffactive['Copy Image'] or buffactive['Copy Image (2)']) then
                send_command('cancel Copy Image')
                send_command('cancel Copy Image (2)')
        end
end
 
function aftercast(spell)
	    if Cities:contains(world.area) then
						equip(sets.Town)
		else
        equip_current()
		end
        if string.find(spell.name,'Utsusemi') and not spell.interrupted then
            if spell.name == 'Utsusemi: Ichi' then
            ShadowType = 'Ichi'
            elseif spell.name == 'Utsusemi: Ni' then
            ShadowType = 'Ni'
            end
        end
end
 
function status_change(new,old)
		if Cities:contains(world.area) then
			equip(sets.Town)
		else
			equip_current()
			end
end 
  
function equip_TP()
    equip(sets.TP[sets.TP.index[TP_ind]])
        --equips offensive gear despite being on defensive set if you have shadows
        if TP_ind == 3 and ((buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) or buffactive['Third Eye'] or buffactive['Blink']) then
            equip(sets.TP.Accuracy)
        end
        --equips DW gear if using two weapons
        if player.equipment.sub == "Emxgha" or player.equipment.sub == "Usonmunku" or player.equipment.sub == "Vampirism" then
            equip({ear1="Suppanomimi", ear2="Eabani Earring"})
        end
        --equips offensive gear and relic boots during Battuta
        if buffactive.battuta then
            --remains on defensive set if Avoidance Down is active
            if buffactive['Avoidance Down'] then
            else
                if TP_ind == 3 then
                    equip(sets.TP.Accuracy)
                end
            equip({feet="Futhark Boots +1"})
            end
        end
        --equip defensive gear when hit with terror/petrify/stun/sleep
        if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
                if TP_ind == 4 then
                equip(sets.Utility.MDT) else
                equip(sets.Utility.PDT)
                end
        end
        --equip Frenzy Sallet (will wake you up) if engaged, slept, and over 100 HP
        if buffactive.sleep and player.hp > 100 then 
            equip({head="Frenzy Sallet"})
        end
		-- equip cursna gear if hit by doom
		if buffactive['doom'] then
			equip(sets.Utility.Doom)
		end
end
 
function equip_idle()
    equip(sets.Idle)
        --equips extra refresh gear when MP is below 75%
        if player.mpp < 75 then
            equip({body="Runeist Coat +1"})
        end
        --auto-equip defensive gear when hit with terror/petrify/stun/sleep
        if buffactive['terror'] or buffactive['petrification'] or buffactive['stun'] or buffactive['sleep'] then
                if TP_ind == 4 then
                equip(sets.Utility.MDT) else
                equip(sets.Utility.PDT)
                end
        end
		if buffactive['doom'] then
			equip(sets.Utility.Doom)
		end
end
 
function buff_change(buff,gain)
    local buff = string.lower(buff)
        if buff == "terror" or buff == "petrification" or buff == "stun" or buff == "sleep" then
            if gain then  
                if TP_ind == 4 then
                equip(sets.Utility.MDT) else
                equip(sets.Utility.PDT)
                end
                if buff == "sleep" and player.hp > 100 and player.status == "Engaged" then 
                equip({head="Frenzy Sallet"})
                end
            else 
            equip_current()
            end
        end
end
 
function equip_current()
        if player.status == 'Engaged' then
        equip(equip_TP(), sets.misc.DT[dt_mode])
        else
        equip(equip_idle(), sets.misc.DT[dt_mode], sets.misc.Movement)
        end
end
             
function self_command(command)
        if command == 'toggle TP set' then
                TP_ind = TP_ind +1
                if TP_ind > #sets.TP.index then TP_ind = 1 end
                send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
                equip_current()
        elseif command == 'reverse TP set' then
                TP_ind = TP_ind -1
                if TP_ind == 0 then TP_ind = #sets.TP.index end
                send_command('@input /echo <----- TP Set changed to '..sets.TP.index[TP_ind]..' ----->')
                equip_current()
		elseif command == 'dt_mode' then
        if dt_mode == 'None' then
            dt_mode = 'Active'
        else
            dt_mode = 'None'
        end
        windower.add_to_chat(8,'Damage taken set to: '..dt_mode)
        equip_current()
						end
end