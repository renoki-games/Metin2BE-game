-- NPCs
define QUEST_NPC 20084
define REWARD_NPC 20018

-- Items
define BIO_ITEM_1 30165
define BIO_ITEM_COUNT 25
define NEEDED_ITEM_COUNT 24
define PUSH_ITEM 71035
define BIO_SOULSTONE 30224

-- Generals
define MIN_LEVEL 70
define CHANCE 50
define CHANCE_WITH_PUSH 75
define DROP_CHANCE_SOULSTONE 1
define DROP_CHANCE_BIO_ITEM 1



quest biologe_level_70 begin
	state run begin
		when login or levelup with pc.get_level() >= MIN_LEVEL begin
			set_state(stage_quest_start)
		end
	end

	state stage_quest_start begin
		when login or letter begin
			send_letter("Die Forschung des Biologen 5")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Die Forschung des Biologen 5")
			sayQuestText("Der Biologe benötigt ein weiteres Mal deine Hilfe.")

			printQuestInfo()
			sayQuestText("Sprich mit dem Biologen.")
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Die Forschung des Biologen 5" begin
			deleteTarget(QUEST_NPC)

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText(string.format("Hallo %s, kannst du mir helfen? Ich habe die Forschungen mit den Eiskugeln abgeschlossen. Ich möchte, dass du nach Lungsam reist und dort Zelkovas Holzäste erbeutest. Hilfst du mir bei meinen Untersuchungen?", pc.get_name()))

			printQuestInfo()
			say(string.format("Ich benötige %d mal einen %s.", BIO_ITEM_COUNT, item_name(BIO_ITEM_1)))
			say("Möchtest du den Auftrag jetzt beginnen?")

			local s = select("Auftrag annehmen", "Abbrechen")
			if s == 2 then return end

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText("Vielen Dank! Du findest sie bei den Baumwesen in Lungsam.")

			printQuestInfo()
			say(string.format("Ich benötige %d mal einen %s.", BIO_ITEM_COUNT, item_name(BIO_ITEM_1)))
			wait()

			setupBioQuestCounter()
			set_state(stage_1)
		end
	end

	state stage_1 begin
		when login or enter or letter begin
			send_letter("Auftrag: Zelkovas Holzäste")
		end

		when button or info begin
			printQuestHeader()
			sayQuestText(string.format("Der Biologe gab dir den Auftrag %d Zelkovas Holzäste zu sammeln. Du findest sie bei den Baumwesen in Lungsam.", BIO_ITEM_COUNT))

			printQuestInfo()
			sayQuestText(string.format("Sammel alle %d Zelkovas Holzäste.", BIO_ITEM_COUNT))
			
			printQuestInfo("Hinweis:")
			sayQuestText(string.format("Du hast derzeit %s abgegeben!", pc.getqf("collectCount")))
		end

		when kill with npc.get_race() >= 2301 and npc.get_race() <= 2315 begin
			local perc = number(1,100)

			if perc <= DROP_CHANCE_BIO_ITEM then 
				game.drop_item_with_ownership(BIO_ITEM_1, 1)
			end
		end


		when QUEST_NPC.chat."Auftrag: Zelkovas Holzäste" with pc.count_item(BIO_ITEM_1) > 0 begin
			local perc = number(0, 99)

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText("Einen Moment bitte. Ah da ist er, sehr gut. Lass mich schnell mal gucken, ob ich ihn gebrauchen kann...")
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
						sayQuestText(string.format("Vielen Dank für die %d Holzäste. Ich benötige jetzt außerdem noch Gyimoks Seelenstein.", BIO_ITEM_COUNT))
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
						sayQuestText("Hervorragend, damit kann ich sehr gut arbeiten. Bring mir noch welche, damit ich meine Forschungen abschließen kann.")
						wait()


						printQuestHeader(mob_name(QUEST_NPC))
						updateBioQuestCounter()
						say_reward("Du hast derzeit "..pc.getqf("collectCount").." abgegeben!")
					else
						printQuestHeader(mob_name(QUEST_NPC))
						sayQuestText(string.format("Vielen Dank für die %d Holzäste. Ich benötige jetzt außerdem noch Gyimoks Seelenstein.", BIO_ITEM_COUNT))
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
			sayQuestText(string.format("Du sollst als nächstes den %s finden.", item_name(BIO_SOULSTONE)))

			printQuestInfo()
			sayQuestText("Du findest ihn bei den Baumwesen in Lungsam.")
		end

		when kill with npc.get_race() >= 2301 and npc.get_race() <= 2315 begin
			if pc.count_item(BIO_SOULSTONE) < 1 then
				local perc = number(1,100)

				if perc <= DROP_CHANCE_SOULSTONE then
					game.drop_item_with_ownership(BIO_SOULSTONE, 1)
					setTarget(QUEST_NPC)
				end
			end
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Gyimoks Seelenstein" begin
			deleteTarget(QUEST_NPC)

			if pc.count_item(BIO_SOULSTONE) > 0 then
				printQuestHeader(mob_name(QUEST_NPC))
				sayQuestText("Dank deiner Hilfe verstehe ich nun die Legende des Gyimoks Seelensteins. Du hast hart gekämpft. Sprich mit Baek-Go, er wird dir helfen deine inneren Kräfte zu steigern.")
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
			sayQuestText(string.format("Um die Belohnung des Biologen zu erhalten sprich mit %s, er wird sie dir überreichen!", mob_name(REWARD_NPC)))
		end

		when __TARGET__.target.click or REWARD_NPC.chat."Belohnung des Biologen" begin
			deleteTarget(REWARD_NPC)

			printQuestHeader(mob_name(REWARD_NPC))
			sayQuestText("Der Biologe hat dich zu mir geschickt? Ich soll dir deine Belohnung geben? Hier ist sie, bitteschön!")

			printQuestInfo("Belohnung:")
			say_reward("Bewegungsgeschwindigkeit +11% (Dauerhaft)")
			say_reward("Schadensreduzierung +10% (Dauerhaft)")
			say_reward("1x Grüner Ebenholzkasten")
			wait()

			affect.add_collect(apply.MOV_SPEED, 11, 60*60*24*365*60)
			affect.add_collect(apply.NORMAL_HIT_DEFEND_BONUS, 10, 60*60*24*365*60)
			affect.add_collect(apply.SKILL_DEFEND_BONUS, 10, 60*60*24*365*60)
			pc.give_item2(50113, 1)
			clear_letter()
			set_quest_state("biologe_level_80", "run")
			complete_quest()
		end
	end

	state __COMPLETE__ begin
	end
end