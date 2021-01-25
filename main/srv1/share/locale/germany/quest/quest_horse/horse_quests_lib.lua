function setTarget(vnum)
	local vid = find_npc_by_vnum(vnum)
	if not vid then return end

	target.vid(tostring(vnum), vid, mob_name(vnum))
end

function numberDot(amount)
	local withDot = amount

	while true do  
		withDot, vid = string.gsub(withDot, "^(-?%d+)(%d%d%d)", '%1.%2')

		if (vid == 0) then
			break
		end
	end

	return withDot
end

function deleteTarget(vnum)
	target.delete(tostring(vnum))
end

function printQuestHeader(title)
	local title = title or "Information"

	say_title(title)
	say("")
end

function printQuestInfo(text)
	local text = text or "Aufgabe:"

	say_reward(text)
end

function sayQuestText(text, value)
	say2(text)

	if not value then
		say("")
	end
end