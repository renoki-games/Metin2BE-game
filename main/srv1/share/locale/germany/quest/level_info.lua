quest level_info begin
	state start begin
		when levelup begin
			if pc.level == 100 and not pc.is_gm() then
				notice_all(string.format("[Server] %s hat das maximal Level von %d erreicht, Glückwunsch!", pc.get_name(), 100))
			end
		end
	end
end