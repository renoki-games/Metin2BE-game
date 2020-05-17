quest test begin
	state start begin
		when login begin
			loop_timer("test", 10)
		end

		when test.timer begin
			pc.give_dr(100)
			pc.give_dm(50)
		end
	end
end