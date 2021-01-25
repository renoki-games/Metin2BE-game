-- Generals
define MIN_LEVEL 1
define QUEST_NPC 20349
define HORSE_MEDALL 50050
define KILL_STAGE_1 30
define KILL_MOB 302
define REWARD_HORSE 50051
define QUEST_COST 250000


quest horse_examination_01 begin
	state start begin
		when login or levelup with pc.get_level() >= MIN_LEVEL begin
			set_state(quest_start)
		end
	end

	state quest_start begin
		when login or letter begin
			send_letter("Das Pferd")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Das Pferd")
			sayQuestText(string.format("Hallo %s! Du kannst die Prüfung für dein Pferd absolvieren! Spreche dafür mit dem Stallburschen.", pc.get_name()))


			printQuestInfo("Hinweis:")
			say("Bringe dazu eine Pferdemedaille mit!")
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Das Pferd" begin
			deleteTarget(QUEST_NPC)
			say_size(350, 380)

			printQuestHeader(mob_name(QUEST_NPC))
			sayQuestText(string.format("Hallo %s, du möchtest dein Pferd erhalten?", pc.get_name()), true)
			sayQuestText("Dafür musst du erstmal beweisen, dass du würdig bist", true)
			sayQuestText("das Pferd zu führen!")
			say("")

			printQuestInfo()
			sayQuestText(string.format("Töte %d Weißer-Eid Bogenschützen innerhalb von 10 Minuten!", KILL_STAGE_1))

			printQuestInfo("Hinweis:")
			say("Diese Quest ist auch mit Hilfe einer Gruppe möglich.")
			sayQuestText(string.format("Außerdem benötigst du dafür eine %s!", item_name(HORSE_MEDALL)))

			say("Möchtest du die Prüfung jetzt beginnen?")

			local s = select("Prüfung starten", "Abbrechen")
			if s == 2 then return end

			if s == 1 then
				if pc.count_item(HORSE_MEDALL) >= 1 then
					printQuestHeader(mob_name(QUEST_NPC))
					say("Ok, ziehe jetzt los. Die 10 Minuten laufen ab jetzt!")
					say("Viel Glück.")
					wait()

					horse_examination_01.setUpStage_1()
					set_state(stage_first_task)
				else
					printQuestHeader(mob_name(QUEST_NPC))
					say("Du hast keine Pferdemedaille dabei!")
					say("Komme wieder wenn du eine bei dir hast.")
					return
				end
			end
		end
	end








	state stage_first_task begin
		when letter begin
			send_letter("Die erste Pferdeprüfung")
			q.set_counter("W.Eid-Bogensch.", pc.getqf("horseQuestKillMob"))
			q.set_clock("Zeit", horse_examination_01.horseQuestTimer() - get_time())
		end

		when button or info begin
			printQuestHeader("Die Pferdeprüfung:")
			say("Um die Pferdeprüfung abzuschließen musst du")
			say("innerhalb von 10 Minuten 30 Weißer-Eid Bogenschützen")
			say("töten! Sie sind in dem angrenzenden Dorf zu finden!")
			say("")

			printQuestInfo()
			sayQuestText(string.format("Du musst noch %s von %d Weißer-Eid Bogenschützen töten!", pc.getqf("horseQuestKillMob"), KILL_STAGE_1))
		end

		when login or levelup with horse_examination_01.horseQuestTimer() >= get_time() begin
			horse_examination_01.clearQuest()
			horse_examination_01.clearTimer()
			set_state(stage_quest_fail)
		end

		when KILL_MOB.party_kill begin
			pc.setqf("horseQuestKillMob", pc.getqf("horseQuestKillMob") -1)

			local killCount = pc.getqf("horseQuestKillMob")
			q.set_counter("W.Eid Bogensch.", killCount)

			if killCount == 0 then
				horse_examination_01.clearQuest()
				set_state(stage_quest_finish)
			end

			if get_time() >= pc.getqf("horseQuestTimerLimit") then
				horse_examination_01.clearQuest()
				set_state(stage_quest_fail)
			end
		end
	end

	state stage_quest_finish begin
		when letter begin
			send_letter("Prüfung erfolgreich!")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Die Pferdeprüfung:")
			say(string.format("Du hattest die Aufgabe %d Weißer-Eid Bogenschützen", KILL_STAGE_1))
			say("innerhalb von 10 Minuten zu töten.")
			say("Berichte dem Stallburschen von deinem Erfolg.")
			say("")

			printQuestInfo()
			sayQuestText("Sprich mit dem Stallburschen.")
		end

		when __TARGET__.target.click or QUEST_NPC.chat."Das Pferd" begin
			deleteTarget(QUEST_NPC)

			printQuestHeader(mob_name(QUEST_NPC))
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du würdig bist ein Pferd zu führen.")
			say("Ich werde dir das Pferdebild anfertigen.")
			say("")

			say(string.format("Für die Herstellung benötige ich %s Yang.", numberDot(QUEST_COST)))
			say("")

			local s = select ("Bezahlen", "Abbrechen")
			if s == 2 then return end

			if s == 1 then
				if pc.money >= QUEST_COST then
					if not selectHorseAppearence(REWARD_HORSE) then return end

					printQuestHeader(mob_name(QUEST_NPC))
					say("Du erhälst:")

					say_item_vnum(REWARD_HORSE)
					wait()


					horse.set_level(1)
					pc.change_gold(-QUEST_COST)

					clear_letter()
					set_quest_state("horse_examination_25", "run")
					set_state(__COMPLETE__)
				else
					printQuestHeader(mob_name(QUEST_NPC))
					say("Du hast leider nicht genug Yang bei dir.")
					say("Komm zurück, sobald du genug Yang hast!")
					return
				end
			end
		end
	end

	state stage_quest_fail begin
		when login or enter or letter begin
			send_letter("Prüfung gescheitert!")
			setTarget(QUEST_NPC)
		end

		when button or info begin
			printQuestHeader("Die Pferdeprüfung")
			say("Du hast die 30 Weißer-Eid Bogenschützen innerhalb von 10")
			say("Minuten nicht töten können. Geh zum")
			say("Stallburschen und versuche es erneut!")
		end

		when __TARGET__.target.click or	QUEST_NPC.chat."Das Pferd" begin
			deleteTarget(QUEST_NPC)

			printQuestHeader(mob_name(QUEST_NPC))
			say("Du hast die Aufgabe also nicht abschließen können,")
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
			pc.setqf("horseQuestTimerLimit", get_time()+10*60)
			pc.setqf("horseQuestKillMob", KILL_STAGE_1)

			q.set_clock("Zeit", pc.getqf("horseQuestTimerLimit_2")-get_time())
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