quest warp_arena begin
	state start begin
		when 11001.chat."In die Arena" or 11003.chat."In die Arena" or 11005.chat."In die Arena" begin
			say_title("Schlachtenverwalter:")
			say("")
			say("Möchtest du in die Arena teleportiert werden?")
			say("")
			local sel_1 = select("Ja", "Nein")
			if sel_1 == 1 then
				if pc.get_map_index() == 1 then
					pc.warp(465800, 946100)
				elseif pc.get_map_index() == 21 then
					pc.warp(71700, 164500)
				elseif pc.get_map_index() == 41 then
					pc.warp(957700, 276300)
				else
					syschat("Falsche Map")
					return
				end
			else
				return
			end
		end
	end
end