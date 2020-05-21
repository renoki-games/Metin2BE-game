quest soulstone begin
    state start begin
		when 50513.use begin
			say_title("Fertigkeitstraining der Groﬂmeister")
			say("")
			if pc.get_skill_group()== 0 then 
				say("Du hast noch keine Lehre gew‰hlt.")
				say("")
				return 
			end 
			if get_time()< pc.getqf("next_time")then 
				if pc.is_skill_book_no_delay()then 
					say("Da du die Exorzismus-Schriftrolle gelesen hast,")
					say("kannst du weiter trainieren, ohne eine Pause")
					say("einlegen zu m¸ssen.")
					wait()
				else
					say("Du kannst deine Fertigkeiten noch nicht weiter")
					say("trainieren. Komm sp‰ter wieder.")
					return 
				end 
			end
			local result = soulstone.BuildGrandMasterSkillList( pc.get_job(), pc.get_skill_group()) 
			local vnum_list = result [ 1 ] 
			local name_list = result [ 2 ] 
			if table.getn( vnum_list ) == 0 then 
				say("Du hast keine Fertigkeit zum Verbessern.") 
				return 
			end 
			say("Bitte w‰hle eine Fertigkeit aus, in der du den")
			say("Status des Groﬂmeisters erlangen mˆchtest.")
			local menu_list = { } 
			table.foreach( name_list , function( i , name ) table.insert( menu_list , name ) end ) 
			table.insert( menu_list , "Abbrechen")
			local s = select_table( menu_list ) 
			if table.getn( menu_list ) == s then 
				return 
			end 
			local skill_name = name_list [ s ] 
			local skill_vnum = vnum_list [ s ] 
			local skill_level = pc.get_skill_level(skill_vnum) 
			local cur_alignment = pc.get_real_alignment()
			local need_alignment = 1000 + 500 * ( skill_level - 30 ) 
			local title = string.format("%s", skill_name)
			say_title(title) 
			say("")
			say("Das Groﬂmeistertraining verbraucht Rangpunkte.")
			say("Es kann also sein, dass du in den negativen")
			say("Punktebereich f‰llst.")

			if cur_alignment < - 19000 + need_alignment then 
				say_reward("Du hast nicht gen¸gend Rangpunkte.") 
				return 
			end 
			if cur_alignment < 0 then 
				say_reward( string.format("Benˆtigte Rangpunkte: %d" , need_alignment * 2 )) 
				need_alignment = need_alignment * 2 
			elseif cur_alignment < need_alignment then
				say_reward( string.format("Benˆtigte Rangpunkte: %d" , need_alignment )) 
				say_reward("Wenn du jetzt trainierst, werden deine")
				say_reward("Rangpunkte in den negativen Bereich fallen")
			else 
				say_reward( string.format("Benˆtigte Rangpunkte: %d" , need_alignment )) 
			end 
			say("") 
			local s = select("Weiter" , "Abbrechen")
			if s == 2 then 
				return 
			end 
			if cur_alignment >= 0 and cur_alignment < need_alignment then 
				say_title( string.format("Fertigkeit perfektionieren:", title))
				say("")
				say("Wenn du jetzt eine Groﬂmeisterfertigkeit")
				say("steigerst, kˆnnten deine Rangpunkte in den")
				say("negativen Bereich fallen, da du im Moment nur")
				say("wenige besitzt. Wenn du wirklich trainieren")
				say("willst, gib das Wort 'trainieren' in die")
				say("Befehlszeile ein.")
				say("")
				say_reward("trainieren")
				say("Willst du nicht trainieren, dr¸cke einfach")
				say("'ENTER'.")

				local s = input()
				if s ~= "trainieren" then 
					return 
				end 
			end 
			if get_time()< pc.getqf("next_time")then 
				if pc.is_skill_book_no_delay()then 
					pc.remove_skill_book_no_delay()
				end 
			end 
			pc.setqf("next_time" , get_time()+ time_hour_to_sec(number(8, 12))) 
			if need_alignment > 0 then 
				if pc.learn_grand_master_skill(skill_vnum) then 
					pc.change_alignment(-need_alignment) 
					say_title(string.format("%s Groﬂmeister Fertigkeitstraining", title))
					say_reward("Erfolgreich!")
					if 40 == pc.get_skill_level( skill_vnum ) then 
						say("Herzlichen Gl¸ckwunsch! Du hast es geschafft.")
						say(string.format("%s ist nun auf Perfekter Meister.", title))
						say("")
						say("Dies bedeutet, dass du diese Fertigkeit nun")
						say("perfekt beherrschst und nicht mehr weiter")
						say("verbessern kannst.")
						notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. clickable_pn_tag(NAME_COLOR, pc.get_name()) .. " " .. tag(TEXT_COLOR, string.format("hat erfolgreich %s perfektioniert!", skill_name)))
					else
						say("Herzlichen Gl¸ckwunsch! Du hast es geschafft.")
						say("Durch das Fertigkeitstraining der Groﬂmeister")
						say(string.format("stieg %s auf Level %d.", skill_name, (skill_level - 30 + 2)))
						
						--say(string.format("Deine Fertigkeit %s hat", skill_name))
						--say(string.format("Stufe G%d erreicht!", (skill_level - 30 + 1)))
					end 
					say("") 
					say_reward("Du hast dein Level erfolgreich gesteigert!")
					say_reward( string.format("Du hast %d Rangpunkte verbraucht" , need_alignment )) 
					say("") 
				else 
					say_title(string.format("%s Groﬂmeister Fertigkeitstraining" , title ))
					say_reward("Fehlgeschlagen!")
					say("")
					say("Du hast deine Fertigkeiten nicht verbessern")
					say("kˆnnen.")
					say("")
					say_reward("Du hast einige Rangpunkte verloren")
					say_reward("und den Seelenstein verbraucht.")

					pc.change_alignment(-number(need_alignment/3 , need_alignment/2)) 
				end 
			end 

			pc.remove_item(50513, 1)
		end
		function BuildGrandMasterSkillList(job, group)
			GRAND_MASTER_SKILL_LEVEL = 30
			PERFECT_MASTER_SKILL_LEVEL = 40

			local skill_list = special.active_skill_list[job+1][group]
			local ret_vnum_list = {}
			local ret_name_list = {}

			table.foreach(skill_list, 
				function(i, skill_vnum) 
				local skill_level = pc.get_skill_level(skill_vnum)
				if skill_level >= GRAND_MASTER_SKILL_LEVEL and skill_level < PERFECT_MASTER_SKILL_LEVEL then
					table.insert(ret_vnum_list, skill_vnum)
					local name=locale.GM_SKILL_NAME_DICT[skill_vnum]
					if name == nil then name=skill_vnum end
					table.insert(ret_name_list, name)
				end
			end)
			return {ret_vnum_list, ret_name_list}
		end
    end
end
