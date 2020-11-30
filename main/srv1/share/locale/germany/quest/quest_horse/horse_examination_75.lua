quest horse_mission4 begin
	state start begin
	end
	
	state run begin
		when login or levelup with pc.get_level() >= 75 and horse.get_level() == 29 begin
			send_letter("Das Schlachtross")
		end
		
		when button or info begin
			say_title("Das Schlachtross")
			say("")
			say("Du bist Level 75 und kannst")
			say("nun deine Prüfung für dein")
			say("Schlachtross absolvieren!")
			say("Bringe dazu eine Pferdemedaille mit!")
			say("")
			clear_letter()
			set_state(horse_mission4_begin)
		end
	end
		
	state horse_mission4_begin begin
		when 20349.chat."Das Schlachtross" begin
			say_title("Stallbursche:")
			say("")
			say("Hallo "..pc.get_name()..",")
			say("du willst also das Schlachtross?")
			say("Dann musst du erstmal beweisen,")
			say("dass du würdig bist das Schlachtross zu führen.")
			say("Diese Prüfung ist die letzte und härteste!")
			say("Ohne eine Gruppe wirst du sie vermutlich nicht")
			say("schaffen können.")
				wait()
			say_title("Stallbursche:")
			say("")
			say("Töte 500 Setaou-Jäger innerhalb von 30 Minuten!")
			say("Dann werde ich dir das Schlachtross geben.")
			say("")
			say("Möchtest du die Prüfung jetzt beginnen?")
			local v = select ("Ja", "Nein")
			if v == 1 then
				if horse.get_level() == 29 then
					if pc.count_item(50050) >= 1 then
						say_title("Stallbursche:")
						say("")
						say("Ok, ziehe jetzt los. Die 30 Minuten laufen ab jetzt!")
						say("Viel Glück.")
						pc.remove_item(50050, 1)
						pc.setqf("limit_time4", get_time()+30*60)
						pc.setqf("horse_ex_4", 500)
						set_state(kill_bogie_mobs4)
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
					say("Komme wieder wenn dein Pferd Level 29")
					say("erreicht hat.")
					return
				end
			elseif v == 2 then
				return
			end
		end
	end
	
	state kill_bogie_mobs4 begin
		when letter begin
			send_letter("Die Pferdeprüfung")
			q.set_counter("Bogenschützen.", pc.getqf("horse_ex_4"))
			q.set_clock("Zeit", pc.getqf("limit_time4")-get_time())
		end
		
		when login or levelup with get_time()>=pc.getqf("limit_time3") begin
			clear_letter()
			pc.delqf("limit_time4")
			pc.delqf("horse_ex_4")
			set_state(failure_quest4)
		end
		
		when info or button begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Um die Pferdeprüfung abzuschließen musst du")
			say("innerhalb von 30 Minuten 500 Setaou-Jäger")
			say("töten. Sie sind in der Grotte der Verbannung")
			say("zu finden!")
			say("")
			say_reward("Du musst noch "..pc.getqf("horse_ex_4").."")
			say_reward("von 500 Setaou-Jägern töten!")
		end
		
		when 2402.party_kill begin
			pc.setqf("horse_ex_4", pc.getqf("horse_ex_4")-1)
			local kill_count = pc.getqf("horse_ex_4") 
			q.set_counter("Noch verbl.", kill_count)
			if kill_count == 0 then
				clear_letter()
				pc.setqf("horse_ex_4", 0)
				set_state(finish_kills4)
			end
			if get_time()>=pc.getqf("limit_time4") then
				clear_letter()
				pc.setqf("horse_ex_4", 0)
				set_state(failure_quest4)
			end
		end
	end 
	
	state finish_kills4 begin
		when letter begin
			cleartimer("limit_time4")
			send_letter("Prüfung erfolgreich!")
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Du hast die 500 Setaou-Jäger")
			say("innerhalb von 30 Minuten getötet.")
			say("Gehe zum Stallburschen und berichte ihm")
			say("davon.")
			say("")
			say_reward("Auf zum Stallburschen")
			say("")
		end
		
		when __TARGET__.target.click or 20349.chat."Das Schlachtross" begin
			target.delete(__TARGET__)
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du dein Schlachtross beherrschen kannst.")
			say("Nun brauchst du noch das Schlachtross-Siegel.")
			say("")
			say("Für die Herstellung benötige ich 2.000.000 Yang.")
			say("")
			local v = select ("Bezahlen", "Abbrechen")
			if v == 1 then
				if pc.money>=2000000 then
					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Schlachtross-Siegel!")
					say_item_vnum(50069)
					say("")
					horse.set_level(30)
					pc.changemoney(-2000000)
					pc.remove_item(50053, 1)
					pc.give_item2(50069, 1)
					set_state(__COMPLETE__)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast, kannst du wiederkommen")
					say("und das Schlachtross-Siegel kaufen!")
					say("")
				end
			elseif v == 2 then
				clear_letter()
				set_state(buy_horse_book)
			end
		end
	end
	
	state buy_horse_book begin
		when 20349.chat."Schlachtross-Siegel" begin
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewiesen, dass")
			say("du dein Schlachtross beherrschen kannst.")
			say("Nun brauchst du noch das Schlachtross-Siegel.")
			say("")
			say("Für die Herstellung benötige ich 2.000.000 Yang.")
			say("")
			local v = select ("Bezahlen", "Abbrechen")
			if v == 1 then
				if pc.money>=2000000 then
					say_title("Stallbursche:")
					say("")
					say("Du erhälst das Schlachtross-Siegel!")
					say_item_vnum(50069)
					say("")
					horse.set_level(30)
					pc.changemoney(-2000000)
					pc.remove_item(50053, 1)
					pc.give_item2(50069, 1)
					set_state(__COMPLETE__)
				else
					say_title("Stallbursche:")
					say("")
					say("Du hast leider nicht genug Yang bei dir.")
					say("Wenn du genug Yang hast, kannst du wiederkommen")
					say("und das Schlachtross-Siegel kaufen!")
					say("")
				end
			elseif v == 2 then
				return
			end
		end
	end
	
	state failure_quest4 begin
		when letter begin
			send_letter("Die Pferdeprüfung")
			pc.setqf("horse_ex_4", 0)
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdeprüfung")
			say("")
			say("Du hast die 500 Setaou-Jäger innerhalb von 30")
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