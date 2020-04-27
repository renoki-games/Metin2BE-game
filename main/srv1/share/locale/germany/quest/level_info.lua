quest level_info begin
	state start begin
		when levelup begin
			if pc.level == 100 and not pc.is_gm() then
				notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. clickable_pn_tag(NAME_COLOR, pc.get_name()) .. " " .. tag(TEXT_COLOR, string.format("hat das max Lv. %d erreicht, Glückwunsch!", 100)))
			end
		end
	end
end