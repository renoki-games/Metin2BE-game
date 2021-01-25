-- NPCs
define QUEST_NPC 20091
define REWARD_NPC 20018

-- Items
define BIO_ITEM_1 30253
define BIO_ITEM_COUNT 10
define NEEDED_ITEM_COUNT 9
define PUSH_ITEM 71035

-- Generals
define MIN_LEVEL 96
define DROP_CHANCE_BIO_ITEM 1
define CHANCE 50
define CHANCE_WITH_PUSH 75





quest biologe_level_96 begin
	state run begin
		when login or levelup with pc.get_level() >= MIN_LEVEL begin
			set_state(stage_quest_start)
		end
	end

	state stage_quest_start begin
		when login or letter begin
			send_letter("Seon-Pyeongs Forschung 3")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Seon-Pyeongs Forschung 3")
			sayQuestText("Seon-Pyeong benötigt ein weiteres Mal deine Hilfe.")

			printQuestInfo()
			sayQuestText("Sprich mit Seon-Pyeong.")
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Seon-Pyeongs Forschung 3" begin
			deleteTarget(QUEST_NPC)

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText(string.format("Hallo %s, Ich bräuchte ein weiteres Mal deine Hilfe, kann ich dir vertrauen? Ich suche Juwelen des Angriffs. Sie sollen deine Angriffskraft extrem erhöhen können. Ich benötige %d Stück davon.", pc.get_name(), BIO_ITEM_COUNT))

			printQuestInfo()
			say(string.format("Ich benötige %d mal ein %s.", BIO_ITEM_COUNT, item_name(BIO_ITEM_1)))
			say("Möchtest du den Auftrag jetzt beginnen?")

			local s = select("Auftrag annehmen", "Abbrechen")
			if s == 2 then return end

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText("Vielen Dank! Du findest sie bei den Setaou-Jägern, sowie den Setaou-Bogenschützen in der Grotte der Verbannung.")

			printQuestInfo()
			say(string.format("Ich benötige %d mal ein %s.", BIO_ITEM_COUNT, item_name(BIO_ITEM_1)))
			wait()

			setupBioQuestCounter()
			set_state(stage_1)
		end
	end

	state stage_1 begin
		when login or enter or letter begin
			send_letter("Auftrag: Juwel des Angriffs")
		end

		when button or info begin
			printQuestHeader()
			sayQuestText(string.format("Seon-Pyeong gab dir den Auftrag %d Juwelen des Angriffs zu sammeln. Du findest sie bei den Setaou-Jägern, sowie den Setaou-Bogenschützen in der Grotte der Verbannung.", BIO_ITEM_COUNT))

			printQuestInfo()
			sayQuestText(string.format("Sammel alle %d Juwelen des Angriffs.", BIO_ITEM_COUNT))
			
			printQuestInfo("Hinweis:")
			sayQuestText(string.format("Du hast derzeit %s abgegeben!", pc.getqf("collectCount")))
		end

		when kill with npc.get_race() == 2402 or npc.get_race() == 2412 begin
			local perc = number(1,100)

			if perc <= DROP_CHANCE_BIO_ITEM then
				game.drop_item_with_ownership(BIO_ITEM_1, 1)
			end
		end


		when QUEST_NPC.chat."Auftrag: Juwel des Angriffs" with pc.count_item(BIO_ITEM_1) > 0 begin
			local perc = number(0, 99)

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText("Einen Moment bitte. Ah da ist er, sehr gut. Lass mich schnell mal gucken, ob ich es gebrauchen kann...")
			wait()

			if pc.count_item(PUSH_ITEM) > 0 then
				printQuestHeader(mob_name(QUEST_NPC))
				sayQuestText("Du trägst das Elixier des Forschers bei dir! Damit kannst du die Qualität des Gegenstands verbessern und somit die Wahrscheinlichkeit steigern.")
				say_item_vnum(PUSH_ITEM)

				local s = select("Verwenden", "Abbrechen")
				if s == 2 then return end

				pc.setqf("playerGotMoreChance", 1)
				pc.remove_item(PUSH_ITEM, 1)
			end

			if pc.getqf("playerGotMoreChance") == 0 then
				if perc <= CHANCE then
					if getBioQuestCount() < NEEDED_ITEM_COUNT then
						printQuestHeader(mob_name(QUEST_NPC))
						sayQuestText("Hervorragend, damit kann ich sehr gut arbeiten. Bring mir noch welche, damit ich meine Forschungen abschließen kann.")
						wait()

						printQuestHeader(mob_name(QUEST_NPC))
						updateBioQuestCounter()
						say_reward("Du hast derzeit "..pc.getqf("collectCount").." abgegeben!")
					else
						printQuestHeader(mob_name(QUEST_NPC))
						sayQuestText(string.format("Vielen Dank für die %d Juwel der Angriffs. Ich würde dir raten zu %s zu gehen. Er hat eine Belohnung für dich bereit.", BIO_ITEM_COUNT, mob_name(REWARD_NPC)))
						wait()

						setupBioQuestCounter()
						set_state(stage_quest_reward)
					end
				else
					printQuestHeader(mob_name(QUEST_NPC))
					sayQuestText("Es tut mir leid, dieses Exemplar kann ich nicht verwenden. Bitte bringe mir weitere!")
				end
			elseif pc.getqf("playerGotMoreChance") == 1 then
				if perc <= CHANCE_WITH_PUSH then
					if getBioQuestCount() < NEEDED_ITEM_COUNT then
						printQuestHeader(mob_name(QUEST_NPC))
						sayQuestText("Hervorragend, damit kann ich sehr gut arbeiten. Bring mir noch welche, damit ich meine Forschungen abschließen kann.")
						wait()


						printQuestHeader(mob_name(QUEST_NPC))
						updateBioQuestCounter()
						say_reward("Du hast derzeit "..pc.getqf("collectCount").." abgegeben!")
					else
						printQuestHeader(mob_name(QUEST_NPC))
						sayQuestText(string.format("Vielen Dank für die %d Juwelen der Angriffs. Ich würde dir raten zu %s zu gehen. Er hat eine Belohnung für dich bereit.", BIO_ITEM_COUNT, mob_name(REWARD_NPC)))
						wait()

						setupBioQuestCounter()
						set_state(stage_quest_reward)
					end
				else
					printQuestHeader(mob_name(QUEST_NPC))
					sayQuestText("Es tut mir leid, dieses Exemplar kann ich nicht verwenden. Bitte bringe mir weitere!")
				end
			end
			
			pc.remove_item(BIO_ITEM_1, 1)
		end
	end

	state stage_quest_reward begin
		when letter begin
			send_letter("Die Belohnung")
			setTarget(REWARD_NPC)
		end

		when button or info begin
			printQuestHeader()
			sayQuestText(string.format("Um die Belohnung des Forschers zu erhalten sprich mit %s, er wird sie dir überreichen!", mob_name(REWARD_NPC)))
		end

		when __TARGET__.target.click or REWARD_NPC.chat."Belohnung des Biologen" begin
			deleteTarget(REWARD_NPC)

			printQuestHeader(mob_name(REWARD_NPC))
			sayQuestText("Seon-Pyeong hat dich zu mir geschickt? Ich soll dir deine Belohnung geben? Hier ist sie, bitteschön!")

			printQuestInfo("Belohnung:")
			say_reward("Angriff: +110 (Dauerhaft)")
			wait()

			affect.add_collect(apply.ATT_GRADE_BONUS, 110, 60*60*24*365*60)
			clear_letter()
			set_quest_state("biologe_level_98", "run")
			complete_quest()
		end
	end

	state __COMPLETE__ begin
	end
end