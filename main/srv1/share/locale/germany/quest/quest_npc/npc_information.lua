quest info begin
	state start begin
		when 20095.chat."Server Informationen" begin
			say_title("Server Informationen:")
			say("____________________________________________________")
			say("Wir suchen immer nach guten Ideen für unseren Server.")
			say("____________________________________________________")
		end
		when 20095.chat."Teamler Liste" begin
			say_title("Teamler Liste:")
			say("__________")
			say_cyan("(SA)Goku")
			say("__________")
			say_red("(DEV)Lead")
			say("__________")
			say_orange("(GA)Dome")
			say("")
		end
		when 20095.chat."Teamler Fähigkeiten" begin
			say_title("Teamler Fähigkeiten:")
			say("_________________________________")
			say_cyan("(SA)Goku:") 
			say("Designer, Clientmodder, Techniker")
			say("_________________________________")
			say_red("(DEV)Lead")
			say("Techniker, Clientmodder")
			say("_________________________________")
			say_orange("(GA)Dome")
			say("Was weiß ich")
			say("_________________________________")
		end
		when 20095.chat."Spiel Informationen" begin
			say_title("Spiel Boni:")
			say("___________________________________________")
			say("Bonus Erfahrungspunkte in der Woche 0%")
			say("Bonus Erfahrungspunkte am Wochenende 0%")
			say("Bonus Erfahrungspunkte am Event 0%")
			say("___________________________________________")
			say("Bonus Yangdroprate in der Woche 0%")
			say("Bonus Yangdroprate am Wochenende 0%")
			say("Bonus Yangdroprate am Event 0%")
			say("___________________________________________")
			say("Bonus Yangbomben in der Woche 0%")
			say("Bonus Yangbomben am Wochenende 0%")
			say("Bonus Yangbomben am Event 0%")
			say("___________________________________________")
		end
		when 20095.chat."Behobene Fehler" begin
			say_title("Behobene Fehler:")
			say("_____________________________________")
			say("Es gibt bis jetzt keine gefundene Fehler.")
			say("_____________________________________")
		end
	end
end  