quest horse_summon begin
	state start begin
		
function get_horse_summon_prob_pct()
	local skill_level=pc.get_skill_level(131)

	if skill_level==1 then
		return 15
	elseif skill_level==2 then
		return 20
	elseif skill_level==3 then
		return 30
	elseif skill_level==4 then
		return 40
	elseif skill_level==5 then
		return 50
	elseif skill_level==6 then
		return 60
	elseif skill_level==7 then
		return 70
	elseif skill_level==8 then
		return 80
	elseif skill_level==9 then
		return 90
	elseif skill_level>=10 then
		return 100
	end
	return 10
end	
	
		when 20349.chat.gameforge.horse_summon._10_npcChat with horse.get_grade() == 1 and pc.countitem("50051") < 1 begin
			say_title(gameforge.horse_exchange_ticket._20_sayTitle)
			say(gameforge.horse_summon._20_say)
			local b = select(gameforge.find_squareguard._50_select, gameforge.find_brother_article._100_select)
			if 1 == b then
				if pc.money>=400000 then
					pc.changemoney(-400000)
					say_title(gameforge.horse_exchange_ticket._20_sayTitle)
					say(gameforge.horse_summon._30_say)
					pc.give_item2("50051", 1)
				else
					say_title(gameforge.horse_exchange_ticket._20_sayTitle)
					say(gameforge.horse_summon._40_say)
				end
			elseif 2==b then
				return
			else
				say(string.format(gameforge.find_squareguard._70_say, b))
			end
		end
		when 20349.chat.gameforge.horse_summon._50_npcChat with horse.get_grade()==2 and pc.countitem("50052")<1 begin
			say_title(gameforge.horse_exchange_ticket._20_sayTitle)
			say(gameforge.horse_summon._60_say)
			local b= select(gameforge.find_squareguard._50_select, gameforge.find_brother_article._100_select)
			if 1==b then
				if pc.money>=50000 then
					pc.changemoney(-50000)
					say_title(gameforge.horse_exchange_ticket._20_sayTitle)
					say(gameforge.horse_summon._70_say)
					pc.give_item2("50052", 1)
				else
					say(gameforge.horse_summon._80_say)
				end
			elseif 2==b then
				return
			else
				say(string.format(gameforge.find_squareguard._70_say, b))
			end
		end
		when 20349.chat.gameforge.horse_summon._90_npcChat with horse.get_grade()==3 and pc.countitem("50053")<1 begin
			say_title(gameforge.horse_exchange_ticket._20_sayTitle)
			say(gameforge.horse_summon._100_say)
			local b= select(gameforge.find_squareguard._50_select, gameforge.find_brother_article._100_select)
			if 1==b then
				if pc.money>=100000 then
					pc.changemoney(-100000)
					say_title(gameforge.buy_fishrod._210_sayTitle)
					say(gameforge.horse_summon._110_say)
					pc.give_item2("50053", 1)
				else
					say_title(gameforge.horse_exchange_ticket._20_sayTitle)
					say(gameforge.horse_summon._80_say)
				end
			elseif 2==b then
				return
			else
				say(string.format(gameforge.find_squareguard._70_say, b))
			end
		end
		when 50051.use with horse.get_grade()==0 begin
			say_title(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._120_say)
		end
		when 50051.use with horse.get_grade()==1 begin
			if pc.get_map_index() >= 1100000 and pc.get_map_index() <= 1105000 or
				pc.get_map_index() >= 1110000 and pc.get_map_index() <= 1115000 then
				syschat("Du kannst in einem Gildenkrieg kein Pferd rufen.")
				return
			end
			if pc.getsp()>=100 then
				if number(1, 100)<=horse_summon.get_horse_summon_prob_pct() then
					horse.set_appearance(horse.get_appearance())
					chat("Pferd erfolgreich gerufen! (Pferd Level: "..horse.get_level()..")")
					if horse.get_appearance() != 0 then
						horse.summon()
					else
						if horse.get_appearance() == 50506 then
							horse.set_appearance(pc.getqf("safe_horse_before"))
							horse.summon()
						else
							horse.summon()
						end
					end
				else
					chat("Es hat nicht funktioniert, das Anfängerpferd konnte nicht gerufen werden.")
				end
				pc.change_sp(-100)
			else
				chat("Deine mentale Kraft reicht nicht aus.")
			end
		end
		when 50051.use with horse.get_grade()==2 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._160_sayReward)
		end
		when 50051.use with horse.get_grade()==3 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._170_sayReward)
		end
		when 50052.use with horse.get_grade()==0 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._180_sayReward)
		end
		when 50052.use with horse.get_grade()==1 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._190_sayReward)
		end
		when 50052.use with horse.get_grade()==2 begin
			if pc.get_map_index() >= 1100000 and pc.get_map_index() <= 1105000 or
				pc.get_map_index() >= 1110000 and pc.get_map_index() <= 1115000 then
				syschat("Du kannst in einem Gildenkrieg kein Pferd rufen.")
				return
			end
			if pc.getsp()>=200 then
				if number(1, 100)<=horse_summon.get_horse_summon_prob_pct() then
					chat("Pferd erfolgreich gerufen! (Pferd Level: "..horse.get_level()..")")
					if horse.get_appearance() != 0 then
						horse.summon()
					else
						if horse.get_appearance() == 50506 then
							horse.set_appearance(pc.getqf("safe_horse_before"))
							horse.summon()
						else
							horse.summon()
						end
					end
				else
					chat("Es hat nicht funktioniert, das Kampfpferd konnte nicht gerufen werden.")
				end
				pc.change_sp(-200)
			else
				chat("Deine mentale Kraft reicht nicht aus.")
			end
		end
		when 50052.use with horse.get_grade()==3 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._230_sayReward)
		end
		when 50053.use with horse.get_grade()==0 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._240_sayReward)
		end
		when 50053.use with horse.get_grade()==1 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._190_sayReward)
		end
		when 50053.use with horse.get_grade()==2 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._250_sayReward)
		end
		when 50053.use with horse.get_grade()==3 begin
			if pc.get_map_index() >= 1100000 and pc.get_map_index() <= 1300000 then
				syschat("Du kannst in einem Gildenkrieg kein Pferd rufen.")
				return
			end
			if pc.getsp()>=300 then
				if number(1, 100)<=horse_summon.get_horse_summon_prob_pct() then
					chat("Pferd erfolgreich gerufen! (Pferd Level: "..horse.get_level()..")")
					if horse.get_appearance() != 0 then
						horse.summon()
					else
						if horse.get_appearance() == 50506 then
							horse.set_appearance(pc.getqf("safe_horse_before"))
							horse.summon()
						else
							horse.summon()
						end
					end
				else
					chat("Es hat nicht funktioniert, das Militärpferd konnte nicht gerufen werden.")
				end
				pc.change_sp(-300)
			else
				chat("Deine mentale Kraft reicht nicht aus.")
			end
		end
	
		when 50053.use with horse.get_grade()==4 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._230_sayReward)
		end
		when 50069.use with horse.get_grade()==1 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._240_sayReward)
		end
		when 50069.use with horse.get_grade()==2 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._190_sayReward)
		end
		when 50069.use with horse.get_level()<30 begin
			say(gameforge.buy_fishrod._210_sayTitle)
			say(gameforge.horse_summon._250_sayReward)
		end
		when 50069.use with horse.get_level()==30 begin
			if pc.get_map_index() >= 1100000 and pc.get_map_index() <= 1300000 then
				syschat("Du kannst in einem Gildenkrieg kein Pferd rufen.")
				return
			end
			if pc.getsp()>=500 then
				if number(1, 100)<=horse_summon.get_horse_summon_prob_pct() then
					chat("Pferd erfolgreich gerufen! (Pferd Level: "..horse.get_level()..")")
					if horse.get_appearance() == 0 then
						horse.summon(false, item.get_value(5))
					else
						if horse.get_appearance() == 50506 then
							horse.set_appearance(pc.getqf("safe_horse_before"))
							horse.summon()
						else
							horse.summon()
						end
					end
				else
					chat("Es hat nicht funktioniert, das Schlachtross konnte nicht gerufen werden.")
				end
				pc.change_sp(-500)
			else
				chat("Deine mentale Kraft reicht nicht aus.")
			end
		end
	
		when 50083.use begin
			if pc.get_map_index() >= 1100000 and pc.get_map_index() <= 1300000 then
				syschat("Du kannst in einem Gildenkrieg kein Pferd rufen.")
				return
			else
				if horse.get_appearance() != 0 then
					if horse.get_appearance() != 50506 then
						pc.setqf("safe_horse_before", horse.get_appearance())
						horse.set_appearance(item.get_value(5))
						horse.summon()
					else
						horse.summon()
					end
				else
					horse.summon(false, item.get_value(5))
				end
			end
		end
	end
	
	state __COMPLETE__ begin
		when enter begin
			q.done()
		end
	end
end

