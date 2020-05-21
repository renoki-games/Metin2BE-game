	-----------------------
	-- LvL 30 / Orkzähne --
	-----------------------
quest bio begin
	state start begin
		when login or levelup with pc.get_level() >=30  begin
			set_state(talk_to_disciple_lv30)
		end	
	end
	state talk_to_disciple_lv30 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then target.vid("__TARGET__", v, "Biologe")
			end
			send_letter("Die Forschung des Biologen")
		end
		when button or info begin
			say_title("Die Forschung des Biologen")
			say("")
			say("Der Biologe benötigt deine Hilfe.")
			say("Sprich mit ihm.")
			say("")
			say_reward("Sprich mit dem Biologen")
			say("")
		end
		when __TARGET__.target.click or 20084.chat."Orkzähne" begin
			target.delete("__TARGET__")
			say_title("Biologe:")
			say("")
			say("Oh, du hilfst mir?")
			say("Gut ...")
			say("Ich bin übrigens der Biologe")
			say("und studiere zahlreiches aus der Pflanzenwelt.")
			say("Wenn du mir bei meinen Forschungen hilfst,")
			say("werde ich dich reich belohnen.")
			say("")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich habe vor kurzem wieder angefangen ...")
			say("Ich forsche an einer Legende ...")
			say("Doch habe ich derzeit viel zu tun,")
			say("es wäre also nett, wenn du mir hilfst ...")
			say("")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich benötige zehn Orkzähne für meine Forschungen.")
			say("Diese sind jedoch sehr zerbrechlich,")
			say("es kann also sein, dass einige bei")
			say("meinen Untersuchungen kaputt gehen.")
			say("Ich benötige alle zehn,")
			say("um meine Forschungen vollenden zu können.")
			say("")
			set_state(collect_orcteeth)
			pc.setqf("collect_count",0)
		end
	end
	state collect_orcteeth begin
		when letter begin
			send_letter("Die Forschung des Biologen")
		end
		when button or info begin
			say_title("Orkzähne")
			say("")
			say("Der Biologe gab dir den Auftrag,")
			say("zehn Orkzähne zu sammeln.")
			say("Sammel und bring sie dem Biologen.")
			say("")
			say_item_vnum(30006) 
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		
		when 20084.chat."Orkzähne" with pc.count_item(30006)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Biologe:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Biologe:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob dieser Zahn in Ordnung ist ...")
			say("")
			pc.remove_item("30006", 1)
			wait()
			if rand<50 then
				local count = pc.getqf("collect_count")+1
				if count<10 then
					pc.setqf("collect_count", count)
					say_title("Biologe:")
					say("")
					say("Hervorragend, dieser Zahn ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Biologe:")
					say("")
					say("Du hast mir die 10 Stück gebracht...")
					say("Nun bitte ich dich noch, mir den")
					say("Jinunggyis Seelenstein zu bringen.")
					say("Du bekommst ihn von Stolzen Orks ...")	
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.setqf("collect_count",0)
					set_state(collect_jinunggyis)
				end
			else
				say_title("Biologe:")
				say("")
				say("Es tut mir leid, aber der Zahn ist bei")
				say("den Untersuchungen zerbrochen.")
				say("Bitte hol mir einen neuen Orkzahn!")
				say("")
			end
		end
	end
	state collect_jinunggyis begin
		when letter begin
			send_letter("Jinunggyis Seelenstein")
		end
		when button or info begin
			say_title("Jinunggyis Seelenstein")
			say("")
			say("Du hast alle zehn Orkzähne gesammelt.")
			say("Nun musst du Jinunggyis Seelenstein erbeuten.")
			say("")
			say_item_vnum(30220)
			say("Ob dieser Stein tatsächlich eine Seele enthält?")
			say("")
			say_reward("Töte die Stolzen Orks")
			say("")
		end
		when 631.kill or  632.kill or 633.kill or 634.kill or 635.kill begin
			if pc.count_item(30220)<1 then
				local rand = number(1,100)
				if rand<=3 then game.drop_item_with_ownership(30220, 1)
				end
			end	
		end
		when 20084.chat."Jinunggyis Seelenstein" begin
			if pc.count_item(30220)>0 then
				say_title("Biologe:")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
				say("die Legende um Jinunggyis Seelenstein.")
				say("Du hast hart gekämpft.")
				say("Sprich mit Baek-Go, er wird dir helfen,")
				say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30220,1)
				set_state(jinunggyis_reward)
			else
				say_title("Biologe:")
				say("")
				say("Du hast mir die 10 Stück gebracht...")
				say("Nun bitte ich dich noch, mir den")
				say("Jinunggyis Seelenstein zu bringen.")
				say("Du bekommst ihn von Stolzen Orks ...")	
				say("Ich denke, dafür bist du stark genug.")
				say("")
			end
		end
	end	
	state jinunggyis_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Die Forschung des Biologen: Baek-Go")
			say("")
			say("Um die Belohnung des Biologen zu erhalten")
			say("suche mit den Informationen der")
			say("Orkzähne und des Seelensteins Baek-Go auf.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("")
			say("Ich sehe ...")
			say("Der Biologe hat dich zu mir geschickt.")
			say("Hier ist deine Belohnung:")
			say("")
			say_reward("Du erhälst:")
			say_reward("Bewegungsgeschwindigkeit +10 (Dauerhaft)")
			say_reward("1x Roter Ebenholzkasten")
			say("")
			affect.add_collect(apply.MOV_SPEED, 10, 60*60*24*365*60)
			pc.give_item2(50109, 1)
			set_state(collect_quest_lv40)
		end
	end

	----------------------------
	-- LvL 40 / Fluchsammlung --
	----------------------------
	state collect_quest_lv40 begin
		when login or levelup with pc.level>39 begin
			set_state(talk_to_disciple_lv40)
		end	
	end
	state talk_to_disciple_lv40 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then target.vid("__TARGET__", v, "Biologe")
			end
			send_letter("Forschung des Biologen 2")
		end
		when button or info begin
			say_title("Forschung des Biologen 2")
			say("")
			say("Der Biologe benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Gegenständen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit dem Biologen")
			say("")
		end
		when __TARGET__.target.click or 20084.chat."Fluchsammlungen" begin
			target.delete("__TARGET__")
			say_title("Biologe:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Orkzähne")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich möchte die Fluchsammlungen untersuchen.")
			say("Davon benötige ich 15 Stück.")
			say("Die Bücher sind jedoch ziemlich alt,")
			say("manchmal zerfallen sie einfach!")
			say("")
			set_state(collect_cursebook)
			pc.setqf("collect_count",0)
		end
	end
	state collect_cursebook begin
		when letter begin
			send_letter("Forschung des Biologen 2")
		end
		when button or info begin
			say_title("Fluchsammlungen")
			say("")
			say("Der Biologe gab dir den Auftrag,")
			say("15 Fluchsammlungen zu besorgen.")
			say("Diese kannst du bei den Dunklen- und")
			say("Hohen Peinigern erbeuten.")
			say("")
			say_item_vnum(30047) 
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end

		when 20084.chat."Fluchsammlungen" with pc.count_item(30047)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Biologe:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Biologe:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob diese Fluchsammlung in Ordnung ist ...")
			say("")
			pc.remove_item(30047, 1)
			wait()
			if rand<50 then
				local count = pc.getqf("collect_count")+1
				if count<15 then
					pc.setqf("collect_count", count)
					say_title("Biologe:")
					say("")
					say("Hervorragend, diese Fluchsammlung ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Biologe:")
					say("Du hast mir die 15 Sammlungen gebracht.")
					say("Nun, ich habe noch eine Bitte.")
					say("Ich benötige den Tempelseelenstein,")
					say("den du von Stolzen dunklen Fanatikern,")
					say("Kämpfern, sowie Obersten erbeuten kannst.")
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.setqf("collect_count",0)
					set_state(collect_templekey)
				end
			else
				say_title("Biologe:")
				say("")
				say("Es tut mir leid, die Fluchsammlung")
				say("ist bei den Untersuchungen zerfallen.")
				say("Bitte hol mir eine neue Fluchsammlung.")
			end
		end
	end
	state collect_templekey begin
		when letter begin
			send_letter("Tempelseelenstein")
		end
		when button or info begin
			say_title("Tempelseelenstein")
			say("")
			say("Du hast alle 15 Fluchsammlungen abgegeben.")
			say("Nun musst du den Tempelseelenstein erbeuten.")
			say("")
			say_item_vnum(30221)
			say("Ob dieser Stein tatsächlich Seelen")
			say("der Tempelanhänger enthält?")
			say("")
			say_reward("Töte die Stolzen dunklen Fanatikern,")
			say_reward("Kämpfern und Obersten")
		end
		when 731.kill or 732.kill or 733.kill or 734.kill or 735.kill or 736.kill or 737.kill begin
			if pc.count_item(30221)<1 then
				local rand = number(0,99)
				if rand<5 then game.drop_item_with_ownership(30221, 1)
				end
			end	
		end
		when 20084.chat."Tempelseelenstein" begin
			if pc.count_item(30221)>0 then
				say_title("Biologe:")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
				say("die Legende um den Tempelseelenstein.")
				say("Du hast hart gekämpft.")
				say("Sprich mit Baek-Go, er wird dir helfen,")
				say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30221,1)
				set_state(templekey_reward)
			else
				say_title("Biologe:")
				say("")
				say("Du hast mir die 15 Sammlungen gebracht.")
				say("Nun, ich habe noch eine Bitte.")
				say("Ich benötige den Tempelseelenstein,")
				say("den du von Stolzen dunklen Fanatikern,")
				say("Kämpfern, sowie Obersten erbeuten kannst.")
				say("Ich denke, dafür bist du stark genug.")
				say("")		
			end
		end
	end
	state templekey_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Biologen zu erhalten,")
			say("suche mit den Informationen der")
			say("Fluchsammlungen und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("")
			say("Ich sehe ...")
			say("Der Biologe hat dich zu mir geschickt.")
			say("Hier ist deine Belohnung:")
			say("")
			say_reward("Du erhälst:")
			say_reward("Angriffsgeschwindigkeit +5 (Dauerhaft)")
			say_reward("1x Prunk Ebenholzkiste")
			say("")
			affect.add_collect(apply.ATT_SPEED, 5, 60*60*24*365*60)
			pc.give_item2(50110, 1)
			set_state(collect_quest_lv50)
		end
	end

	------------------------------
	-- LvL 50 / Dämonenandenken --
	------------------------------
	state collect_quest_lv50 begin
		when login or levelup with pc.level>49 begin
			set_state(talk_to_disciple_lv50)
		end	
	end
	state talk_to_disciple_lv50 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then target.vid("__TARGET__", v, "Biologe")
			end
			send_letter("Forschung des Biologen 3")
		end
		when button or info begin
			say_title("Forschung des Biologen 3")
			say("")
			say("Der Biologe benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Gegenständen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit dem Biologen")
			say("")
		end
		when __TARGET__.target.click or 20084.chat."Dämonenandenken" begin
			target.delete("__TARGET__")
			say_title("Biologe:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Fluchsammlungen")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich möchte die Dämonenandenken untersuchen.")
			say("Davon benötige ich 15 Stück.")
			say("Diese sind jedoch ziemlich zerbrechlich,")
			say("es kann also sein, dass einige bei")
			say("meinen Untersuchungen kaputt gehen.")
			say("")
			set_state(collect_deamonitem)
			pc.setqf("collect_count",0)
		end
	end
	state collect_deamonitem begin
		when letter begin
			send_letter("Forschung des Biologen 3")
		end
		when button or info begin
			say_title("Dämonenandenken")
			say("")
			say("Der Biologe gab dir den Auftrag,")
			say("15 Dämonenandenken zu besorgen.")
			say("Diese kannst du bei den Monstern im")
			say("Dämonenturm erbeuten.")
			say("")
			say_item_vnum(30015)
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		
		when 20084.chat."Dämonenandenken" with pc.count_item(30015)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Biologe:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Biologe:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob dieses Dämonenandenken in Ordnung ist ...")
			say("")
			pc.remove_item("30015", 1)
			wait()
			if rand<50 then
				local count = pc.getqf("collect_count")+1
				if count<15 then
					pc.setqf("collect_count", count)
					say_title("Biologe:")
					say("")
					say("Hervorragend,")
					say("dieses Dämonenandenken ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Biologe:")
					say("")
					say("Du hast mir die 15 Andenken gebracht.")
					say("Nun, ich habe noch eine Bitte.")
					say("Ich benötige Sagyis Seelenstein,")
					say("den du von den Monstern im Dämonenturm,")
					say("erbeuten kannst.")
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.setqf("collect_count",0)
					set_state(collect_sagyis)
				end
			else
				say_title("Biologe:")
				say("")
				say("Es tut mir leid, das Andenken")
				say("ist bei den Untersuchungen zerbrochen.")
				say("Bitte hol mir ein Neues.")
			end
		end
	end
	state collect_sagyis begin
		when letter begin
			send_letter("Sagyis Seelenstein")
		end
		when button or info begin
			say_title("Sagyis Seelenstein")
			say("")
			say("Du hast alle 15 Dämonenandenken abgegeben.")
			say("Nun musst du Sagyis Seelenstein erbeuten.")
			say("")
			say_item_vnum(30222)
			say("Ob dieser Stein tatsächlich Seelen")
			say("von Sagyis Adligen enthält?")
			say("")
		end
		when 1031.kill or 1032.kill or 1033.kill or 1034.kill  begin
			if pc.count_item(30222)<1 then
				local rand = number(0,99)
				if rand<5 then game.drop_item_with_ownership(30222, 1)
				end
			end	
		end
		when 20084.chat."Sagyis Seelenstein" begin
			target.delete("__TARGET__")
			if pc.count_item(30222)>0 then
				say_title("Biologe:")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
				say("die Legende um Sagyis Seelenstein.")
				say("Du hast hart gekämpft.")
				say("Sprich mit Baek-Go, er wird dir helfen,")
				say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30222,1)
				set_state(sagyis_reward)
			else
				say_title("Biologe:")
				say("")
				say("Du hast mir die 15 Andenken gebracht.")
				say("Nun, ich habe noch eine Bitte.")
				say("Ich benötige Sagyis Seelenstein,")
				say("den du von den Monstern im Dämonenturm,")
				say("erbeuten kannst.")
				say("Ich denke, dafür bist du stark genug.")
				say("")	
			end
		end
	end
	state sagyis_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Biologen zu erhalten,")
			say("suche mit den Informationen der")
			say("Dämonenandenken und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
			say_title("Baek-Go:")
			say("")
			say("Ich sehe ...")
			say("Der Biologe hat dich zu mir geschickt.")
			say("Hier ist deine Belohnung:")
			say("")
			say_reward("Du erhälst:")
			say_reward("Verteidigung +60 (Dauerhaft)")
			say_reward("1x Gelber Ebenholzkasten")
			say("")
			affect.add_collect(apply.DEF_GRADE_BONUS, 60, 60*60*24*365*60)
			pc.give_item2(50111, 1)
			set_state(collect_quest_lv60)
		end
	end

	------------------------
	-- LvL 60 / Eiskugeln --
	------------------------
	state collect_quest_lv60 begin
		when login or levelup with pc.level>59 begin
			set_state(talk_to_disciple_lv60)
		end	
	end
	state talk_to_disciple_lv60 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then target.vid("__TARGET__", v, "Biologe")
			end
			send_letter("Forschung des Biologen 4")
		end
		when button or info begin
			say_title("Forschung des Biologen 4")
			say("")
			say("Der Biologe benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Gegenständen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit dem Biologen")
			say("")
		end
		when __TARGET__.target.click or 20084.chat."Eiskugeln" begin
			target.delete("__TARGET__")
			say_title("Biologe:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Dämonenandenken")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich möchte die Eiskugeln untersuchen.")
			say("Davon benötige ich 20 Stück.")
			say("Diese sind jedoch ziemlich zerbrechlich,")
			say("es kann also sein, dass einige bei")
			say("meinen Untersuchungen kaputt gehen.")
			say("")
			set_state(collect_scoops)
			pc.setqf("collect_count",0)
		end
	end
	state collect_scoops begin
		when letter begin
			send_letter("Forschung des Biologen 4")
		end
		when button or info begin
			say_title("Eiskugeln")
			say("")
			say("Der Biologe gab dir den Auftrag,")
			say("20 Eiskugeln zu besorgen.")
			say("Diese kannst du bei den Eisgolems auf")
			say("dem Berg Sohan erbeuten.")
			say("")
			say_item_vnum(30050)
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		
		when 20084.chat."Eiskugeln" with pc.count_item(30050)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Biologe:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Biologe:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob diese Eiskugel in Ordnung ist ...")
			say("")
			pc.remove_item("30050", 1)
			wait()
			if rand<50 then
				local count = pc.getqf("collect_count")+1
				if count<20 then
					pc.setqf("collect_count", count)
					say_title("Biologe:")
					say("")
					say("Hervorragend,")
					say("diese Eiskugel ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Biologe:")
					say("")
					say("Du hast mir die 20 Eiskugeln gebracht.")
					say("Nun, ich habe noch eine Bitte.")
					say("Ich benötige Aurtumryus Seelenstein,")
					say("den du von den Eismonstern auf dem Berg Sohan,")
					say("erbeuten kannst.")
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.setqf("collect_count",0)
					set_state(collect_aurtumryus)
				end
			else
				say_title("Biologe:")
				say("")
				say("Es tut mir leid, die Eiskugel")
				say("ist bei den Untersuchungen zerbrochen.")
				say("Bitte hol mir eine Neue.")
			end
		end
	end
	
	state collect_aurtumryus begin
		when letter begin
			send_letter("Aurtumryus Seelenstein")
		end
		when button or info begin
			say_title("Aurtumryus Seelenstein")
			say("")
			say("Du hast alle 20 Eiskugeln abgegeben.")
			say("Nun musst du Aurtumryus Seelenstein erbeuten.")
			say("")
			say_item_vnum(30223)
			say("Ob dieser Stein tatsächlich Seelen")
			say("von Aurtumryus Adligen enthält?")
			say("")
		end
		when 1101.kill or 1102.kill or 1103.kill or 1104.kill or 1105.kill or 1106.kill or 1107.kill begin
			if pc.count_item(30223)<1 then
				local rand = number(0,99)
				if rand<5 then game.drop_item_with_ownership(30223, 1)
				end
			end	
		end
		when 20084.chat."Aurtumryus Seelenstein" begin
			if pc.count_item(30223)>0 then
				say_title("Biologe:")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
				say("die Legende um Aurtumryus Seelenstein.")
				say("Du hast hart gekämpft.")
				say("Sprich mit Baek-Go, er wird dir helfen,")
				say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30223,1)
				set_state(aurtumryus_reward)
			else
				say_title("Biologe:")
				say("")
				say("Du hast mir die 20 Eiskugeln gebracht.")
				say("Nun, ich habe noch eine Bitte.")
				say("Ich benötige Aurtumryus Seelenstein,")
				say("den du von den Eismonstern auf dem Berg Sohan,")
				say("erbeuten kannst.")
				say("Ich denke, dafür bist du stark genug.")
				say("")
			end
		end
	end
	state aurtumryus_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Biologen zu erhalten,")
			say("suche mit den Informationen der")
			say("Eiskugeln und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("")
			say("Ich sehe ...")
			say("Der Biologe hat dich zu mir geschickt.")
			say("Hier ist deine Belohnung:")
			say("")
			say_reward("Du erhälst:")
			say_reward("Angriffswert +50 (Dauerhaft)")
			say_reward("1x Hellgrüner Ebenholskasten")
			say("")
			affect.add_collect(apply.ATT_GRADE_BONUS, 50, 60*60*24*365*60)
			pc.give_item2(50112, 1)
			set_state(collect_quest_lv70)
		end
	end

	--------------------------------
	-- LvL 70 / Zelkovas Holzäste --
	--------------------------------

	state collect_quest_lv70 begin
		when login or levelup with pc.level>69 begin
			set_state(talk_to_disciple_lv70)
		end	
	end
	state talk_to_disciple_lv70 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then target.vid("__TARGET__", v, "Biologe")
			end
			send_letter("Forschung des Biologen 5")
		end
		when button or info begin
			say_title("Forschung des Biologen 5")
			say("")
			say("Der Biologe benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Gegenständen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit dem Biologen")
			say("")
		end
		when __TARGET__.target.click or 20084.chat."Zelkovas Holzäste" begin
			target.delete("__TARGET__")
			say_title("Biologe:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Eiskugeln")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich möchte Zelkovas Holzäste untersuchen.")
			say("Davon benötige ich 25 Stück.")
			say("Diese welken jedoch ziemlich schnell,")
			say("es kann also sein, dass einige für")
			say("meine Untersuchungen unbrauchbar sind.")
			say("")
			set_state(collect_branches)
			pc.setqf("collect_count",0)
		end
	end
	state collect_branches begin
		when letter begin
			send_letter("Forschung des Biologen 5")
		end
		when button or info begin
			say_title("Zelkovas Holzäste")
			say("")
			say("Der Biologe gab dir den Auftrag,")
			say("25 von Zelkovas Holzästen zu besorgen.")
			say("Diese kannst du bei den Monstern")
			say("im Geisterwald erbeuten.")
			say("")
			say_item_vnum(30165)
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		
		when 2301.kill or 2302.kill or 2303.kill or 2304.kill or 2305.kill or 2311.kill or 
			 2312.kill or 2313.kill or 2314.kill or 2315.kill or 2306.kill or 2307.kill begin
			 local rand = number(0,99)
			 if rand<1 then game.drop_item_with_ownership(30165, 1)
			end
		end
		
		when 20084.chat."Zelkovas Holzäste" with pc.count_item(30165)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Biologe:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Biologe:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob dieser Holzast in Ordnung ist ...")
			say("")
			pc.remove_item("30165", 1)
			wait()
			if rand<50 then
				local count = pc.getqf("collect_count")+1
				if count<25 then
					pc.setqf("collect_count", count)
					say_title("Biologe:")
					say("")
					say("Hervorragend,")
					say("dieser Holzast ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Biologe:")
					say("")
					say("Du hast mir die 25 Holzäste gebracht.")
					say("Nun, ich habe noch eine Bitte.")
					say("Ich benötige Gyimoks Seelenstein,")
					say("den du ebenfalls von den Monstern")
					say("im Geisterwald erbeuten kannst.")
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.setqf("collect_count",0)
					set_state(collect_gyimoks)
				end
			else
				say_title("Biologe:")
				say("")
				say("Es tut mir leid, der Holzast")
				say("ist während des Transports verwelkt.")
				say("Bitte hol mir einen Neuen.")
			end
		end
	end
	state collect_gyimoks begin
		when letter begin
			send_letter("Gyimoks Seelenstein")
		end
		when button or info begin
			say_title("Gyimoks Seelenstein")
			say("")
			say("Du hast alle 25 Holzäste abgegeben.")
			say("Nun musst du Gyimoks Seelenstein erbeuten.")
			say("")
			say_item_vnum(30224)
			say("Ob dieser Stein tatsächlich Seelen")
			say("von Gyimoks Adligen enthält?")
			say("")
		end
		when 2301.kill or 2302.kill or 2303.kill or 2304.kill or 2305.kill or 2311.kill or 
			 2312.kill or 2313.kill or 2314.kill or 2315.kill or 2306.kill or 2307.kill begin
			if pc.count_item(30224)<1 then
				local rand = number(0,99)
				if rand<1 then game.drop_item_with_ownership(30224, 1)
				end
			end	
		end
		when 20084.chat."Gyimoks Seelenstein" begin
			target.delete("__TARGET__")
			if pc.count_item(30224)>0 then
				say_title("Biologe:")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
				say("die Legende um Gyimoks Seelenstein.")
				say("Du hast hart gekämpft.")
				say("Sprich mit Baek-Go, er wird dir helfen,")
				say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30224,1)
				set_state(gyimoks_reward)
			else
				say_title("Biologe:")
				say("")
				say("Du hast mir die 25 Holzäste gebracht.")
				say("Nun...ich habe noch eine Bitte.")
				say("Ich benötige Gyimoks Seelenstein,")
				say("den du ebenfalls von den Monstern")
				say("im Geisterwald erbeuten kannst.")
				say("Ich denke, dafür bist du stark genug.")
				say("")
			end
		end
	end
	state gyimoks_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Biologen zu erhalten,")
			say("suche mit den Informationen der")
			say("Zelkova Holzäste und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("")
			say("Ich sehe ...")
			say("Der Biologe hat dich zu mir geschickt.")
			say("Hier ist deine Belohnung:")
			say("")
			say_reward("Du erhälst:")
			say_reward("Bewegungsgeschwindigkeit +11% (Dauerhaft)")
			say_reward("Schadensreduzierung +10% (Dauerhaft)")
			say_reward("1x Grüner Ebenholzkasten")
			say("")
			affect.add_collect(apply.MOV_SPEED, 11, 60*60*24*365*60)
			affect.add_collect(apply.NORMAL_HIT_DEFEND_BONUS, 10, 60*60*24*365*60)
			affect.add_collect(apply.SKILL_DEFEND_BONUS, 10, 60*60*24*365*60)
			pc.give_item2(50113, 1)
			set_state(collect_quest_lv80)
		end
	end

	----------------------------
	-- LvL 80 / Tugyis Tafeln --
	----------------------------
	state collect_quest_lv80 begin
		when login or levelup with pc.level>79 begin
			set_state(talk_to_disciple_lv80)
		end	
	end
	state talk_to_disciple_lv80 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then target.vid("__TARGET__", v, "Biologe")
			end
			send_letter("Forschung des Biologen 6")
		end
		when button or info begin
			say_title("Forschung des Biologen 6")
			say("")
			say("Der Biologe benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Gegenständen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit dem Biologen")
			say("")
		end
		when __TARGET__.target.click or 20084.chat."Tugyis Tafeln" begin
			target.delete("__TARGET__")
			say_title("Biologe:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Zelkova Holzäste")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich möchte Tugyis Tafeln untersuchen.")
			say("Davon benötige ich 30 Stück.")
			say("Diese sind jedoch ziemlich zerbrechlich,")
			say("es kann also sein, dass einige bei")
			say("meinen Untersuchungen kaputt gehen.")
			say("")
			set_state(collect_plates)
			pc.setqf("collect_count",0)
		end
	end
	state collect_plates begin
		when letter begin
			send_letter("Forschung des Biologen 6")
		end
		when button or info begin
			say_title("Tugyis Tafeln")
			say("")
			say("Der Biologe gab dir den Auftrag,")
			say("30 von Tugyis Tafeln zu besorgen.")
			say("Diese kannst du bei den Tausenkämpfern")
			say("im Land der Riesen erbeuten.")
			say("")
			say_item_vnum(30166)
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		when 1403.kill begin
			local rand = number(0,99)
			if rand<50 then game.drop_item_with_ownership(30166, 1)
			end
		end
		
		when 20084.chat."Tugyis Tafeln" with pc.count_item(30166)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Biologe:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Biologe:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob diese Tafel in Ordnung ist ...")
			say("")
			pc.remove_item("30166", 1)
			wait()
			if rand<50 then
				local count = pc.getqf("collect_count")+1
				if count<30 then
					pc.setqf("collect_count", count)
					say_title("Biologe:")
					say("")
					say("Hervorragend,")
					say("diese Tafel ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Biologe:")
					say("")
					say("Du hast mir die 30 Tafeln gebracht.")
					say("Nun, ich habe noch eine Bitte.")
					say("Ich benötige Tugyis Seelenstein,")
					say("den du ebenfalls von den Monstern")
					say("im Land der Riesen erbeuten kannst.")
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.setqf("collect_count",0)
					set_state(collect_tugyis)
				end
			else
				say_title("Biologe:")
				say("")
				say("Es tut mir leid, die Tafel")
				say("ist während der Untersuchung zerbrochen.")
				say("Bitte hol mir eine Neue.")
			end
		end
	end
	state collect_tugyis begin
		when letter begin
			send_letter("Tugyis Seelenstein")
		end
		when button or info begin
			say_title("Tugyis Seelenstein")
			say("")
			say("Du hast alle 30 Tafeln abgegeben.")
			say("Nun musst du Tugyis Seelenstein erbeuten.")
			say("")
			say_item_vnum(30225)
			say("Ob dieser Stein tatsächlich Seelen")
			say("von Tugyis Adligen enthält?")
			say("")
		end
		when 1401.kill or 1402.kill or 1403.kill or 1601.kill or 1602.kill or 1603.kill begin
			if pc.count_item(30225)<1 then
				local rand = number(0,99)
				if rand<5 then game.drop_item_with_ownership(30225, 1)
				end
			end
		end
		when 20084.chat."Tugyis Seelenstein" begin
			if pc.count_item(30225)>0 then
				say_title("Biologe:")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
				say("die Legende um Tugyis Seelenstein.")
				say("Du hast hart gekämpft.")
				say("Sprich mit Baek-Go, er wird dir helfen,")
				say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30225,1)
				set_state(tugyis_reward)
			else
				say_title("Biologe:")
				say("")
				say("Du hast mir die 30 Tafeln gebracht.")
				say("Nun, ich habe noch eine Bitte.")
				say("Ich benötige Tugyis Seelenstein,")
				say("den du ebenfalls von den Monstern")
				say("im Land der Riesen erbeuten kannst.")
				say("Ich denke, dafür bist du stark genug.")
				say("")
			end
		end
	end
	state tugyis_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Biologen zu erhalten,")
			say("suche mit den Informationen der")
			say("Tugyis Tafeln und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("")
			say("Ich sehe ...")
			say("Der Biologe hat dich zu mir geschickt.")
			say("Hier ist deine Belohnung:")
			say("")
			say_reward("Du erhälst:")
			say_reward("Angriffsgeschwindigkeit +6% (Dauerhaft)")
			say_reward("Schadenserhöhung +10% (Dauerhaft)")
			say_reward("1x Blauer Ebenholzkasten")
			say("")
			affect.add_collect(apply.ATT_SPEED, 6, 60*60*24*365*60)
			affect.add_collect(apply.SKILL_DAMAGE_BONUS, 10, 60*60*24*365*60)
			affect.add_collect(apply.NORMAL_HIT_DAMAGE_BONUS, 10, 60*60*24*365*60)
			pc.give_item2(50114, 1)
			set_state(collect_quest_lv85)
		end
	end
	
	------------------------------------
	-- LvL 85 / Roter Geisterbaum Ast --
	------------------------------------

	state collect_quest_lv85 begin
		when login or levelup with pc.level>84 begin
			set_state(talk_to_disciple_lv85)
		end	
	end
	state talk_to_disciple_lv85 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then target.vid("__TARGET__", v, "Biologe")
			end
			send_letter("Forschung des Biologen 7")
		end
		when button or info begin
			say_title("Forschung des Biologen 7")
			say("")
			say("Der Biologe benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Gegenständen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit dem Biologen")
			say("")
		end
		when __TARGET__.target.click or 20084.chat."Roter Geisterbaum Ast" begin
			target.delete("__TARGET__")
			say_title("Biologe:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Tugyis Tafeln")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich möchte Roter Geisterbaum Ast untersuchen.")
			say("Davon benötige ich 40 Stück.")
			say("Diese welken jedoch ziemlich schnell,")
			say("es kann also sein, dass einige für")
			say("meine Untersuchungen unbrauchbar sind.")
			say("")
			set_state(collect_red_ast)
			pc.setqf("collect_count",0)
		end
	end
	state collect_red_ast begin
		when letter begin
			send_letter("Forschung des Biologen 7")
		end
		when button or info begin
			say_title("Roter Geisterbaum Ast")
			say("")
			say("Der Biologe gab dir den Auftrag,")
			say("40 von Roter Geisterbaum Ast zu besorgen.")
			say("Diese kannst du bei den Monstern")
			say("im Roten Wald erbeuten.")
			say("")
			say_item_vnum(30167)
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		
		when 2311.kill or 2312.kill or 2313.kill or 2314.kill or 2315.kill begin
			local rand = number(0,99)
			if rand<2 then game.drop_item_with_ownership(30167, 1)
			end
		end
		
		when 20084.chat."Roter Geisterbaum Ast" with pc.count_item(30167)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Biologe:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Biologe:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob der Roter Geisterbaum Ast gut ist ...")
			say("")
			pc.remove_item(30167, 1)
			wait()
			if rand<50 then
				local count = pc.getqf("collect_count")+1
				if count<40 then
					pc.setqf("collect_count", count)
					say_title("Biologe:")
					say("")
					say("Hervorragend,")
					say("dieser Ast ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Biologe:")
					say("")
					say("Du hast mir die 40 Roter Geisterbaum Ast gebracht.")
					say("Nun, ich habe noch eine Bitte.")
					say("Ich benötige den Waldgeist-Seelenstein,")
					say("den du ebenfalls von den Bossen")
					say("erbeuten kannst.")
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.setqf("collect_count",0)
					set_state(collect_bossKey)
				end
			else
				say_title("Biologe:")
				say("")
				say("Es tut mir leid, der Holzast")
				say("ist während des Transports verwelkt.")
				say("Bitte hol mir einen Neuen.")
				say("")
			end
		end
	end
	state collect_bossKey begin
		when letter begin
			send_letter("Waldgeist-Seelenstein")
		end
		when button or info begin
			say_title("Waldgeist-Seelenstein")
			say("")
			say("Du hast alle 40 Roter Geisterbaum Ast abgegeben.")
			say("Nun musst du den Waldgeist-Seelenstein")
			say("erbeuten.")
			say("")
			say_item_vnum(30226)
			say("Ob dieser Stein tatsächlich Seelen")
			say("eines Waldgeistes enthält?")
			say("")
		end
		when 2311.kill or 2312.kill or 2313.kill or 2314.kill or 2315.kill begin
			if pc.count_item(30226)<1 then
				local rand = number(0,99)
				if rand<1 then game.drop_item_with_ownership(30226, 1)
				end
			end	
		end
		when 20084.chat."Waldgeist-Seelenstein" begin
			if pc.count_item(30226)>0 then
				say_title("Biologe:")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
				say("die Legende um den Waldgeist-Seelenstein.")
				say("Du hast hart gekämpft.")
				say("Sprich mit Baek-Go, er wird dir helfen,")
				say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30226,1)
				set_state(bossKey_reward)
			else
				say_title("Biologe:")
				say("")
				say("Du hast mir die Roter Geisterbaum Ast gebracht.")
				say("Nun, ich habe noch eine Bitte.")
				say("Ich benötige den Waldgeist-Seelenstein,")
				say("den du ebenfalls von den Bossen")
				say("erbeuten kannst.")
				say("Ich denke, dafür bist du stark genug.")
				say("")
			end
		end
	end
	state bossKey_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Biologen zu erhalten,")
			say("suche mit den Informationen der")
			say("Notizen und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("")
			say("Ich sehe ...")
			say("Der Biologe hat dich zu mir geschickt.")
			say("Hier ist deine Belohnung:")
			say("")
			say_reward("Du erhälst:")
			say_reward("Schadenreduzierung gegen andere Spieler: +10% (Dauerhaft)")
			say_reward("1x Purpur Ebenholzkasten")
			say("")
			affect.add_collect(apply.RESIST_WARRIOR, 10, 60*60*24*365*60)
			affect.add_collect(apply.RESIST_ASSASSIN, 10, 60*60*24*365*60)
			affect.add_collect(apply.RESIST_SURA, 10, 60*60*24*365*60)
			affect.add_collect(apply.RESIST_SHAMAN, 10, 60*60*24*365*60)
			pc.give_item2(50115, 1)
			set_state(collect_quest_lv90)
		end
	end
	---------------------------------
	-- LvL 90 / Notiz der Anführer --
	---------------------------------

	state collect_quest_lv90 begin
		when login or levelup with pc.level>89 begin
			set_state(talk_to_disciple_lv90)
		end	
	end
	state talk_to_disciple_lv90 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
			if v != 0 then target.vid("__TARGET__", v, "Biologe")
			end
			send_letter("Forschung des Biologen 8")
		end
		when button or info begin
			say_title("Forschung des Biologen 8")
			say("")
			say("Der Biologe benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Gegenständen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit dem Biologen")
			say("")
		end
		when __TARGET__.target.click or 20084.chat."Notiz der Anführer" begin
			target.delete("__TARGET__")
			say_title("Biologe:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Tugyis Tafeln")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say_title("Biologe:")
			say("")
			say("Ich möchte Notizen der Anführer untersuchen.")
			say("Davon benötige ich 50 Stück.")
			say("Es kann jedoch sein, dass sich einige")
			say("Notizen als alt und unlesbar herausstellen.")
			say("")
			set_state(collect_notices)
			pc.setqf("collect_count",0)
		end
	end
	state collect_notices begin
		when letter begin
			send_letter("Forschung des Biologen 8")
		end
		when button or info begin
			say_title("Notiz der Anführer")
			say("")
			say("Der Biologe gab dir den Auftrag,")
			say("50 Notizen der Anführer zu besorgen.")
			say("Diese kannst du von den Bossen")
			say("wie z.B. Oberork, Königsspinne,")
			say("Neunschwanz, etc. erbeuten.")
			say("")
			say_item_vnum(30168)
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		when 591.kill or 691.kill or 791.kill or 793.kill or 991.kill or 992.kill or 993.kill or 1091.kill or 1092.kill or 1093.kill or 1304.kill or
			 1403.kill or 2091.kill or 2191.kill or 2206.kill or 2207.kill or 2306.kill or 2493.kill or 2494.kill or 5001.kill or 5004.kill or
			 5161.kill or 5162.kill or 5163.kill begin
			local rand = number(0,99)
			if rand<70 then game.drop_item_with_ownership(30168, 1)
			end
		end
		
		when 20084.chat."Notiz der Anführer" with pc.count_item(30168)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Biologe:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Biologe:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob diese Notiz lesbar ist ...")
			say("")
			pc.remove_item("30168", 1)
			wait()
			if rand<50 then
				local count = pc.getqf("collect_count")+1
				if count<50 then
					pc.setqf("collect_count", count)
					say_title("Biologe:")
					say("")
					say("Hervorragend,")
					say("diese Notiz ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Biologe:")
					say("")
					say("Du hast mir die 50 Notizen gebracht.")
					say("Nun, ich habe noch eine Bitte.")
					say("Ich benötige den Seelenstein der Anführer,")
					say("den du ebenfalls von den Bossen")
					say("erbeuten kannst.")
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.setqf("collect_count",0)
					set_state(collect_bossKey2)
				end
			else
				say_title("Biologe:")
				say("Es tut mir leid, die Notiz")
				say("hat sich als unlesbar herausgestellt.")
				say("Bitte hol mir eine Neue.")
			end
		end
	end
	state collect_bossKey2 begin
		when letter begin
			send_letter("Seelenstein der Anführer")
		end
		when button or info begin
			say_title("Seelenstein der Anführer")
			say("")
			say("Du hast alle 50 Notizen abgegeben.")
			say("Nun musst du den Seelenstein der Anführer")
			say("erbeuten.")
			say("")
			say_item_vnum(30227)
			say("Ob dieser Stein tatsächlich Seelen")
			say("der Anführer enthält?")
			say("")
		end
		when 591.kill or 691.kill or 791.kill or 793.kill or 991.kill or 992.kill or 993.kill or 1091.kill or 1092.kill or 1093.kill or 1304.kill or
			 1403.kill or 2091.kill or 2191.kill or 2206.kill or 2207.kill or 2306.kill or 2493.kill or 2494.kill or 5001.kill or 5004.kill or
			 5161.kill or 5162.kill or 5163.kill begin
			if pc.count_item(30227)<1 then
				local rand = number(0,99)
				if rand<20 then game.drop_item_with_ownership(30227, 1)
				end
			end	
		end
		when 20084.chat."Seelenstein der Anführer" begin
			if pc.count_item(30227)>0 then
				say_title("Biologe:")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
				say("die Legende um den Seelenstein der Anführer.")
				say("Du hast hart gekämpft.")
				say("Sprich mit Baek-Go, er wird dir helfen,")
				say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30227,1)
				set_state(bossKey_reward)
			else
				say_title("Biologe:")
				say("")
				say("Du hast mir die 50 Notizen gebracht.")
				say("Nun, ich habe noch eine Bitte.")
				say("Ich benötige den Seelenstein der Anführer,")
				say("den du ebenfalls von den Bossen")
				say("erbeuten kannst.")
				say("Ich denke, dafür bist du stark genug.")
				say("")
			end
		end
	end
	state bossKey_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Biologen zu erhalten,")
			say("suche mit den Informationen der")
			say("Notizen und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Biologen" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("")
			say("Ich sehe ...")
			say("Der Biologe hat dich zu mir geschickt.")
			say("Hier ist deine Belohnung:")
			say("")
			say_reward("Du erhälst:")
			say_reward("Schaden gegen andere Spieler: +8% (Dauerhaft)")
			say_reward("1x Blauer Ebenholzkasten")
			say("")
			affect.add_collect(apply.ATTBONUS_WARRIOR, 8, 60*60*24*365*60)
			affect.add_collect(apply.ATTBONUS_ASSASSIN, 8, 60*60*24*365*60)
			affect.add_collect(apply.ATTBONUS_SURA, 8, 60*60*24*365*60)
			affect.add_collect(apply.ATTBONUS_SHAMAN, 8, 60*60*24*365*60)
			pc.give_item2(50114, 1)
			set_state(collect_quest_lv90)
		end
	end
	
	--------------------------------
	-- LvL 92 / Juwelen der Magie --
	--------------------------------
	state collect_quest_lv90 begin
		when login or levelup with pc.level ==92 begin
			set_state(talk_to_disciple_lv92)
		end	
	end
	state talk_to_disciple_lv92 begin
		when letter begin
			local v = find_npc_by_vnum(20091)
			if v != 0 then target.vid("__TARGET__", v, "Seon-Pyeong")
			end
			send_letter("Forschung von Seon-Pyeong")
		end
		when button or info begin
			say_title("Die Forschung von Seon-Pyeong")
			say("")
			say("Seon-Pyeong benötigt deine Hilfe.")
			say("Sprich mit ihm.")
			say("")
			say_reward("Sprich mit Seon-Pyeong")
			say("")
		end
		when __TARGET__.target.click or 20091.chat."Juwelen der Magie" begin
			target.delete("__TARGET__")
			say("Seon-Pyeong:")
			say("")
			say("Oh, du hilfst mir?")
			say("Gut ...")
			say("Ich bin übrigens Seon-Pyeong")
			say("und studiere zahlreiches aus der Unterwelt.")
			say("Wenn du mir bei meinen Forschungen hilfst,")
			say("werde ich dich reich belohnen.")
			say("")
			wait()
			say("Seon-Pyeong:")
			say("")
			say("Ich habe vor kurzem wieder angefangen ...")
			say("Ich forsche an einer Legende ...")
			say("Doch habe ich derzeit viel zu tun,")
			say("es wäre also nett, wenn du mir hilfst ...")
			say("")
			wait()
			say("Seon-Pyeong:")
			say("")
			say("Ich benötige zehn Juwelen der Magie für meine")
			say("Forschungen. Diese sind jedoch sehr zerbrechlich,")
			say("es kann also sein, dass einige bei meinen")
			say("Untersuchungen kaputt gehen.")
			say("Ich benötige alle zehn,")
			say("um meine Forschungen vollenden zu können.")
			say("")
			set_state(collect_magie)
			pc.setqf("collect_count",0)
		end
	end
	state collect_magie begin
		when letter begin
			send_letter("Forschung von Seon-Pyeong")
		end
		when button or info begin
			say_title("Juwelen der Magie")
			say("")
			say("Seon-Pyeong gab dir den Auftrag,")
			say("zehn Juwelen der Magie zu sammeln.")
			say("Sammel und bring sie Seon-Pyeong.")
			say("")
			say_item_vnum(30251) 
			say("")
			say("Du bekommst sie von den Golems aus der Grotte 1")
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		
		when 20091.chat."Juwelen der Magie" with pc.count_item(30251)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Seon-Pyeong:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Seon-Pyeong:")
			say("")
			say("Super, du hast mir einen Juwel der Magie gebracht ...")
			say("Vielen Dank,")
			say("lasst mich schnell schauen")
			say("ob dieses Juwel in ordnung ist ...")
			say("")
			pc.remove_item(30251, 1)
			wait()
			if rand<25 then
				local count = pc.getqf("collect_count")+1
				if count<10 then
					pc.setqf("collect_count", count)
					say("Seon-Pyeong:")
					say("")
					say("Hervorragend, dieses Juwel ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Seon-Pyeong:")
					say("")
					say("Du hast mir die 10 Stück gebracht...")
					say("geh zu Baek-Go um dir deine belohnung")
					say("abzuholen.")
					say("")
					pc.setqf("collect_count",0) 
					set_state(magie_reward)
				end
			else
				say("Seon-Pyeong:")
				say("")
				say("Es tut mir leid, aber dises Juwel ist bei")
				say("den Untersuchungen zerbrochen.")
				say("Bitte hol mir ein neues Juwel!")
				say("")
			end
		end
	end  
	state magie_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Seon-Pyeong zu erhalten")
			say("suche mit den Informationen den")
			say("Juwelen der Magie Baek-Go auf.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Seon-Pyeong" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("Ich sehe ...")
			say("Seon-Pyeong hat dich zu mir geschickt.")
			say("")
			say_reward("Du erhälst:")
			say_reward("Max-MP: +162 (Dauerhaft)")
			say("")
			affect.add_collect(apply.MAX_SP, 162, 60*60*24*365*60) 
			set_state(collect_quest_lv94)
		end
	end
	
	--------------------------------------
	-- LvL 94 / Juwelen der Lebenskraft --
	--------------------------------------
	state collect_quest_lv94 begin
		when login or levelup with pc.level>93 begin
			set_state(talk_to_disciple_lv94)
		end	
	end
	state talk_to_disciple_lv94 begin
		when letter begin
			local v = find_npc_by_vnum(20091)
			if v != 0 then target.vid("__TARGET__", v, "Seon-Pyeong")
			end
			send_letter("Forschung des Seon-Pyeong 2")
		end
		when button or info begin
			say_title("Forschung des Seon-Pyeong 2")
			say("")
			say("Sprich mit Seon-Pyeong, er benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Juwelen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit Seon-Pyeong")
			say("")
		end
		when __TARGET__.target.click or 20091.chat."Juwelen der Lebenskraft" begin
			target.delete("__TARGET__")
			say("Seon-Pyeong:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Juwelen der Magie")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say("Seon-Pyeong:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say("Seon-Pyeong:")
			say("")
			say("Ich möchte die Juwelen der Lebenskraft untersuchen.")
			say("Davon benötige ich 10 Stück.")
			say("Die Juwelen sind jedoch ziemlich zerbrechlich,")
			say("manchmal zerfallen sie einfach!")
			say("")
			set_state(collect_lebenskraft)
			pc.setqf("collect_count",0)
		end
	end
	state collect_lebenskraft begin
		when letter begin
			send_letter("Forschung des Seon-Pyeong 2")
		end
		when button or info begin
			say_title("Juwelen der Lebenskraft")
			say("")
			say("Sprich mit Seon-Pyeong, er gab dir den Auftrag,")
			say("10 Juwelen der Lebenskraft zu besorgen.")
			say("Diese kannst du bei den Seatou Monstern")
			say("in der Grotte 2 am hinteren Teil bekommen.")
			say("")
			say_item_vnum(30252) 
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		when 20091.chat."Juwelen der Lebenskraft" with pc.count_item(30252)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Seon-Pyeong:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Seon-Pyeong:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob dieses Juwel der Lebenskraft in Ordnung ist ...")
			say("")
			pc.remove_item(30252, 1)
			wait()
			if rand<25 then
				local count = pc.getqf("collect_count")+1
				if count<10 then
					pc.setqf("collect_count", count)
					say_title("Seon-Pyeong:")
					say("")
					say("Hervorragend, dieses Juwel der Lebenskraft ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else
					say_title("Seon-Pyeong:")
					say("")
					say("Du hast mir die 10 Stück gebracht...")
					say("geh zu Baek-Go um dir deine belohnung")
					say("abzuholen.")
					say("")
					pc.setqf("collect_count",0)
					set_state(lebenskraft_reward)
				end
			else
				say_title("Seon-Pyeong:")
				say("")
				say("Es tut mir leid, das Juwel")
				say("ist bei den Untersuchungen zerfallen.")
				say("Bitte hol mir ein neues Juwel.")
			end
		end
	end
	state lebenskraft_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Seon-Pyeong zu erhalten,")
			say("suche mit den Informationen der")
			say("Juwelen der Lebenskraft und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Seon-Pyeong" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("Ich sehe ...")
			say("Seon-Pyeong hat dich zu mir geschickt.")
			say("")
			say_reward("Du erhälst:")
			say_reward("Max-TP: +1414 (Dauerhaft)")
			say("")
			affect.add_collect(apply.MAX_HP, 1414, 60*60*24*365*60)
			set_state(collect_quest_lv96)
		end
	end
	
	-----------------------------------
	-- LvL 96 / Juwelen des Angriffs --
	-----------------------------------
	state collect_quest_lv96 begin
		when login or levelup with pc.level>95 begin
			set_state(talk_to_disciple_lv96)
		end	
	end
	state talk_to_disciple_lv96 begin
		when letter begin
			local v = find_npc_by_vnum(20091)
			if v != 0 then target.vid("__TARGET__", v, "Seon-Pyeong")
			end
			send_letter("Forschung des Seon-Pyeong 3")
		end
		when button or info begin
			say_title("Forschung des Seon-Pyeong 3")
			say("")
			say("Sprich mit Seon-Pyeong, er benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Juwelen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit Seon-Pyeong")
			say("")
		end
		when __TARGET__.target.click or 20091.chat."Juwelen des Angriffs" begin
			target.delete("__TARGET__")
			say("Seon-Pyeong:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Juwelen der Lebenskraft")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say("Seon-Pyeong:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say("Seon-Pyeong:")
			say("")
			say("Ich möchte die Juwelen des Angriffs untersuchen.")
			say("Davon benötige ich 10 Stück.")
			say("Die Juwelen sind jedoch ziemlich zerbrechlich,")
			say("manchmal zerfallen sie einfach!")
			say("")
			set_state(collect_angriff)
			pc.setqf("collect_count",0)
		end
	end
	state collect_angriff begin
		when letter begin
			send_letter("Forschung des Seon-Pyeong 2")
		end
		when button or info begin
			say_title("Juwelen des Angriffs")
			say("")
			say("Sprich mit Seon-Pyeong, er gab dir den Auftrag,")
			say("10 Juwelen des Angriffs zu besorgen.")
			say("Diese kannst du bei den Seatou Monstern")
			say("in der Grotte 2 am hinteren Teil bekommen.")
			say("")
			say_item_vnum(30253) 
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		when 20091.chat."Juwelen des Angriffs" with pc.count_item(30253)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Seon-Pyeong:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Seon-Pyeong:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob dieses Juwel des Angriffs in Ordnung ist ...")
			say("")
			pc.remove_item(30253, 1)
			wait()
			if rand<25 then
				local count = pc.getqf("collect_count")+1
				if count<20 then
					pc.setqf("collect_count", count)
					say_title("Seon-Pyeong:")
					say("")
					say("Hervorragend, dieses Juwel des Angriffs ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Seon-Pyeong:")
					say("")
					say("Du hast mir die 10 Stück gebracht...")
					say("geh zu Baek-Go um dir deine belohnung")
					say("abzuholen.")
					say("")
					pc.setqf("collect_count",0)
					set_state(angriff_reward)
				end
			else
				say_title("Seon-Pyeong:")
				say("")
				say("Es tut mir leid, das Juwel")
				say("ist bei den Untersuchungen zerfallen.")
				say("Bitte hol mir ein neues Juwel.")
			end
		end
	end
	state angriff_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Seon-Pyeong zu erhalten,")
			say("suche mit den Informationen der")
			say("Juwelen des Angriffs und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Seon-Pyeong" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("Ich sehe ...")
			say("Seon-Pyeong hat dich zu mir geschickt.")
			say("")
			say_reward("Du erhälst:")
			say_reward("Angriff: +60 (Dauerhaft)")
			say("")
			affect.add_collect(apply.ATT_GRADE_BONUS, 60, 60*60*24*365*60)
			set_state(collect_quest_lv98)
		end
	end
	---------------------------------------
	-- LvL 98 / Juwelen der Verteidigung --
	---------------------------------------
	state collect_quest_lv98 begin
		when login or levelup with pc.level>97 begin
			set_state(talk_to_disciple_lv98)
		end	
	end
	state talk_to_disciple_lv98 begin
		when letter begin
			local v = find_npc_by_vnum(20091)
			if v != 0 then target.vid("__TARGET__", v, "Seon-Pyeong")
			end
			send_letter("Forschung des Seon-Pyeong 4")
		end
		when button or info begin
			say_title("Forschung des Seon-Pyeong 4")
			say("")
			say("Sprich mit Seon-Pyeong, er benötigt ein weiteres Mal Hilfe.")
			say("Er meinte, er bräuchte Hilfe auf der Suche")
			say("nach speziellen Juwelen.")
			say("Sprich mit ihm,")
			say("um eine genauere Beschreibung zu erhalten.")
			say("")
			say_reward("Sprich mit Seon-Pyeong")
			say("")
		end
		when __TARGET__.target.click or 20091.chat."Juwelen der Verteidigung" begin
			target.delete("__TARGET__")
			say("Seon-Pyeong:")
			say("")
			say("Gut, dass du gekommen bist...")
			say("Die Untersuchung der Juwelen des Angriffs")
			say("habe ich abgeschlossen.")
			say("Nun habe ich neue Objekte gefunden,")
			say("die ich gerne untersuchen würde.")
			wait()
			say("Seon-Pyeong:")
			say("")
			say("Ich würde sie ja selber sammeln,")
			say("aber ich habe zuviel zu tun...")
			say("Es wäre sehr nett, wenn du dies")
			say("für mich erledigen könntest.")
			wait()
			say("Seon-Pyeong:")
			say("")
			say("Ich möchte die Juwelen der Verteidigung untersuchen.")
			say("Davon benötige ich 10 Stück.")
			say("Die Juwelen sind jedoch ziemlich zerbrechlich,")
			say("manchmal zerfallen sie einfach!")
			say("")
			set_state(collect_verteidigung)
			pc.setqf("collect_count",0)
		end
	end
	state collect_verteidigung begin
		when letter begin
			send_letter("Forschung des Seon-Pyeong 4")
		end
		when button or info begin
			say_title("Juwelen der Verteidigung")
			say("")
			say("Sprich mit Seon-Pyeong, er gab dir den Auftrag,")
			say("10 Juwelen der Verteidigung zu besorgen.")
			say("Diese kannst du bei den Seatou Monstern")
			say("in der Grotte 2 am hinteren Teil bekommen.")
			say("")
			say_item_vnum(30254) 
			say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			say("")
		end
		when 20091.chat."Juwelen der Verteidigung" with pc.count_item(30254)>0 begin
			local rand = number(0,99)
			if pc.count_item(71035)>0 then
				say_title("Seon-Pyeong:")
				say("")
				say_item_vnum(71035)
				say("Du trägst das Elixier des Forschers bei dir!")
				say("Damit kannst du die Qualität des Gegenstands verbessern")
				say("und somit die Wahrscheinlichkeit steigern, dass die Abgabe")
				say("erfolgreich ist.")
				say("")
				local sel = select("Verwenden", "Nicht verwenden") 
				if sel == 1 then
					rand = rand - 25
					pc.remove_item(71035, 1)
				else end
			end
			say_title("Seon-Pyeong:")
			say("")
			say("Einen Moment ...")
			say("Vielen Dank,")
			say("lass mich schnell überprüfen")
			say("ob dieses Juwel der Verteidigung in Ordnung ist ...")
			say("")
			pc.remove_item(30254, 1)
			wait()
			if rand<25 then
				local count = pc.getqf("collect_count")+1
				if count<20 then
					pc.setqf("collect_count", count)
					say_title("Seon-Pyeong:")
					say("")
					say("Hervorragend, dieses Juwel der Verteidigung ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
					say("")
				else 
					say_title("Seon-Pyeong:")
					say("")
					say("Du hast mir die 10 Stück gebracht...")
					say("geh zu Baek-Go um dir deine belohnung")
					say("abzuholen.")
					say("")
					pc.setqf("collect_count",0)
					set_state(verteidigung_reward)
				end
			else
				say_title("Seon-Pyeong:")
				say("")
				say("Es tut mir leid, das Juwel")
				say("ist bei den Untersuchungen zerfallen.")
				say("Bitte hol mir ein neues Juwel.")
			end
		end
	end
	state verteidigung_reward begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Doktor")
			end
		end
		when button or info begin
			say_title("Sprich mit Baek-Go")
			say("")
			say("Um die Belohnung des Seon-Pyeong zu erhalten,")
			say("suche mit den Informationen der")
			say("Juwelen der Verteidigung und des Seelensteins")
			say("Baek-Go auf. Er befindet sich in der Stadt.")
			say("")
		end
		when __TARGET__.target.click  or 20018.chat."Belohnung des Seon-Pyeong" begin
			target.delete("__TARGET__")
			say_title("Baek-Go:")
			say("Ich sehe ...")
			say("Seon-Pyeong hat dich zu mir geschickt.")
			say("")
			say_reward("Du erhälst:")
			say_reward("Verteidigung: +59 (Dauerhaft)")
			say("")
			affect.add_collect(apply.DEF_GRADE_BONUS, 59, 60*60*24*365*60)
			set_state(__COMPLETE__)
		end
	end
	
	state __COMPLETE__ begin
	end
end