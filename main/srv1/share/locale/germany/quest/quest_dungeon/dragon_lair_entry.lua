define ENTRY_NPC 30121
define ENTRY_KEY 30179

quest dragon_lair_entry begin
	state start begin
		when logout with pc.get_map_index() >= (74*10000) begin
			pc.setqf("punishment", 1)
		end

		when login with pc.get_map_index() >= (74*10000) and pc.getqf("punishment") == 1 begin
			pc.setqf("punishment", 0)
			warp_to_village()
		end

		when ENTRY_NPC.chat."Ich will den Drachen töten" with pc.get_map_index() == 73 and game.get_event_flag("dragontemple_open") == 0 begin
			pc.setqf("punishment", 0)

			if game.get_event_flag("dragontemple_used") == 1 then
				if game.get_event_flag("dragontemple_block") == 1 then
					say_title(mob_name(ENTRY_NPC))
					say("")
					say("Der Raum ist gesperrt, versuch es später noch ein mal.")
					return
				end
				
				say_title(mob_name(ENTRY_NPC))
				say("")
				say("Tut mir Leid, der Raum ist reserviert.")
				say("Wenn du ein Passwort hast für den Zugang")
				say("gebe es jetzt bitte ein.")

				local password = input()
				if game.get_event_flag("dragontemple_password") == tonumber(password) then
					say_title(mob_name(ENTRY_NPC))
					say("")
					say("Das Passwort stimmt überein.")
					say("Ich bringe dich in die Kammer.")
					
					local s = select("Bring mich rein", "Abbrechen")
					if s == 2 then return end

					pc.remove_item(ENTRY_KEY, 3)
					pc.warp(843600, 1066900, (74*10000))
				else
					say_title(mob_name(ENTRY_NPC))
					say("")
					say("Das Passwort stimmt nicht überein.")
					return
				end

			elseif game.get_event_flag("dragontemple_used") == 0 then
				say_title(mob_name(ENTRY_NPC))
				say("")
				say("Du willst also den Drachen bekämpfen?")
				say("Dann gib bitte erst ein Passwort(nur Zahlen) ein")
				say("um den Raum zu schützen. Geb das Passwort")
				say("einfach deinen Gruppenmitgliedern und sie")
				say("können mit in den Raum.")
				say("Gib es bitte jetzt ein.")

				local password = tonumber(input(""))
				game.set_event_flag("dragontemple_password", password)

				say_title(mob_name(ENTRY_NPC))
				say("")
				say("Wenn du willst kann ich dich sofort")
				say("in den Drachnraum bringen.")
				say("Gib mir einfach 3x")
				say("")
				say_item_vnum(ENTRY_KEY)
				say("")
				
				local s = select("Hier, nimm sie und bring mich rein", "Abbrechen")
				if s == 2 then return end

				if pc.count_item(ENTRY_KEY) >= 3 then
					pc.remove_item(ENTRY_KEY, 3)
					DragonLair.startRaid(74)

					game.set_event_flag("dragontemple_used", 1)
					timer("blockentry", 5*60)
				else
					say("Du hast nur "..pc.count_item(ENTRY_KEY).." von 3 benötigten")
					say("")
					say_item_vnum(ENTRY_KEY)
					say("")
					return
				end
			end
		end

		when 2493.kill with pc.get_map_index() >= (74*10000) begin
			timer("set_unused", 30)
			notice_all("Die gruppe von blabla hat den Drachen gekillt.")
		end

		when set_unused.timer begin
			game.set_event_flag("dragontemple_used", 0)
			game.set_event_flag("dragontemple_block", 0)
			notice_all("Der Drache ist zurückgekehrt!")
		end

		when blockentry.timer begin
			game.set_event_flag("dragontemple_block", 1)
		end
	end

	state __FUNCTIONS__ begin
	end
end