quest horse_mission3 begin
	state start begin
	end
	
	state run begin
		when login or levelup with pc.get_level() >= 50 and horse.get_level() == 20 begin
			send_letter("Das Militär-Pferd")
		end
		
		when button or info begin
			say_title("Das Militär-Pferd")
			say("")
			say("Du bist Level 50 und kannst")
			say("nun deine Prüfung für dein")
			say("Militär-Pferd absolvieren!")
			say("Bringe dazu eine Pferdemedaille mit!")
			say("")
			clear_letter()
			set_state(horse_mission3_begin)
		end
	end
		
	state horse_mission3_begin begin
		when 20349.chat."Das Militär-Pferd" begin
			say_title("Stallbursche:")
			say("")
			say("Hallo "..pc.get_name()..",")
			say("du willst also das Militärpferd?")
			say("Dann musst du erstmal beweisen,")
			say("dass du würdig bist das Militärpferd zu führen.")
			say("Diese Prüfung ist die vorletzte!")
			say("Ohne eine Gruppe wirst du sie vermutlich nicht")
			say("schaffen können.")
				wait()
			say_title("Stallbursche:")
			say("")
			say("Töte 300 Dämonenbogenschützen innerhalb von 30 Minuten!")
			say("Dann werde ich dir das Militärpferd geben.")
			say("")
			say("Möchtest du die Prüfung jetzt beginnen?")
			local v = select ("Ja", "Nein")
			if v == 1 then
				if horse.get_level() == 20 then
					if pc.count_item(50050) >= 1 then
						say_title("Stallbursche:")
						say("")
						say("Ok, ziehe jetzt los. Die 30 Minuten laufen ab jetzt!")
						say("Viel Glück.")
						pc.remove_item(50050, 1)
						pc.setqf("limit_time3", get_time()+30*60)
						pc.setqf("horse_ex_3", 300)
						q.set_clock("Zeit", pc.getqf("limit_time3")-get_time())
						set_state(kill_bogie_mobs3)
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
					say("Komme wieder wenn dein Pferd Level 20")
					say("erreicht hat.")
					return
				end
			elseif v == 2 then
				return
			end
		end
	end
	
	state kill_bogie_mobs3 begin
		when letter begin
			send_letter("Die Pferdeprüfung")
			q.set_counter("Bogenschützen.", pc.getqf("horse_ex_3"))
			q.set_clock("Zeit", pc.getqf("limit_time3")-get_time())
		end
		
		when login or levelup with get_time()>=pc.getqf("limit_time3") begin
			clear_letter()
			pc.delqf("horse_ex_3")
			set_state(failure_quest3)
		end

		when info or button begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Um die Pferdeprüfung abzuschließen musst du")
			say("innerhalb von 30 Minuten 300 Dämonenbogenschützen")
			say("töten. Sie sind im Dämonenturm ab der ersten Ebene")
			say("zu finden!")
			say("")
			say_reward("Du musst noch "..pc.getqf("horse_ex_3").."")
			say_reward("von 300 Dämonenbogenschützen töten!")
		end
		
		when 1002.party_kill begin
			pc.setqf("horse_ex_3", pc.getqf("horse_ex_3")-1)
			local kill_count = pc.getqf("horse_ex_3") 
			q.set_counter("Noch verbl.", kill_count)
			if kill_count == 0 then
				clear_letter()
				pc.setqf("horse_ex_3", 0)
				set_state(finish_kills3)
			end
			if get_time()>=pc.getqf("limit_time3") then
				clear_letter()
				pc.setqf("horse_ex_3", 0)
				set_state(failure_quest3)
			end
		end
	end 
	
	state finish_kills3 begin
		when letter begin
			cleartimer("limit_time3")
			send_letter("Prüfung erfolgreich!")
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Du hast die 300 Dämonenbogenschützen")
			say("innerhalb von 30 Minuten getötet.")
			say("Gehe zum Stallburschen und berichte ihm")
			say("davon.")
			say("")
			say_reward("Auf zum Stallburschen")
			say("")
		end
		
		when __TARGET__.target.click or 20349.chat."Das Militär-Pferd" begin
			target.delete(__TARGET__)
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du dein Militärpferd beherrschen kannst.")
			say("Nun brauchst du noch das Militär-Pferdebuch.")
			say("")
			say("Für die Herstellung benötige ich 1.000.000 Yang.")
			say("")
			local v = select ("Bezahlen", "Abbrechen")
			if v == 1 then
				if pc.money>=1000000 then
					if not selectHorseAppearence(50052) then return end

					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Militär-Pferdebuch!")
					say_item_vnum(50053)
					say("")
					wait()

					horse.set_level("21")
					pc.changemoney(-1000000)
					pc.remove_item(50052, 1)
					set_state(__COMPLETE__)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast, kannst du wiederkommen")
					say("und das Militär-Pferdebuch kaufen!")
					say("")
				end
			elseif v == 2 then
				clear_letter()
				set_state(buy_horse_book)
			end
		end
	end
	
	state buy_horse_book begin
		when 20349.chat."Militär-Pferdebuch" begin
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du dein Militärpferd beherrschen kannst.")
			say("Nun brauchst du noch das Militär-Pferdebuch.")
			say("")
			say("Für die Herstellung benötige ich 1.000.000 Yang.")
			say("")
			local v = select ("Bezahlen", "Abbrechen")
			if v == 1 then
				if pc.money>=1000000 then	
					if not selectHorseAppearence(50053) then return end

					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Militär-Pferdebuch!")
					say_item_vnum(50053)
					say("")
					say("Außerdem schenke ich dir noch ein Buch")
					say("der Reitkunst, um mit dem Fertigkeitstraining")
					say("deines Pferdes beginnen zu können.")
					wait()

					horse.set_level(21)
					pc.changemoney(-1000000)
					pc.remove_item(50052, 1)
					pc.give_item2(50060, 1)
					set_quest_state("horse_mission4", "run")
					set_state(__COMPLETE__)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast, kannst du wiederkommen")
					say("und das Militär-Pferdebuch kaufen!")
					say("")
				end
			elseif v == 2 then
				return
			end
		end
	end
	
	state failure_quest3 begin
		when letter begin
			send_letter("Die Pferdeprüfung")
			pc.setqf("horse_ex_3", 0)
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Du hast die 300 Dämonenbogenschützen innerhalb von 30")
			say("Minuten nicht töten können. Geh zum")
			say("Stallburschen und versuche es erneut!")
			say("")
			clear_letter()
			set_state(start)
		end
	end
	
	state __COMPLETE__ begin
		when enter begin
			q.done()
		end
	end
end