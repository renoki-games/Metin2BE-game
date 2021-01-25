define QUEST_NPC_RED 11001

quest npc_arena_manager_red begin
	state start begin
		when QUEST_NPC_RED.chat."Lösche die Event-Flag" with pc.is_gm() begin
			game.set_event_flag("arenaStatus_RED", 0)
			return
		end

		when QUEST_NPC_RED.chat."Duellarena Info" begin
			printQuestHeader("Schlachtenverwalter:")
			sayQuestText("Um gegen jemanden duellieren zu können, musst du den Namen des Gegners eintragen.", true)
			sayQuestText("Der Jenige der 3 Runden gewinnt, gewinnt das Arenaduell!")
			sayQuestText("Ein Duell darf nicht auf unkoventionellen Weg abgebrochen werden. Als Stafe steht Perma Bann an.")
		end

		when QUEST_NPC_RED.chat."Zurück in die Arena" with pc.getqf("active_player_a") == 1 or pc.getf("npc_arena_manager_red", "active_player_b") == 1 begin
			printQuestHeader("Schlachtenverwalter:")
			sayQuestText("Falls du ausversehen die Arena verlassen hast, kannst du wieder rein.", true)

			local s = select("Wieder eintreten", " Duell abbrechen")
			if s == 2 then 
				game.set_event_flag("arenaStatus_RED", 0)
				pc.setf("npc_arena_manager_red", "round", 0)
				pc.setf("npc_arena_manager_red", "active_player_b", 0)
				pc.setf("npc_arena_manager_red", "active_player_a", 0)
				notice("Dein Gegner muss das Duell auch abbrechen.")
			end

			if s == 1 then
				npc_arena_manager_red.warpToArenaPlayer_1(3)
			end
		end

		when QUEST_NPC_RED.chat."Duell abbrechen" with pc.getqf("active_player_a") == 1 or pc.getf("npc_arena_manager_red", "active_player_b") == 1 begin
			printQuestHeader("Schlachtenverwalter:")
			sayQuestText("Falls du auf das Duell keine Lust mehr hast, kannst du abbrechen.", true)
			wait()

			game.set_event_flag("arenaStatus_RED", 0)
			pc.setf("npc_arena_manager_red", "round", 0)
			pc.setf("npc_arena_manager_red", "active_player_b", 0)
			pc.setf("npc_arena_manager_red", "active_player_a", 0)
			warp_to_village()
		end

		when QUEST_NPC_RED.chat."In die Duellarena!" with pc.get_level() >= 15 begin
			printQuestHeader("Schlachtenverwalter:")

			if game.get_event_flag("arenaStatus_RED") == 1 then 
				return say_reward("Die Arena ist schon besetzt.") end

			sayQuestText("Trage den Namen des Gegners ein:")

			local selectName = input()
			local vid = pc.get_vid()
			local a = find_pc_by_name(selectName)
			pc.select(a)
			local player_b_level = pc.get_level()

			if player_b_level < 15 then
				pc.select(vid)
				sayQuestText("Dein Gegner muss mindestens Level 15 erreicht haben!")
				return
			end

			pc.select(vid)

			if selectName == "" or selectName == nil then
				return say_reward("Du hast keinen Namen eingetragen!")

			elseif selectName == pc.get_name() then
				return say_reward("Du kannst dich nicht selber eintragen!")

			elseif find_pc_by_name(selectName) == 0 then
				return say_reward("Der Spieler wurde nicht gefunden!")
			end

			sayQuestText("Warte bis dein Gegner das Duell bestätigt.")

			local send = confirm(find_pc_by_name(selectName),"Willst du dich mit "..pc.get_name().." duellieren?", 30)

			if send != CONFIRM_OK then
				printQuestHeader("Schlachtenverwalter:")
				sayQuestText(selectName.." hat die Herrausforderung nicht angenommen!")
				return
			end

			printQuestHeader("Schlachtenverwalter:")
			sayQuestText("Macht euch bereit!")
			wait()

			game.set_event_flag("arenaStatus_RED", 1)
			pc.setqf("active_player_a", 1)

			local b = find_pc_by_name(selectName)

			npc_arena_manager_red.warpToArenaPlayer_1(1)

			pc.select(b)
			
			pc.setf("npc_arena_manager_red", "active_player_b", 1)
			npc_arena_manager_red.warpToArenaPlayer_1(2)
		end

		when kill with pc.getqf("active_player_a") == 1 or pc.getf("npc_arena_manager_red", "active_player_b") == 1 begin
			local vid = npc.get_vid()
			local a = pc.select(vid)
			local name = pc.get_name()
	
			pc.select(a)
			if pc.getf("npc_arena_manager_red", "round") >= 2 then
				notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. clickable_pn_tag(NAME_COLOR, pc.get_name()) .. " " .. tag(TEXT_COLOR, "hat das Duell gegen " .. clickable_pn_tag(NAME_COLOR, name) .. " " .. tag(TEXT_COLOR,"gewonnen!")))
				notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. clickable_pn_tag(NAME_COLOR, pc.get_name()) .. " " .. tag(TEXT_COLOR, "hatte noch " .. tag(NAME_COLOR, pc.get_hp()) .. " " .. tag(TEXT_COLOR,"TP übrig!")))

				game.set_event_flag("arenaStatus_RED", 0)
				pc.setf("npc_arena_manager_red", "round", 0)
				pc.setf("npc_arena_manager_red", "active_player_b", 0)
				pc.setf("npc_arena_manager_red", "active_player_a", 0)
		
				local b = pc.select(vid)

				npc_arena_manager_red.warpToArenaPlayer_1(4)

				pc.setf("npc_arena_manager_red", "round", 0)
				pc.setf("npc_arena_manager_red", "active_player_b", 0)
				pc.setf("npc_arena_manager_red", "active_player_a", 0)

				pc.select(b)
				npc_arena_manager_red.warpToArenaPlayer_1(4)
			else
				pc.setf("npc_arena_manager_red", "round", pc.getf("npc_arena_manager_red", "round") + 1)
				notice(pc.name.." gewinnt eine Runde!")
				notice(string.format("%s hat %s Runden gewonnen.",pc.name , pc.getf("npc_arena_manager_red", "round")))
			end
		end
	end
	state __FUNCTIONS__ begin
		function warpToArenaPlayer_1(val)
			if val == 1 then
				pc.warp(465300, 946800)
			elseif val == 2 then
				pc.warp(466500, 945500)
			elseif val == 3 then
				pc.warp(465900, 946200)
			elseif val == 4 then
				pc.warp(466800, 947100)
			end
		end
	end
end