quest refine_item_information begin
	state start begin
		when refine with item.get_level() == 9 begin
			notice_all(string.format("%s %s |cffa7ffd4hat erfolgreich|r %s |cffa7ffd4hergestellt!|r", tag(SERVER_COLOR, "[Server]"), clickable_pn_tag(NAME_COLOR, pc.get_name()), clickable_item_tag(ITEM_COLOR)))
		end
	end
end