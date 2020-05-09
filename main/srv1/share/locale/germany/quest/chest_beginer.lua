quest truhen_zero begin
	state start begin
		when login begin
			say_title("Willkommen auf Metin2 - Black Edition")
			say("")
			say("Du erh‰lst von uns dein Starterset,")
			say("wir w¸nschen dir viel Spaﬂ!")
			pc.give_item2(50187)
			horse.set_level(0)
			set_state(truhen)
		end
	end
	state truhen begin
		when 50187.use begin
			pc.remove_item(50187, 1)			--Lehrlingstruhe I verschwindet
			pc.give_item2(50188, 1)				--Lehrlingstruhe II		
			pc.give_item2(72501)				--Anti-Erfahrungsring
			pc.give_item2(71033)				--Emotionsmaske
			pc.give_item2(72701)				--Windschuhe
			pc.give_item2(50083)				--Reitkarte
			pc.give_item2(13004)				--Schlachtschild+4
			pc.give_item2(15004)				--Lederschuhe+4
			pc.give_item2(72723)				--Elixier der Sonne (K)
			pc.give_item2(72727)				--Elixier des Mondes (K)
			if pc.get_job() == 0 then
				pc.give_item2(14)				--Schwert+4
				pc.give_item2(3004)				--Glefe+4
				pc.give_item2(11204)			--Mˆnchsplattenpanzer+4
				pc.give_item2(12204)			--Traditioneller Helm+4
				pc.give_item2(14064)			--Goldarmband+4
				pc.give_item2(16064)			--Goldhalskette+4
				pc.give_item2(17064)			--Goldohrringe+4
			elseif pc.get_job() == 1 then
				pc.give_item2(14)				--Schwert+4
				pc.give_item2(1004)				--Dolche+4
				pc.give_item2(2004)				--Bogen+4
				pc.give_item2(11404)			--Azuranzug+4
				pc.give_item2(12344)			--Lederkapuze+4
				pc.give_item2(8000, 250)		--Holzpfeil
				pc.give_item2(14004)			--Holzarmband+4
				pc.give_item2(16004)			--Holzhalskette+4
				pc.give_item2(17004)			--Holzohrringe+4
			elseif pc.get_job() == 2 then
				pc.give_item2(14)				--Schwert+4
				pc.give_item2(11604)			--Requiem-Plattenpanzer+4
				pc.give_item2(12484)			--Blutiger Helm+4
				pc.give_item2(14044)			--Silberarmband+4
				pc.give_item2(16044)			--Silberhalskette+4
				pc.give_item2(17044)			--Silberohrringe+4
			elseif pc.get_job() == 3 then
				pc.give_item2(7004)				--F‰cher+4
				pc.give_item2(5004)				--Kupferglocke+4
				pc.give_item2(11804)			--Purpurkleidung+4
				pc.give_item2(12624)			--Mˆnchshut+4
				pc.give_item2(14044)			--Silberarmband+4
				pc.give_item2(16044)			--Silberhalskette+4
				pc.give_item2(17044)			--Silberohrringe+4
			end
		end
		when 50188.use with pc.get_level() >= 10 begin
			pc.remove_item(50188, 1)			--Lehrlingstruhe II verschwindet
			pc.give_item2(50189, 1)				--Lehrlingstruhe III
			pc.give_item2(71004, 3)				--Medaille des Drachen
			pc.give_item2(27989, 1)				--Kompass des Metinsteins
			pc.give_item2(39006, 10)			--Tapferkeitsumhang
			pc.give_item2(71049, 1)				--Seidenb¸ndel
		end
		when 50189.use with pc.get_level() >= 20 begin
			pc.remove_item(50189, 1)			--Lehrlingstruhe III verschwindet
			pc.give_item2(50190, 1)				--Expertentruhe I
			pc.give_item2(71004, 6)				--Medaille des Drachen
			pc.give_item2(27989, 2)				--Kompass des Metinsteins
			pc.give_item2(39006, 20)			--Tapferkeitsumhang
			pc.give_item2(71012, 1)				--Buch des Anf¸hrers
		end
		when 50190.use with pc.get_level() >= 30 begin
			pc.remove_item(50190, 1)			--Expertentruhe I verschwindet
			pc.give_item2(50191, 1)				--Expertentruhe II
			pc.give_item2(27987, 1)				--Muschel
			pc.give_item2(71004, 9)				--Medaille des Drachen
			pc.give_item2(27989, 3)				--Kompass des Metinsteins
			pc.give_item2(39006, 30)			--Tapferkeitsumhang
			pc.give_item2(71001, 3)				--Exorzismus-Schriftrolle
			pc.give_item2(71094, 3)				--Konzentriertes Lesen
		end
		when 50191.use with pc.get_level() >= 40 begin
			pc.remove_item(50191, 1)			--Expertentruhe II verschwindet
			pc.give_item2(50192, 1)				--Expertentruhe III
			pc.give_item2(27987, 2)				--Muschel
			pc.give_item2(71153, 1)				--Trank der Weisheit
			pc.give_item2(39006, 40)			--Tapferkeitsumhang
			pc.give_item2(71001, 3)				--Exorzismus-Schriftrolle
			pc.give_item2(71094, 3)				--Konzentriertes Lesen
			pc.give_item2(71151, 3)				--Gr¸ner Zauber
			pc.give_item2(71152, 3)				--Gr¸ne St‰rke
		end
		when 50192.use with pc.get_level() >= 50 begin
			pc.remove_item(50192, 1)			--Expertentruhe III verschwindet
			pc.give_item2(50193, 1)				--Meistertruhe I
			pc.give_item2(27987, 3)				--Muschel
			pc.give_item2(39006, 50)			--Tapferkeitsumhang
			pc.give_item2(71001, 3)				--Exorzismus-Schriftrolle
			pc.give_item2(71094, 3)				--Konzentriertes Lesen
			pc.give_item2(71084, 3)				--Gegenstand verzaubern
			pc.give_item2(71085, 3)				--Gegenstand verst‰rken
			pc.give_item2(25040, 3)				--Segensschriftrolle
		end
		when 50193.use with pc.get_level() >= 60 begin
			pc.remove_item(50193, 1)			--Meistertruhe I verschwindet
			pc.give_item2(50194, 1)				--Meistertruhe II
			pc.give_item2(27987, 4)				--Muschel
			pc.give_item2(39006, 60)			--Tapferkeitsumhang
			pc.give_item2(71001, 3)				--Exorzismus-Schriftrolle
			pc.give_item2(71094, 3)				--Konzentriertes Lesen
			pc.give_item2(71084, 3)				--Gegenstand verzaubern
			pc.give_item2(71085, 3)				--Gegenstand verst‰rken
			pc.give_item2(70024, 3)				--Segenskugel
			pc.give_item2(71021, 3)				--Schriftrolle des Krieges
		end
		when 50194.use with pc.get_level() >= 70 begin
			pc.remove_item(50194, 1)			--Meistertruhe II verschwindet
			pc.give_item2(50195, 1)				--Meistertruhe III
			pc.give_item2(27987, 5)				--Muschel
			pc.give_item2(39006, 70)			--Tapferkeitsumhang
			pc.give_item2(71001, 3)				--Exorzismus-Schriftrolle
			pc.give_item2(71094, 3)				--Konzentriertes Lesen
			pc.give_item2(71084, 3)				--Gegenstand verzaubern
			pc.give_item2(71085, 3)				--Gegenstand verst‰rken
			pc.give_item2(70024, 3)				--Segenskugel
			pc.give_item2(71032, 3)				--Schriftrolle des Drachen
			pc.give_item2(27992, 1)				--Weiﬂe Perle
		end
		when 50195.use with pc.get_level() >= 80 begin
			pc.remove_item(50195, 1)			--Meistertruhe III verschwindet
			pc.give_item2(50196, 1)				--Groﬂmeistertruhe
			pc.give_item2(27987, 6)				--Muschel
			pc.give_item2(39006, 80)			--Tapferkeitsumhang
			pc.give_item2(71001, 3)				--Exorzismus-Schriftrolle
			pc.give_item2(71094, 3)				--Konzentriertes Lesen
			pc.give_item2(71084, 3)				--Gegenstand verzaubern
			pc.give_item2(71085, 3)				--Gegenstand verst‰rken
			pc.give_item2(70024, 3)				--Segenskugel
			pc.give_item2(70039, 3)				--Schmiede-Handbuch
			pc.give_item2(27993, 1)				--Blaue Perle
		end
		when 50196.use with pc.get_level() >= 90 begin
			pc.remove_item(50196, 1)			--Groﬂmeistertruhe verschwindet
			pc.give_item2(50197, 1)				--Perfekte Meistertruhe
			pc.give_item2(27987, 7)				--Muschel
			pc.give_item2(39006, 90)			--Tapferkeitsumhang
			pc.give_item2(71001, 3)				--Exorzismus-Schriftrolle
			pc.give_item2(71094, 3)				--Konzentriertes Lesen
			pc.give_item2(71084, 3)				--Gegenstand verzaubern
			pc.give_item2(71085, 3)				--Gegenstand verst‰rken
			pc.give_item2(70024, 3)				--Segenskugel
			pc.give_item2(25041, 1)				--Magisches Metall
			pc.give_item2(27994, 1)				--Blutrote Perle
		end
		when 50197.use with pc.get_level() >= 100 begin
			pc.remove_item(50197, 1)			--Perfekte Meistertruhe verschwindet
			pc.give_item2(27987, 8)				--Muschel
			pc.give_item2(39006, 100)			--Tapferkeitsumhang
			pc.give_item2(71001, 3)				--Exorzismus-Schriftrolle
			pc.give_item2(71094, 3)				--Konzentriertes Lesen
			pc.give_item2(71084, 3)				--Gegenstand verzaubern
			pc.give_item2(71085, 3)				--Gegenstand verst‰rken
			pc.give_item2(70024, 3)				--Segenskugel
			pc.give_item2(25041, 3)				--Magisches Metall
			pc.give_item2(27992, 3)				--Weiﬂe Perle
			pc.give_item2(27993, 3)				--Blaue Perle
			pc.give_item2(27994, 3)				--Blutrote Perle
			pc.give_item2(50512, 1)				--Regenbogenstein
			pc.give_item2(71011)				--Emotionsmaske
			pc.give_item2(39091)				--Orkanschuhe
			pc.give_item2(72726)				--Elixier der Sonne (IS)
			pc.give_item2(72730)				--Elixier des Mondes (IS)
		end
	end
end