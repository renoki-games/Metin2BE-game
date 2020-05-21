quest warp_sd begin
	state start begin
		when 20088.chat.gameforge.check_trans_ticket._10_npcChat with pc.get_map_index()==75 begin
			say_title(gameforge.check_trans_ticket._15_sayTitle)
			say(gameforge.check_trans_ticket._20_say)
			wait()
			if pc.count_item(71095) > 0 then
				say_title(gameforge.check_trans_ticket._15_sayTitle)
				say(gameforge.check_trans_ticket._30_say)
				wait()
				if false == pc.can_warp() then
					say(gameforge.check_trans_ticket._160_say)
					return
				end
				if pc.count_item(71095) + pc.count_item(71130) > 0 then
					if select("Eintreten", "Ablehnen") == 2 then return end
					pc.remove_item(71095, 1)
					pc.warp(704100, 464100)
				else
					return
				end
			else
				say_title(gameforge.check_trans_ticket._15_sayTitle)
				say(gameforge.check_trans_ticket._40_say)
				say_item_vnum(71095)
				wait()
			end	
		end
		
	end
end