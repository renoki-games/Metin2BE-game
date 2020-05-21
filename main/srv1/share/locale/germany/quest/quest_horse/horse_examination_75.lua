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
			say("nun deine Pr�fung f�r dein Schlachtross absolvieren!")
			say("Bringe dazu 1 Pferdemedaillen mit!")
			say("")
			clear_letter()
			set_state(horse_mission4_begin)
		end
	end
		
	state horse_mission4_begin begin
		when 20349.chat."Das Schlachtross" begin
			say("Stallbursche:")
			say("")
			say("Hallo "..pc.get_name().."")
			say("Du willst also das Schlachtross?")
			say("Dann musst du erstmal beweisen")
			say("das du w�rdig bist das Schlachtross zu f�hren")
			say("Diese Pr�fung ist die letzte und h�rteste!")
			say("Ohne Gruppe wirst du sie vermutlich nicht")
			say("schaffen.")
				wait()
			say("Stallbursche:")
			say("")
			say("Ich bitte dich nun zur letzten Pr�fung")
			say("500 Setaou-J�ger innerhalb 30 Minuten")
			say("zu t�ten. Dann werde ich dir das Schlachtross geben.")
			say("")
			say("M�chtest du die Pr�fung jetzt beginnen?")
			local v = select ("Ja, ich m�chte!", "Nein, Sp�ter.")
			if v == 1 then
				if horse.get_level() == 29 then
					if pc.count_item(50050) >= 1 then
						say("Stallbursche:")
						say("")
						say("Ok, ziehe jetzt los. Die 30 Minuten laufen ab jetzt!")
						say("Viel Gl�ck.")
						pc.remove_item(50050, 1)
						pc.setqf("limit_time4", get_time()+30*60)
						pc.setqf("horse_ex_4", 500)
						set_state(kill_bogie_mobs3)
					else
						say("Stallbursche:")
						say("")
						say("Du hast keine Pferdemedaille dabei!")
						say("Komme wieder wenn du eine bei dir")
						say("tr�gst.")
						return
					end
				else
					say("Stallbursche:")
					say("")
					say("Dein Pferdelevel ist nicht hoch genug!")
					say("Komme wieder wenn dein Pferd level 29")
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
			send_letter("Die Pferdepr�fung")
		end
		
		when login or levelup with get_time()>=pc.getqf("limit_time4") begin
			clear_letter()
			pc.setqf("horse_ex_4", 0)
			set_state(failure_quest3)
		end
		
		when login begin
			q.set_counter("Noch verbl.", pc.getqf("horse_ex_4"))
			q.set_clock("Zeit", pc.getqf("limit_time4")-get_time())
		end
		
		when leave begin
			q.done()
		end
		
		when info or button begin
			say_title("Die Pferdepr�fung")
			say("")
			say("Um die Pferdepr�fung abzuschlie�en musst du")
			say("innerhalb 30 Minuten 500 Setaou-J�ger")
			say("t�ten. Sie sind im D�monenturm der ersten Ebenen")
			say("zu finden!")
			say("")
			say_reward("Du musst noch "..pc.getqf("horse_ex_4").."")
			say_reward("von 500 Setaou-J�ger t�ten!")
		end
		
		when 2402.party_kill begin
			pc.setqf("horse_ex_4", pc.getqf("horse_ex_4")-1)
			local kill_count = pc.getqf("horse_ex_4") 
			q.set_counter("Noch verbl.", kill_count)
			if kill_count == 0 then
				clear_letter()
				pc.setqf("horse_ex_4", 0)
				set_state(finish_kills3)
			end
			if get_time()>=pc.getqf("limit_time4") then
				clear_letter()
				pc.setqf("horse_ex_4", 0)
				set_state(failure_quest3)
			end
		end
	end 
	
	state finish_kills3 begin
		when letter begin
			cleartimer("limit_time4")
			send_letter("Pr�fung Erfolgreich!")
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdepr�fung")
			say("")
			say("Du hast die 500 Setaou-J�ger innerhalb")
			say("30 Minuten get�tet.")
			say("")
			say_reward("Auf zum Stallburschen")
			say("")
		end
		
		when __TARGET__.target.click or 20349.chat."Das Schlachtross" begin
			target.delete(__TARGET__)
			say_title("Stallbursche:")
			say("")
			say("Du hast die Aufgabe erledigt und bewisen das")
			say("du dein Schlachtross beherrschen kannst.")
			say("Nun brauchst du noch das Schlachtross-Siegel.")
			say("")
			say("F�r die herstellung ben�tige ich 2.000.000 Yang")
			say("")
			local v = select ("Bezahlen", "Noch nicht")
			if v == 1 then
				if pc.money>=2000000 then
					say_title("Stallbursche:")
					say("")
					say("Du erh�lst das Schlachtross-Siegel!")
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
					say("Wenn du genug Yang hast kannst du wiederkommen")
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
			say("Du hast die Aufgabe erledigt und bewisen das")
			say("du dein Schlachtross beherrschen kannst.")
			say("Nun brauchst du noch das Schlachtross-Siegel")
			say("")
			say("F�r die herstellung ben�tige ich 2.000.000 Yang")
			say("")
			local v = select ("Bezahlen", "Noch nicht")
			if v == 1 then
				if pc.money>=2000000 then
					say_title("Stallbursche:")
					say("")
					say("Du erh�lst das Schlachtross-Siegel!")
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
					say("Wenn du genug Yang hast kannst du wiederkommen")
					say("und das Schlachtross-Siegel kaufen!")
					say("")
				end
			elseif v == 2 then
				return
			end
		end
	end
	
	state failure_quest3 begin
		when letter begin
			send_letter("Die Pferdepr�fung")
			pc.setqf("horse_ex_4", 0)
			local v = find_npc_by_vnum(20349)
			if v != 0 then target.vid("__TARGET__", v, "Hauptmann3")
			end
		end
		
		when button or info begin
			say_title("Die Pferdepr�fung")
			say("")
			say("Du hast die 500 Setaou-J�ger innerhalb von 30")
			say("Minuten nicht t�ten k�nnen. Geh zum")
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