quest npcs_hair_shop begin 
	state start begin 
		when 20094.chat."Krieger Frisuren" begin
			local sel1 = select("Männlich", "Weiblich")
			if sel1 == 1 then
				setskin(NOWINDOW)
				npc.open_shop(20)
				return
			else
				setskin(NOWINDOW)
				npc.open_shop(21)
				return
			end
		end 
		
		when 20094.chat."Ninja Frisuren" begin
			local sel2 = select("Männlich", "Weiblich")
			if sel2 == 1 then
				setskin(NOWINDOW)
				npc.open_shop(22)
				return
			else
				setskin(NOWINDOW)
				npc.open_shop(23)
				return
			end
		end 
		
		when 20094.chat."Sura Frisuren" begin
			local sel3 = select("Männlich", "Weiblich")
			if sel3 == 1 then
				setskin(NOWINDOW)
				npc.open_shop(24)
				return
			else
				setskin(NOWINDOW)
				npc.open_shop(25)
				return
			end
		end
		
		when 20094.chat."Schamanen Frisuren" begin
			local sel4 = select("Männlich", "Weiblich")
			if sel4 == 1 then
				setskin(NOWINDOW)
				npc.open_shop(26)
				return
			else
				setskin(NOWINDOW)
				npc.open_shop(27)
				return
			end
		end  
	end 
end  