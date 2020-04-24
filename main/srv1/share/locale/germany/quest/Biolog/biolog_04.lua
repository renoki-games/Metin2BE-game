quest biolog_04 begin
	state finish_lv40 begin
		when login or levelup with pc.get_level() >= 50 begin
            -- Biologe 4 Quest schreiben
        end
	end
end