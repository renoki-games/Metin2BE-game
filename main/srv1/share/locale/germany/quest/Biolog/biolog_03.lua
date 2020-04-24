quest biolog_03 begin
	state finish_lv40 begin
		when login or levelup with pc.get_level() >= 50 begin
            set_state(talk_to_bio_lv50)
        end
	end
	state talk_to_bio_lv50 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
            if v != 0 then 
				target.vid("__TARGET__", v, "Biologe")
            end
			send_letter("Die Forschung des Biologen #3")
		end
		when button or info begin
			say_title("Die Forschung des Biologen #3")
            say("")
			say("Der Biologe benötigt ein weiteres mal Hilfe.")
            say("Er meint, er bräuchte Hilfe auf der Suche")
            say("nach speziellen Gegenständen.")
            say("Sprich mit ihm,")
            say("um eine genauere Beschreibung zu erhalten.")
            say("")
			say("Aufgabe(n):")
            say_reward("- Sprich mit dem Biologen")
            say("")
		end
		when __TARGET__.target.click or 20084.chat."Die Forschung des Biologen" begin -- ###### BEARBEITEN
			target.delete("__TARGET__")
			say_mob("")
            say("")
			say("Gut, dass du gekommen bist.")
            say("Die Untersuchung der Fluchsammlungen")
            say("habe ich abgeschlossen.")
            say("Nun habe ich neue Objekte gefunden,")
            say("die ich gerne untersuchen würde.")
            wait()
            say_mob("")
			say("")
            say("Ich würde sie ja selber sammeln,")
            say("aber ich habe zuviel zu tun.")
            say("Es wäre sehr nett, wenn du dies")
            say("für mich erledigen könntest.")
            wait()
            say_mob("")
			say("")
            say("Ich möchte die Dämonenandenken untersuchen.")
            say("Davon benötige ich 15 Stück.")
            say("Diese sind jedoch ziemlich zerbrechlich,")
            say("es kann also sein, dass einige bei")
            say("meinen Untersuchungen kaputt gehen.")
            say("")
			pc.setqf("collect_count",0)
			set_state(collect_item_lv50)
		end
	end
	state collect_item_lv50 begin
		when letter begin
			send_letter("Die Forschung des Biologen #3")
		end
		when button or info begin
			say_title("Dämonenandenken:")
            say("")
			say("Der Biologe gab dir den Auftrag,")
            say("15 Dämonenandenken zu besorgen.")
            say("Diese kannst du bei den Dunklen und")
            say("Hohen Peinigern erbeuten.")
            say("")
            say_item_vnum(30015) 
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			wait("")
			say_title("Dämonenandenken:")
			say("")
			say("Töte dafür:")
			say_reward("- " ..mob_name(1001))
			say_reward("- " ..mob_name(1002))
			say_reward("- " ..mob_name(1003))
			say_reward("- " ..mob_name(1004))
            say("")
			if pc.is_dev() then
				local s = select("Weiter", "Letzter Status")
				if s == 2 then
					set_state(talk_to_bio_lv50)
				end
			end
		end
		when 20084.chat."Dämonenandenken" with pc.count_item(30015) > 0 begin -- ###### BEARBEITEN
			local chance = number(1, 100)
			if pc.getqf("drink_drug") >= 1 then
				chance = chance + 25
				pc.setqf("drink_drug", 0)
			end
			say_mob("")
			say("")
			say("Vielen Dank!")
			say("Einen Moment ...")
			say("lass mich schnell überprüfen")
			say("ob dieses Andenken in Ordnung ist ...")
			say("")
			wait()
			pc.remove_item(30015)
			if chance >= 75 then
				local count = pc.getqf("collect_count") + 1
				if count < 15 then
					pc.setqf("collect_count", count)
					say_mob("")
					say("")
					say("Hervorragend,")
					say("dieses Dämonenandenken ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann.")
					say("")
					say_reward("Du hast derzeit "..count.." abgegeben!")
					say("")
				else
					say_mob("")
					say("")
					say("Du hast mir die 15 Andenken gebracht.")
					say("Nun, ich habe noch eine Bitte.")
					say("Ich benötige Sagyis Seelenstein,")
					say("den du von den Monstern im Dämonenturm,")
					say("erbeuten kannst.")
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.delqf("collect_count")
					set_state(collect_soulstone_lv50)
				end
			else
				say_mob("")
				say("")
				say("Es tut mir leid, das Andenken")
				say("ist bei der Untersuchung zerbrochen.")
				say("Bitte hol mir ein neues.")
				say("")
			end
		end
		when 71035.use begin --Potion of Daze
			if pc.getqf("drink_drug")==1 then
				syschat("Dieser Effekt wirkt bereits")
				return
			end
			if pc.count_item(71035)==0 then
				say_title("Elixier des Forschers:")
				say("")
				say("Es ist ein Fehler aufgetreten.")
				say("Bitte versuche es erneut.")
				say("")
				return
			end
			pc.remove_item(71035, 1)
			pc.setqf("drink_drug",1)
		end
	end
	state collect_soulstone_lv50 begin
		when letter begin
			send_letter(item_name(30222))
		end
		when button or info begin
			say_title(item_name(30222))
            say("")
            say("Du hast 15x " ..item_name(30015).. " gesammelt.")
            say("Nun musst du " ..item_name(30222).. " erbeuten.")
            say("")
            say_item_vnum(30222)
			wait()
			say_title(item_name(30222))
			say("")
			say("Töte dafür:")
			say_reward("- " ..mob_name(1001))
			say_reward("- " ..mob_name(1002))
			say_reward("- " ..mob_name(1003))
			say_reward("- " ..mob_name(1004))
			say("")
			say("Um " ..item_name(30222).. " zu erhalten")
            say("")
			if pc.is_dev() then
				local s = select("Weiter", "Letzter Status")
				if s == 2 then
					set_state(collect_item_lv50)
				end
			end
		end
		when kill begin
			if npc.get_race() == 1001 or
				npc.get_race() == 1002 or
				npc.get_race() == 1003 or
				npc.get_race() == 1004 then
				local chance = number(1, 300)
				if chance <= 1 then
					pc.give_item2(30222, 1)
					set_state(giveup_soulstone_lv50)
				end
			end
		end
	end
	state giveup_soulstone_lv50 begin
		when letter begin
			send_letter("Die Forschung des Biologen #3")
		end
		when button or info begin
			say_title(item_name(30222).. ":")
			say("")
			say("Du hast den Seelenstein erhalten.")
			say("Bring ihm zum Biologen um deine Belohnung")
			say("abzuholen.")
			say("")
			if pc.is_dev() then
				local s = select("Weiter", "Letzter Status")
				if s == 2 then
					set_state(collect_soulstone_lv50)
				end
			end
		end
		when 20084.chat."Seelenstein" begin
			if pc.count_item(30222) > 0 then
				say_mob("")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
                say("die Legende um Sagyis Seelenstein.")
                say("Du hast hart gekämpft.")
                say("Sprich mit Baek-Go, er wird dir helfen,")
                say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30222,1)
                set_state(reward_soulstone_lv50)
			else
				say_mob("")
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
	state reward_soulstone_lv50 begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Baek-Go") end
		end
		when button or info begin
			say_title("Belohnung des Biologen")
			say("")
			say("Um die Belohnung des Biologen zu erhalten,")
            say("suche mit den Informationen der")
            say("Dämonenandenken und des Seelensteins")
            say("Baek-Go auf. Er befindet sich in dem Zelt.")
            say("")
		end
		when __TARGET__.target.click or 20018.chat."Belohnung des Biologen" begin
			target.delete("__TARGET__")
			say_mob("")
			say("")
			say("Ich sehe schon,")
			say("der Biologe hat dich zu mir geschickt.")
			say("Hier ist deine Belohnung:")
			say("")
			say("Du erhälst:")
			say_reward("- Gelber Ebenholzkasten")
			say_reward("- Verteidigung +40 (Dauerhaft)")
			say("")
			 affect.add_collect(apply.DEF_GRADE_BONUS, 40,60*60*24*365*60)
            pc.give_item2(50111)
			clear_letter()
			set_quest_state("biologe_04", "finish_lv50")
			set_state(__FIN_lv50__)
		end
	end
	state __FIN_lv50__ begin
	end
end