quest upgrade_refine_scroll begin
    state start begin
		when 20016.chat."Schriftrolle des Krieges" begin
			say_title("Schmied")
			say("Die Schriftrolle des Krieges hat die")
			say("Kraft Gegenstände von +0 bis +4")
			say("mit 100% Chance zu verbessern.")
			say("")
			say("Um eine herzustellen brauchst du:")				
			say_item("Magisches Kupfererz", 70035, "")
			say_item("Segensschriftrolle", 25040, "")
			wait()
			say_title("Schmied")
			if pc.count_item(70035)==0 then				
				say("Du besitzt kein Magisches Kupfererz")
				return	
			end
			if pc.count_item(25040)==0 then				
				say("Du besitzt keine Segensschriftrolle")
				return					
			end	    
			say("Möchtest du eine Schriftrolle des Krieges")
			say("herstellen?")
			say_reward("Es kostet 200.000 Yang.")
			local s=select("Ja", "Nein")
			if s==2 then
				return
			end
			say_title("Schmied")
			if pc.count_item(70035)==0 then				
				return	
			end
			if pc.count_item(25040)==0 then
				return					
			end	 
			if pc.get_gold() < 200000 then
				say("Du hast nicht genügend Yang.")
				return
			end
			say("Glückwunsch, du hast eine Schriftrolle")
			say("des Krieges hergestellt!")
			say_item("Schriftrolle des Krieges", 71021, "")
			pc.remove_item(70035)
			pc.remove_item(25040)
			pc.changegold(-200000)
			pc.give_item2(71021)			
	    end
		when 20016.chat."Schriftrolle des Drachen" begin
			say_title("Schmied")
			say("Die Schriftrolle des Drachen hat die")
			say("Kraft Gegenstände mit höherer Erfolgschance")
			say("zu verbessern.")
			say("")
			say("Um eine herzustellen brauchst du:")				
			say_item("Magisches Eisenerz", 71026, "")
			say_item("Segensschriftrolle", 25040, "")
			wait()
			say_title("Schmied")
			if pc.count_item(71026)==0 then				
				say("Du besitzt kein Magisches Eisenerz.")
				return	
			end
			if pc.count_item(25040)==0 then				
				say("Du besitzt keine Segensschriftrolle.")
				return					
			end	    
			say("Möchtest du eine Schriftrolle des Drachen")
			say("herstellen?")
			say_reward("Es kostet 500.000 Yang.")
			local s=select("Ja", "Nein")
			if s==2 then
				return
			end
			say_title("Schmied")
			if pc.count_item(71026)==0 then				
				return	
			end
			if pc.count_item(25040)==0 then
				return					
			end	 
			if pc.get_gold() < 500000 then
				say("Du hast nicht genügend Yang.")
				return
			end
			say("Glückwunsch, du hast eine Schriftrolle")
			say("des Drachen hergestellt!")
			say_item("Schriftrolle des Drachen", 71032, "")
			pc.remove_item(71026)
			pc.remove_item(25040)
			pc.changegold(-500000)
			pc.give_item2(71032)			
	    end	
		when 20016.chat."Schmiede-Handbuch" begin
			say_title("Schmied")
			say("Das Schmiede-Handbuch hat die Kraft")
			say("Gegenstände mit noch höherer Erfolgschance")
			say("zu verbessern.")
			say("")
			say("Um eine herzustellen brauchst du:")				
			say_item("Stein des Schmieds", 71025, "")
			say_item("Segensschriftrolle", 25040, "")
			wait()
			say_title("Schmied")
			if pc.count_item(71025)==0 then				
				say("Du besitzt kein Stein des Schmieds.")
				return	
			end
			if pc.count_item(25040)==0 then				
				say("Du besitzt keine Segensschriftrolle.")
				return					
			end	    
			say("Möchtest du ein Schmiede-Handbuch")
			say("herstellen?")
			say_reward("Es kostet 1.000.000 Yang.")
			local s=select("Ja", "Nein")
			if s==2 then
				return
			end
			say_title("Schmied")
			if pc.count_item(71025)==0 then				
				return
			end
			if pc.count_item(25040)==0 then
				return					
			end	 
			if pc.get_gold() < 1000000 then
				say("Du hast nicht genügend Yang.")
				return
			end
			say("Glückwunsch, du hast ein Schmiede-Handbuch")
			say("hergestellt!")
			say_item("Schmiede-Handbuch", 70039, "")
			pc.remove_item(71025)
			pc.remove_item(25040)
			pc.changegold(-1000000)
			pc.give_item2(70039)			
	    end	
    end
end

