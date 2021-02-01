-- Generals
define START_SKILL_LEVEL 20
define APPRENTICE_CHEST_LV_1 50187
define APPRENTICE_CHEST_LV_10 50188
define APPRENTICE_CHEST_LV_20 50189
define APPRENTICE_CHEST_LV_30 50190
define APPRENTICE_CHEST_LV_40 50191
define APPRENTICE_CHEST_LV_50 50192
define APPRENTICE_CHEST_LV_60 50193
define APPRENTICE_CHEST_LV_70 50194
define APPRENTICE_CHEST_LV_80 50195
define APPRENTICE_CHEST_LV_90 50196
define APPRENTICE_CHEST_LV_100 50197

quest apprentice_chests begin
	state start begin
		when login begin
			printQuestHeader("Herzlich Willkommen in der Welt von Metin2 - Black Edition")
			sayQuestText(string.format("Hallo %s, du erhälst von uns dein Starterset.", pc.get_name()), true)
			sayQuestText("Hier mal ein paar kleine Informationen zum Start:")
			say_title("Wie farmst du richtig Yang?")
			say("- Fertigkeitsbuch: 50K Yang")
			say("- Geiststein: 20K - 2KK Yang")
			say("- Verwandlungskugel: 2KK Yang")
			printQuestHeader("Einfach bei einem NPC verkaufen.")

			sayQuestText("Wir wünschen dir viel Spaß! :)", true)
			printQuestHeader("Dein M2BE Team <3")

			apprentice_chests.giveStartSkills(START_SKILL_LEVEL)
			apprentice_chests.giveStartNotice(APPRENTICE_CHEST_LV_1)
			set_state(stage_apprentice_chest)
		end
	end

	state stage_apprentice_chest begin
		when APPRENTICE_CHEST_LV_1.use or APPRENTICE_CHEST_LV_10.use or APPRENTICE_CHEST_LV_20.use or APPRENTICE_CHEST_LV_30.use or APPRENTICE_CHEST_LV_40.use or APPRENTICE_CHEST_LV_50.use or APPRENTICE_CHEST_LV_60.use or APPRENTICE_CHEST_LV_70.use or APPRENTICE_CHEST_LV_80.use or APPRENTICE_CHEST_LV_90.use or APPRENTICE_CHEST_LV_100.use begin
			apprentice_chests.giveApprenticeChests(item.vnum)
		end
	end

	state __FUNCTIONS__ begin
		function giveStartSkills(val)
			pc.set_skill_level(126, val)
			pc.set_skill_level(127, val)
			pc.set_skill_level(128, val)
		end

		function giveStartNotice(itemVnum)
			pcName = clickable_pn_tag(NAME_COLOR, pc.get_name())
			pcJob = ({"Krieger","Ninja","Sura","Schamanen"})[pc.job+1]
			pcEmpire = ({"Shinsoo","Chunjo","Jinno"})[pc.get_empire()]
		
			text = string.format("|cffa7ffd4Wir begrüßen|r %s |cffa7ffd4als neuen %s in %s. Herzlich Willkommen!|r", pcName, pcJob, pcEmpire)
			notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. text)

			pc.give_item2(itemVnum, 1)
		end

		function giveApprenticeChests(vnum)
			local tab = itemChestTable()
			local chestVnum = vnum
			local minLevel = tab[chestVnum]["LEVEL"]
			local getItems = tab[chestVnum]["ITEMS"]

			if pc.get_level() >= minLevel then

				if chestVnum == APPRENTICE_CHEST_LV_1 then
					local job = pc.get_job()+1
					local getRaceItems = tab[chestVnum]["RACE"][job]

					table.foreach(getRaceItems,
						function(r, b)
							pc.give_item2(b[1], b[2])
						end
					)
				end

				table.foreach(getItems,
					function(i, p)
						pc.give_item2(p[1], p[2])
					end
				)

				item.remove()
			else
				chat(string.format("Du musst für diese Truhe mindestens Level %d sein!", tab[chestVnum]["LEVEL"]))
			end
		end
	end
end