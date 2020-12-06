quest horse_menu begin
	state start begin
		when 20030.click or 20101.click or 20102.click or 20103.click or 20104.click or 20105.click or 20106.click or 20107.click
			or 20108.click or 20109.click or 20110.click or 20111.click or 20112.click or 20113.click or 20114.click 
			or 20115.click or 20116.click or 20117.click or 20118.click or 20119.click or 20120.click or 20121.click begin
			if horse.is_mine() then
				say(locale.horse_menu.menu)
				say("")

				local s = 6

				if horse.is_dead() then
					s = select(locale.horse_menu.revive,locale.horse_menu.unsummon, locale.horse_menu.close)

					if s == 1 then s = 0
					elseif s == 2 then s = 3
					elseif s == 3 then return
					end
				else
					s = select(locale.horse_menu.feed, locale.horse_menu.ride, locale.horse_menu.unsummon, gameforge[get_language()].horse_menu._10_say, gameforge[get_language()].horse_menu._20_say, locale.horse_menu.close)
				end

				if s == 6 then
					return
				elseif s == 0 then
					horse.revive()
				elseif s == 1 then
					if horse.get_level() < 30 then
						local food = horse.get_grade() + 50053
						if pc.countitem(food) > 0 then
							pc.removeitem(food, 1)
							horse.feed()
							return
						else
							say(gameforge[get_language()].horse_menu._30_say  .. item_name(food))
							say("")
						end
					else
						if pc.countitem(38100) > 0 then
							pc.removeitem(38100, 1)
							horse.feed()
							return
						else
							say(gameforge[get_language()].horse_menu._30_say  .. item_name(38100))
							say("")
						end
					end
				elseif (s == 2 and false == pc.is_riding()) then 
					horse.ride()
				elseif s == 3 then
					horse.unsummon()
				elseif s == 4 then
					say(gameforge[get_language()].horse_menu._40_say..horse.get_health_pct().."%")
					say(gameforge[get_language()].horse_menu._50_say..horse.get_stamina_pct().."%")
					say("")
				elseif s == 5 then
					if pc.countitem(71110) <= 0 then
						say(gameforge[get_language()].horse_menu._30_say  .. item_name(71110))
						say("")
						return
					end

					local old_horse_name = horse.get_name()
					if string.len(old_horse_name) == 0 then
						say(gameforge[get_language()].horse_menu._60_say)
					else
						say(gameforge[get_language()].horse_menu._70_say..old_horse_name)
					end
					
					say(gameforge[get_language()].horse_menu._80_say)
					say("")

					local horse_name = input()

					if string.len(horse_name) < 2 then
						say(gameforge[get_language()].horse_menu._90_say)
						say("")
						return
					elseif string.len(horse_name) > 12 then
						say(gameforge[get_language()].horse_menu._100_say)
						say("")
						return
					end
					
					local ret = horse.set_name(horse_name)

					if ret == 0 then
						say(gameforge[get_language()].horse_menu._110_say)
						say("")
					elseif ret == 1 then
						say()
						say(gameforge[get_language()].horse_menu._120_say)
					elseif ret == 2 then
						pc.remove_item("71110")

						say(gameforge[get_language()].horse_menu._130_say)
						say("")
					end
				end
			end
		end
    end
end
