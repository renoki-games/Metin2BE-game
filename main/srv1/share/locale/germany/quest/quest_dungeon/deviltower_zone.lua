define MIN_LEVEL 40

quest deviltower_zone begin
	state start begin
		when login begin
			if pc.get_map_index() == 66 then
				if pc.get_x() < 2048+88 or pc.get_y() < 6656+577 or pc.get_x() > 2048+236 or pc.get_y() > 6656+737 then
					pc.warp((5376+532)*100, (512+596+4)*100, 22)
				end

				pc.set_warp_location(22, 5376+532, 512+596+4)

			elseif pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 then
				pc.set_warp_location(22, 5376+532, 512+596+4)
			end
		end

		when logout begin
			if pc.count_item(30300) >= 1 then
				pc.remove_item(30300, pc.count_item(30300))
			end

			if pc.count_item(30302) >= 1 then
				pc.remove_item(30302, pc.count_item(30302))
			end
		end

		when deviltower_man.chat."Dämonenturm" begin
			printQuestHeader("Wächter des Dämonturmes")

			if pc.get_level() < MIN_LEVEL then 
				sayQuestText("Du hast noch nicht genügend Erfahrung gesammelt.", true)
				sayQuestText(string.format("Komme wieder, wenn du Level %d bist!", MIN_LEVEL))
				return
			end

			sayQuestText("Möchtest du den Dämonenturm betreten?") 
			local s = select ("Betreten", "Abbrechen") 
			if s == 2 then return end

			pc.warp(216500, 727000)
		end

		when kill with npc.get_race() == 8015 begin
			timer("devil_stone1_1", 8)
		end

		when devil_stone1_1.timer begin
			d.new_jump_all(66, special.devil_tower[1][1], special.devil_tower[1][2])
			d.regen_file("data/dungeon/deviltower2_regen.txt")
			d.set_warp_at_eliminate(4, d.get_map_index(), special.devil_tower[2][1], special.devil_tower[2][2], "data/dungeon/deviltower3_regen.txt")
		end

		when kill with npc.get_race() == 1091 begin
			d.set_warp_at_eliminate(4, d.get_map_index(), special.devil_tower[3][1], special.devil_tower[3][2], "data/dungeon/deviltower4_regen.txt")
			d.check_eliminated()
		end

		function get_4floor_stone_pos()
			local positions = {
					{368, 629}, {419, 630}, {428, 653}, {422, 679},
					{395, 689}, {369, 679}, {361, 658},
				}

			for i = 1, 6 do
				local j = number(i, 7)
				if i != j then
					local t = positions[i];
					positions[i] = positions[j];
					positions[j] = t;
				end
			end
			return positions
		end

		when kill with npc.get_race() == 8016 and pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			d.setf("level", 4)
			local positions = deviltower_zone.get_4floor_stone_pos()

			for i = 1, 6 do
				test_chat(positions[i][1], positions[i][2])
				d.set_unique("fake" .. i , d.spawn_mob(8017, positions[i][1], positions[i][2]))
			end
			test_chat(positions[7][1], positions[7][2])

			local vid = d.spawn_mob(8017, positions[7][1], positions[7][2])
			d.set_unique("real", vid)
			server_loop_timer('devil_stone4_update', 10, pc.get_map_index())
			server_timer('devil_stone4_fail1', 5*60, pc.get_map_index())

			test_chat(vid)
			d.notice("Du bist nun auf der 4ten Ebene.");
			d.notice("Viele falsche Metinsteine werden deine Sinne und Verstand blenden.");
			d.notice("Finde den richtigen Metinstein innerhalb 15 Minuten.");
			d.notice("Es ist der einzige Weg um zur nächsten Ebene zu gelangen.");
		end

		when devil_stone4_fail1.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Noch 10 Minuten verbleibend.")
				server_timer('devil_stone4_fail2', 5*60, get_server_timer_arg())
			end
		end

		when devil_stone4_fail2.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Noch 5 Minuten verbleibend.")
				server_timer('devil_stone4_fail', 5*60, get_server_timer_arg())
			end
		end
	
		when devil_stone4_fail.server_timer begin
			if d.select(get_server_timer_arg()) and d.getf("level") == 4 then
				d.notice("Die Zeit ist abgelaufen.")
				d.exit_all()
			end
		end
	
		when devil_stone4_update.server_timer begin
			if d.select(get_server_timer_arg()) then
				if not d.is_unique_dead("real") then
					for i = 1, 6 do
						if d.getf("fakedead" .. i) == 0 then
							if d.unique_get_hp_perc("fake" .. i) < 50 then
								d.purge_unique("fake" .. i)
								d.setf("fakedead" .. i, 1)
								d.notice("Der falsche Metinstein verschwindet...");
							end
						end
					end
				else
					server_timer("devil_stone4_end", 5, get_server_timer_arg())
					
					d.notice("Du hast einen guten Instinkt bewiesen.");
					d.notice("Du hast den richtigen Metinstein zerstört.")
					d.purge()
				end
			else

			server_timer('devil_stone4_stop_timer', 1, get_server_timer_arg())
			end
		end

		when devil_stone4_stop_timer.server_timer begin
			clear_server_timer('devil_stone4_update', get_server_timer_arg())
		end

		when devil_stone4_end.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer('devil_stone4_update', get_server_timer_arg())
				clear_server_timer('devil_stone4_fail1', get_server_timer_arg())
				clear_server_timer('devil_stone4_fail2', get_server_timer_arg())
				clear_server_timer('devil_stone4_fail', get_server_timer_arg())

				d.setf("level", 5)
				d.setf("stone_count", 5)

				d.jump_all(special.devil_tower[4][1], special.devil_tower[4][2])
				d.notice("Du bist nun auf der 5ten Ebene.")
				d.notice("Töte die Monster um Schlüsselsteine zu erhalten.")
				d.notice("Diese werden die Tore öffnen.")
				d.notice("Öffne 5 Tore in 20 Minuten")
				d.notice("um auf die nächste Ebene zu gelangen!")

				server_timer('devil_stone5_fail1', 5*60, get_server_timer_arg())
				clear_server_timer('devil_stone4_update', get_server_timer_arg())
	
				d.set_regen_file("data/dungeon/deviltower5_regen.txt")

				d.spawn_mob(20073, 421, 452)
				d.spawn_mob(20073, 380, 460)
				d.spawn_mob(20073, 428, 414)
				d.spawn_mob(20073, 398, 392)
				d.spawn_mob(20073, 359, 426)
			end
		end

		when devil_stone5_fail1.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Noch 15 Minuten verbleibend.")
				server_timer('devil_stone5_fail2', 5*60, get_server_timer_arg())
			end
		end
	
		when devil_stone5_fail2.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Noch 10 Minuten verbleibend.")
				server_timer('devil_stone5_fail3', 5*60, get_server_timer_arg())
			end
		end
	
		when devil_stone5_fail3.server_timer begin
			if d.select(get_server_timer_arg()) then
				d.notice("Noch 5 Minuten verbleibend.")
				server_timer('devil_stone5_fail', 5*60, get_server_timer_arg())
			end
		end
	
		when devil_stone5_fail.server_timer begin
			if d.select(get_server_timer_arg()) and d.getf("level") == 5 then
				d.notice("Die Zeit ist abgelaufen.")
				d.exit_all()
			end
		end
	
		when kill with npc.get_race() == 1062 and pc.in_dungeon() and d.getf("level") == 5 begin
			local KILL_COUNT_FOR_DROP_KEY = 50
			local n = d.getf("countItem")+1
			d.setf("countItem", n)
			if n == KILL_COUNT_FOR_DROP_KEY then
				game.drop_item(50084, 1)
				d.setf("countItem", 0)
			end
		end

		when devil_stone5.take with item.vnum == 50084 begin
			npc.purge()
			item.remove()
			d.setf("stone_count", d.getf("stone_count") - 1)

			if d.getf("stone_count") <= 0 then
				d.clear_regen()
				d.kill_all()
				d.notice("Du hast das letzte Siegel geöffnet.")
				d.notice("Du wirst nun zur 6ten Ebene gelangen!")

				clear_server_timer('devil_stone5_fail1', get_server_timer_arg())
				clear_server_timer('devil_stone5_fail2', get_server_timer_arg())
				clear_server_timer('devil_stone5_fail3', get_server_timer_arg())
				clear_server_timer('devil_stone5_fail', get_server_timer_arg())

				d.setf("level", 6)
				d.new_jump_all(66, 2420, 6822)
				d.regen_file("data/dungeon/deviltower6_regen.txt")

				d.notice("Vernichte alle Dämonen auf der 6ten Ebene")
				d.notice("bevor du den König tötest!")
			else
				d.notice("Du hast ein Siegel geöffnet! Es verbleiben "..d.getf("stone_count")..".")
			end
		end
	
		when kill with npc.get_race() == 1092 begin
			d.kill_all()
			d.check_eliminated()
			local reward_blacksmith = {20074, 20075, 20076}

			d.spawn_mob(reward_blacksmith[number(1,3)], 425, 216);
			d.setqf("can_refine", 1)
		end
	
		when 20074.chat."Obere Ebenen des Dämonenturms" or 20075.chat."Obere Ebenen des Dämonenturms" or 20076.chat."Obere Ebenen des Dämonenturms" with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 and npc.lock() begin
			printQuestHeader("Turmschmied:")

			sayQuestText("Du hast einen Weg zur 7ten Ebene gefunden.")
			wait()

			if pc.level >= 75 then
				printQuestHeader("Turmschmied:")
				sayQuestText("Du bist stark genug. Viel Erfolg!")

				timer("devil_jump_7", 6)
				npc.unlock()
				d.purge()
				return
			end

			printQuestHeader("Turmschmied:")
			sayQuestText("Du must mehr trainieren um hier hochzukommen.")
			wait()

			pc.warp(50011800, 50009300)
			return
		end

		when devil_jump_7.timer begin
			d.clear_regen()
			d.spawn_mob(8018, 639, 658)
			d.spawn_mob(8018, 611, 637)
			d.spawn_mob(8018, 596, 674)
			d.spawn_mob(8018, 629, 670)

			d.setf("level", 7)
			d.jump_all(2048+590, 6656+638)
		end
		
		when kill with npc.get_race() == 8018 and pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			local count = d.getf("7_stone_kill") + 1
			d.setf("7_stone_kill", count)
	
			if count >= 4 then
				d.setf("7_stone_kill", 0)
				d.set_regen_file("data/dungeon/deviltower7_regen.txt")
			end
		end
	
		when 8019.kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			game.drop_item(30300, 1)
		end

		when 30300.use with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			item.remove()
			local pct = number(1,5)
			if pct == 1 then
				game.drop_item(30302, 1)
				d.clear_regen()
			else
				game.drop_item(30301, 1)
			end
		end

		when 30302.use with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			item.remove()
			if d.getf("level") != 7 then return end

			printQuestHeader(string.format("%s:", item_name(30302)))
			sayQuestText("Mit dieser Karte bringe ich dich auf die nächste Ebene!")

			timer("devil_jump_8", 12)
		end

		when devil_jump_8.timer begin
			d.setf("level", 8)

			d.jump_all(2048+590, 6656+403)
			d.set_regen_file("data/dungeon/deviltower8_regen.txt")
			d.spawn_mob(20366, 640, 460)

			pc.remove_item(30302, pc.count_item(30302))
		end
	
		when kill with npc.get_race() == 1040 and pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			if d.getf("level") < 9 then
				local pct1 = number(1, 8)

				if pct1 == 1 then
					local pct2 = number(1, 4)
					if pct2 == 1 then
						game.drop_item(30304, 1)
					else
						game.drop_item(30303, 1)
					end
				else return end
			end
		end
	
		when 20366.take with item.vnum == 30304 begin
			npc.purge()
			item.remove()

			d.clear_regen()
			d.kill_all()
			timer("stage_9_timer", 5)
		end

		when stage_9_timer.timer begin
			d.jump_all(2048+590, 6656+155)
			d.regen_file("data/dungeon/deviltower9_regen.txt")
		end

		when kill with npc.get_race() == 1093 and pc.in_dungeon() begin
			timer("devil_end_jump", 60)
			d.notice("Der Sensenmann wurde besiegt. Du wirst in einer Minute vor den Turm teleportiert.")
		end

		when devil_end_jump.timer begin
			d.exit_all()
		end
	end
end
