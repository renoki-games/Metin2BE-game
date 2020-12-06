quest fisher begin
    state start begin
		when 9009.chat.gameforge[get_language()].fisher._10_npcChat begin
		    npc.open_shop()
			setskin(NOWINDOW)
		end
	
		when 9009.chat.gameforge[get_language()].fisher._20_npcChat begin
			say_title(gameforge[get_language()].fisher._30_sayTitle)
			say(gameforge[get_language()].fisher._40_say)
		end

		when 9009.take with item.vnum < 27400 or item.vnum > 27590 begin
			say_title(gameforge[get_language()].fisher._30_sayTitle)
			say(gameforge[get_language()].fisher._50_say)
		end

		when 9009.take with item.vnum == 27590 begin
			say_title(gameforge[get_language()].fisher._30_sayTitle)
			say(gameforge[get_language()].fisher._60_say)
		end

		when 9009.take with item.vnum >= 27400 and item.vnum < 27590 and item.get_socket(0)!= item.get_value(2) begin
			say_title(gameforge[get_language()].fisher._30_sayTitle)
			say(gameforge[get_language()].fisher._70_say)
		end

		when 9009.take with item.vnum >= 27400 and item.vnum < 27590 and item.get_socket(0) == item.get_value(2) begin
			say_title(gameforge[get_language()].fisher._30_sayTitle)
			say(gameforge[get_language()].fisher._80_say)
			say(string.format(gameforge[get_language()].fisher._90_say, item.get_value(0) / 10))
			say(gameforge[get_language()].fisher._100_say)
			say(string.format(gameforge[get_language()].fisher._110_say, 100 - item.get_value(3)))
			say(gameforge[get_language()].fisher._120_say)

			local s =  select(gameforge[get_language()].locale.guild.yes, gameforge[get_language()].locale.guild.no)

			if s == 1 then
				local f = __fish_real_refine_rod(item.get_cell())
				if f == 2 then
					say_title(gameforge[get_language()].fisher._30_sayTitle)
					say(gameforge[get_language()].fisher._130_say)
				elseif f == 1 then
					say_title(gameforge[get_language()].fisher._30_sayTitle)
					say(gameforge[get_language()].fisher._140_say)
				else
					say(gameforge[get_language()].fisher._150_say)
				end
			else
				say_title(gameforge[get_language()].fisher._30_sayTitle)
				say(gameforge[get_language()].fisher._160_say)
			end
		end
    end
end


