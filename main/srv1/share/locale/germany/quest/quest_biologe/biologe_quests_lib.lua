
function setupBioQuestCounter()
	pc.setqf("collectCount", 0)
end


function updateBioQuestCounter()
	pc.setqf("collectCount", pc.getqf("collectCount") + 1)
end

function getBioQuestCount()
	return pc.getqf("collectCount")
end