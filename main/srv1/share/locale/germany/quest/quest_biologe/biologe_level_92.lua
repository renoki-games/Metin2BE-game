-- NPCs
define QUEST_NPC 20091
define REWARD_NPC 20018

-- Items
define BIO_ITEM_1 30251
define BIO_ITEM_COUNT 10
define NEEDED_ITEM_COUNT 9
define PUSH_ITEM 71035

-- Generals
define MIN_LEVEL 92
define DROP_CHANCE_BIO_ITEM 1
define CHANCE 50
define CHANCE_WITH_PUSH 75





quest biologe_level_92 begin
	state run begin
		when login or levelup with pc.get_level() >= MIN_LEVEL begin
			set_state(stage_quest_start)
		end
	end

	state stage_quest_start begin
		when login or letter begin
			send_letter("Seon-Pyeongs Forschung 1")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Seon-Pyeongs Forschung 1")
			sayQuestText("Seon-Pyeong ben�tigt deine Hilfe.")

			printQuestInfo()
			sayQuestText("Sprich mit Seon-Pyeong.")
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Seon-Pyeongs Forschung 1" begin
			deleteTarget(QUEST_NPC)

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText(string.format("Hallo %s, der Biologe hat mir schon viel von dir erz�hlt! Ich w�rde dich bitten in die Grotte der Verbannung zu gehen und dort Juwele der Magie f�r mich zu sammeln. Kann ich dir den Auftrag anvertrauen?", pc.get_name()))

			printQuestInfo()
			say(string.format("Ich ben�tige %d mal ein %s.", BIO_ITEM_COUNT, item_name(BIO_ITEM_1)))
			say("M�chtest du den Auftrag jetzt beginnen?")

			local s = select("Auftrag annehmen", "Abbrechen")
			if s == 2 then return end

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText("Vielen Dank! Du findest sie bei den Setaou-Seherinnen, sowie den Setaou-Magistra in der Grotte der Verbannung.")

			printQuestInfo()
			say(string.format("Ich ben�tige %d mal ein %s.", BIO_ITEM_COUNT, item_name(BIO_ITEM_1)))
			wait()

			setupBioQuestCounter()
			set_state(stage_1)
		end
	end

	state stage_1 begin
		when login or enter or letter begin
			send_letter("Auftrag: Juwel der Magie")
		end

		when button or info begin
			printQuestHeader()
			sayQuestText(string.format("Seon-Pyeong gab dir den Auftrag %d Juwelen der Magie zu sammeln. Du findest sie bei den Setaou-Seherinnen, sowie den Setaou-Magistra in der Grotte der Verbannung.", BIO_ITEM_COUNT))

			printQuestInfo()
			sayQuestText(string.format("Sammel alle %d Juwelen der Magie.", BIO_ITEM_COUNT))
			
			printQuestInfo("Hinweis:")
			sayQuestText(string.format("Du hast derzeit %s abgegeben!", pc.getqf("collectCount")))
		end

		when kill with npc.get_race() == 2403 or npc.get_race() == 2413 begin
			local perc = number(1,100)

			if perc <= DROP_CHANCE_BIO_ITEM then
				game.drop_item_with_ownership(BIO_ITEM_1, 1)
			end
		end


		when QUEST_NPC.chat."Auftrag: Juwel der Magie" with pc.count_item(BIO_ITEM_1) > 0 begin
			local perc = number(0, 99)

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText("Einen Moment bitte. Ah da ist er, sehr gut. Lass mich schnell mal gucken, ob ich es gebrauchen kann...")
			wait()

			if pc.count_item(PUSH_ITEM) > 0 then
				printQuestHeader(mob_name(QUEST_NPC))
				sayQuestText("Du tr�gst das Elixier des Forschers bei dir! Damit kannst du die Qualit�t des Gegenstands verbessern und somit die Wahrscheinlichkeit steigern.")
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
						sayQuestText("Hervorragend, damit kann ich sehr gut arbeiten. Bring mir noch welche, damit ich meine Forschungen abschlie�en kann.")
						wait()

						printQuestHeader(mob_name(QUEST_NPC))
						updateBioQuestCounter()
						say_reward("Du hast derzeit "..pc.getqf("collectCount").." abgegeben!")
					else
						printQuestHeader(mob_name(QUEST_NPC))
						sayQuestText(string.format("Vielen Dank f�r die %d Juwel der Magie. Ich w�rde dir raten zu %s zu gehen. Er hat eine Belohnung f�r dich bereit.", BIO_ITEM_COUNT, mob_name(REWARD_NPC)))
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
						sayQuestText("Hervorragend, damit kann ich sehr gut arbeiten. Bring mir noch welche, damit ich meine Forschungen abschlie�en kann.")
						wait()


						printQuestHeader(mob_name(QUEST_NPC))
						updateBioQuestCounter()
						say_reward("Du hast derzeit "..pc.getqf("collectCount").." abgegeben!")
					else
						printQuestHeader(mob_name(QUEST_NPC))
						sayQuestText(string.format("Vielen Dank f�r die %d Juwelen der Magie. Ich w�rde dir raten zu %s zu gehen. Er hat eine Belohnung f�r dich bereit.", BIO_ITEM_COUNT, mob_name(REWARD_NPC)))
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
			sayQuestText(string.format("Um die Belohnung des Forschers zu erhalten sprich mit %s, er wird sie dir �berreichen!", mob_name(REWARD_NPC)))
		end

		when __TARGET__.target.click or REWARD_NPC.chat."Belohnung des Biologen" begin
			deleteTarget(REWARD_NPC)

			printQuestHeader(mob_name(REWARD_NPC))
			sayQuestText("Seon-Pyeong hat dich zu mir geschickt? Ich soll dir deine Belohnung geben? Hier ist sie, bittesch�n!")

			printQuestInfo("Belohnung:")
			say_reward("Max-MP: +462 (Dauerhaft)")
			wait()

			affect.add_collect(apply.MAX_SP, 462, 60*60*24*365*60)
			clear_letter()
			set_quest_state("biologe_level_94", "run")
			complete_quest()
		end
	end

	state __COMPLETE__ begin
	end
end