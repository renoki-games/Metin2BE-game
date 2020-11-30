quest kingdom_horse begin
	state start begin
		when 50065.use begin
			if horse.get_level() != 30 then
				syschat("Dein Pferdelevel muss 30 sein.")
			else
				if horse.is_riding() then
					horse.unride()
				end
				if horse.is_summon() then
					horse.unsummon()
					syschat("Du hast das Pferd weggeschickt.")
					return
				end
				if pc.get_empire() == 1 then
					if pc.getf("horse_color", "color") == 1 then
						horse.set_appearance(20113)
					elseif pc.getf("horse_color", "color") == 2 then
						horse.set_appearance(20114)
					elseif pc.getf("horse_color", "color") == 3 then
						horse.set_appearance(20115)
					else
						if pc.has_guild() and pc.is_guild_master() then
							horse.set_appearance(20115)
						elseif pc.has_guild() then
							horse.set_appearance(20114)
						else
							horse.set_appearance(20113)	
						end
					end
				elseif pc.get_empire() == 2 then
					if pc.getf("horse_color", "color") == 1 then
						horse.set_appearance(20116)
					elseif pc.getf("horse_color", "color") == 2 then
						horse.set_appearance(20117)
					elseif pc.getf("horse_color", "color") == 3 then
						horse.set_appearance(20118)
					else
						if pc.has_guild() and pc.is_guild_master() then
							horse.set_appearance(20118)
						elseif pc.has_guild() then
							horse.set_appearance(20117)
						else
							horse.set_appearance(20116)	
						end
					end
				elseif pc.get_empire() == 3 then
					if pc.getf("horse_color", "color") == 1 then
						horse.set_appearance(20119)
					elseif pc.getf("horse_color", "color") == 2 then
						horse.set_appearance(20120)
					elseif pc.getf("horse_color", "color") == 3 then
						horse.set_appearance(20121)
					else
						if pc.has_guild() and pc.is_guild_master() then
							horse.set_appearance(20121)
						elseif pc.has_guild() then
							horse.set_appearance(20120)
						else
							horse.set_appearance(20119)	
						end
					end
				else
					syschat("Error!")
				end
				horse.summon()
			end
		end
	end
end