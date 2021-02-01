define MAX_LEVEL 100

quest level_info begin
	state start begin
		when levelup with pc.get_level() == MAX_LEVEL begin
			notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. clickable_pn_tag(NAME_COLOR, pc.get_name()) .. " " .. tag(TEXT_COLOR, string.format("hat das maximale Level %d erreicht, Glückwunsch!", MAX_LEVEL)))
			complete_quest()
		end
	end
	state __COMPLETE__ begin
	end
end