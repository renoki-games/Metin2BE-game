-- Generals
define MIN_LEVEL 50
define QUEST_NPC 20349
define HORSE_MEDALL 50050
define KILL_STAGE_1 300
define KILL_MOB 1002
define REWARD_HORSE 50053
define RIDING_BOOK 50060
define QUEST_COST 1000000


quest horse_examination_50 begin
	state run begin
		when login or levelup with pc.get_level() >= MIN_LEVEL begin
			set_state(quest_start)
		end
	end

	state quest_start begin
		when login or letter begin
			send_letter("Das Milit�rpferd")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Das Milit�rpferd")
			sayQuestText("Du bist Level 50 und kannst nun die Pr�fung f�r dein Milit�rpferd absolvieren!", true)
			sayQuestText("Spreche daf�r mit dem Stallburschen.")

			printQuestInfo("Hinweis:")
			say("Bringe dazu eine Pferdemedaille mit!")
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Das Milit�rpferd" begin
			deleteTarget(QUEST_NPC)
			say_size(350, 380)

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText(string.format("Hallo %s, du m�chtest dein Milit�rpferd erhalten?", pc.get_name()), true)
			sayQuestText("Daf�r musst du erstmal beweisen, dass du w�rdig bist", true)
			sayQuestText("das Milit�rpferd zu f�hren!")
			say("")

			printQuestInfo()
			sayQuestText(string.format("T�te %d D�monenbogensch�tzen innerhalb von 30 Minuten!", KILL_STAGE_1))

			printQuestInfo("Hinweis:")
			say("Diese Quest ist auch mit Hilfe einer Gruppe m�glich.")
			sayQuestText(string.format("Au�erdem ben�tigst du daf�r eine %s!", item_name(HORSE_MEDALL)))

			say("M�chtest du die Pr�fung jetzt beginnen?")

			local s = select("Pr�fung starten", "Abbrechen")
			if s == 2 then return end

			if s == 1 then
				if horse.get_level() == 20 then
					if pc.count_item(HORSE_MEDALL) >= 1 then

						printQuestHeader(mob_name(QUEST_NPC))
						say("Ok, ziehe jetzt los. Die 30 Minuten laufen ab jetzt!")
						say("Viel Gl�ck.")
						wait()

						horse_examination_50.setUpStage_1()
						set_state(stage_first_task)
					else
						printQuestHeader(mob_name(QUEST_NPC))
						say("Du hast keine Pferdemedaille dabei!")
						say("Komme wieder wenn du eine bei dir hast.")
						return
					end
				else 
					printQuestHeader(mob_name(QUEST_NPC))
					say("Dein Pferd muss mindestens Level 20 erreicht haben!")
					return
				end
			end
		end
	end

	state stage_first_task begin
		when letter begin
			send_letter("Die dritte Pferdepr�fung")
			q.set_counter("D�monen-Bogensch..", pc.getqf("horseQuestKillMob"))
			q.set_clock("Zeit", horse_examination_50.horseQuestTimer() - get_time())
		end

		when button or info begin
			printQuestHeader("Die Pferdepr�fung:")
			say("Um die Pferdepr�fung abzuschlie�en musst du")
			say(string.format("innerhalb von 30 Minuten %d D�monenbogensch�tzen", KILL_STAGE_1))
			say("t�ten! Du findest sie in dem D�monenturm.")
			say("")

			printQuestInfo()
			sayQuestText(string.format("Du musst noch %s von %d D�monenbogensch�tzen t�ten!", pc.getqf("horseQuestKillMob"), KILL_STAGE_1))
		end

		when login or levelup with horse_examination_50.horseQuestTimer() >= get_time() begin
			horse_examination_50.clearQuest()
			horse_examination_50.clearTimer()
			set_state(stage_quest_fail)
		end

		when KILL_MOB.party_kill begin
			pc.setqf("horseQuestKillMob", pc.getqf("horseQuestKillMob") -1)

			local killCount = pc.getqf("horseQuestKillMob")
			q.set_counter("D�monen-Bogensch.", killCount)

			if killCount == 0 then
				horse_examination_50.clearQuest()
				set_state(stage_quest_finish)
			end

			if get_time() >= pc.getqf("horseQuestTimerLimit") then
				horse_examination_50.clearQuest()
				set_state(stage_quest_fail)
			end
		end
	end

	state stage_quest_finish begin
		when letter begin
			send_letter("Pr�fung erfolgreich!")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Die Pferdepr�fung:")
			say(string.format("Du hattest die Aufgabe %d D�monenbogensch�tzen", KILL_STAGE_1))
			say("innerhalb von 30 Minuten zu t�ten.")
			say("Berichte dem Stallburschen von deinem Erfolg.")
			say("")

			printQuestInfo()
			sayQuestText("Sprich mit dem Stallburschen.")
		end

		when __TARGET__.target.click or QUEST_NPC.chat."Das Milit�rpferd" begin
			deleteTarget(QUEST_NPC)

			printQuestHeader(mob_name(QUEST_NPC))
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du w�rdig bist ein Milit�rpferd zu f�hren.")
			say("Ich werde dir das Milit�r-Pferdebuch anfertigen.")
			say("")

			say(string.format("F�r die Herstellung ben�tige ich %s Yang.", numberDot(QUEST_COST)))
			say("")

			local s = select ("Bezahlen", "Abbrechen")
			if s == 2 then return end

			if s == 1 then
				if pc.money >= QUEST_COST then
					if not selectHorseAppearence(REWARD_HORSE) then return end

					printQuestHeader(mob_name(QUEST_NPC))
					say("Du erh�lst:")

					say_item_vnum(REWARD_HORSE)
					sayQuestText(string.format("Au�erdem bekommst du noch ein %s geschenkt um deine Pferdefertigkeiten zu steigern.", item_name(RIDING_BOOK)))
					wait()

					horse.set_level(21)
					pc.change_gold(-QUEST_COST)
					pc.remove_item(50052, 1)
					pc.give_item2(RIDING_BOOK, 1)

					clear_letter()
					set_quest_state("horse_examination_75", "run")
					set_state(__COMPLETE__)
				else
					printQuestHeader(mob_name(QUEST_NPC))
					say("Du hast leider nicht genug Yang bei dir.")
					say("Komm zur�ck, sobald du genug Yang hast!")
					return
				end
			end
		end
	end

	state stage_quest_fail begin
		when login or enter or letter begin
			send_letter("Pr�fung gescheitert!")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Die Pferdepr�fung")
			say("Du hast die 300 Bogensch�tzen innerhalb von 30")
			say("Minuten nicht t�ten k�nnen. Geh zum")
			say("Stallburschen und versuche es erneut!")
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Das Milit�rpferd" begin
			deleteTarget(QUEST_NPC)

			printQuestHeader(mob_name(QUEST_NPC))
			say("Du hast die Aufgabe also nicht abschlie�en k�nnen,")
			say("keine Sorge, ich gebe dir einen weiteren Versuch.")
			say("Sprich mich einfach an, sobald du bereit bist!")
			wait()

			clear_letter()
			set_state(quest_start)
		end
	end

	state __COMPLETE__ begin
	end

	state __FUNCTIONS__ begin
		function setUpStage_1()
			pc.remove_item(HORSE_MEDALL, 1)
			pc.setqf("horseQuestTimerLimit", get_time()+30*60)
			pc.setqf("horseQuestKillMob", KILL_STAGE_1)

			q.set_clock("Zeit", pc.getqf("horseQuestClockTimer")-get_time())
		end

		function horseQuestTimer()
			return pc.getqf("horseQuestTimerLimit")
		end

		function clearTimer()
			pc.delqf(horseQuestTimerLimit)
		end

		function clearQuest()
			clear_letter()
			pc.delqf("horseQuestKillMob")
		end
	end
end