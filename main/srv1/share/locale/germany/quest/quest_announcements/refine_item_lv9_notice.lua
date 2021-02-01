define MAX_REFINE 9

quest refine_item_information begin
	state start begin
		when refine with item.get_level() == MAX_REFINE begin
			notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. clickable_pn_tag(NAME_COLOR, pc.get_name()) .. " " .. tag(TEXT_COLOR, string.format("hat soeben %s", clickable_item_tag(ITEM_COLOR) .. " " .. tag(TEXT_COLOR, "erfolgreich verbessert!"))))
		end
	end
end