quest biolog_01 begin
	state start begin
		when login or levelup with pc.get_level() >= 30 begin
			set_state(talk_to_bio_lv30)
		end
	end
	state talk_to_bio_lv30 begin
		when letter begin
			local v = find_npc_by_vnum(20084)
            if v != 0 then 
				target.vid("__TARGET__", v, "Biologe")
            end
			send_letter("Die Forschung des Biologen #1")
		end
		when button or info begin
			say_title("Die Forschung des Biologen #1")
            say("")
            say("Der Biologe braucht deine Hilfe.")
            say("Sprich mit ihm.")
            say("")
			say("Aufgabe(n):")
            say_reward("- Sprich mit dem Biologen")
            say("")
		end
		when __TARGET__.target.click or 20084.chat."Die Forschung des Biologen" begin -- ###### BEARBEITEN
			target.delete("__TARGET__")
			say_mob("")
            say("")
            say("Oh, du hilfst mir?")
            say("Gut ...")
            say("Ich bin der Biologe")
            say("und studiere zahlreiches aus der Pflanzenwelt.")
            say("Wenn du mir bei meinen Forschungen hilfst,")
            say("werde ich dich reich belohnen.")
            say("")
            wait()
            say_mob("")
			say("")
            say("Ich habe vor kurzem wieder angefangen.")
            say("Ich forsche an einer Legende.")
            say("Doch habe ich derzeit viel zu tun,")
            say("es wäre also nett, wenn du mir hilfst.")
            say("")
            wait()
            say_mob("")
			say("")
			say("Ich benötige 10x den Zahn eines Orks")
			say("für meine Forschungen.")
			say("Diese sind jedoch sehr zerbrechlich,")
			say("es kann also sein, dass einige bei")
			say("meinen Untersuchungen kaputt gehen.")
			say("Ich benötige 10 Stück")
			say("um meine Forschungen vollenden zu können.")
            say("")
			pc.setqf("collect_count",0)
			set_state(collect_item_lv30)
		end
	end
	state collect_item_lv30 begin
		when letter begin
			send_letter("Die Forschung des Biologen #1")
		end
		when button or info begin
			say_title("Orkzähne:")
            say("")
            say("Der Biologe gab dir den Auftrag,")
            say("10x den Zahn eines Orks zu sammeln.")
            say("Sammel und bringe sie dem Biologen.")
            say("")
            say_item_vnum(30006) 
            say_reward("Du hast derzeit "..pc.getqf("collect_count").." abgegeben!")
			wait("")
			say_title("Orkzähne:")
			say("")
			say("Töte dafür:")
			say_reward("- " ..mob_name(601))
			say_reward("- " ..mob_name(636))
			say_reward("- " ..mob_name(637))
			say_reward("- " ..mob_name(656))
            say("")
			if pc.is_dev() then
				local s = select("Weiter", "Letzter Status")
				if s == 2 then
					set_state(talk_to_bio_lv30)
				end
			end
		end
		when 20084.chat."Orkzähne" with pc.count_item(30006) > 0 begin -- ###### BEARBEITEN
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
			say("ob dieser Zahn in Ordnung ist ...")
			say("")
			wait()
			pc.remove_item(30006)
			if chance >= 75 then
				local count = pc.getqf("collect_count") + 1
				if count < 10 then
					pc.setqf("collect_count", count)
					say_mob("")
					say("")
					say("Hervorragend,")
					say("dieser Zahn ist in Ordnung.")
					say("Bring mir noch welche, damit ich meine")
					say("Forschungen abschließen kann")
					say("")
					say_reward("Du hast derzeit "..count.." abgegeben!")
					say("")
				else
					say_mob("")
					say("")
					say("Du hast mir die 10 Stück gebracht.")
					say("Nun bitte ich dich noch, mir den")
					say("Jinunggyis Seelenstein zu bringen.")
					say("Du bekommst ihn von Stolzen Orks.")
					say("Ich denke, dafür bist du stark genug.")
					say("")
					pc.delqf("collect_count")
					set_state(collect_soulstone_lv30)
				end
			else
				say_mob("")
				say("")
				say("Es tut mir leid, aber der Zahn ist bei")
				say("der Untersuchung zerbrochen.")
				say("Bitte hol mir einen neuen Orkzahn!")
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
	state collect_soulstone_lv30 begin
		when letter begin
			send_letter(item_name(30220))
		end
		when button or info begin
			say_title(item_name(30220))
            say("")
            say("Du hast 10x " ..item_name(30006).. " gesammelt.")
            say("Nun musst du " ..item_name(30220).. " erbeuten.")
            say("")
            say_item_vnum(30220)
			wait()
			say_title(item_name(30220))
			say("")
			say("Töte dafür:")
			say_reward("- " ..mob_name(635))
			say_reward("- " ..mob_name(636))
			say_reward("- " ..mob_name(637))
			say("")
			say("Um " ..item_name(30220).. " zu erhalten")
            say("")
			if pc.is_dev() then
				local s = select("Weiter", "Letzter Status")
				if s == 2 then
					set_state(collect_item_lv30)
				end
			end
		end
		when kill begin
			if npc.get_race() == 635 or
				npc.get_race() == 636 or
				npc.get_race() == 637 then
				local chance = number(1, 100)
				if chance <= 1 then
					pc.give_item2(30220, 1)
					set_state(giveup_soulstone_lv30)
				end
			end
		end
	end
	state giveup_soulstone_lv30 begin
		when letter begin
			send_letter("Die Forschung des Biologen #1")
		end
		when button or info begin
			say_title(item_name(30220).. ":")
			say("")
			say("Du hast den Seelenstein erhalten.")
			say("Bring ihm zum Biologen um deine Belohnung")
			say("abzuholen.")
			say("")
			if pc.is_dev() then
				local s = select("Weiter", "Letzter Status")
				if s == 2 then
					set_state(collect_soulstone_lv30)
				end
			end
		end
		when 20084.chat."Seelenstein" begin
			if pc.count_item(30220) > 0 then
				say_mob("")
				say("")
				say("Dank deiner Hilfe verstehe ich nun")
				say("die Legende um Jinunggyis Seelenstein.")
				say("Du hast hart gekämpft.")
				say("Sprich mit Baek-Go, er wird dir helfen,")
				say("deine inneren Kräfte zu steigern.")
				say("")
				pc.remove_item(30220,1)
                set_state(reward_soulstone_lv30)
			else
				say_mob("")
				say("")
				say("Du hast mir die 10 Stück gebracht.")
                say("Nun bitte ich dich noch, mir den")
                say("Jinunggyis Seelenstein zu bringen.")
                say("Du bekommst ihn von Stolzen Orks.")    
                say("Ich denke, dafür bist du stark genug.")
                say("")        
			end
		end
	end
	state reward_soulstone_lv30 begin
		when letter begin
			send_letter("Sprich mit Baek-Go")
			local v = find_npc_by_vnum(20018)
			if v != 0 then target.vid("__TARGET__", v, "Baek-Go") end
		end
		when button or info begin
			say_title("Belohnung des Biologen")
			say("")
			say("Um die Belohnung des Biologen zu erhalten")
            say("suche mit den Informationen der")
            say("Orkzähne und des Seelensteins Baek-Go auf.")
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
			say_reward("- Roter Ebenholzkasten")
			say_reward("- Bewegungsgeschwindigkeit +10% (Dauerhaft)")
			say("")
			affect.add_collect(apply.MOV_SPEED, 10, 60*60*24*365*60)
			pc.give_item2(50109)
			clear_letter()
			set_quest_state("biologe_02", "finish_lv30")
			set_state(__FIN_LV30__)
		end
	end
	state __FIN_LV30__ begin
	end
end