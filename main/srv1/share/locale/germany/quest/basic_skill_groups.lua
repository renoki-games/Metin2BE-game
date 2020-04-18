quest setskills begin
	state start begin
		when login with pc.getqf("first_login") == 0 begin
			pc.set_skill_level(126, 20)
			pc.set_skill_level(127, 20)
			pc.set_skill_level(128, 20)
			pc.setqf("first_login", 1)
		end
	end
end