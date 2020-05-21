quest horse_medaille begin
	state start begin
		when 20349.chat."Pferdelevel steigern" with horse.get_level() >= 1 begin
			say_title("Stallbursche:")
			if horse.get_level() >= 1 and horse.get_level() <= 9 or 
			   horse.get_level() >= 11 and horse.get_level() <= 19 or 
			   horse.get_level() >= 21 and horse.get_level() <= 28 then
				say("")
				say("Möchtest du diese Pferdemedaille benutzen")
				say("um dein Pferdelevel zu steigern?")
				say("")
				if select("Steigern", "Beenden") == 2 then return end
				local drop_random = number(1,100)
				if drop_random < 50 then
					horse.set_level(horse.get_level()+1)
					say_title("Pferdelevel gestiegen!")
					say("")
					say("Glückwunsch!")
					say("Das Training mit der Medaille hat geklappt!")
					say("")
					say("Dein Pferd ist auf Level "..horse.get_level().." gestiegen!")
					pc.remove_item(50050, 1)
				else
					say_title("Pferdelevel nicht gestiegen!")
					say("")
					say("Das Training mit der Medaille hat leider nicht geklappt!")
					say("Probiere es später noch mal.")
					say("")
					say("Dein Pferd ist noch auf Level "..horse.get_level().."!")
					pc.remove_item(50050, 1)
				end
			else
				if horse.get_level() == 10 or horse.get_level() == 20 then
					say("")
					say("Du musst erst deine nächste Prüfung erfolgreich beenden!")
				end
				if horse.get_level() == 29 then
					say("")
					say("Du kannst dein Pferdelevel mit der Medaille nicht mehr erhöhen!")
				end
				if horse.get_level() == 30 then
					say("")
					say("Du hast das maximale Pferdelevel bereits erreicht!")
				end
			end
		end
	end
end