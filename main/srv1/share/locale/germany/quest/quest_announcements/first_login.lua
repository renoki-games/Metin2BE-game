quest first_login begin
	state start begin
		when login begin
			pc.set_skill_level(126, 20)
			pc.set_skill_level(127, 20)
			pc.set_skill_level(128, 20)

			name = clickable_pn_tag(NAME_COLOR, pc.get_name())
			job = ({"Krieger","Ninja","Sura","Schamanen"})[pc.job+1]
			empire = ({"Shinsoo","Chunjo","Jinno"})[pc.get_empire()]

			text = string.format("|cffa7ffd4Wir begrüßen|r %s |cffa7ffd4als neuen %s in %s. Herzlich Willkommen!|r", name, job, empire)
			notice_all(tag(SERVER_COLOR, "[Server]") .. " " .. text)
			complete_quest()
		end
	end
	state __COMPLETE__ begin
	end
end