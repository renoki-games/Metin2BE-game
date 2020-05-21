quest info begin
	state start begin
		when 20095.chat."Server Informationen" begin
			say_title("Server Informationen:")
			say("_______________________________________________")
			say("Wir suchen immer nach guten Ideen.")
			say("Falls es jemandem gelingt gute Ideen zu finden,")
			say("kriegt diese Person eine angemessene Belohnung.")
			say("")
		end
		when 20095.chat."Teamler Liste" begin
			say_title("Teamler Liste:")
			say("__________")
			say_cyan("(SA)Goku")
			say_red("(DEV)Lead")
			say_orange("(GA)Dome")
			say("")
		end
		when 20095.chat."Teamler F‰higkeiten" begin
			say_title("Teamler F‰higkeiten:")
			say("________________________________________________")
			say_cyan("(SA)Goku:") 
			say("Clientmodder, Designer, Techniker")
			say("")
			say_red("(DEV)Lead")
			say("Clientmodder, Techniker, Developer")
			say_orange("(GA)Dome")
			say("Was weiﬂ ich")
			say("")
		end
		when 20095.chat."Spiel Informationen" begin
			say_title("Spiel Bonus:")
			say("_______________________________________")
			say("Bonus Erfahrungspunkte in der Woche 100%")
			say("Bonus Erfahrungspunkte am Wochenende 100%")
			say("Bonus Erfahrungspunkte am Event 100%")
			say("_______________________________________")
			say("Bonus Yangdroprate in der Woche 100%")
			say("Bonus Yangdroprate am Wochenende 100%")
			say("Bonus Yangdroprate am Event 100%")
			say("_______________________________________")
			say("Bonus Yangbomben in der Woche 100%")
			say("Bonus Yangbomben am Wochenende 100%")
			say("Bonus Yangbomben am Event 100%")
			say("")
		end
		when 20095.chat."Behobene Fehler" begin
			say_title("Behobene Fehler:")
			say("_______________________________________________")
			say("Es gibt bis jetzt keine gefundene Fehler.")
			say("Jeder der einen Fehler findet egal welcher Art,")
			say("kriegt eine angemessene Belohnung.")
			say("")
		end
	end
end  