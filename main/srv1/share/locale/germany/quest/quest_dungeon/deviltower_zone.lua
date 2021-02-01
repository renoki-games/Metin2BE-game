define MAPINDEX_NO_DUNGEON 66
define MIN_LEVEL_1 40
define MIN_LEVEL_2 75
define STAGE_4_METIN 8016
define STAGE_5_MOB 1062
define BLACKSMITH_1 20074
define BLACKSMITH_2 20075
define BLACKSMITH_3 20076
define UNKNOWN_CHEST_CHANCE 2
define STAGE_8_KEY_DROP_CHANCE 2
define END_BOSS 1093

quest deviltower_zone begin
	state start begin
		when login begin
			if deviltower_zone.isNotInDungeon(MAPINDEX_NO_DUNGEON) == true then
				if pc.get_x() < 2048+88 or pc.get_y() < 6656+577 or pc.get_x() > 2048+236 or pc.get_y() > 6656+737 then
					pc.warp((5376+532)*100, (512+596+4)*100, 65)
				end
			end

			if deviltower_zone.isInDungeon(MAPINDEX_NO_DUNGEON) == true then
				pc.set_warp_location(65, 5376+532, 512+596+4)
			end
		end

		when logout begin
			deviltower_zone.removeDungeonItems(30300, 30302)
		end

		when deviltower_man.chat.gameforge[get_language()].deviltower_zone._10_npcChat begin
			local setting = deviltower_zone.getData()

			if pc.get_level() < MIN_LEVEL_1 then
				say_title(gameforge[get_language()].deviltower_zone._20_sayTitle)
				say("")
				say(gameforge[get_language()].deviltower_zone._30_say)
			else
				say_title(gameforge[get_language()].deviltower_zone._20_sayTitle)
				say("")
				say(gameforge[get_language()].deviltower_zone._40_say)
				local s =  select("Eintreten", "Später")
				if s == 2 then return end

				pc.warp(setting.firstFloorPos[1]*100,setting.firstFloorPos[2]*100)
			end
		end

		when devil_stone1.kill begin
			timer("stage_0_MetinKill", 5)
		end

		when stage_0_MetinKill.timer begin
			d.new_jump_all(MAPINDEX_NO_DUNGEON, special.devil_tower[1][1], special.devil_tower[1][2])
			d.regen_file("data/dungeon/deviltower2_regen.txt")
			d.check_eliminated()
			d.set_warp_at_eliminate(4, d.get_map_index(), special.devil_tower[2][1], special.devil_tower[2][2], "data/dungeon/deviltower3_regen.txt")
			d.check_eliminated()
		end

		when devil_stone3.kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			--d.set_warp_at_eliminate(4, d.get_map_index(), special.devil_tower[3][1], special.devil_tower[3][2], "data/dungeon/deviltower4_regen.txt")
			d.regen_file("data/dungeon/deviltower4_regen.txt")
			d.check_eliminated()
			d.setf("floor", 4)
		end

		when STAGE_4_METIN.kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			local positions = deviltower_zone.getData4Stage()
			for i = 1, 6 do
				test_chat(positions[i][1], positions[i][2])
				d.set_unique("fake" .. i , d.spawn_mob(8017, positions[i][1], positions[i][2]))
			end

			test_chat(positions[7][1], positions[7][2])

			local vid = d.spawn_mob(8017, positions[7][1], positions[7][2])
			test_chat(vid)
			d.set_unique("real", vid)
			server_timer("stage_4_fail", 5*60, pc.get_map_index())
			server_loop_timer('stage_4_update', 10, pc.get_map_index())
			notice_multiline(gameforge[get_language()].deviltower_zone._50_dNotice,d.notice)
		end

		when stage_4_fail.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(gameforge[get_language()].deviltower_zone._60_dNotice,d.notice)
				server_timer('stage_4_fail_2', 5*60, get_server_timer_arg())
			end
		end

		when stage_4_fail_2.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(gameforge[get_language()].deviltower_zone._70_dNotice,d.notice)
				server_timer('stage_4_fail_3', 5*60, get_server_timer_arg())
			end
		end

		when stage_4_fail_3.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(gameforge[get_language()].deviltower_zone._80_dNotice,d.notice)
				d.clear_regen()
				d.exit_all()
			end
		end

		when stage_4_update.server_timer begin
			if d.select(get_server_timer_arg()) then
				if not d.is_unique_dead("real") then
					for i = 1, 6 do
						if d.getf("fakedead" .. i) == 0 then
							if d.unique_get_hp_perc("fake" .. i) < 50 then
								d.purge_unique("fake" .. i)
								d.setf("fakedead" .. i, 1)
								notice_multiline(gameforge[get_language()].deviltower_zone._90_dNotice,d.notice)
							end
						end
					end
				else
					server_timer("stage_4_complete", 5, get_server_timer_arg())
					d.purge()
					notice_multiline(gameforge[get_language()].deviltower_zone._100_dNotice,d.notice)
					deviltower_zone.clearStage4Timer()
				end
			else
				clear_server_timer('stage_4_update', get_server_timer_arg())
			end
		end

		when stage_4_complete.server_timer begin
			if d.select(get_server_timer_arg()) then
				clear_server_timer('stage_4_update', get_server_timer_arg())
				d.clear_regen()
				d.setf("floor", 5)
				d.setf("sealCount", 5)
		
				notice_multiline(gameforge[get_language()].deviltower_zone._110_dNotice,d.notice)
				d.jump_all(special.devil_tower[4][1], special.devil_tower[4][2])

				server_timer('stage_5_fail_1', 5*60, get_server_timer_arg())
				d.set_regen_file("data/dungeon/deviltower5_regen.txt")
				deviltower_zone.spawnSeals()
			end
		end

		when stage_5_fail_1.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(gameforge[get_language()].deviltower_zone._120_dNotice,d.notice)
				server_timer('stage_5_fail_2', 5*60, get_server_timer_arg())
			end
		end

		when stage_5_fail_2.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(gameforge[get_language()].deviltower_zone._60_dNotice,d.notice)
				server_timer('stage_5_fail_3', 5*60, get_server_timer_arg())
			end
		end

		when stage_5_fail_3.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(gameforge[get_language()].deviltower_zone._70_dNotice,d.notice)
				server_timer('stage_5_fail_4', 5*60, get_server_timer_arg())
			end
		end

		when stage_5_fail_4.server_timer begin
			if d.select(get_server_timer_arg()) then
				notice_multiline(gameforge[get_language()].deviltower_zone._80_dNotice,d.notice)
				d.exit_all()
			end
		end

		when STAGE_5_MOB.kill with pc.in_dungeon() and d.getf("floor") == 5 begin
			local KILL_COUNT_FOR_DROP_KEY = 25
			d.setf("count", d.getf("count") + 1) 

			if n == KILL_COUNT_FOR_DROP_KEY then
				game.drop_item(50084, 1)
				d.setf("count", 0)
			end
		end

		when devil_stone5.take with item.vnum == 50084 begin
			npc.purge()
			item.remove()
			d.setf("sealCount", d.getf("sealCount") - 1)

			if d.getf("sealCount") <= 0 then
				d.setf("floor", 6)
				d.clear_regen()
				d.regen_file("data/dungeon/deviltower6_regen.txt")
		
				notice_multiline(gameforge[get_language()].deviltower_zone._130_dNotice,d.notice)
				d.jump_all(special.devil_tower[5][1], special.devil_tower[5][2])
		
				local server_arg = d.get_map_index()
				clear_server_timer('stage_5_fail_1', server_arg)
				clear_server_timer('stage_5_fail_2', server_arg)
				clear_server_timer('stage_5_fail_3', server_arg)
				clear_server_timer('stage_5_fail_4', server_arg)
			else
				d.notice(string.format(gameforge[get_language()].deviltower_zone._140_dNotice, d.getf("sealCount")))
			end
		end

		when devil_stone6.kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 and d.getf("floor") == 6 begin
			d.kill_all()
			notice_multiline(gameforge[get_language()].deviltower_zone._150_dNotice, d.notice)
			d.check_eliminated()
			notice_multiline(gameforge[get_language()].deviltower_zone._160_dNotice, d.notice)

			local reward_alchemist = {20074, 20075, 20076}
			local setting = deviltower_zone.getData()
			d.spawn_mob(setting.DemonTowerBlackSmiths[number(1,3)], 425, 216);
			d.setqf2("deviltower_zone","can_refine", 1)
		end

		when BLACKSMITH_1.chat."Die höheren Ebenen" or BLACKSMITH_2.chat."Die höheren Ebenen" or BLACKSMITH_3.chat."Die höheren Ebenen" with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 and npc.lock() begin
			say_title("Turmschmied:")
			say(gameforge[get_language()].deviltower_zone._190_say)
			wait()

			if pc.level >= MIN_LEVEL_2 then
				say_title("Turmschmied:")
				say(gameforge[get_language()].deviltower_zone._200_say)
				local s =  select("Eintreten", "Abbrechen", "Zurück vor den Turm")
				if s == 3 then
					pc.warp(590500, 110900)
					return
				end

				if s == 2 then return end
				timer("stage_7_timer", 6)
				npc.unlock()
				d.purge()
				return
			end
			say_title("Turmschmied:")
			say(gameforge[get_language()].deviltower_zone._230_say)
			wait()

			pc.warp(590500, 110500)
			return
		end

		when stage_7_timer.timer begin
			d.clear_regen()
			d.spawn_mob(8018, 639, 658)
			d.spawn_mob(8018, 611, 637)
			d.spawn_mob(8018, 596, 674)
			d.spawn_mob(8018, 629, 670)
			d.setf("floor", 7)
			notice_multiline(gameforge[get_language()].deviltower_zone._240_dNotice,d.notice)
			d.jump_all(2048+590, 6656+638)
		end

		when 8018.kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			local count = d.getf("stage_7_MetinCount") + 1
			d.setf("stage_7_MetinCount", count)

			if count == 4 then
				d.setf("stage_7_MetinCount", 0)
				d.set_regen_file("data/dungeon/deviltower7_regen.txt")
			end	
		end

		when 8019.kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			game.drop_item(30300, 1)
		end

		when 30300.use with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			local chance = number(1,10)

			if chance == UNKNOWN_CHEST_CHANCE then
				game.drop_item(30302, 1)
				d.clear_regen()
			else
				game.drop_item(30301, 1)
			end
			item.remove()
		end

		when 30302.use with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			if d.getf("floor") != 7 then item.remove() return end

			say_title("Turmschmied")
			say(gameforge[get_language()].deviltower_zone._250_say)
			item.remove()
			timer("stage_8_timer", 6)
			d.clear_regen()
		end

		when stage_8_timer.timer begin
			d.setf("floor", 8)
			notice_multiline(gameforge[get_language()].deviltower_zone._260_dNotice,d.notice)
			d.jump_all(2048+590, 6656+403)
			d.set_regen_file("data/dungeon/deviltower8_regen.txt")
			d.spawn_mob(20366, 640, 460)
		end

		when 1040.kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			local chance = number(1, 5)

			if chance == STAGE_8_KEY_DROP_CHANCE then
				local perc = number(1, 10)
				if perc == STAGE_8_KEY_DROP_CHANCE then
					game.drop_item(30304, 1)
				else
					game.drop_item(30303, 1)
				end
			end
		end

		when 20366.take with item.vnum == 30304 and deviltower_zone.isInDungeon(MAPINDEX_NO_DUNGEON) == true begin
			npc.purge()
			item.remove()
			timer("stage_9_timer", 6)
		end

		when stage_9_timer.timer begin
			d.setf("floor", 9)
			notice_multiline(gameforge[get_language()].deviltower_zone._270_dNotice,d.notice)
			d.jump_all(2048+590, 6656+155)
			d.regen_file("data/dungeon/deviltower9_regen.txt")
		end

		when END_BOSS.kill with pc.in_dungeon() and pc.get_map_index() >= 660000 and pc.get_map_index() < 670000 begin
			d.kill_all()
			d.setqf2("deviltower_zone","stage_9_done", 1)
			notice_multiline(gameforge[get_language()].deviltower_zone._280_dNotice,d.notice)
			notice_multiline(gameforge[get_language()].deviltower_zone._290_dNotice,d.notice)
			server_timer("devil_end_jump", 60, d.get_map_index())
		end

		when devil_end_jump.server_timer begin
			if d.select (get_server_timer_arg()) then
				d.clear_regen()
				d.exit_all()
			end
		end
	end

	state __FUNCTIONS__ begin
		function isNotInDungeon(mapIndex)
			if pc.get_map_index() == mapIndex then
				return true
			end
		end

		function isInDungeon(mapIndex)
			if pc.get_map_index() == (mapIndex*10000) and pc.get_map_index() == ((mapIndex+1)*10000) then
				return true
			end
		end

		function getData4Stage()
			local positions = 
				{
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

		function removeDungeonItems(val_1, val_2)
			if pc.count_item(val_1) >= 1 then
				pc.remove_item(val_1, pc.count_item(val_1))
			end

			if pc.count_item(val_2) >= 1 then
				pc.remove_item(val_2, pc.count_item(val_2))
			end
		end

		function makeDungeon()
			d.new_jump_all(MAPINDEX_NO_DUNGEON, special.devil_tower[1][1], special.devil_tower[1][2])
			d.regen_file("data/dungeon/deviltower2_regen.txt")
			d.set_warp_at_eliminate(4, d.get_map_index(), special.devil_tower[2][1], special.devil_tower[2][2], "data/dungeon/deviltower3_regen.txt")
		end

		function setDungeonTimer(name, val, idx)
			local timerVal = val or 5
			server_timer(name, timerVal, idx)
		end

		function clearStage4Timer()
			clear_server_timer('stage_4_fail', get_server_timer_arg())
			clear_server_timer('stage_4_fail_2', get_server_timer_arg())
			clear_server_timer('stage_4_fail_3', get_server_timer_arg())
		end

		function spawnSeals()
			local setting = deviltower_zone.getData()
			d.spawn_mob(setting.sealVnum, setting.sealPos1[1], setting.sealPos1[2])
			d.spawn_mob(setting.sealVnum, setting.sealPos2[1], setting.sealPos2[2])
			d.spawn_mob(setting.sealVnum, setting.sealPos3[1], setting.sealPos3[2])
			d.spawn_mob(setting.sealVnum, setting.sealPos4[1], setting.sealPos4[2])
			d.spawn_mob(setting.sealVnum, setting.sealPos5[1], setting.sealPos5[2])
		end

		function getData()
			return {
				["firstFloorPos"] = {2165, 7270},
				["sealVnum"] = 20073,
				["sealPos1"] = {421, 452},
				["sealPos2"] = {380, 460},
				["sealPos3"] = {428, 414},
				["sealPos4"] = {398, 392},
				["sealPos5"] = {359, 426},
				["DemonTowerBlackSmiths"] = {20074, 20075, 20076},
			}
		end
	end
end