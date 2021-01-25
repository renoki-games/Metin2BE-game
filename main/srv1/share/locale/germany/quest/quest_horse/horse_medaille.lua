-- NPCs
define HORSE_NPC 20349
-- Items
define HORSE_MEDALL 50050
-- Generals
define CHANCE 50
define HORSE_MIN_LEVEL 1

quest horse_medaille begin
	state start begin
		when HORSE_NPC.chat."Pferdelevel steigern" with horse.get_level() >= HORSE_MIN_LEVEL begin
			say_title("Stallbursche:")
			say("")

			if horse.get_level() >= HORSE_MIN_LEVEL and horse.get_level() <= 9 or 
			   horse.get_level() >= 11 and horse.get_level() <= 19 or 
			   horse.get_level() >= 21 and horse.get_level() <= 28 then

			   if pc.count_item(HORSE_MEDALL) > 0 then
					say("Möchtest du eine Pferdemedaille benutzen")
					say("um dein Pferdelevel zu steigern?")
					say("")

					local s = select("Steigern", "Abbrechen")
					if s == 2 then return end

					local prc = number(1,100)

					if prc < CHANCE then
						say_title("Stallbursche:")
						say("")
						say("Glückwunsch!")
						say("Das Training mit der Medaille war erfolgreich!")
						say("")
						say(string.format("Dein Pferd ist auf Level %s gestiegen!", horse.get_level()+1))
						wait()

						horse.set_level(horse.get_level()+1)

					else
						say_title("Stallbursche:")
						say("")
						say("Das Training mit der Medaille hat leider nicht geklappt!")
						say("Probiere es später noch mal.")
						say("")
						say(string.format("Dein Pferd ist noch auf Level %s!", horse.get_level()))
					end

					pc.remove_item(HORSE_MEDALL, 1)

				else
					say("Du hast keine Pferdemedaille dabei!")
					say("")
					say_item_vnum(HORSE_MEDALL)
					say_reward("Du bekommst diese Medaillen in den Affendungeons.")
					say("")
				end

			else
				if horse.get_level() == 10 or horse.get_level() == 20 then
					sayQuestText("Du musst zuerst deine nächste Pferdeprüfung erfolgreich abschließen, um dein Pferdelevel weiter zu steigern!")
				end

				if horse.get_level() == 29 then
					sayQuestText("Du kannst dein Pferdelevel mit der Medaille nicht mehr weiter erhöhen. Du musst die letzte Prüfung ablegen!")
				end

				if horse.get_level() == 30 then
					say("Du hast das maximale Pferdelevel bereits erreicht!")
					set_state(__COMPLETE__)
				end
			end
		end
	end

	state __COMPLETE__ begin
	end
end