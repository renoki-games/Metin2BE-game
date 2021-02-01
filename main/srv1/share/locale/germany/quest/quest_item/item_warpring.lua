define QUEST_NPC 9012

quest warpring begin
	state start begin
		when button or QUEST_NPC.chat."Teleportieren" begin
			printQuestHeader("Teleportation:")
			say("Wohin möchtest du teleportiert werden?")

			local warptab = {
				["Reiche"] = {
					["subs"] = {
						["Stadt"] = {
							["subs"] = {
								["Shinsoo"] = {["x"] = 4693, ["y"] = 9642},
								["Chunjo"] = {["x"] = 557, ["y"] = 1579},
								["Jinno"] = {["x"] = 9696, ["y"] = 2784},
							},
						},
						["Dorf"] = {
							["subs"] = {
								["Shinsoo"] = {["x"] = 3531, ["y"] = 8829},
								["Chunjo"] = {["x"] = 1455, ["y"] = 2400},
								["Jinno"] = {["x"] = 8639, ["y"] = 2460},
							},
						},
						["Gildenland#1"] = {["x"] = 1354, ["y"] = 55, ["empire"] = 1},
						["Gildenland#2"] = {["x"] = 2217, ["y"] = 103, ["empire"] = 2},
						["Gildenland#3"] = {["x"] = 2711, ["y"] = 129, ["empire"] = 3},
					},
				},

				["Karten"] = {
					["subs"] = {
						["Anfänger Gebiete"] = {
							["subs"] = {
								["Tal von Seungryong"] = {
									["subs"] = {
										["Anfang#1"] = {["x"] = 4021, ["y"] = 6739, ["empire"] = 1},
										["Anfang#2"] = {["x"] = 2704, ["y"] = 7399, ["empire"] = 2},
										["Anfang#3"] = {["x"] = 3213, ["y"] = 8080, ["empire"] = 3},
										["Mitte"] = {["x"] = 3328, ["y"] = 7460},
									},
								},
								["Yongbi-Wüste"] = {
									["subs"] = {
										["Anfang#1"] = {["x"] = 2178, ["y"] = 6272, ["empire"] = 1},
										["Anfang#2"] = {["x"] = 2219, ["y"] = 5027, ["empire"] = 2},
										["Anfang#3"] = {["x"] = 3440, ["y"] = 5025, ["empire"] = 3},
										["Mitte"] = {["x"] = 2968, ["y"] = 5471},
									},
								},
							},
						},

						["Fortgeschrittene Gebiete"] = {
							["subs"] = {
								["Berg Sohan"] = {
									["subs"] = {
										["Anfang#1"] = {["x"] = 4342, ["y"] = 2906, ["empire"] = 1},
										["Anfang#2"] = {["x"] = 3752, ["y"] = 1749, ["empire"] = 2},
										["Anfang#3"] = {["x"] = 4918, ["y"] = 1736, ["empire"] = 3},
										["Mitte"] = {["x"] = 4365, ["y"] = 2154},
									},
								},
								["Doyyumhwan"] = {
									["subs"] = {
										["Anfang#1"] = {["x"] = 5994, ["y"] = 7563, ["empire"] = 1},
										["Anfang#2"] = {["x"] = 5978, ["y"] = 6222, ["empire"] = 2},
										["Anfang#3"] = {["x"] = 7307, ["y"] = 6898, ["empire"] = 3},
										["Mitte"] = {["x"] = 6008, ["y"] = 6871},
									},
								},
								["Lungsam"] = {
									["subs"] = {
										["Anfang"] = {["x"] = 2930, ["y"] = 56},
										["Mitte"] = {["x"] = 3032, ["y"] = 274},
									},
								},
							},
						},

						["Experten Gebiete"] = {
							["subs"] = {
								["Roter Wald"] = {
									["subs"] = {
										["Anfang"] = {["x"] = 11199, ["y"] = 708},
										["Ende"] = {["x"] = 11196, ["y"] = 43},
									},
								},
								["Land der Riesen"] = {["x"] = 8292, ["y"] = 7636},
								["Grotte der Verbannung"] = {["x"] = 2841, ["y"] = 8089},
							},
						},
					},
				},

				["Dungeons"] = {
					["subs"] = {
						["Affendungeons"] = {
							["subs"] = {
								["Hasun Dong#1"] = {["x"] = 4054, ["y"] = 8756, ["empire"] = 1},
								["Hasun Dong#2"] = {["x"] = 1607, ["y"] = 2137, ["empire"] = 2},
								["Hasun Dong#3"] = {["x"] = 8727, ["y"] = 2107, ["empire"] = 3},
								["Jungsun Dong"] = {["x"] = 3062, ["y"] = 6203},
								["Sangsun Dong"] = {["x"] = 2880, ["y"] = 5408},
							},
						},
						["Dämonenturm"] = {["x"] = 5906, ["y"] = 1103},
						["Devil's Catacomb"] = {["x"] = 5919, ["y"] = 1000},
						["Kuahlo Dong"] = {["x"] = 3444, ["y"] = 6289},
					},
				},
			}

			local wp = {}
			local function create_list(nm,index)
				table.foreach((index or warptab),
					function(i,l)
						local x = (nm or '')..'#/'..i
						if l.subs ~= nil then
							create_list(x,l.subs)
							wp[x] = {["type"] = "kat"}
						else
							wp[x] = l
							wp[x]["type"] = "warp"
							wp[x]["kat"] = (nm or '')
						end
					end
				)
			end

			create_list()

			local function show_menu(id,kat)
				local index = id or 1

				local function count(str,del)
					local out = 0
					for i in string.gfind(str,del) do
						out = out+1
					end
					return out
				end

				local function trim(str)
					str = string.gsub(str,'.-#/','',index)
					return str
				end

				local wl,co = {
					["list"] = {},
					["data"] = {},
				}, 1

				table.sort(wp)
				table.foreach(wp,
					function(i,l)
						if count(i,'.-#/') == index then
							local function cc()
								if l.empire == nil or l.empire == pc.get_empire() then
									if l.type == "kat" then
										local str = ' '..(string.gsub(trim(i),'#%d+',''))..' '
										wl.list[co] = str
										wl.data[str] = l
										wl.data[str]["name"] = i
									else
										local str = (string.gsub(trim(i),'#%d+',''))
										wl.list[co] = str
										wl.data[str] = l
									end
									co = co+1
								end
							end

							if index == 1 then
								cc()
							elseif kat ~= nil and string.sub(i,1,string.len(kat)) == kat then
								cc()
							end
						end
					end
				)

				table.sort(wl.list)
				table.insert(wl.list, 1, 8)

				if index ~= 1 then
					table.insert(wl.list,'Zurück')
				end

				table.insert(wl.list,'Abbrechen')

				local sel = select2(wl.list)
				if sel == table.getn(wl.list) then return end

				if index ~= 1 and sel == table.getn(wl.list)-1 then
					local nextkat = function()
						local t,out = split(kat,'#/'),''
						table.foreach(t,
							function(i,l)
								if i < table.getn(t) and i > 1 then
									out = out..'#/'..l
								end
							end
						)
						return out
					end
					printQuestHeader("Teleportation:")
					say("Wohin möchtest du teleportiert werden?")

					show_menu(index-1,nextkat())
					return
				end

				if wl.data[wl.list[sel]]["type"] == "kat" then 
					printQuestHeader("Teleportation:")
					say("Wohin möchtest du teleportiert werden?")

					show_menu(index+1, wl.data[wl.list[sel]]["name"],kat or nil)
					return
				else
					pc.warp(wl.data[wl.list[sel]]["x"]*100,wl.data[wl.list[sel]]["y"]*100)
				end
			end

			show_menu()
		end
	end
end