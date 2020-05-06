quest stash begin
	state start begin --Status when nothing is open
		when login begin
			cmdchat("ingame_mall " ..q.getcurrentquestindex())
		end
		when button or info begin
			syschat("Du besitzt noch kein Lager!")
		end
		when warehouse_keeper.chat.gameforge.warehouse._10_npcChat  begin
			say_title(gameforge.warehouse._20_sayTitle)
			-- changed handling, after we get a new button to open the storeage directly
			say(gameforge.warehouse._30_say)
			wait()

			if pc.gold < 500 then
				
				
				say_title(gameforge.warehouse._20_sayTitle)
				say(gameforge.warehouse._40_say)
			else
				local s =  select(gameforge.locale.stash.pay_ok, gameforge.locale.stash.pay_no)

				if s == 1 then
					pc.changegold(-500)
					game.set_safebox_level(1)
					set_state(use)
					say_title(gameforge.subquest_26._30_sayTitle)
					say(gameforge.warehouse._50_say)
					say_reward(gameforge.warehouse._60_sayReward)
					say(gameforge.warehouse._70_say)
				else
					say_title(gameforge.warehouse._20_sayTitle)
					say(gameforge.warehouse._80_say)
				end
			end
		end
		when warehouse_keeper.chat.gameforge.warehouse._120_npcChat  begin
			if pc.getqf("open_item_storage_count") < 3 then
				say_title(gameforge.subquest_26._30_sayTitle)
				say(gameforge.warehouse._140_say)
				wait()
				say_title(gameforge.subquest_26._30_sayTitle)
				say_show_item(90013) -- icon of item
				say(gameforge.warehouse._150_say)
				wait()
				pc.setqf("open_item_storage_count", pc.getqf("open_item_storage_count") + 1)
			end
			
			setskin(NOWINDOW)
			game.open_mall()
		end
	end
	state use begin
		when login begin
			cmdchat("ingame_mall " ..q.getcurrentquestindex())
		end
		when button or info begin
			if pc.in_dungeon() then
				syschat("<Lager> Du kannst hier kein Lager �ffnen!")
			else
				game.open_safebox()
			end
		end
		when warehouse_keeper.chat.gameforge.warehouse._90_npcChat begin
			if pc.getqf("open_count") < 3 then
				say_title(gameforge.subquest_26._30_sayTitle)
				say(gameforge.warehouse._100_say)
				wait()
				say_title(gameforge.subquest_26._30_sayTitle)
				say(gameforge.warehouse._110_say)
				wait()
				pc.setqf("open_count", pc.getqf("open_count") + 1)
			end
			setskin(NOWINDOW)
			game.open_safebox()
		end
		when warehouse_keeper.chat.gameforge.warehouse._120_npcChat begin
			if pc.getqf("open_item_storage_count") < 3 then
				say_title(gameforge.subquest_26._30_sayTitle)
				say(gameforge.warehouse._140_say)
			    wait()
				say_title(gameforge.subquest_26._30_sayTitle)
				say_show_item(90013) -- icon of item
				say(gameforge.warehouse._150_say)
				wait()
				pc.setqf("open_item_storage_count", pc.getqf("open_item_storage_count") + 1)
			end
			
			setskin(NOWINDOW)
			game.open_mall()
			
		end
		when warehouse_keeper.chat."Silber oder Goldbarren kaufen" begin
			npc.open_shop()
			say_title(gameforge.subquest_26._30_sayTitle)
			say(gameforge.warehouse._130_say)
		end 

	end -- end_of_state: use
end -- end_of_quest

