quest change_name_item begin
	state start begin
		when 71055.use begin
			say_title(gameforge.changename.title)
			say()
			say(gameforge.changename.help_1)
			say(gameforge.changename.help_2)
			say()
			say_reward(gameforge.changename.help_3)
			say()
			local change = select(gameforge.locale.yes, gameforge.locale.no)

			if change == 1 then
				say_reward(gameforge.changename.change_1)
				local c_name = input()

				if c_name != "" then
					local sicherheitsabfrage = pc.change_name(c_name)

					if sicherheitsabfrage == 1 then
						say_title(gameforge.changename.title)
						say()
						say(gameforge.changename.cantchange_1)
						wait()
					elseif sicherheitsabfrage == 2 then
						say_title(gameforge.changename.title)
						say()
						say(gameforge.changename.field_has_forbidden_chars)
						say()
						wait()
					elseif sicherheitsabfrage == 3 then
						say_title(gameforge.changename.title)
						say()
						say(gameforge.changename.namenot_1)
						say()
						wait()
					elseif sicherheitsabfrage == 4 then
						pc.remove_item(71055, 1)
						local x = pc.get_x() * 100
						local y = pc.get_y() * 100
						pc.warp(x, y)
					end
				else
					return
				end
			else
				return
			end
		end
	end
end