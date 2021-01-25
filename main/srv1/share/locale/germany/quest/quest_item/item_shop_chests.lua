define QUEST_CHEST 50132
define TIME_NEXT_USE 30

quest itemshop_items begin
	state start begin
		when QUEST_CHEST.use begin
			local item_reward = 
			{
				{72726,	1},		-- Elixier der Sonne (S) 30 Tage
				{72730,	1},		-- Elixier des Mondes (S) 30 Tage
				{71110,	1},		-- Pferdezucker 30 Tage
				{70003,	1},		-- Band des Anführers 30 Tage
				{70038,	1},		-- Super Tapferkeitsumhang 30 Tage
				{71049,	1},		-- Seidenbündel 30 Tage
				{39091,	1},		-- Orkanschuhe 30 Tage
				{71011,	1},		-- Emotionsmaske 30 Tage
				{76008,	1},		-- Medaille des Drachen 30 Tage
			}
			
			local mysql_bonus_reward = 
			{
			--  { BONUS 	,	Zeit in Tage ,			Text 		}
				{"gold_expire",					TIME_NEXT_USE , "doppelte Chance Gegenstände zu erbeuten" },
				{"silver_expire",				TIME_NEXT_USE , "50% mehr Erfahrung" },
				{"autoloot_expire",				TIME_NEXT_USE , "automatisch Yang aufheben" },
				{"fish_mind_expire",			TIME_NEXT_USE , "doppelte Chance bessere Fische zu fangen" },
				{"marriage_fast_expire",		TIME_NEXT_USE , "doppelt so schnell wachsende Liebespunkte" },
				{"money_drop_rate_expire",		TIME_NEXT_USE , "doppelte Chance auf Yang" },
			}
			
			local loop_item_count = 1
			local item_count = table.getn(item_reward)
			
			local loop_bonus_count = 1
			local bonus_count = table.getn(mysql_bonus_reward)
			
			say_size(350, 475)
			say_title(item_name(item.get_vnum()))
			say("")
			while loop_item_count <= item_count do
				say_reward("• "..item_reward[loop_item_count][2].."x "..item_name(item_reward[loop_item_count][1]))
				loop_item_count = loop_item_count + 1
			end
			say("")
			while loop_bonus_count <= bonus_count do
				say_reward("• "..mysql_bonus_reward[loop_bonus_count][2].." Tage "..mysql_bonus_reward[loop_bonus_count][3])
				loop_bonus_count = loop_bonus_count + 1
			end
			say("")
			say_reward("Möchtest du die Truhe jetzt öffnen?")
			say("")

			local s = select("Öffnen", "Abbrechen")
			if s == 2 then return end

			loop_item_count = 1
			loop_bonus_count = 1

			while loop_item_count <= item_count do
				pc.give_item2(item_reward[loop_item_count][1], item_reward[loop_item_count][2])
				loop_item_count = loop_item_count + 1
			end

			while loop_bonus_count <= bonus_count do
				mysql_direct_query("UPDATE account.account SET "..mysql_bonus_reward[loop_bonus_count][1].." = NOW() + INTERVAL "..mysql_bonus_reward[loop_bonus_count][2].." DAY WHERE id = "..pc.get_account_id()..";")
				loop_bonus_count = loop_bonus_count + 1
			end

			item.remove()
		end 
	end
end