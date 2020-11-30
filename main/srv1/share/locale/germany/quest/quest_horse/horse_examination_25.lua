quest horse_mission2 begin
	state start begin
	end
	
	state run begin
		when login or levelup with pc.get_level() >= 25 begin
			send_letter("Das Kampf-Pferd")
		end
		
		when button or info begin
			say_title("Das Kampf-Pferd")
			say("")
			say("Du bist Level 25 und kannst")
			say("nun deine Prüfung für dein")
			say("Kampf-Pferd absolvieren!")
			say("Bringe dazu eine Pferdemedaille mit!")
			say("")
			clear_letter()
			set_state(horse_mission2_begin)
		end
	end
		
	state horse_mission2_begin begin
		when 20349.chat."Das Kampf-Pferd" begin
			say_title("Stallbursche:")
			say("")
			say("Hallo "..pc.get_name()..",")
			say("du willst also das Kampfpferd?")
			say("Dann musst du erstmal beweisen,")
			say("dass du würdig bist das Kampfpferd zu führen.")
			say("Töte 100 Skorpionbogenschützen oder")
			say("Schlangenbogenschützen innerhalb von 30 Minuten!")
			say("Dann werde ich dir das Kampfpferd geben.")
			say("Du kannst auch eine Gruppe leiten und")
			say("mit ihr dann die Mission erfüllen!")
			say("")
			say("Möchtest du die Prüfung jetzt beginnen?")
			local v = select ("Ja", "Nein")
			if v == 1 then
				if horse.get_level() == 10 then
					if pc.count_item(50050) >= 1 then
						say_title("Stallbursche:")
						say("")
						say("Ok, ziehe jetzt los. Die 30 Minuten laufen ab jetzt!")
						say("Viel Glück.")
						pc.remove_item(50050, 1)
						pc.setqf("limit_time2", get_time()+30*60)
						pc.setqf("bogie_mobs2", 100)
						q.set_clock("Zeit", pc.getqf("limit_time2")-get_time())
						set_state(kill_bogie_mobs2)
					else
						say_title("Stallbursche:")
						say("")
						say("Du hast keine Pferdemedaille dabei!")
						say("Komme wieder wenn du eine bei dir")
						say("trägst.")
						return
					end
				else
					say_title("Stallbursche:")
					say("")
					say("Dein Pferdelevel ist nicht hoch genug!")
					say("Komme wieder wenn dein Pferd Level 10")
					say("erreicht hat.")
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
			q.set_counter("Bogenschützen.", pc.getqf("bogie_mobs2"))
			q.set_clock("Zeit", pc.getqf("limit_time2")-get_time())
		end
		
		when login or levelup with get_time()>=pc.getqf("limit_time3") begin
			clear_letter()
			pc.delqf("limit_time2")
			pc.delqf("bogie_mobs2")
			set_state(failure_quest2)
		end
		
		when info or button begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Um die Pferdeprüfung abzuschließen musst du")
			say("100 Skorpionbogenschützen oder")
			say("Schlangenbogenschützen innerhalb von 30 Minuten")
			say("töten. Sie sind in der Yongbi-Wüste zu finden!")
			say("")
			say_reward("Du musst noch "..pc.getqf("bogie_mobs2").."")
			say_reward("von 100 Bogenschützen töten!")
		end
		
		when 2105.party_kill or 2107.party_kill begin
			pc.setqf("bogie_mobs2", pc.getqf("bogie_mobs2")-1)
			local kill_count = pc.getqf("bogie_mobs2") 
			q.set_counter("Bogenschützen.", kill_count)
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
			send_letter("Prüfung erfolgreich!")
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Du hast die 100 Bogenschützen")
			say("innerhalb von 30 Minuten getötet.")
			say("Gehe zum Stallburschen und berichte ihm")
			say("davon.")
			say("")
			say_reward("Auf zum Stallburschen")
			say("")
		end
		
		when __TARGET__.target.click or 20349.chat."Das Kampfpferd" begin
			target.delete(__TARGET__)
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du dein Kampfpferd beherrschen kannst.")
			say("Nun brauchst du noch das Waffen-Pferdebuch.")
			say("")
			say("Für die Herstellung benötige ich 500.000 Yang.")
			say("")
			local v = select ("Bezahlen", "Abbrechen")
			if v == 1 then
				if pc.money>=500000 then
					if not selectHorseAppearence(50052) then return end

					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Waffen-Pferdebuch!")
					say_item_vnum(50052)
					say("")
					wait()

					horse.set_level("11")
					pc.changemoney(-500000)
					pc.remove_item(50051, 1)
					set_quest_state("horse_mission3", "run")
					set_state(__complete)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast, kannst du wiederkommen")
					say("und das Waffen-Pferdebuch kaufen!")
					say("")
				end
			elseif v == 2 then
				clear_letter()
				set_quest_state("horse_mission3", "run")
				set_state(buy_horse_book)
			end
		end
	end
	
	state buy_horse_book begin
		when 20349.chat."Waffen-Pferdebuch" begin
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du dein Kampfpferd beherrschen kannst.")
			say("Nun brauchst du noch das Waffen-Pferdebuch.")
			say("")
			say("Für die Herstellung benötige ich 500.000 Yang.")
			say("")
			local v = select ("Bezahlen", "Abbrechen")
			if v == 1 then
				if pc.money>=500000 then
					if not selectHorseAppearence(50052) then return end

					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Waffen-Pferdebuch!")
					say_item_vnum(50052)
					say("")
					wait()

					horse.set_level("11")
					pc.changemoney(-500000)
					pc.remove_item(50051, 1)
					set_quest_state("horse_mission3", "run")
					set_state(__complete)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast, kannst du wiederkommen")
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
			say("Du hast die 100 Bogenschützen innerhalb von 30")
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