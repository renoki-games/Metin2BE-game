-----------------------------
-- Fertigkeitslehrer-Quest --
---- DE-Like by AntiMask ----
----- Stand Februar 2012 ----
-----------------------------

quest skill_group begin
	state start begin
		when login or levelup with pc.get_level() >=5 and pc.get_skill_group() == 0 begin
			set_state(run)
		end
	end
	
	state run begin
		when login with pc.get_skill_group() != 0 begin
			restart_quest()
		end
	
		when letter with pc.get_skill_group() == 0 begin
			send_letter("Die Ausbildung")
	
			local job = pc.get_job()
	
			if job == 0 then
				local v = pc_find_skill_teacher_vid(1)
				
				if v != 0 then
					target.vid("teacher1", v, "Die Ausbildung")
				end
				
				local v = pc_find_skill_teacher_vid(2)
				
				if v != 0 then
					target.vid("teacher2", v, "Die Ausbildung")
				end
			elseif job == 1 then
				local v = pc_find_skill_teacher_vid(1)
				
				if v != 0 then
					target.vid("teacher3", v, "Die Ausbildung")
				end
				
				local v = pc_find_skill_teacher_vid(2)
				
				if v != 0 then
					target.vid("teacher4", v, "Die Ausbildung")
				end
			elseif job == 2 then
				local v = pc_find_skill_teacher_vid(1)
				
				if v != 0 then
					target.vid("teacher5", v, "Die Ausbildung")
				end
				
				local v = pc_find_skill_teacher_vid(2)
				
				if v != 0 then
					target.vid("teacher6", v, "Die Ausbildung")
				end
			elseif job == 3 then
				local v = pc_find_skill_teacher_vid(1)
				
				if v != 0 then
					target.vid("teacher7", v, "Die Ausbildung")
				end
				
				local v = pc_find_skill_teacher_vid(2)
				
				if v != 0 then
					target.vid("teacher8", v, "Die Ausbildung")
				end
			end
		end
	
		when leave begin
			target.delete("teacher1")
			target.delete("teacher2")
			target.delete("teacher3")
			target.delete("teacher4")
			target.delete("teacher5")
			target.delete("teacher6")
			target.delete("teacher7")
			target.delete("teacher8")
		end
	
		when button or info begin
			if pc.get_job() == 0 then
				say_title("Lehrer der Kriegerausbildung:")
				say("Wenn du einen Krieger wegen seiner schnellen und")
				say("wiederholten Angriffsfähigkeit bewunderst,")
				say("empfehle ich die Körper-Kampf-Lehre. Wenn du")
				say("ganze Gruppen von Monstern mit einem Schlag")
				say("auslöschen möchtest, empfehle ich die")
				say("Mental-Kampf-Lehre. Wir erwarten dich in der Nähe")
				say("des Dorfplatzes.")
				say("")
				select("Bestätigen")
				setskin(NOWINDOW)
			elseif pc.get_job() == 1 then
				say_title("Lehrer der Ninjaausbildung:")
				say("Wenn du dir einen Namen als hervorragender")
				say("Schütze machen willst, dann mache eine")
				say("Fernkampf-Lehre. Wenn du bereit bist, geheime")
				say("Missionen im Schutze der Dunkelheit auszuführen,")
				say("ist die Nahkampf-Lehre etwas für dich.")
				say("Wir erwarten dich in der Nähe des Dorfplatzes.")
				say("")
				select("Bestätigen")
				setskin(NOWINDOW)
			elseif pc.get_job() == 2 then
				say_title("Lehrer der Suraausbildung:")
				say("Möchtest du ein wahrer Schwertmagier und")
				say("dämonischer Kämpfer sein? Dann empfehle")
				say("ich die Magische-Waffen-Lehre. Wenn du jedoch")
				say("willst, dass du als Zauberer der Finsternis und")
				say("der Flüche gefürchtet wirst, dann wähle die")
				say("Schwarze-Magie-Lehre.")
				say("Wir erwarten dich in der Nähe des Dorfplatzes.")
				say("")
				select("Bestätigen")
				setskin(NOWINDOW)
			elseif pc.get_job() == 3 then
				say_title("Lehrer der Schamanenausbildung:")
				say("Wenn du ein Schamane sein möchtest, der den")
				say("Einsatz von Magie und das unterstützende Segnen")
				say("beherrscht, dann wähle die Drachenmacht-Lehre.")
				say("Wenn du jedoch den Schmerz und das Leid der")
				say("Anderen lindern willst, dann empfehle ich die")
				say("Lehre der Heilung.")
				say("Wir erwarten dich in der Nähe des Dorfplatzes.")
				say("")
				select("Bestätigen")
				setskin(NOWINDOW)
			end
		end
		
		
		function join(teacher_job, teacher_group)
			local pc_job = pc.get_job()
			if pc_job != teacher_job then
				say_title("Falsche Lehre")
				say("Tut mir leid.")
				if teacher_job == 1 and teacher_group == 1 then
					say("Nur Ninja können die Nahkampf-Lehre wählen.")
				elseif teacher_job == 1 and teacher_group == 2 then
					say("Nur Ninja können die Fernkampf-Lehre wählen.")
				elseif teacher_job == 2 and teacher_group == 1 then
					say("Nur Sura können die Magische-Waffen-Lehre")
					say("wählen.")
				elseif teacher_job == 2 and teacher_group == 2 then
					say("Nur Sura können die Schwarze-Magie-Lehre")
					say("wählen.")
				elseif teacher_job == 3 and teacher_group == 1 then
					say("Nur Schamanen können die Drachenmacht-Lehre")
					say("wählen.")
				elseif teacher_job == 3 and teacher_group == 2 then
					say("Nur Schamanen können die Lehre der Heilung")
					say("wählen.")
				end
				
				if pc_job == 0 then
					say_reward("Ein Krieger kann zwischen der Körper-Kampf-Lehre")
					say_reward("und der Mental-Kampf-Lehre wählen.")
				elseif pc_job == 1 then
					say_reward("Ein Ninja kann zwischen der Nahkampf-Lehre und")
					say_reward("der Fernkampf-Lehre wählen.")
				elseif pc_job == 2 then
					say_reward("Ein Sura kann zwischen der Magische-Waffen-Lehre")
					say_reward("und der Schwarze-Magie-Lehre wählen.")
				elseif pc_job == 3 then
					say_reward("Ein Schamane kann zwischen der Lehre der")
					say_reward("Drachenmacht und der Lehre der Heilung wählen.")
				end
			else
				if teacher_job == 0 then
					if teacher_group == 1 then
						say_title("Körper-Kampf-Lehre")
						say("Ein Schüler der Körper-Kampf-Lehre trainiert")
						say("seine Körperkraft und lernt sie auch")
						say("gewinnbringend einzusetzen. Seine Angriffe")
						say("schlagen tiefe Wunden, so dass der Gegner schnell")
						say("besiegt ist.")
					elseif teacher_group == 2 then
						say_title("Mental-Kampf-Lehre")
						say("Ein Schüler der Mental-Kampf-Lehre trainiert")
						say("seinen Geist und spezialisiert sich auf")
						say("vorausdenkendes Kämpfen. Dadurch ist er in der")
						say("Lage, Angriffe seiner Gegner effektiver")
						say("abzuwehren.")
					end
					say_reward("Anforderung: Krieger ab Level 5")
				elseif teacher_job == 1 then
					if teacher_group == 1 then
						say_title("Nahkampf-Lehre")
						say("In der Nahkampf-Lehre werden Ninja darin")
						say("ausgebildet, den Feind mit schnellen und")
						say("tödlichen Schlägen genau an seinen Schwachstellen")
						say("zu treffen.")
					elseif teacher_group == 2 then
						say_title("Fernkampf-Lehre")
						say("In der Fernkamf-Lehre lernen die Ninja, ihre")
						say("Feinde mit einem Bogen präzise auf Distanz zu")
						say("bekämpfen.")
					end
					say_reward("Anforderung: Ninja ab Level 5")
				elseif teacher_job == 2 then
					if teacher_group == 1 then
						say_title("Magische-Waffen_lehre")
						say("In der Magische-Waffen-Lehre übt man die Kunst")
						say("des gewaltigen Schlags gegen geschwächte Feinde,")
						say("wobei verfluchte Klingen geschwungen werden.")
					elseif teacher_group == 2 then
						say_title("Schwarze-Magie-Lehre")
						say("In der Schwarze-Magie-Lehre verwendet man dunkle")
						say("Künste, um Feinde mit Flüchen auf Distanz zu")
						say("schwächen.")
					end
					say_reward("Anforderung: Sura ab Level 5")
				elseif teacher_job == 3 then
					if teacher_group == 1 then
						say_title("Drachenmacht-Lehre")
						say("Die Drachenmacht-Lehre verwendet starke")
						say("Feuerangriffe des Drachengottes. Sie nutzt")
						say("Verstärkungsmagie und kann der Gruppe den Schutz")
						say("des Drachengottes geben.")
					elseif teacher_group == 2 then
						say_title("Lehre der Heilung")
						say("In der Lehre der Heilung lernt man, Feinde durch")
						say("Stromschläge zu betäuben. Zusätzlich lernt man,")
						say("Gruppenmitglieder zu heilen und zu stärken.")
					end
					say_reward("Anforderung: Schamanen ab Level 5")
				end
				say("")
				
				local s = select("Beginnen", "Für später vormerken")
				
				if s == 1 then
					if pc.get_job() == teacher_job and pc.get_skill_group() == 0 then
						pc.set_skill_group(teacher_group)
						pc.clear_skill()
						if    not pc.is_clear_skill_group() then
							if pc.get_job() == 0 then
								if pc.get_skill_group() == 1 then
									say_title("Du hast die Körper-Kampf-Lehre gewählt.")
								elseif pc.get_skill_group() == 2 then
									say_title("Du hast die Mental-Kampf-Lehre gewählt.")
								end
							elseif pc.get_job() == 1 then
								if pc.get_skill_group() == 1 then
									say_title("Du hast die Nahkampf-Lehre gewählt.")
								elseif pc.get_skill_group() == 2 then
									say_title("Du hast die Fernkampf-Lehre gewählt.")
								end
							elseif pc.get_job() == 2 then
								if pc.get_skill_group() == 1 then
									say_title("Du hast die Magische-Waffen-Lehre gewählt.")
								elseif pc.get_skill_group() == 2 then
									say_title("Du hast die Schwarze-Magie-Lehre gewählt.")
								end
							elseif pc.get_job() == 3 then
								if pc.get_skill_group() == 1 then
									say_title("Du hast die Drachenmacht-Lehre gewählt.")
								elseif pc.get_skill_group() == 2 then
									say_title("Du hast die Lehre der Heilung gewählt.")
								end
							end
							local skill_points = pc.get_level() - 1
							say("Wilkommen!")
							say("Mit der Entscheidung zu einer Lehre erhältst du")
							say(""..skill_points.." Fertigkeitspunkte. Diese kannst du einsetzen,")
							say("um Fertigkeiten deiner Wahl zu steigern.")
							say_title("Information:")
							say_reward("Du hast "..skill_points.." Fertigkeitspunkte erhalten.")
							say("")
						else
							say_title("Fehler")
							say("Setze deine Fertigkeiten zurück.")
							say("Versuche es anschliessend erneut.")
							say("")
						end
						restart_quest()
					end
				end
			end
		end
	
		when teacher1.target.click or 
			skill_group1_1.chat."Beginne die Körper-Kampf-Lehre" or
			skill_group2_1.chat."Beginne die Körper-Kampf-Lehre" or
			skill_group3_1.chat."Beginne die Körper-Kampf-Lehre" 
			begin
			target.delete("teacher1")
			skill_group.join(0, 1)
		end
	
		when teacher2.target.click or 
			skill_group1_2.chat."Beginne die Mental-Kampf-Lehre" or
			skill_group2_2.chat."Beginne die Mental-Kampf-Lehre" or
			skill_group3_2.chat."Beginne die Mental-Kampf-Lehre" 
			begin 
			target.delete("teacher2")
			skill_group.join(0, 2)
		end
	
		when teacher3.target.click or 
			skill_group1_3.chat."Beginne die Nahkampf-Lehre" or
			skill_group2_3.chat."Beginne die Nahkampf-Lehre" or
			skill_group3_3.chat."Beginne die Nahkampf-Lehre" 
			begin 
			target.delete("teacher3")
			skill_group.join(1, 1)
		end
	
		when teacher4.target.click or 
			skill_group1_4.chat."Beginne die Fernkampf-Lehre" or
			skill_group2_4.chat."Beginne die Fernkampf-Lehre" or
			skill_group3_4.chat."Beginne die Fernkampf-Lehre" 
			begin 
			target.delete("teacher4")
			skill_group.join(1, 2)
		end
	
		when teacher5.target.click or 
			skill_group1_5.chat."Beginne die Magische-Waffen-Lehre" or
			skill_group2_5.chat."Beginne die Magische-Waffen-Lehre" or
			skill_group3_5.chat."Beginne die Magische-Waffen-Lehre"
			begin 
			target.delete("teacher5")
			skill_group.join(2, 1)
		end
	
		when teacher6.target.click or 
			skill_group1_6.chat."Beginne die Schwarze-Magie-Lehre" or
			skill_group2_6.chat."Beginne die Schwarze-Magie-Lehre" or
			skill_group3_6.chat."Beginne die Schwarze-Magie-Lehre" 
			begin 
			target.delete("teacher6")
			skill_group.join(2, 2)
		end
	
		when teacher7.target.click or 
			skill_group1_7.chat."Beginne die Drachenmacht-Lehre" or
			skill_group2_7.chat."Beginne die Drachenmacht-Lehre" or
			skill_group3_7.chat."Beginne die Drachenmacht-Lehre" 
			begin 
			target.delete("teacher7")
			skill_group.join(3, 1)
		end
		
		when teacher8.target.click or 
			skill_group1_8.chat."Beginne die Lehre der Heilung" or
			skill_group2_8.chat."Beginne die Lehre der Heilung" or
			skill_group3_8.chat."Beginne die Lehre der Heilung" 
			begin 
			target.delete("teacher8")
			skill_group.join(3, 2)
		end
	end
end