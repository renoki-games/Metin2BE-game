quest refine_item_information begin
	state start begin
		when refine with item.get_level() == 9 begin
			chat(string.format("%s %s |cffa7ffd4hat erfolgreich %s geuppt!|r", tag(SERVER_COLOR, "[Server]"), clickable_pn_tag(NAME_COLOR, pc.get_name()), clickable_item_tag(ITEM_COLOR, item.get_vnum(), item.get_name())))
		end
	end
end