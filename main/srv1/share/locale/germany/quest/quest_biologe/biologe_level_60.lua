-- NPCs
define QUEST_NPC 20084
define REWARD_NPC 20018

-- Items
define BIO_ITEM_1 30050
define BIO_ITEM_COUNT 20
define NEEDED_ITEM_COUNT 19
define PUSH_ITEM 71035
define BIO_SOULSTONE 30223

-- Generals
define MIN_LEVEL 60
define CHANCE 50
define CHANCE_WITH_PUSH 75
define DROP_CHANCE_SOULSTONE 1




quest biologe_level_60 begin
	state run begin
		when login or levelup with pc.get_level() >= MIN_LEVEL begin
			set_state(stage_quest_start)
		end
	end

	state stage_quest_start begin
		when login or letter begin
			send_letter("Die Forschung des Biologen 4")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Die Forschung des Biologen 4")
			sayQuestText("Der Biologe ben�tigt ein weiteres Mal deine Hilfe.")

			printQuestInfo()
			sayQuestText("Sprich mit dem Biologen.")
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Die Forschung des Biologen 4" begin
			deleteTarget(QUEST_NPC)

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText(string.format("Hallo %s, kannst du mir helfen? Ich habe die Forschungen mit den D�monenandenken abgeschlossen. Der Berg Sohan war schon immer ein wunderbarer Ort. Ich brauche die Eiskugeln von dort. Hilfst du mir bei meinen Untersuchungen?", pc.get_name()))

			printQuestInfo()
			say(string.format("Ich ben�tige %d mal eine %s.", BIO_ITEM_COUNT, item_name(BIO_ITEM_1)))
			say("M�chtest du den Auftrag jetzt beginnen?")

			local s = select("Auftrag annehmen", "Abbrechen")
			if s == 2 then return end

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText("Vielen Dank! Du findest sie bei den Eisgolems im Berg Sohan.")

			printQuestInfo()
			say(string.format("Ich ben�tige %d mal eine %s.", BIO_ITEM_COUNT, item_name(BIO_ITEM_1)))
			wait()

			setupBioQuestCounter()
			set_state(stage_1)
		end
	end

	state stage_1 begin
		when login or enter or letter begin
			send_letter("Auftrag: Eiskugeln")
		end

		when button or info begin
			printQuestHeader()
			sayQuestText(string.format("Der Biologe gab dir den Auftrag %d Eiskugeln zu sammeln.  Du findest sie bei den Eisgolems im Berg Sohan.", BIO_ITEM_COUNT))

			printQuestInfo()
			sayQuestText(string.format("Sammel alle %d Eiskugeln.", BIO_ITEM_COUNT))
			
			printQuestInfo("Hinweis:")
			sayQuestText(string.format("Du hast derzeit %s abgegeben!", pc.getqf("collectCount")))
		end

		when QUEST_NPC.chat."Auftrag: Eiskugeln" with pc.count_item(BIO_ITEM_1) > 0 begin
			local perc = number(0, 99)










			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText("Einen Moment bitte. Ah da ist er, sehr gut. Lass mich schnell mal gucken, ob ich sie gebrauchen kann...")
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
						sayQuestText(string.format("Vielen Dank f�r die %d Eiskugeln. Ich ben�tige jetzt au�erdem noch Aurtumryus Seelenstein.", BIO_ITEM_COUNT))
						wait()

						setupBioQuestCounter()
						set_state(stage_2)
					end
				else
					printQuestHeader(mob_name(QUEST_NPC))
					sayQuestText("Es tut mir leid, dieses Exemplar kann ich nicht verwenden. Bitte bringe mir ein Neues!")
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
						sayQuestText(string.format("Vielen Dank f�r die %d Eiskugeln. Ich ben�tige jetzt au�erdem noch Aurtumryus Seelenstein.", BIO_ITEM_COUNT))
						wait()

						setupBioQuestCounter()
						set_state(stage_2)
					end
				else
					printQuestHeader(mob_name(QUEST_NPC))
					sayQuestText("Es tut mir leid, dieses Exemplar kann ich nicht verwenden. Bitte bringe mir ein Neues!")
				end
			end

			pc.remove_item(BIO_ITEM_1, 1)
		end
	end

	state stage_2 begin
		when letter begin
			send_letter("Auftrag: Der Seelenstein")
			
		end

		when button or info begin
			printQuestHeader()
			sayQuestText(string.format("Du sollst als n�chstes den %s finden.", item_name(BIO_SOULSTONE)))

			printQuestInfo()
			sayQuestText("Du findest ihn bei den Eiswesen im Berg Sohan.")
		end

		when 1101.kill or 1102.kill or 1103.kill or 1104.kill or 1105.kill or 1106.kill or 1107.kill begin
			if pc.count_item(BIO_SOULSTONE) < 1 then
				local perc = number(1,100)

				if perc <= DROP_CHANCE_SOULSTONE then
					game.drop_item_with_ownership(BIO_SOULSTONE, 1)
					setTarget(QUEST_NPC)
				end
			end
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Aurtumryus Seelenstein" begin
			deleteTarget(QUEST_NPC)

			if pc.count_item(BIO_SOULSTONE) > 0 then
				printQuestHeader(mob_name(QUEST_NPC))
				sayQuestText("Dank deiner Hilfe verstehe ich nun die Legende des Aurtumryus Seelensteins. Du hast hart gek�mpft. Sprich mit Baek-Go, er wird dir helfen deine inneren Kr�fte zu steigern.")
				wait()

				pc.remove_item(BIO_SOULSTONE, 1)
				set_state(stage_quest_reward)
			end
		end
	end

	state stage_quest_reward begin
		when letter begin
			send_letter("Die Belohnung")
			setTarget(REWARD_NPC)
		end

		when button or info begin
			printQuestHeader()
			sayQuestText(string.format("Um die Belohnung des Biologen zu erhalten sprich mit %s, er wird sie dir �berreichen!", mob_name(REWARD_NPC)))
		end

		when __TARGET__.target.click or REWARD_NPC.chat."Belohnung des Biologen" begin
			deleteTarget(REWARD_NPC)

			printQuestHeader(mob_name(REWARD_NPC))
			sayQuestText("Der Biologe hat dich zu mir geschickt? Ich soll dir deine Belohnung geben? Hier ist sie, bittesch�n!")

			printQuestInfo("Belohnung:")
			say_reward("Angriffswert +50 (Dauerhaft)")
			say_reward("1x Hellgr�ner Ebenholskasten")
			wait()
			
			
			
			
			affect.add_collect(apply.ATT_GRADE_BONUS, 50, 60*60*24*365*60)
			pc.give_item2(50112, 1)
			clear_letter()
			set_quest_state("biologe_level_70", "run")
			complete_quest()
		end
	end

	state __COMPLETE__ begin
	end
end