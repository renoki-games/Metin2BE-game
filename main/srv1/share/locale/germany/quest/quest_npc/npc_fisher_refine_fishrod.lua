quest fisher begin
    state start begin
		when 9009.chat.gameforge.fisher._10_npcChat begin
		    npc.open_shop()
			setskin(NOWINDOW)
		end
	
		when 9009.chat.gameforge.fisher._20_npcChat begin
			say_title(gameforge.fisher._30_sayTitle)
			say(gameforge.fisher._40_say)
		end

		when 9009.take with item.vnum < 27400 or item.vnum > 27590 begin
			say_title(gameforge.fisher._30_sayTitle)
			say(gameforge.fisher._50_say)
		end

		when 9009.take with item.vnum == 27590 begin
			say_title(gameforge.fisher._30_sayTitle)
			say(gameforge.fisher._60_say)
		end

		when 9009.take with item.vnum >= 27400 and item.vnum < 27590 and item.get_socket(0)!= item.get_value(2) begin
			say_title(gameforge.fisher._30_sayTitle)
			say(gameforge.fisher._70_say)
		end

		when 9009.take with item.vnum >= 27400 and item.vnum < 27590 and item.get_socket(0) == item.get_value(2) begin
			say_title(gameforge.fisher._30_sayTitle)
			say(gameforge.fisher._80_say)
			say(string.format(gameforge.fisher._90_say, item.get_value(0) / 10))
			say(gameforge.fisher._100_say)
			say(string.format(gameforge.fisher._110_say, 100 - item.get_value(3)))
			say(gameforge.fisher._120_say)

			local s =  select(gameforge.locale.guild.yes, gameforge.locale.guild.no)

			if s == 1 then
				local f = __fish_real_refine_rod(item.get_cell())
				if f == 2 then
					say_title(gameforge.fisher._30_sayTitle)
					say(gameforge.fisher._130_say)
				elseif f == 1 then
					say_title(gameforge.fisher._30_sayTitle)
					say(gameforge.fisher._140_say)
				else
					say(gameforge.fisher._150_say)
				end
			else
				say_title(gameforge.fisher._30_sayTitle)
				say(gameforge.fisher._160_say)
			end
		end
    end
end


