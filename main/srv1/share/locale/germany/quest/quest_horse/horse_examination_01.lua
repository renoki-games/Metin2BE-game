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
			say("Bringe dazu eine Pferdemedaille mit!")
			say("")
			clear_letter()
			set_state(horse_mission1_begin)
		end
	end
		
	state horse_mission1_begin begin
		when 20349.chat."Das Pferd" begin
			say_title("Stallbursche:")
			say("")
			say("Hallo "..pc.get_name()..",")
			say("du willst also das Anfängerpferd?")
			say("Dann musst du erstmal beweisen,")
			say("dass du würdig bist das Anfängerpferd zu führen.")
			say("Töte 30 Weißer-Eid Bogenschützen")
			say("innerhalb von 10 Minuten!")
			say("Dann werde ich dir das Anfängerpferd geben.")
			say("Du kannst auch eine Gruppe leiten und")
			say("mit ihr dann die Mission erfüllen!")
			say("")
			say("Möchtest du die Prüfung jetzt beginnen?")
			local v = select ("Ja", "Nein")
			if v == 1 then
				if pc.count_item(50050) >= 1 then
					if not selectHorseAppearence(50050) then return end

					say_title("Stallbursche:")
					say("")
					say("Ok, ziehe jetzt los. Die 10 Minuten laufen ab jetzt!")
					say("Viel Glück.")
					wait()

					pc.remove_item(50050, 1)
					pc.setqf("limit_time1", get_time()+10*60)
					pc.setqf("bogie_mobs1", 30)
					q.set_clock("Zeit", pc.getqf("limit_time2")-get_time())
					set_state(kill_bogie_mobs1)
				else
					say_title("Stallbursche:")
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
	
	state kill_bogie_mobs1 begin
		when letter begin
			send_letter("Die Pferdeprüfung")
			q.set_counter("W.Eid-Bogensch.", pc.getqf("bogie_mobs1"))
			q.set_clock("Zeit", pc.getqf("limit_time1")-get_time())
		end
		
		when login or levelup with get_time()>=pc.getqf("limit_time1") begin
			clear_letter()
			pc.delqf("limit_time1")
			pc.delqf("bogie_mobs1")
			set_state(failure_quest1)
		end
		
		when info or button begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Um die Pferdeprüfung abzuschließen musst du")
			say("innerhalb von 10 Minuten 30 Weißer-Eid Bogenschützen")
			say("töten. Sie sind auf der Map 2 zu finden!")
			say("")
			say_reward("Du musst noch "..pc.getqf("bogie_mobs1").."")
			say_reward("von 30 Weißer-Eid Bogenschützen töten!")
		end
		
		when 302.party_kill begin
			pc.setqf("bogie_mobs1", pc.getqf("bogie_mobs1")-1)
			local kill_count = pc.getqf("bogie_mobs1") 
			q.set_counter("W.Eid Bogensch.", kill_count)
			if kill_count == 0 then
				clear_letter()
				pc.delqf("bogie_mobs1")
				set_state(finish_kills1)
			end
			if get_time()>=pc.getqf("limit_time1") then
				clear_letter()
				pc.delqf("bogie_mobs1")
				set_state(failure_quest1)
			end
		end
	end
	
	state finish_kills1 begin
		when letter begin
			cleartimer("limit_time1")
			clear_letter()
			send_letter("Prüfung erfolgreich!")
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Du hast die 30 Weißer-Eid Bogenschützen")
			say("innerhalb von 10 Minuten getötet.")
			say("Gehe zum Stallburschen und berichte ihm")
			say("davon.")
			say("")
			say_reward("Auf zum Stallburschen")
			say("")
		end
		
		when __TARGET__.target.click or 20349.chat."Das Pferd" begin
			target.delete(__TARGET__)
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du das Anfängerpferd beherrschen kannst.")
			say("Nun brauchst du noch das Pferdebild.")
			say("")
			say("Für die Herstellung benötige ich 250.000 Yang.")
			say("")
			local v = select ("Bezahlen", "Abbrechen")
			if v == 1 then
				if pc.money>=250000 then

					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Pferdebild!")
					say_item_vnum(50051)
					say("")
					wait()

					horse.set_level(1)
					pc.changemoney(-250000)
					pc.give_item2(50051)
					set_quest_state("horse_mission2", "run")
					set_state(__complete)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast, kannst du wiederkommen")
					say("und das Pferdebild kaufen!")
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
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du dein Anfängerpferd beherrschen kannst.")
			say("Nun brauchst du noch das Pferdebild.")
			say("")
			say("Für die Herstellung benötige ich 250.000 Yang.")
			say("")
			local v = select ("Bezahlen", "Abbrechen")
			if v == 1 then
				if pc.money>=250000 then
					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Pferdebild!")
					say_item_vnum(50051)
					say("")
					wait()

					horse.set_level(1)
					pc.give_item2(50051)
					pc.changemoney(-250000)

					set_quest_state("horse_mission2", "run")
					set_state(__complete)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast, kannst du wiederkommen")
					say("und das Pferdebild kaufen!")
					say("")
				end
			elseif v == 2 then
				return
			end
		end
	end
	
	state failure_quest1 begin
		when letter begin
			send_letter("Die Pferdeprüfung")
			pc.delqf("bogie_mobs1")
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Du hast die 30 Weißer-Eid Bogenschützen innerhalb von 10")
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