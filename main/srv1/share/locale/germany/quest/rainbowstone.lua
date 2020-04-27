----------------------------------
--   Regenbogenstein Quest by [SA]Goku
--		(c) by [SA]Goku
----------------------------------
quest rainbowstone begin
    state start begin
            when 50512.use  begin
				
				say_title ( "Regenbogenstein" )
				say ( "Hiermit kannst du eine" ) 
				say ( "Fertigkeit deiner Wahl perfektionieren!" ) 
				say ( "" ) 
				wait ( ) 
				say_title ( "Regenbogenstein" ) 
				local result = BuildSkillList(pc.get_job(), pc.get_skill_group())

				local vnum_list = result[1]
				local name_list = result[2]

				if table.getn(vnum_list) < 2 then
				say("Es gibt keine Fertigkeiten!")
				say("")
				return
				end
				say("Welche Fertigkeit willst du perfektionieren?")
				say("")

				local i = select_table(name_list)

				if table.getn(name_list) == i then
				return
				end

				local name = name_list[i]
				local vnum = vnum_list[i]

				if pc.get_skill_level(vnum) < 30 then
					say_title("Regenbogenstein:")
					say("")
					say("Es können nur Großmeister Fertigkeiten auf")
					say("die perfekte Stufe gesetzt werden.")
					say("")
					return
				end
				
				say_title("Regenbogenstein:")
				say_reward("Dieser Stein ermöglicht es dir,")
				say_reward("deine Fertigkeit ab G1 auf P zu skillen!")
				say(string.format("%sauf Perfekten Meister?", name))
				say("")

				local s = select("Ja", "Nein")
				if 2 == s then
				return
				end

				if 1 == s then
				say_title("Regenbogenstein:")
				say("Einmal benutzt, ist dies nicht mehr rückgängig zu machen.")
				say("Trotzdem benutzen?")
				say("")

				local c = select("Ja", "Nein")

				if 2 == c then
				return
				end


				if 1 == c then
				pc.set_skill_level((vnum) ,40) 
				say_reward("Deine Fertigkeit wurde auf P gesetzt.")
				say_reward("Viel Spaß weiterhin auf unserem Server!")
				notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. clickable_pn_tag(NAME_COLOR, pc.get_name()) .. " " .. tag(TEXT_COLOR, string.format("hat erfolgreich %sauf P geskillt!", name)))
				pc.removeitem("50512", 1)
				end
			end
		end
    end
end