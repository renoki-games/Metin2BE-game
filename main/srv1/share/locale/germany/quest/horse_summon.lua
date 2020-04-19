quest horse_summon begin
	state start begin
		when 50053.use begin
			if horse.is_riding() then
				horse.unride()
			elseif horse.is_summon() then
				horse.unsummon()
			else
				notice("Dein Pferd wurde erfolgreich gerufen.")
				horse.summon()
			end
		end
	end
end 