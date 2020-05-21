quest warpring begin
	state start begin
		when button or 9012.chat."Teleportieren" begin
			local warp = {--koord Pflicht, rest optional!
				{
					name = "Map 1",
					{
						name = "Shinsoo",
						koord = {469234, 964236},
					},
					{
						name = "Chunjo",
						koord = {55743, 157929},
					},
					{
						name = "Jinno",
						koord = {969479, 278446},
					},
				},
				{
					name = "Map 2",
					{
						name = "Shinsoo",
						koord = {353028, 882735},
					},
					{
						name = "Chunjo",
						koord = {145521, 239832},
					},
					{
						name = "Jinno",
						koord = {864090, 245922},
					},
				},
				{
					name = "Orktal",
					{
						name = "Anfang",
						koord = {
									{402100, 673900},
									{270400, 739900},
									{321300, 808000},
								},
						empire_specific = true,
					},
					{
						name = "Mitte",
						koord = {332800, 745600},
					},
				},
				{
					name = "Wüste",
					{
						name = "Anfang",
						koord = {
									{217800, 627200},
									{221900, 502700},
									{344000, 502500},
								},
						empire_specific = true,
					},
					{
						name = "Mitte",
						koord = {296800, 547100},
					},
				},
				{
					name = "Eisland",
					{
						name = "Anfang",
						koord = {
									{434200, 290600},
									{375200, 174900},
									{491800, 173600},
								},
						empire_specific = true,
					},
					{
						name = "Mitte",
						koord = {436500, 215400},
					},
				},
				{
					name = "Feuerland",
					{
						name = "Anfang",
						koord = {
									{599400, 756300},
									{597800, 622200},
									{730700, 689800},
								},
						empire_specific = true,
					},
					{
						name = "Mitte",
						koord = {600800, 687100},
					},
				},
				{
					name = "Dämonenturm",
					koord = {590482, 110582},
				},
				{
					name = "Devil's Catacomb",
					koord = {591818, 100316},
				},
				{
					name = "Grotte der Verbannung",
					koord = {284191, 808909},
				},
				{
					name = "Spinnendungeon",
					koord = {92404, 525296},
				},
				{
					name = "Geisterwald",
					{
						name = "Anfang",
						koord = {291303, 5626},
					},
					{
						name = "Mitte",
						koord = {303350, 27325},
					},
				},
				{
					name = "Roter Wald",
					{
						name = "Anfang",
						koord = {1119900, 70800},
					},
					{
						name = "Ende",
						koord = {1119100, 7700},
					},
				},
				{
					name = "Land der Riesen",
					koord = {819200, 716800},
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

			local x, y = 0
			if tbl.empire_specific then
				x, y = tbl.koord[pc.get_empire()][1], tbl.koord[pc.get_empire()][2]
			else
				x, y = tbl.koord[1], tbl.koord[2]
			end

			pc.warp(x, y)
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