function selectHorseAppearence(itemVnum)
	say_title("Stallbursche")
	say()
	say("W‰hle das Aussehen deines Pferdes:")
	say()
	local sel = select("Weiﬂes Pferd", "Braunes Pferd", "Schwarzes Pferd", "Abbrechen")
	if sel == 4 then return false end

	giveHorseItem(itemVnum, sel)
	return true
end

function giveHorseItem(itemVnum, idx) -- 0 to 2 for ex. 20101/20102/20103
	pc.give_item2_select(itemVnum)

	local horseVnum = item.get_value(3) + (idx - 1)
	item.set_socket(0, horseVnum)
end
