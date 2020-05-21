quest horse_examination_01 begin
	state start begin
		when login or levelup with pc.get_level() >= 2 begin
			send_letter("Das Pferd")
		end
		
		when button or info begin
			say_title("Das Pferd")
			say("")
			say("Du kannst deine Prüfung für dein")
			say("Pferd absolvieren!")
			say("Bringe dazu eine Pferdemedaillen mit!")
			say("")
			clear_letter()
			set_state(horse_mission1_begin)
		end
	end
		
	state horse_mission1_begin begin
		when 20349.chat."Das Pferd" begin
			say("Stallbursche:")
			say("")
			say("Hallo "..pc.get_name().."")
			say("Du willst also das Pferd?")
			say("Dann musst du erstmal beweisen")
			say("das du würdig bist das Kampf-Pferd zu führen")
			say("Töte bitte 30 Weißer-Eid Bogenschützen innerhalb 10 Minuten!")
			say("Dann werde ich dir das Pferd geben.")
			say("Du kannst dir auch eine Gruppe leiten und")
			say("mit ihr dann die Mission erfüllen!")
			say("")
			say("Möchtest du die Prüfung jetzt beginnen?")
			local v = select ("Ja, ich möchte!", "Nein, Später.")
			if v == 1 then
				if pc.count_item(50050) >= 1 then
					say("Stallbursche:")
					say("")
					say("Ok, ziehe jetzt los. Die 10 Minuten laufen ab jetzt!")
					say("Viel Glück.")
					pc.remove_item(50050, 1)
					pc.setqf("limit_time2", get_time()+10*60)
					pc.setqf("bogie_mobs2", 30)
					q.set_clock("Zeit", pc.getqf("limit_time2")-get_time())
					set_state(kill_bogie_mobs2)
				else
					say("Stallbursche:")
					say("")
					say("Du hast keine Pferdemedaille dabei!")
					say("Komme wieder wenn du eine bei dir")
					say("trägst.")
					return
				end
			elseif v == 2 then
				return
			end
		end
	end
	
	state kill_bogie_mobs2 begin
		when letter begin
			send_letter("Die Pferdeprüfung")
			q.set_counter("W.Eid-Bogensch.:", pc.getqf("bogie_mobs2"))
			q.set_clock("Zeit", pc.getqf("limit_time2")-get_time())
		end
		
		when info or button begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Um die Pferdeprüfung abzuschließen musst du")
			say("innerhalb 10 Minuten 30 Wilde Bogenschützen")
			say("töten. Sie sind in Map2 zu finden!")
			say("")
			say_reward("Du musst noch "..pc.getqf("bogie_mobs2").."")
			say_reward("von 30 Wilde Bogenschützen töten!")
		end
		
		when 302.party_kill begin
			pc.setqf("bogie_mobs2", pc.getqf("bogie_mobs2")-1)
			local kill_count = pc.getqf("bogie_mobs2") 
			q.set_counter("W.Eid Bogensch.:", kill_count)
			if kill_count == 0 then
				clear_letter()
				pc.setqf("bogie_mobs2", 0)
				set_state(finish_kills2)
			end
			if get_time()>=pc.getqf("limit_time2") then
				clear_letter()
				pc.setqf("bogie_mobs2", 0)
				set_state(failure_quest2)
			end
		end
	end
	
	state finish_kills2 begin
		when letter begin
			cleartimer("limit_time2")
			clear_letter()
			send_letter("Prüfung Erfolgreich!")
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Du hast die 30 Bogenschützen innerhalb 20 Minuten")
			say("getötet.")
			say("")
			say_reward("Auf zum Stallburschen")
			say("")
		end
		
		when __TARGET__.target.click or 20349.chat."Das Kampfpferd" begin
			target.delete(__TARGET__)
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewisen das")
			say("du dein Kampf-Pferd beherrschen kannst.")
			say("Nun brauchst du noch das Waffen-Pferdebuch")
			say("")
			say("Für die herstellung benötige ich 250.000 Yang")
			say("")
			local v = select ("Bezahlen", "Noch nicht")
			if v == 1 then
				if pc.money>=250000 then
					if not selectHorseAppearence(50051) then return end

					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Pferdebild!")
					say_item_vnum(50051)
					say("")
					wait()

					horse.set_level(1)
					pc.changemoney(-250000)
					set_quest_state("horse_mission3", "run")
					set_state(__complete)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast kannst du wiederkommen")
					say("und das Waffen-Pferdebuch kaufen!")
					say("")
				end
			elseif v == 2 then
				clear_letter()
				set_quest_state("horse_mission2", "run")
				set_state(buy_horse_book)
			end
		end
	end
	
	state buy_horse_book begin
		when 20349.chat."Waffen-Pferdebuch" begin
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewisen das")
			say("du dein Kampf-Pferd beherrschen kannst.")
			say("Nun brauchst du noch das Waffen-Pferdebuch")
			say("")
			say("Für die herstellung benötige ich 250.000 Yang")
			say("")
			local v = select ("Bezahlen", "Noch nicht")
			if v == 1 then
				if pc.money>=250000 then
					if not selectHorseAppearence(50051) then return end

					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Pferdebild!")
					say_item_vnum(50051)
					say("")
					wait()

					horse.set_level(1)
					pc.changemoney(-250000)

					set_quest_state("horse_mission2", "run")
					set_state(__complete)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast kannst du wiederkommen")
					say("und das Waffen-Pferdebuch kaufen!")
					say("")
				end
			elseif v == 2 then
				return
			end
		end
	end
	
	state failure_quest2 begin
		when letter begin
			send_letter("Die Pferdeprüfung")
			pc.setqf("bogie_mobs2", 0)
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Du hast die 30 Bogenschützen innerhalb von 20")
			say("Minuten nicht töten können. Geh zum")
			say("Stallburschen und versuche es erneut!")
			say("")
			clear_letter()
			set_state(start)
		end
	end
	
	state __complete begin
		when enter begin
			q.done()
		end
	end
end