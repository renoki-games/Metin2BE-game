quest info begin
	state start begin
		when 20095.chat."Server Informationen" begin
			say_title("Server Informationen:")
			say("____________________________________________________________")
			say("Wir suchen immer nach guten Ideen für den Server.")
			say("Falls du gute Ideen hast, schreib diese bitte dem Team.")
			say("____________________________________________________________")
		end
		when 20095.chat."Teamler Liste" begin
			say_title("Teamler Liste:")
			say("____________________________________________________________")
			say_cyan("(SA)Goku")
			say("____________________________________________________________")
			say_red("(CA)Dome")
			say("____________________________________________________________")
		end
		when 20095.chat."Teamler Fähigkeiten" begin
			say_title("Teamler Fähigkeiten:")
			say("____________________________________________________________")
			say_cyan("(SA)Goku:") 
			say("Konzept-Designer, erfahrener Metin2 DE Spieler Lv 90+")
			say("____________________________________________________________")
			say_red("(CA)Dome:")
			say("Techniker, Clientmodder")
			say("____________________________________________________________")
		end
		when 20095.chat."Spiel Informationen" begin
			say_title("Spiel Boni:")
			say("____________________________________________________________")
			say("EXP Bonus in der Woche 0%")
			say("EXP Bonus am Wochenende 10%")
			say("EXP Bonus am Event 20%")
			say("____________________________________________________________")
			say("Doppeldrop Bonus in der Woche 0%")
			say("Doppeldrop Bonus am Wochenende 10%")
			say("Doppeldrop Bonus am Event 20%")
			say("____________________________________________________________")
			say("Yangdrop Bonus in der Woche 0%")
			say("Yangdrop Bonus am Wochenende 10%")
			say("Yangdrop Bonus am Event 20%")
			say("____________________________________________________________")
		end
		when 20095.chat."Behobene Fehler" begin
			say_title("Behobene Fehler:")
			say("____________________________________________________________")
			say("Es gibt bis jetzt keine gefundene Fehler.")
			say("Melde bitte alle gefundene Fehler dem Team.")
			say("____________________________________________________________")
		end
	end
end  