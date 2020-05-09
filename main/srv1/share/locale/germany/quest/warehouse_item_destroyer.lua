quest warehouse_item_destroyer begin
	state start begin
		when 9005.chat."Item zerstören Information" begin
			say_title(mob_name(npc.get_race()).. ":")
			say("")
			say("Willkommen " ..pc.get_name().. ",")
			say("Bei mir kannst du Items zerstören.")
			say("Du kannst sogar einen ganzen Stapel zerstören.")
			say("Zieh das Item einfach auf mich drauf.")
			say("")
		end
		when 9005.take begin
			local c = item.count
			local i = item.vnum
			say_title(mob_name(npc.get_race()).. ":")
			say("")
			if pc.is_gm() then
				say("(GM) Vnum: " ..i)
				say("(GM) ID: " ..item.get_id())
			end
			if c <= 1 then
				say_reward("Möchtest du " ..item_name(i).. " zerstören?")
			else
				say_reward("Möchtest du " ..c.. "x " ..item_name(i).. " zerstören?")
			end
			say("")
			local s = select("Zerstören", "Abbrechen")
			if s == 2 then return end
			item.remove()
		end
	end
end