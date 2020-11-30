quest missionbooks begin 
	state start begin 
		function leichtequests() 
			local quests = { 
			  --{Index, {MobId1, MobAnzahl1}, {MobId2, MobAnzahl2}, Questtitel, Questtext}, 
				{1, {106, 35}, {0, 0}, "Auftauchen der Grauw�lfe 1", "Hast du von den Grauw�lfen geh�rt? Sie waren meist alleine unterwegs, aber durch den Einfluss des b�sen Chi in letzter Zeit haben sie begonnen, in Rudeln Reisende zu jagen. Kannst Du diese Grauw�lfe ausschalten? Du wirst sicher belohnt werden.", "Missionsbuch erf�llt!"}, 
				{2, {107, 30}, {0, 0}, "Auftauchen der Grauw�lfe 2", "Hast du von den Alpha-Grauw�lfen geh�rt? Sie waren meist alleine unterwegs, aber durch den Einfluss des b�sen Chi in letzter Zeit haben sie begonnen, in Rudeln Reisende zu jagen. Kannst Du diese Alpha-Grauw�lfe ausschalten? Du wirst sicher belohnt werden.", "Missionsbuch erf�llt!"}, 
				{3, {104, 35}, {105, 25}, "Der Sturm der Blauw�lfe", "Hast Du schon vom Sturm der Blauw�lfe geh�rt? Das bezieht sich auf die Untaten der Blauw�lfe in letzter Zeit. Sie vernichten alles was ihnen im Weg ist, als w�ren sie ein Sturm aus Pelz und Z�hnen. Kannst Du diesen Sturm der Blauw�lfe b�ndigen?", "Missionsbuch erf�llt!"}, 
				{4, {112, 25}, {111, 25}, "Marsch der hungernden B�ren", "Oh, bitte hilf uns. In letzter Zeit besch�digt eine zunehmende Zahl Grizzlyb�ren und Schwarzb�ren unsere Bienenst�cke und Plantagen. Bitte hilf uns. Ohne die Bienen und das Obst verhungern wir. T�te die Untiere f�r uns.", "Missionsbuch erf�llt!"}, 
				{5, {8004, 2}, {0, 0}, "Metin der Gier zerst�ren", "Seit kurzem regnet es Steine mit b�sem Chi in der N�he der Stadt. Untersuchungen zeigen, dass das Chi in diesen Steinen Tiere zur Raserei treibt. Zerst�re diese Steine. Ich bitte Dich darum. Du wirst sicher belohnt werden.", "Missionsbuch erf�llt!"}, 
				{6, {8003, 2}, {0, 0}, "Metin der Schlacht zerst�ren", "Seit kurzem regnet es Steine mit b�sem Chi in der N�he der Stadt. Untersuchungen zeigen, dass das Chi in diesen Steinen Tiere zur Raserei treibt. Zerst�re diese Steine. Ich bitte Dich darum. Du wirst sicher belohnt werden.", "Missionsbuch erf�llt!"}, 
				{7, {8002, 3}, {0, 0}, "Metin des Kampfes zerschlagen", "Seit kurzem regnet es Steine mit b�sem Chi in der N�he der Stadt. Untersuchungen zeigen, dass das Chi in diesen Steinen Tiere zur Raserei treibt. Zerst�re diese Steine. Ich bitte Dich darum. Du wirst sicher belohnt werden.", "Missionsbuch erf�llt!"}, 
				{8, {8001, 2}, {0, 0}, "Metin des Kummers zerschlagen", "Seit kurzem regnet es Steine mit b�sem Chi in der N�he der Stadt. Untersuchungen zeigen, dass das Chi in diesen Steinen Tiere zur Raserei treibt. Zerst�re diese Steine. Ich bitte Dich darum. Du wirst sicher belohnt werden.", "Missionsbuch erf�llt!"}, 
				{9, {108, 40}, {0, 0}, "Sorge um die D�rfer", "Die Sorgen der D�rfer in der N�he der Stadt haben in letzter Zeit zugenommen. Keiler, die bisher h�chstens kleine Tiere auf den Bergen angefallen haben, sind aggressiv geworden. Sie sind in die Felder eingefallen und haben die Bauern angegriffen. Kannst Du diese Keiler vertreiben?", "Missionsbuch erf�llt!"}, 
				{10, {109, 30}, {0, 0}, "Sorge um die D�rfer 2", "Seit Kurzem suchen Keiler und ein roter Keiler, der sie anf�hrt, die D�rfer in der N�he der Hauptstadt heim. Die Regierung hat beschlossen, dass rote Keiler zu t�ten sind. Die Krieger werden aufgefordert, jeweils 30 Rote Keiler zu erlegen. Wir bitten dich um deine Mithilfe", "Missionsbuch erf�llt!"}, 
				{11, {114, 25}, {110, 30}, "Tiger und B�ren", "Hast Du das schon geh�rt? Wenn Tiger und B�ren f�r 100 Tage nur Knoblauch und Zwiebeln fressen, k�nnen sie sich in Gro�tiger und Feuerb�ren verwandeln. Das kommt bestimmt nicht vor, aber es schadet nicht, dieses Ger�cht zu pr�fen. �berpr�fe es, indem Du Tiger und B�ren erlegst.", "Missionsbuch erf�llt!"} 
			} 
			return quests 
		end 
		function normalequests() 
			local quests = { 
				{1, {393, 10}, {0, 0}, "Der Angriff der Se-Rangs", "Krieger, es sind neue Informationen zur wei�en Armee eingetroffen. Als Reaktion auf unseren Druck haben die Se-Rangs, Anf�hrerinnen der wei�en Armee, eine Gegenoffensive gestartet. Unternimm sofort etwas gegen die Se-Rangs. Wir m�ssen ihre Anf�hrerinnen erwischen und so ihre Pl�ne unterbinden.", "Missionsbuch erf�llt!"}, 
				{2, {5101, 30}, {5102, 30}, "Geheimnis des leichten Affen 1", "Die Lage des leichten Affendungeons in Map2 wurde endlich ermittelt. Normalerweise stellen die dort lebenden Affen keine Bedrohung dar, aber wenn sie sich zusammenrotten, k�nnten sie das Reich gef�hrden. Begib dich zum leichten Affendungeon und sieh nach, wie es um die Afenpopulation steht.", "Missionsbuch erf�llt!"}, 
				{3, {5103, 15}, {5104, 15}, "Geheimnis des leichten Affen 2", "Die Lage des leichten Affendungeons in Map2 wurde endlich ermittelt. Normalerweise stellen die dort lebenden Affen keine Bedrohung dar,  aber wenn sie sich zusammenrotten, k�nnten sie das Reich gef�hrden.  Begib dich zum leichten Affendungeon und sieh nach,  wie es um die Affenpopulation steht.", "Missionsbuch erf�llt!"}, 
				{4, {5111, 30}, {5112, 30}, "Geheimnis des normalen Affen 1", "Der Ort des normalen Affendungeons in der W�ste wurde endlich entdeckt.  Soweit wir wissen, sind diese Affen keine Gefahr,  aber wenn sie sich zusammenrotten, k�nnen sie das Reich gef�hrden.  Begib Dich zum normalen Affendungeon  und finde heraus, wer sich dahinter verbirgt.", "Missionsbuch erf�llt!"}, 
				{5, {5113, 15}, {5114, 15}, "Geheimnis des normalen Affen 2", "Der Ort des normalen Affendungeons in der W�ste wurde endlich entdeckt.  Soweit wir wissen, sind diese Affen keine Gefahr,  aber wenn sie sich zusammenrotten, k�nnen sie das Reich gef�hrden.  Begib Dich zum normalen Affendungeon  und finde heraus, wer sich dahinter verbirgt.", "Missionsbuch erf�llt!"},
				{6, {631, 30}, {632, 30}, "Gro�er Aufstand der Orks 1", "Geheime Informationen legen die Vermutung nahe, dass die Anf�hrer der Orks im Tal von Seungryong an Weltherrschaftspl�nen arbeiten. Schau dich dort bitte einmal um und �berpr�fe die Richtigkeit dieser Informationen. Und damit sich die Reise lohnt, k�nntest du gleich noch ein paar Orks aus dem Weg schaffen.", "Missionsbuch erf�llt!"}, 
				{7, {633, 20}, {634, 15}, "Gro�er Aufstand der Orks 2", "Geheime Informationen deuten darauf hin, dass die Anf�hrer der Orks im Tal von Seungryong planen, die ganze Welt zu unterwerfen. So l�cherlich das auch klingen mag, solltest du dieses Ger�cht dennoch �berpr�fen. Und wenn du schon mal dort bist, k�nntest du auch gleich noch ihre Truppen dezimieren.", "Missionsbuch erf�llt!"}, 
				{8, {8006, 3}, {0, 0}, "Metin der Dunkelheit zerst�ren", "Seit kurzem regnet es Steine in der N�he der Stadt. Sie scheinen b�ses Chi zu besitzen, denn seitdem geb�rden sich die Tiere in der Umgebung wie toll. Bitte k�mmere dich darum, dass diese Steine zerst�rt werden. Du wirst f�r deine M�he angemessen entlohnt werden.", "Missionsbuch erf�llt!"}, 
				{9, {8007, 2}, {0, 0}, "Metin der Eifersucht zerst�ren", "Seit kurzem regnet es Steine in der N�he der Stadt. Sie scheinen b�ses Chi zu besitzen, denn seitdem geb�rden sich die Tiere in der Umgebung wie toll. Bitte k�mmere dich darum, dass diese Steine zerst�rt werden. Du wirst f�r deine M�he angemessen entlohnt werden.", "Missionsbuch erf�llt!"}, 
				{10, {8005, 2}, {0, 0}, "Metin der Schw�rze zerst�ren", "Seit kurzem regnet es Steine in der N�he der Stadt. Sie scheinen b�ses Chi zu besitzen, denn seitdem geb�rden sich die Tiere in der Umgebung wie toll. Bitte k�mmere dich darum, dass diese Steine zerst�rt werden. Du wirst f�r deine M�he angemessen entlohnt werden.", "Missionsbuch erf�llt!"}, 
				{11, {501, 30}, {502, 30}, "�berfall der Wilden", "Wir haben einen Spion der Wilden geschnappt und ihm wichtige Informationen entlockt. Offenbar planen sie einen �berfall auf das Reich. Wir m�ssen ihrem Angriff zuvorkommen. Beweise deine Treue zum Reich!", "Missionsbuch erf�llt!"}, 
				{12, {404, 25}, {405, 25}, "Unruhiger schwarzer Wind", "Es hei�t neuerdings, dass die Schwarzwindbande sich anschickt, das Land in einem einzigen Handstreich zu �bernehmen. Bevor sie gen�gend Truppen rekrutieren k�nnen, sollten wir sie ihrer F�hrung berauben. Ich bitte dich: Schalte ihre Anf�hrer aus!"}, 
				{13, {304, 20}, {0, 0}, "Vertreiben der wei�en Armee", "In letzter Zeit hat die Armee des Wei�en-Eides uns sehr zu schaffen gemacht. Sie entf�hrt oft fahrende H�ndler und richtet im Dorf Verw�stungen an. Bitte halte sie auf. Schalte Mitglieder der Armee und ihre Anf�hrerinnen aus.", "Missionsbuch erf�llt!"}, 
				{14, {494, 4}, {0, 0}, "Wer Wind s�t, wird Sturm ernten", "Die Chuong, Anf�hrer der Schwarzwindbande, machen �rger. Als Meister des Schwertkampfs haben sie nur zum Spa� andere Krieger herausgefordert. Schalte sie aus, bevor sie die gesamte Schwarzwindbande mit ihrem �bermut anstecken.", "Missionsbuch erf�llt!"}, 
			} 
			return quests 
		end 
		function schwerequests() 
			local quests = { 
				{1, {701, 30}, {702, 30}, "Anh�nger des Schw. Glaubens 1", "Es ist endlich der Befehl ergangen, einen der gef�hrlichsten Gegner des Reiches auszumerzen: die esoterische Sekte im Tal von Seungryong. Geh dorthin und heize ihnen ordentlich ein! Aber mach nicht den Fehler, sie zu untersch�tzen. Auch wenn sie oft nur unverst�ndliches Zeug plappern, sind sie doch erfahrene K�mpfer."}, 
				{2, {703, 20}, {704, 25}, "Anh�nger des Schw. Glaubens 2", "Es ist endlich der Befehl ergangen, einen der gef�hrlichsten Gegner des Reiches auszumerzen: die esoterische Sekte im Tal von Seungryong. Geh dorthin und heize ihnen ordentlich ein! Aber mach nicht den Fehler, sie zu untersch�tzen. Auch wenn sie oft nur unverst�ndliches Zeug plappern, sind sie doch erfahrene K�mpfer."}, 
				{3, {706, 40}, {707, 40}, "Anh�nger des Schw. Glaubens 3", "Es ist endlich der Befehl ergangen, einen der gef�hrlichsten Gegner des Reiches auszumerzen: die esoterische Sekte im Tal von Seungryong. Geh dorthin und heize ihnen ordentlich ein! Aber mach nicht den Fehler, sie zu untersch�tzen. Auch wenn sie oft nur unverst�ndliches Zeug plappern, sind sie doch erfahrene K�mpfer."}, 
				{4, {1301, 45}, {1302, 35}, "Chunwa Bong-ki", "Der gelbe Tigergeist hat sich anscheinend mit den Baumfrosch-Monstern verschworen. Zerschlage umgehend ihre gemeinsamen Einheiten. Wenn du sie ignorierst, wird dies �bel f�r das Reich ausgehen!"}, 
				{5, {8511, 25}, {0, 0}, "Das Eis wird schmelzen", "Kennst du den von ewigem Eis bedeckten Berg Sohan? Viele Forscher und K�mpfer haben sich dorthin aufgemacht, sind jedoch nie zur�ckgekehrt. Finde heraus, warum dies so ist und ob sie angegriffen wurden. Vielleicht kannst du etwas erfahren, wenn du dort Monster jagst."}, 
				{6, {1063, 45}, {0, 0}, "Das Geheimnis des D�monenturms", "Einige Ger�chte besagen, dass die Gemeinen Speerk�mpfer im D�monenturm unbesiegbar seien. Angeblich stehen sie jedes Mal wieder auf, wenn man sie t�tet. Wenn das stimmt, stehen uns dunkle Zeiten bevor. Bitte finde mehr dar�ber heraus!"}, 
				{7, {1064, 60}, {0, 0}, "Der Herr des D�monenturms", "Nach genauerer Untersuchung wurde festgestellt, dass die Geistersoldaten fortw�hrend wiederbelebt wurden. Wir m�ssen Gemeine Geist Schamanen vernichten, um das zu verhindern."}, 
				{8, {1305, 30}, {0, 0}, "Die rechte des Gelben Tigergeists", "Dir ist sicherlich schon aufgefallen, dass die Tiere in letzter Zeit sehr wild und angriffslustig sind. Der Geheimdienst des Reichs vermutet als Grund daf�r, dass der Gelbe Tigergeist, K�nig aller Tiere auf diesem Kontinent, gerade seine Untertanen mobilisiert. Als Gegenma�nahme sollten wir die Anf�hrer beseitigen, die als seine rechte Hand fungieren."}, 
				{9, {1105, 35}, {1106, 30}, "Eigent�mer des Berg Sohan?", "Der Neunschwanz, Herr des Bergs Sohan, schart dort angeblich D�monen um sich. Bevor er seine Truppen zusammen hat, m�ssen wir das R�ckgrat seiner Armee zerschlagen und so seine Pl�ne vereiteln. Bitte hilf uns. Du wirst gro�z�gig belohnt."}, 
				{10, {1101, 45}, {0, 0}, "Eismonster! Ihr wahres Wesen", "Wir haben herausgefunden, wie die Eismonster auf dem Berg Sohan sich untereinander verst�ndigen: Sie verbreiten ihre Informationen �ber die schwebenden Eissplitter, die dort �berall anzutreffen sind. Um die Truppen des Eislandes zu schw�chen, m�ssen wir diese Informations�bertragung st�ren. Ich bitte dich: Beseitige das Verzauberte Eis!"}, 
				{11, {5121, 30}, {5122, 30}, "Geheimnis des schweren Affendungeons 1", "Die Lage des schweren Affendungeons in der W�ste wurde endlich ermittelt. Normalerweise stellen die dort lebenden Affen keine Gefahr dar, aber wenn sie sich zusammenrotten, k�nnten sie das Reich gef�hrden. Begib dich zum schweren Affendungeon und sieh nach, wie es um die Affenpopulation steht."}, 
				{12, {5123, 15}, {5124, 15}, "Geheimnis des schweren Affendungeons 2", "Die Lage des schweren Affendungeons in der W�ste wurde endlich ermittelt. Normalerweise stellen die dort lebenden Affen keine Gefahr dar, aber wenn sie sich zusammenrotten, k�nnten sie das Reich gef�hrden. Begib dich zum schweren Affendungeon und sieh nach, wie es um die Affenpopulation steht."}, 
				{13, {1001, 30}, {1002, 20}, "Gesellschaft des Todes 1", "Hast du schon vom D�monenturm geh�rt? Dort haben esoterische Sekten mit m�chtiger Magie D�monensoldaten beschworen. Bek�mpfe sie und finde so heraus, wie m�chtig sie sind."}, 
				{13, {1003, 30}, {1004, 25}, "Gesellschaft des Todes 2", "Hast du schon vom D�monenturm geh�rt? Dort haben esoterische Sekten mit m�chtiger Magie D�monensoldaten beschworen. Bek�mpfe sie und finde so heraus, wie m�chtig sie sind."}, 
				{14, {8010, 2}, {0, 0}, "Metin der H�rte zerst�ren", "Seit kurzem regnet es Steine in der N�he der Stadt. Sie scheinen b�ses Chi zu besitzen, denn seitdem geb�rden sich die Tiere in der Umgebung wie toll. Bitte k�mmere dich darum, dass diese Steine zerst�rt werden. Du wirst f�r deine M�he angemessen entlohnt werden."}, 
				{15, {8009, 2}, {0, 0}, "Metin der Seele zerst�ren", "Seit kurzem regnet es Steine in der N�he der Stadt. Sie scheinen b�ses Chi zu besitzen, denn seitdem geb�rden sich die Tiere in der Umgebung wie toll. Bitte k�mmere dich darum, dass diese Steine zerst�rt werden. Du wirst f�r deine M�he angemessen entlohnt werden."}, 
				{16, {8008, 2}, {0, 0}, "Metin des Schattens zerst�ren", "Seit kurzem regnet es Steine in der N�he der Stadt. Sie scheinen b�ses Chi zu besitzen, denn seitdem geb�rden sich die Tiere in der Umgebung wie toll. Bitte k�mmere dich darum, dass diese Steine zerst�rt werden. Du wirst f�r deine M�he angemessen entlohnt werden."}, 
				{17, {2051, 35}, {2052, 35}, "Sie haben acht Beine 1(SD2)", "In der Yongbi-W�ste wurde ein H�hlensystem entdeckt, das den dort lebenden Spinnen als Unterschlupf dient. Wir haben keine genaueren Informationen �ber diese Spinnenh�hlen, aber die Gegend ist als sehr gef�hrlich bekannt. Andererseits ergibt sich durch die Ansammlung vieler Spinnen auf engem Raum eine gute Gelegenheit, ihre Zahl und damit auch ihre Bedrohlichkeit zu verringern. Also mach dich auf den Weg! Und sei vorsichtig!"}, 
				{18, {2053, 35}, {2054, 35}, "Sie haben acht Beine 2(SD2)", "In der Yongbi-W�ste wurde ein H�hlensystem entdeckt, das den dort lebenden Spinnen als Unterschlupf dient. Wir haben keine genaueren Informationen �ber diese Spinnenh�hlen, aber die Gegend ist als sehr gef�hrlich bekannt. Andererseits ergibt sich durch die Ansammlung vieler Spinnen auf engem Raum eine gute Gelegenheit, ihre Zahl und damit auch ihre Bedrohlichkeit zu verringern. Also mach dich auf den Weg! Und sei vorsichtig!"}, 
				{19, {2033, 35}, {2034, 35}, "Sie haben acht Beine 3(SD2)", "In der Yongbi-W�ste wurde ein H�hlensystem entdeckt, das den dort lebenden Spinnen als Unterschlupf dient. Wir haben keine genaueren Informationen �ber diese Spinnenh�hlen, aber die Gegend ist als sehr gef�hrlich bekannt. Andererseits ergibt sich durch die Ansammlung vieler Spinnen auf engem Raum eine gute Gelegenheit, ihre Zahl und damit auch ihre Bedrohlichkeit zu verringern. Also mach dich auf den Weg! Und sei vorsichtig!"}, 
				{19, {2035, 40}, {0, 0}, "Sie haben acht Beine 4(SD2)", "In der Yongbi-W�ste wurde ein H�hlensystem entdeckt, das den dort lebenden Spinnen als Unterschlupf dient. Wir haben keine genaueren Informationen �ber diese Spinnenh�hlen, aber die Gegend ist als sehr gef�hrlich bekannt. Andererseits ergibt sich durch die Ansammlung vieler Spinnen auf engem Raum eine gute Gelegenheit, ihre Zahl und damit auch ihre Bedrohlichkeit zu verringern. Also mach dich auf den Weg! Und sei vorsichtig!"}, 
				{21, {2103, 30}, {2104, 20}, "Skorpionplage", "Diese Skorpionwesen tyrannisieren Reisende und H�ndler, was sich schlecht auf die Wirtschaft des Reiches auswirkt. Bitte hilf dabei, dieser Plage Herr zu werden."}, 
				{22, {2001, 40}, {0, 0}, "Wut der Spinne 1", "Spinnen, die normalerweise friedlich in der Yongbi-W�ste leben, haben angefangen, Reisende anzugreifen und zu t�ten. Abgesehen davon, dass die Betroffenen wenig erfreut sind, haben diese Angriffe unangenehme Auswirkungen auf die Handelsbeziehungen im Reich. Sorge bitte daf�r, dass das aufh�rt."}, 
				{23, {2002, 40}, {0, 0}, "Wut der Spinne 2", "Spinnen, die normalerweise friedlich in der Yongbi-W�ste leben, haben angefangen, Reisende anzugreifen und zu t�ten. Abgesehen davon, dass die Betroffenen wenig erfreut sind, haben diese Angriffe unangenehme Auswirkungen auf die Handelsbeziehungen im Reich. Sorge bitte daf�r, dass das aufh�rt."}, 
				} 
			return quests 
		end 
		function expertquests() 
			local quests = { 
				{1, {2302, 40}, {2303, 30}, "Das Geheimnis des Geisterwaldes", "Nachforschungen haben ergeben, dass der Geisterwald ein Gebiet ist, das von Geisterbaumstumpf und Dryade dominiert wird. Wenn du sie vernichtest, kannst du vielleicht verhindern, dass sich die Geisterb�ume weiter ausbreiten."}, 
				{2, {2301, 30}, {0, 0}, "Untersuche die Geisterb�ume", "Sie stehen wie normale, etwas finster aussehende B�ume in der Landschaft herum � doch dann werden sie pl�tzlich lebendig und greifen Tiere und Menschen an. Finde heraus, wie die Geisterb�ume vernichtet werden k�nnen."}, 
				{3, {2204, 40}, {0, 0}, "Erforsche die Flammen", "Die Flammen sind unglaublich brutal. Sie erg�tzen sich am Schmerz der Menschen, deren Haut sie gerade verzehren. Wir haben noch keine Ahnung, wie wir sie ausschalten k�nnen. Kannst du mehr �ber diese Flammen herausfinden?"}, 
				{4, {2202, 45}, {0, 0}, "Flammengeist! Seine Identit�t", "Eine Gruppe, die Kampftiger jagen sollte, wurde selbst von noch unbekannten Gegnern vernichtet. Es hei�t, dass diese Gegner wie brennende M�dchen aussehen, also finde heraus, worum es sich handelt."}, 
				{5, {2205, 60}, {0, 0}, "Flammenkrieger", "Vor Kurzem wurde das Kind eines Adligen, das sich in das Feuerland begab, von einem Flammenkrieger erschlagen. Wenn du die Flammenkrieger t�test, erh�ltst du eine Belohnung. Warum forderst du sie nicht heraus?"}, 
				{6, {2201, 60}, {2203, 40}, "Reduziere die Zahl der Kampftiger", "Jetzt, da wir die Feuergeister bek�mpfen k�nnen, m�ssen wir sie im offenen Kampf komplett vernichten. Diese Aufgabe wird vom Milit�r �bernommen, aber um mit voller Kampfst�rke zu den Feuergeistern durchdringen zu k�nnen, brauchen wir eine Einfallschneise. Bitte sorge daf�r, dass uns keine Kampftiger in die Quere kommen."}, 
				{7, {2201, 45}, {0, 0}, "Doyyumhwan erforschen", "Doyyumhwan ist ein Lavagebiet, das von noch unbekannten Monstern bev�lkert wird. Wir m�ssen diese Region erforschen. Kannst du uns dabei helfen?"} 
			} 
			return quests 
		end 
		
		function einfache_belohnungen_item() 
			local item = {
			--  Item // Count
				{ 30003, 1 },		-- Schweinenase
				{ 30053, 1 },		-- B�renfu�haut
				{ 30072, 1 },		-- B�renfu�haut+
				{ 30010, 1 },		-- B�rengalle
				{ 30071, 1 },		-- B�rengalle+
				{ 30038, 1 },		-- Tigerfell
				{ 30023, 1 },		-- Wei�es Tigerfell
				{ 30028, 1 },		-- Wolfskralle
				{ 30069, 1 },		-- Wolfskralle+
				{ 30004, 1 },		-- Keilerzahn
			}
			return item 
		end
		function einfache_belohnungen_exp() 
			local experience = {
				-- EXP // Chance
				{ 10000,	35 },
				{ 20000,	30 },
				{ 30000,	20 },
				{ 50000,	10 },
				{ 80000,	5 },
			}
			return experience
		end
		function einfache_belohnungen_gold() 
			local gold ={
				-- Gold // Chance
				{ 5000,	35 },
				{ 10000,	30 },
				{ 20000,	20 },
				{ 50000,	10 },
				{ 100000,	5 },
			}
			return gold 
		end 
		
		function mittlere_belohnungen_item() 
			local item = {
			--  Item // Count
				{ 30057, 1 },		-- Spinnenaugen
				{ 30056, 1 },		-- Spinnennetz
				{ 30058, 1 },		-- Spinnen-Eiersack
				{ 30025, 1 },		-- Spinnen-Giftsack
				{ 30032, 1 },		-- Schwarze Uniform
				{ 30074, 1 },		-- Schwarze Uniform+
				{ 30007, 1 },		-- Orkamulett
				{ 30076, 1 },		-- Orkamulett+
				{ 30006, 1 },		-- Orkzahn
				{ 30077, 1 },		-- Orkzahn+
				{ 30055, 1 },		-- Skorpionschere
				{ 30046, 1 },		-- Skorpionschwanz
				{ 30081, 1 },		-- Skorpionschwanz+
				{ 30045, 1 },		-- Skorpionnadel
				{ 30030, 1 },		-- Rostige Degenklinge
				{ 30018, 1 },		-- Rotes Haarband
				{ 30031, 1 },		-- Schmuckgegenstand
				{ 30052, 1 },		-- Flagge
				{ 30017, 1 },		-- Schm�ckende Haarnadel
				{ 30008, 1 },		-- Esoterikfibel
				{ 30011, 1 },		-- Kn�uel
				{ 30041, 1 },		-- Shuriken
				{ 30034, 1 },		-- Wei�es Haarband
				{ 30073, 1 },		-- Wei�es Haarband+
				{ 30092, 1 },		-- Kriegsbeute
				{ 30033, 1 },		-- Zerbrochenes Porzellan
				{ 30035, 1 },		-- Gesichtscreme
				{ 30021, 1 },		-- St�ck Edelstein
				{ 30005, 1 },		-- St�ck kaputte R�stung
			}
			return item 
		end
		function mittlere_belohnungen_exp()
			local experience = {
				-- EXP // Chance
				{ 20000,	35 },
				{ 30000,	30 },
				{ 50000,	20 },
				{ 80000,	10 },
				{ 100000,	5 },
			}
			return experience
		end
		function mittlere_belohnungen_gold()
			local gold ={
				-- Gold // Chance
				{ 10000,	25 },
				{ 30000,	25 },
				{ 50000,	20 },
				{ 80000,	15 },
				{ 100000,	10 },
				{ 200000,	5 },
			}
			return gold 
		end 
		
		function schwere_belohnungen_item() 
			local item = {
			--  Item // Count
				{ 30040, 1 },		-- Blatt
				{ 30091, 1 },		-- Kriegersymbol
				{ 30016, 1 },		-- D�monenedelstein
				{ 30048, 1 },		-- Eisst�ck
				{ 30088, 1 },		-- Eisst�ck+
				{ 30039, 1 },		-- St�ck Gewebe
				{ 30085, 1 },		-- St�ck Gewebe+
				{ 30015, 1 },		-- D�monenandenken
				{ 30086, 1 },		-- D�monenandenken+
				{ 30059, 1 },		-- Spinnenbeine
				{ 30061, 1 },		-- Froschschenkel
				{ 30049, 1 },		-- Eiskillerwal-Horn
				{ 30050, 1 },		-- Eiskugel
				{ 30090, 1 },		-- Eiskugel+
				{ 30047, 1 },		-- Fluchsammlung
				{ 30080, 1 },		-- Fluchsammlung+
				{ 30067, 1 },		-- Schlangenhaut
				{ 30022, 1 },		-- Schlangenschwanz
				{ 30051, 1 },		-- Unbekannter Talisman
				{ 30079, 1 },		-- Unbekannter Talisman+
				{ 30038, 1 },		-- Tigerfell
				{ 30014, 1 },		-- Yetifell
				{ 30089, 1 },		-- Yetifell+
				{ 30009, 1 },		-- Unbekannte Medizin
				{ 30083, 1 },		-- Unbekannte Medizin+
				{ 30042, 1 },		-- Rei�zahn eines Tigers
				{ 30019, 1 },		-- Flammenm�hne
				{ 30075, 1 },		-- Shuriken+
			}
			return item
		end
		function schwere_belohnungen_exp() 
			local experience = {
				-- EXP // Chance
				{ 30000,	20 },
				{ 50000,	20 },
				{ 80000,	15 },
				{ 100000,	15 },
				{ 150000,	15 },
				{ 200000,	10 },
				{ 300000,	5 },
			}
			return experience
		end
		function schwere_belohnungen_gold() 
			local gold ={
				-- Gold // Chance
				{ 30000,	25 },
				{ 50000,	25 },
				{ 80000,	20 },
				{ 100000,	15 },
				{ 150000,	10 },
				{ 200000,	5 },
			}
			return gold 
		end 
		
		function experten_belohnungen_item() 
			local item = {
			--  Item // Count
				{ 70050, 1 },		-- Symbol d. weisen Kaisers
				{ 70051, 1 },		-- Handschuh weiser Kaiser
				{ 70048, 1 },		-- Fl�chtlingsumhang
				{ 50301, 1 },		-- Sun-zi-Kriegskunst
				{ 50302, 1 },		-- Wu-zi-Kriegskunst
				{ 50303, 1 },		-- WeiLiao-zi Kriegskunst
				{ 70102, 1 },		-- Zen-Bohne
				{ 50513, 1 },		-- Seelenstein
			}
			return item 
		end
		function experten_belohnungen_exp() 
			local experience = {
				-- EXP // Chance
				{ 30000,	15 },
				{ 50000,	15 },
				{ 80000,	15 },
				{ 100000,	15 },
				{ 150000,	15 },
				{ 200000,	10 },
				{ 250000,	10 },
				{ 500000,	5 },
			}
			return experience
		end
		function experten_belohnungen_gold()
			local gold ={
				-- Gold // Chance
				{ 50000,	30 },
				{ 80000,	25 },
				{ 100000,	20 },
				{ 150000,	15 },
				{ 200000,	10 },
			}
			return gold 
		end 

		when 50307.use begin 
			local liste = missionbooks.leichtequests() 
			local rnd = number(1, table.getn(liste)) 
			if pc.getqf("Has_Mission") == 0 then
				say_title("Leichtes Missionsbuch:")
				say("")
				say("M�chtest du das leichte Missionsbuch")
				say("einl�sen um eine Aufgabe zu erhalten?")
				say("")
				say_yellow("Du kannst die Mission nicht mehr abbrechen!")
				say("")
				local start = select("Starten","Abbrechen")
				if start == 1 then
					pc.setqf("Has_Mission", 1) 
					pc.setqf("QUEST_ART", 1) 
					pc.setqf("QUEST_ID", rnd) 
					pc.setqf("MOB_ID_1", liste[rnd][2][1]) 
					pc.setqf("MOB_ANZAHL_1", liste[rnd][2][2]) 
					if liste[rnd][3][1] != 0 then 
						pc.setqf("MOB_ID_2", liste[rnd][3][1]) 
						pc.setqf("MOB_ANZAHL_2", liste[rnd][3][2]) 
					end
					pc.remove_item(50307, 1) 
					send_letter(liste[rnd][4])
				else
					return
				end
			else 
				say_title("Laufende Missionsbuchquest")
				say("")
				say("Du hast bereits einen Missionsbuchauftrag") 
				say("angenommen. Du kannst nur dann einen anderen") 
				say("Auftrag starten, wenn du den jetzigen Auftrag") 
				say("vollendest oder abbrichst.") 
			end 
		end 
		when 50308.use begin 
			local liste = missionbooks.normalequests() 
			local rnd = number(1, table.getn(liste)) 
			if pc.getqf("Has_Mission") == 0 then 
				say_title("Normales Missionsbuch:")
				say("")
				say("M�chtest du das normale Missionsbuch")
				say("einl�sen um eine Aufgabe zu erhalten?")
				say("")
				say_yellow("Du kannst die Mission nicht mehr abbrechen!")
				say("")
				local start = select("Starten","Abbrechen")
				if start == 1 then
					pc.setqf("Has_Mission", 1) 
					pc.setqf("Is_Finished", 0)
					pc.setqf("QUEST_ART", 2) 
					pc.setqf("QUEST_ID", rnd) 
					pc.setqf("MOB_ID_1", liste[rnd][2][1]) 
					pc.setqf("MOB_ANZAHL_1", liste[rnd][2][2]) 
					if liste[rnd][3][1] != 0 then 
						pc.setqf("MOB_ID_2", liste[rnd][3][1]) 
						pc.setqf("MOB_ANZAHL_2", liste[rnd][3][2]) 
					end 
					pc.remove_item(50308, 1) 
					send_letter(liste[rnd][4]) 
					say_title(liste[quest_id][4])
				else
					return
				end
			else 
				say_title("Laufende Missionsbuchquest") 
				say("")
				say("Du hast bereits einen Missionsbuchauftrag") 
				say("angenommen. Du kannst nur dann einen anderen") 
				say("Auftrag starten, wenn du den jetzigen Auftrag") 
				say("vollendest oder abbrichst.") 
			end 
		end 
		when 50309.use begin 
			local liste = missionbooks.schwerequests() 
			local rnd = number(1, table.getn(liste)) 
			if pc.getqf("Has_Mission") == 0 then 
				say_title("Schweres Missionsbuch:")
				say("")
				say("M�chtest du das schwere Missionsbuch")
				say("einl�sen um eine Aufgabe zu erhalten?")
				say("")
				say_yellow("Du kannst die Mission nicht mehr abbrechen!")
				say("")
				local start = select("Starten","Abbrechen")
				if start == 1 then
					pc.setqf("Has_Mission", 1) 
					pc.setqf("Is_Finished", 0)
					pc.setqf("QUEST_ART", 3) 
					pc.setqf("QUEST_ID", rnd) 
					pc.setqf("MOB_ID_1", liste[rnd][2][1]) 
					pc.setqf("MOB_ANZAHL_1", liste[rnd][2][2]) 
					if liste[rnd][3][1] != 0 then 
						pc.setqf("MOB_ID_2", liste[rnd][3][1]) 
						pc.setqf("MOB_ANZAHL_2", liste[rnd][3][2]) 
					end 
					pc.remove_item(50309, 1) 
					send_letter(liste[rnd][4]) 
					say_title(liste[quest_id][4])
				else
					return
				end
			else 
				say_title("Laufende Missionsbuchquest") 
				say("")
				say("Du hast bereits einen Missionsbuchauftrag") 
				say("angenommen. Du kannst nur dann einen anderen") 
				say("Auftrag starten, wenn du den jetzigen Auftrag") 
				say("vollendest oder abbrichst.") 
			end 
		end 
		when 50310.use begin 
			local liste = missionbooks.expertquests() 
			local rnd = number(1, table.getn(liste)) 
			if pc.getqf("Has_Mission") == 0 then 
				say_title("Experten Missionsbuch:")
				say("")
				say("M�chtest du das experten Missionsbuch")
				say("einl�sen um eine Aufgabe zu erhalten?")
				say("")
				say_yellow("Du kannst die Mission nicht mehr abbrechen!")
				say("")
				local start = select("Starten","Abbrechen")
				if start == 1 then
					pc.setqf("Has_Mission", 1) 
					pc.setqf("Is_Finished", 0)
					pc.setqf("QUEST_ART", 4) 
					pc.setqf("QUEST_ID", rnd) 
					pc.setqf("MOB_ID_1", liste[rnd][2][1]) 
					pc.setqf("MOB_ANZAHL_1", liste[rnd][2][2]) 
					if liste[rnd][3][1] != 0 then 
						pc.setqf("MOB_ID_2", liste[rnd][3][1]) 
						pc.setqf("MOB_ANZAHL_2", liste[rnd][3][2]) 
					end 
					pc.remove_item(50310, 1) 
					send_letter(liste[rnd][4]) 
				else
					return
				end
			else 
				say_title("Laufende Missionsbuchquest") 
				say("")
				say("Du hast bereits einen Missionsbuchauftrag") 
				say("angenommen. Du kannst nur dann einen anderen") 
				say("Auftrag starten, wenn du den jetzigen Auftrag") 
				say("vollendest oder abbrichst.") 
			end 
		end 
		when letter begin 
			if pc.getqf("Has_Mission") == 1 then 
				local liste 
				local quest_art = pc.getqf("QUEST_ART") 
				local quest_id = pc.getqf("QUEST_ID") 
				if quest_art == 1 then 
					liste = missionbooks.leichtequests() 
				elseif quest_art == 2 then 
					liste = missionbooks.normalequests() 
				elseif quest_art == 3 then 
					liste = missionbooks.schwerequests() 
				elseif quest_art == 4 then 
					liste = missionbooks.expertquests() 
				end 
				send_letter(liste[quest_id][4]) 
			end 
		end 
		when button or info begin 
			if pc.getqf("Has_Mission") == 1 then
				local liste 
				local belohnung 
				local quest_art = pc.getqf("QUEST_ART") 
				local quest_id = pc.getqf("QUEST_ID") 
				if quest_art == 1 then 
					liste = missionbooks.leichtequests() 
				elseif quest_art == 2 then 
					liste = missionbooks.normalequests() 
				elseif quest_art == 3 then 
					liste = missionbooks.schwerequests() 
				elseif quest_art == 4 then 
					liste = missionbooks.expertquests() 
				end 
				if pc.getqf("Is_Finished") == 0 then 
					say_title(liste[quest_id][4]) 
					say("")
					say2(liste[quest_id][5])
					say("")
					if liste[quest_id][3][1] == 0 then 
						say_reward("T�te "..liste[quest_id][2][2].." "..mob_name(liste[quest_id][2][1])) 
						say_reward("(Verbleibend: "..mob_name(pc.getqf("MOB_ID_1")).." "..pc.getqf("MOB_ANZAHL_1")..")") 
					else 
						say_reward("T�te "..liste[quest_id][2][2].." "..mob_name(liste[quest_id][2][1]).." und "..liste[quest_id][3][2].." "..mob_name(liste[quest_id][3][1])) 
						say_reward("(Verbleibend: "..mob_name(pc.getqf("MOB_ID_1")).." "..pc.getqf("MOB_ANZAHL_1").." und "..mob_name(pc.getqf("MOB_ID_2")).." "..pc.getqf("MOB_ANZAHL_2")..")") 
					end
					say("")
					-- if select("Weiter", "Abbrechen") == 2 then 
						-- say_title(liste[quest_id][4].." abbrechen") 
						-- say("M�chtest du diesen Auftrag wirklich abbrechen?") 
						-- if select("Ja, abbrechen", "Nein") == 1 then 
							-- say_title(liste[quest_id][4]) 
							-- say_title("Auftrag abgebrochen.") 
							-- pc.delqf("Is_Finished") 
							-- pc.delqf("Has_Mission") 
							-- pc.delqf("MOB_ID_1") 
							-- pc.delqf("MOB_ID_2") 
							-- pc.delqf("MOB_ANZAHL_2") 
							-- pc.delqf("MOB_ANZAHL_1") 
							-- pc.delqf("QUEST_ID") 
							-- pc.delqf("QUEST_ART") 
						-- end 
					-- end 
				else 
					say_title(liste[quest_id][4].. " abgeschlossen.")
					say("")
					say_reward("Du erh�lst:")
					say("")
					if quest_art == 1 then 
						belohnung_item	= missionbooks.einfache_belohnungen_item() 
						belohnung_exp	= missionbooks.einfache_belohnungen_exp() 
						belohnung_gold	= missionbooks.einfache_belohnungen_gold() 
					elseif quest_art == 2 then 
						belohnung_item	= missionbooks.mittlere_belohnungen_item() 
						belohnung_exp	= missionbooks.mittlere_belohnungen_exp() 
						belohnung_gold	= missionbooks.mittlere_belohnungen_gold() 
					elseif quest_art == 3 then 
						belohnung_item	= missionbooks.schwere_belohnungen_item() 
						belohnung_exp	= missionbooks.schwere_belohnungen_exp() 
						belohnung_gold	= missionbooks.schwere_belohnungen_gold() 
					elseif quest_art == 4 then 
						belohnung_item	= missionbooks.experten_belohnungen_item() 
						belohnung_exp	= missionbooks.experten_belohnungen_exp() 
						belohnung_gold	= missionbooks.experten_belohnungen_gold() 
					end 
					
					local random_item = number(1, table.getn(belohnung_item))
					
					----------
					-- ITEM --
					----------
					pc.give_item2(belohnung_item[random_item][1], belohnung_item[random_item][2])
					say_reward(belohnung_item[random_item][2].."x "..item_name(belohnung_item[random_item][1]))
					
					---------
					-- EXP --
					---------
					rand_exp = number (0,99)
					local i = 0
					for i = 1, table.getn(belohnung_exp) do 
						if rand_exp < belohnung_exp[i][2] then
							say_reward(numtomoney(belohnung_exp[i][1]).." Erfahrungspunkte")
							pc.give_exp2(belohnung_exp[i][1])
							break
						else
							rand_exp = rand_exp - belohnung_exp[i][2]
						end 
					end 
					
					----------
					-- GOLD --
					----------
					rand_gold = number (0,99)
					i = 0
					for i = 1, table.getn(belohnung_gold) do 
						if rand_gold < belohnung_gold[i][2] then
							say_reward(numtomoney(belohnung_gold[i][1]).." Yang")
							pc.change_money(belohnung_gold[i][1])
							break
						else
							rand_gold = rand_gold - belohnung_gold[i][2]
						end 
					end 
					
					pc.delqf("Is_Finished") 
					pc.delqf("Has_Mission") 
					pc.delqf("MOB_ID_1") 
					pc.delqf("MOB_ID_2") 
					pc.delqf("MOB_ANZAHL_2") 
					pc.delqf("MOB_ANZAHL_1") 
					pc.delqf("QUEST_ID") 
					pc.delqf("QUEST_ART") 
					cleartimer("MISSION_TIME_20")
					clear_letter()
				end 
			end 
		end
		when login begin
			if pc.getqf("Has_Mission") == 1 then
				local count = pc.getqf("MOB_ANZAHL_1")
				q.set_counter(mob_name(pc.getqf("MOB_ID_1")), count)
			end
		end
		when kill with pc.getqf("Has_Mission") == 1 begin 
			local liste 
			local quest_art = pc.getqf("QUEST_ART") 
			local quest_id = pc.getqf("QUEST_ID") 
			if quest_art == 1 then 
				liste = missionbooks.leichtequests() 
			elseif quest_art == 2 then 
				liste = missionbooks.normalequests() 
			elseif quest_art == 3 then 
				liste = missionbooks.schwerequests() 
			elseif quest_art == 4 then 
				liste = missionbooks.expertquests() 
			end 
			if liste[quest_id][3][1] == 0 then 
				if npc.get_race() == pc.getqf("MOB_ID_1") then 
					local count = pc.getqf("MOB_ANZAHL_1") - 1 
					if count >= 0 then 
						pc.setqf("MOB_ANZAHL_1", count) 
						q.set_counter(mob_name(pc.getqf("MOB_ID_1")), count) 
						if count == 0 then 
							pc.setqf("Is_Finished", 1) 
							send_letter(liste[quest_id][6]) 
						end 
					end 
				end 
			else 
				if npc.get_race() == pc.getqf("MOB_ID_1") then 
					local count = pc.getqf("MOB_ANZAHL_1") - 1 
					local count2 = pc.getqf("MOB_ANZAHL_2") 
					if count >= 0 then 
						pc.setqf("MOB_ANZAHL_1", count) 
						q.set_counter(mob_name(pc.getqf("MOB_ID_1")), count) 
						if count == 0 and count2 == 0 then 
							pc.setqf("Is_Finished", 1) 
							send_letter(liste[quest_id][6]) 
						end 
					end 
				end 
				if npc.get_race() == pc.getqf("MOB_ID_2") then 
					local count2 = pc.getqf("MOB_ANZAHL_2") - 1 
					local count = pc.getqf("MOB_ANZAHL_1") 
					if count2 >= 0 then 
						pc.setqf("MOB_ANZAHL_2", count2) 
						q.set_counter(mob_name(pc.getqf("MOB_ID_2")), count2)
						if count2 == 0 and count == 0 then 
							pc.setqf("Is_Finished", 1) 
							send_letter(liste[quest_id][6]) 
						end 
					end 
				end 
			end 
		end 
	end
end  