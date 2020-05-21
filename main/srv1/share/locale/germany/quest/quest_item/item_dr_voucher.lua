quest item_dr_voucher begin
	state start begin
		when 80014.use or 80015.use or 80016.use or 80017.use begin
			local dr_table = {
				[80014] = 100,
				[80015] = 500,
				[80016] = 1000,
				[80017] = 50,
			}

			local iVnum = item.vnum
			
			say_title("DR-Gutschein:")
			say("")
			say_item_vnum(item.get_vnum())
			say("")
			say(string.format("Möchtest du diesen Gutschein für %sDR einlösen?", (dr_table[iVnum])))
			say("")
			local sel = select("Einlösen", "Abbrechen")

			if sel == 1 then
				pc.remove_item(item.get_vnum(), 1)
				pc.give_dr(dr_table[iVnum])
			else
				return
			end
		end
	end
end