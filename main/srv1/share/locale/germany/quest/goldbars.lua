quest goldbars begin
	state start begin
		when 80003.use or 80004.use or 80005.use or 80006.use or 80007.use begin
			local barrenInfo = {
				[80003] = 50000000,
				[80004] = 100000000,
				[80005] = 250000000,
				[80006] = 500000000,
				[80007] = 1000000000,
			}

			local iVnum = item.vnum

			if pc.get_money() + barrenInfo[iVnum] >= GOLD_MAX or pc.get_money() + barrenInfo[iVnum] < 0 then
				syschat("Du trägst zuviel Yang bei dir.")
				return
			end

			pc.remove_item(item.get_vnum(), 1)
			pc.change_gold(barrenInfo[iVnum])
		end
	end
end