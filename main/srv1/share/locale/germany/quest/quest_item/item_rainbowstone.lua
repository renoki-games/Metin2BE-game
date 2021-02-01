define QUEST_ITEM 50512
define MIN_SKILL_LEVEL 30
define SKILL_LEVEL_P 40

quest item_rainbowstone begin
	state start begin
		when QUEST_ITEM.use begin
			item_rainbowstone.updateGrandMasterSkill()
		end
	end

	state __FUNCTIONS__ begin
		function updateGrandMasterSkill()
			printQuestHeader("Regenbogenstein:")

			local result = BuildSkillList(pc.get_job(), pc.get_skill_group())
			local vnumList = result[1]
			local nameList = result[2]

			if item_rainbowstone.checkSkillGroup(vnumList) == false then return end
			sayQuestText("Welche Fertigkeit willst du perfektionieren?")

			local i = select_table(nameList)
			if table.getn(nameList) == i then return end

			local name = nameList[i]
			local vnum = vnumList[i]
			
			if item_rainbowstone.checkSkillLevel(vnum) == false then return end

			printQuestHeader("Regenbogenstein:")
			sayQuestText("Dieser Stein ermöglicht es dir,", true)
			sayQuestText("eine Fertigkeit ab G1 auf P zu perfektionieren!")
			sayQuestText(string.format("%s auf Perfekten Meister verbessern?", name))

			local s = select("Ja", "Nein")
			if s == 2 then return end

			printQuestHeader("Regenbogenstein:")
			sayQuestText("Einmal benutzt, ist dies nicht mehr rückgängig zu machen.", true)
			sayQuestText("Möchtest du fortfahren?")

			local c = select("Ja", "Nein")
			if 2 == c then return end

			printQuestHeader("Regenbogenstein:")
			sayQuestText("Deine Fertigkeit wurde perfektioniert!", true)
			sayQuestText("Viel Spaß weiterhin auf Metin2 - Black Edition.")

			notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. clickable_pn_tag(NAME_COLOR, pc.get_name()) .. " " .. tag(TEXT_COLOR, string.format("hat erfolgreich %s perfektioniert!", name)))

			item.remove()
			pc.set_skill_level((vnum), SKILL_LEVEL_P)
		end
		
		function checkSkillLevel(val)
			if pc.get_skill_level(val) < MIN_SKILL_LEVEL then
				printQuestHeader("Regenbogenstein:")
				sayQuestText("Deine Fertigkeit muss mindestens auf Großmeister sein!")
				return false

			elseif pc.get_skill_level(val) == SKILL_LEVEL_P then
				printQuestHeader("Regenbogenstein:")
				sayQuestText("Deine Fertigkeit ist bereits auf Perfekter Meister!")
				return false
			end
		end
		
		function checkSkillGroup(val)
			if table.getn(val) < 2 then
			sayQuestText("Du hast noch keine Fertigkeiten!")
				return false
			end
		end	
	end
end