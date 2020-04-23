quest horsecandy begin
	state start begin
		when 71110.use begin
			say_title("Wie soll dein Pferd heißen?")
			local name = input()
			local result = horse.set_name(name)

			say_title("Pferdename")
			say()

			if result == 1 then
				say("Dieser Pferdename ist nicht zulässig.")
				return
			end

			say(string.format("Dein Pferd heißt nun %s", name))
			say()
			item.remove()
		end
	end
end