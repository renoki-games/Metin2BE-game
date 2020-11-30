quest warp_grotte begin
	state start begin
		when 20093.chat."In die Grotte eintreten" begin
			say_title("Koe-Pung:")
			say("")
			say("Halt! Ich bin Koe-Pung vom Drachenorden, Hüter")
			say("des Portals. Nur mit der Erlaubnis des Ordens und")
			say("wenn du mir einen Blutstein vorzeigen kannst,")
			say("darfst du passieren!")
			say("")
			wait()
			say_title("Koe-Pung:")
			say("")
			if pc.get_level() < 75 then	
				say("Du kannst erst mit Level 75 in die Grotte der")
				say("Verbannung eintreten.")
				say("")
				return
			end
			if pc.count_item(30190) == 0 and pc.count_item(30191) == 0 then
				say("Ich kann dich nicht passieren lassen. Komm")
				say("wieder, wenn du im Besitz eines Blutsteins")
				say("bist.")
				say("")
				return
			end
			say("Möchtest du in die Grotte eintreten?")
			local sel_1 = select("Blutstein geben", "Nicht eintreten") 
			if 1 == sel_1 then
				if pc.count_item(30190) > 0 and pc.count_item(30191) > 0 then
					say_title("Koe-Pung:")
					say("")
					say("Du hast 2 verschiedene Blutsteine bei dir!")
					say("Welchen möchtest du abgeben?")
					local sel_2 = select("Handelbaren", "Nicht handelbaren", "Abbrechen")
					if 1 == sel_2 then
						pc.remove_item(30190, 1)
						pc.warp(10000, 1206200)
					elseif 2 == sel_2 then
						pc.remove_item(30191, 1)
						pc.warp(10000, 1206200)
					else
						return
					end
				elseif pc.count_item(30190) == 0 and pc.count_item(30191) == 0 then
					say_title("Koe-Pung:")
					say("")
					say("Du hast keine Blutsteine bei dir!")
					return
				else
					if pc.count_item(30190) > 0 then
						pc.remove_item(30190, 1)
						pc.warp(10000, 1206200)
					elseif pc.count_item(30191) > 0 then
						pc.remove_item(30191, 1)
						pc.warp(10000, 1206200)
					end
				end
			end
		end
	end
end
					