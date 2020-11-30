quest horse_appearance begin
	state start begin
		when 20349.chat."Pferd ändern" begin
			say_title("Stallbursche:")
			say("")
			say("Welches Pferd möchtest du haben?")
			local s = select("Standard", "Weißes Pferd", "Braunes Pferd", "Schwarzes Pferd", "Abbrechen")
			if s==1 then
				horse.unride()
				horse.unsummon()
				horse.set_appearance(0)
				pc.setf("horse_color", "color", 0)
				horse.summon()
				return
			elseif s==2 then
				horse.unride()
				horse.unsummon()
				pc.setf("horse_color", "color", 1)
			elseif s==3 then
				horse.unride()
				horse.unsummon()
				pc.setf("horse_color", "color", 2)
			elseif s==4 then
				horse.unride()
				horse.unsummon()
				pc.setf("horse_color", "color", 3)
			else
				return
			end
			if pc.getf("horse_color", "color") == 1 then
				if horse.get_level() <= 10 then
					horse.set_appearance(20101)
				elseif horse.get_level() >= 11 and horse.get_level() <= 20 then
					horse.set_appearance(20104)
				elseif horse.get_level() >= 21 and horse.get_level() <= 29 then
					horse.set_appearance(20107)
				elseif horse.get_level() == 30 then
					if horse.get_appearance() >= 20113 and horse.get_appearance() <= 20121 then
						if pc.get_empire() == 1 then
							horse.set_appearance(20113)
						elseif pc.get_empire() == 2 then
							horse.set_appearance(20116)
						elseif pc.get_empire() == 3 then
							horse.set_appearance(20119)
						end
					else
						horse.set_appearance(20110)
					end
				end
			elseif pc.getf("horse_color", "color") == 2 then
				if horse.get_level() <= 10 then
					horse.set_appearance(20102)
				elseif horse.get_level() >= 11 and horse.get_level() <= 20 then
					horse.set_appearance(20105)
				elseif horse.get_level() >= 21 and horse.get_level() <= 29 then
					horse.set_appearance(20108)
				elseif horse.get_level() == 30 then
					if horse.get_appearance() >= 20113 and horse.get_appearance() <= 20121 then
						if pc.get_empire() == 1 then
							horse.set_appearance(20114)
						elseif pc.get_empire() == 2 then
							horse.set_appearance(20117)
						elseif pc.get_empire() == 3 then
							horse.set_appearance(20120)
						end
					else	
						horse.set_appearance(20111)
					end
				end
			elseif pc.getf("horse_color", "color") == 3 then
				if horse.get_level() <= 10 then
					horse.set_appearance(20103)
				elseif horse.get_level() >= 11 and horse.get_level() <= 20 then
					horse.set_appearance(20106)
				elseif horse.get_level() >= 21 and horse.get_level() <= 29 then
					horse.set_appearance(20109)
				elseif horse.get_level() == 30 then
					if horse.get_appearance() >= 20113 and horse.get_appearance() <= 20121 then
						if pc.get_empire() == 1 then
							horse.set_appearance(20115)
						elseif pc.get_empire() == 2 then
							horse.set_appearance(20118)
						elseif pc.get_empire() == 3 then
							horse.set_appearance(20121)
						end
					else
						horse.set_appearance(20112)
					end
				end
			end
			horse.summon()
		end
	end
end