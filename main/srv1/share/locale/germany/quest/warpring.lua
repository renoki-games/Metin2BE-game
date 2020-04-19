quest warpring begin
	state start begin
		when button begin
			local warp = {--koord Pflicht, rest optional!
				{--Map1
					name = "Map 1",
					{--Rotes Reich
						name = "Rotes Reich",
						koord = {965784, 275242},
						minlevel = 50,
						maxlevel = 80,
						itemneed = {
							{189, 1}
						},
						goldneed = 10000
					},
					{--Gelbes Reich
						name = "Gelbes Reich",
						koord = {965784, 275242},
						minlevel = 10,
						maxlevel = 105,
						itemneed = {
							{189, 1}
						},
						goldneed = 10000
					},
					{--Blaues Reich
						name = "Blaues Reich",
						koord = {965784, 275242},
						minlevel = 1,
						maxlevel = 105,
						itemneed = {
							{189, 1}
						},
						goldneed = 10000
					},
				},
				{--Map2
					name = "Map 2",
					{--Rotes Reich
						name = "Rotes Reich",
						koord = {965784, 275242},
						minlevel = 1,
						maxlevel = 30,
						itemneed = {
							{189, 1}
						},
						goldneed = 10000
					},
					{--Gelbes Reich
						name = "Gelbes Reich",
						koord = {965784, 275242},
						minlevel = 1,
						maxlevel = 105,
						itemneed = {
							{189, 1}
						},
						goldneed = 10000
					},
					{--Blaues Reich
						name = "Blaues Reich",
						koord = {965784, 275242},
						minlevel = 1,
						maxlevel = 105,
						itemneed = {
							{189, 1}
						},
						goldneed = 10000
					},
				},
			}
			warpring.showwarps(warp)
		end
		function warp(tbl)
			local level = pc.get_level()
			if tbl.minlevel and level < tbl.minlevel then
				say("Dein Level ist zu niedrig, um diese Map zu betreten.")
				say("Minimal Level: "..tbl.minlevel)
				select("Abbrechen")
				return
			elseif tbl.maxlevel  and level > tbl.maxlevel then
				say("Dein Level ist zu hoch, um diese Map zu betreten.")
				say("Maximal Level: "..tbl.maxlevel)
				select("Abbrechen")
				return
			end
			while not pc.can_warp() do
				say("Du kannst dich noch nicht teleportieren, da du in")
				say("den letzten 10 Sekunden gehandelt hast.")
				if select("Erneut versuchen", "Abbrechen") == 2 then return end
			end
			local warpneedstrings = warpring.get_warpneedstrings(tbl)
			if table.getn(warpneedstrings) > 0 then
				say("Um diese Map zu betreten benötigst du folgende")
				say("Dinge:")
				for _,v in ipairs(warpneedstrings) do
					say(v)
				end
				say("")
				say("Möchtest du trotzdem fortfahren?")
				if select("Teleportieren", "Abbrechen") == 2 then return end
			end
			if not warpring.check_and_remove_warpneeds(tbl) then
				say("Dir fehlt mindestens eins der benötigten Dinge.")
				select("Abbrechen")
				return
			end
			pc.warp(tbl.koord[1], tbl.koord[2])
		end
		function get_warpneedstrings(tbl)
			local warpneeds = {}
			if tbl.itemneed and table.getn(tbl.itemneed) > 0 then
				for _,v in ipairs(tbl.itemneed) do
					table.insert(warpneeds, "- "..v[2].."x "..item_name(v[1]))
				end
			end
			if tbl.goldneed and tbl.goldneed > 0 then
				table.insert(warpneeds, "- "..tbl.goldneed.." Yang")
			end
			return warpneeds
		end
		function check_warpneeds(tbl)
			if tbl.itemneed and table.getn(tbl.itemneed) > 0 then
				for _,v in ipairs(tbl.itemneed) do
					if pc.count_item(v[1]) < v[2] then
						return false
					end
				end
			end
			if tbl.goldneed and tbl.goldneed > 0 then
				if pc.get_gold() < tbl.goldneed then
					return false
				end
			end
			return true
		end
		function remove_warpneeds(tbl)
			if tbl.itemneed and table.getn(tbl.itemneed) > 0 then
				for _,v in ipairs(tbl.itemneed) do
					pc.remove_item(v[1], v[2])
				end
			end
			if tbl.goldneed and tbl.goldneed > 0 then
				pc.change_gold(-tbl.goldneed)
			end
		end
		function check_and_remove_warpneeds(tbl)
			if not warpring.check_warpneeds(tbl) then
				return false
			end
			warpring.remove_warpneeds(tbl)
			return true
		end
		function get_warpnames(tbl)
			local level = pc.get_level()
			local names = {}
			for _,v in ipairs(tbl) do
				if v.minlevel and level < v.minlevel then
					v.name = v.name.." (ab Lv. "..v.minlevel..")"
				elseif v.maxlevel  and level > v.maxlevel then
					v.name = v.name.." (bis Lv. "..v.maxlevel..")"
				end
				table.insert(names, v.name)
			end
			return names
		end
		function showwarps(tbl)
			local warpnames = warpring.get_warpnames(tbl)
			local s = tbl[select3(warpnames)] or false
			if not s then return end
			if s.koord then
				warpring.warp(s)
				return
			end
			warpring.showwarps(s)
		end
	end
end