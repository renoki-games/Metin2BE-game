define VOUCHER_100 80014
define VOUCHER_500 80015
define VOUCHER_1000 80016
define VOUCHER_50 80017

quest item_dr_voucher begin
	state start begin
		when VOUCHER_100.use or VOUCHER_500.use or VOUCHER_1000.use or VOUCHER_50.use begin
			local itemVnum = item.vnum

			printQuestHeader("DR-Gutschein:")
			say_item_vnum(item.get_vnum())
			say("")
			sayQuestText(string.format("Möchtest du diesen Gutschein für %s DR einlösen?", (item_dr_voucher.dr_table[itemVnum])))

			local s = select("Einlösen", "Abbrechen")
			if s == 2 then return end

			local dr = item_dr_voucher.dr_table[itemVnum]
			item_dr_voucher.giveDR(dr)
			item.remove()
		end
	end

	state __FUNCTIONS__ begin
		function giveDR(dr)
			mysql_query(string.format("UPDATE account.account SET DR = DR + %d WHERE id = %d", dr, pc.get_account_id()))
		end

		function dr_table()
			return {
				[VOUCHER_100] = 100,
				[VOUCHER_500] = 500,
				[VOUCHER_1000] = 1000,
				[VOUCHER_50] = 50,
			}
		end
	end
end