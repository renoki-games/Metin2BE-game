-- #################################################################
-- ##                                                             ##
-- ##                        LOCALE.LUA                           ##
-- ##                                                             ##
-- ## Background:                                                 ##
-- ##   This file provides Metin2 with one big array!             ##
-- ##   This array contains some configurations values and a lot  ##
-- ##   of strings to translate. Also every quest-file contains   ##
-- ##   string to translate.                                      ##
-- ##                                                             ##
-- ## Gameforge-Way-To-Do:                                        ##
-- ##   We extract everything we need to translate from this file ##
-- ##   into one big "Key = Value"-file. Simple key-value-files   ##
-- ##   can be managed by our localisation-tool.                  ##
-- ##   Also we extract every string out of every .quest-file and ##
-- ##   generate a lots of new keys. These keys are used in the   ##
-- ##   .quest-files.                                             ##
-- ##                                                             ##
-- ##   !! The key-value-file is called 'translate.lua'           ##
-- ##                                                             ##
-- ## The Advantage:                                              ##
-- ##   1) We can easily translate everything with our tool       ##
-- ##   2) We cant create syntax-errors in this file              ##
-- ##   3) We cant create syntax-errors in the quest-files        ##
-- ##   4) We can compare the quest-files between two languages   ##
-- ##      to find differences if something is broken in only     ##
-- ##      country.                                               ##
-- ##                                                             ##
-- #################################################################

locale = {}
locale.man_postfix = gameforge[get_language()].locale.man_postfix
locale.woman_postfix = gameforge[get_language()].locale.woman_postfix
locale.confirm = gameforge[get_language()].locale.confirm
locale.reward = gameforge[get_language()].locale.reward
locale.exp = gameforge[get_language()].locale.exp
locale.count_prefix = gameforge[get_language()].locale.count_prefix
locale.count_postfix = gameforge[get_language()].locale.count_postfix
locale.level = gameforge[get_language()].locale.level
locale.quest_word = gameforge[get_language()].locale.quest_word
locale.complete = gameforge[get_language()].locale.complete
locale.start = gameforge[get_language()].locale.start
locale.chat = gameforge[get_language()].locale.chat
locale.eliminate_on_begin = gameforge[get_language()].locale.eliminate_on_begin
locale.eliminate_on_end = gameforge[get_language()].locale.eliminate_on_end
locale.yes = gameforge[get_language()].locale.yes
locale.no = gameforge[get_language()].locale.no
locale.cancel = gameforge[get_language()].locale.cancel
locale.gold = gameforge[get_language()].locale.gold
locale.need_item_prefix = gameforge[get_language()].locale.need_item_prefix
locale.need_item_postfix = gameforge[get_language()].locale.need_item_postfix
locale.map_name = {
	[61] = gameforge[get_language()].locale.map_name_1,
	[62] = gameforge[get_language()].locale.map_name_2,
	[63] = gameforge[get_language()].locale.map_name_3,
	[64] = gameforge[get_language()].locale.map_name_4,
}
locale.empire_names = {
	[0] = gameforge[get_language()].locale.empire_names_1,
	[1] = gameforge[get_language()].locale.empire_names_2,
	[2] = gameforge[get_language()].locale.empire_names_3,
	[3] = gameforge[get_language()].locale.empire_names_4,
}
locale.item_drop_pct = gameforge[get_language()].locale.item_drop_pct
locale.gold_drop_pct = gameforge[get_language()].locale.gold_drop_pct
locale.tengold_drop_pct = gameforge[get_language()].locale.tengold_drop_pct
locale.exp_pct = gameforge[get_language()].locale.exp_pct
locale.show_guild_ranking_top = gameforge[get_language()].locale.show_guild_ranking_top
locale.show_guild_ranking_around = gameforge[get_language()].locale.show_guild_ranking_around
locale.show_guild_cur_score = gameforge[get_language()].locale.show_guild_cur_score
locale.guild_around_rank_msg = gameforge[get_language()].locale.guild_around_rank_msg
locale.guild_top_rank_msg = gameforge[get_language()].locale.guild_top_rank_msg
locale.guild_rank_head = gameforge[get_language()].locale.guild_rank_head
locale.guild_your_rank1 = gameforge[get_language()].locale.guild_your_rank1
locale.guild_your_rank2 = gameforge[get_language()].locale.guild_your_rank2
locale.guild_your_rank3 = gameforge[get_language()].locale.guild_your_rank3
locale.deviltower_man_chat = gameforge[get_language()].locale.deviltower_man_chat
locale.deviltower_man_say = gameforge[get_language()].locale.deviltower_man_say
locale.deviltower_man_say_you_cant = gameforge[get_language()].locale.deviltower_man_say_you_cant 
locale.deviltower_enter = gameforge[get_language()].locale.deviltower_enter
locale.deviltower_no_enter = gameforge[get_language()].locale.deviltower_no_enter
locale.forked_man_chat = gameforge[get_language()].locale.forked_man_chat
locale.forked_man_say = gameforge[get_language()].locale.forked_man_say
locale.forked_man_say_cant = gameforge[get_language()].locale.forked_man_say_cant
locale.forked_enter = gameforge[get_language()].locale.forked_enter
locale.forked_no_enter = gameforge[get_language()].locale.forked_no_enter
locale.forked_open_gate = gameforge[get_language()].locale.forked_open_gate
locale.forked_kill_boss = gameforge[get_language()].locale.forked_kill_boss
locale.forked_condition = gameforge[get_language()].locale.forked_condition
locale.forked_condition2 = gameforge[get_language()].locale.forked_condition2
locale.forked_rule = gameforge[get_language()].locale.forked_rule
locale.forked_rule_sungzi = gameforge[get_language()].locale.forked_rule_sungzi
locale.login_notice = gameforge[get_language()].locale.login_notice
locale.NOTICE_COLOR = color256(255, 230, 186)
locale.NORMAL_COLOR = color256(196, 196, 196)
locale.QUEST_TEMP_REWARD = locale.NOTICE_COLOR .. gameforge[get_language()].locale.quest_temp_reward_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.quest_temp_reward_2 

locale.yeonnahwan = {}
locale.yeonnahwan.start_level_begin = 99
locale.yeonnahwan.start_level_end = 99
locale.yeonnahwan.start_probability = 1
locale.yeonnahwan.end_level = 99
locale.yeonnahwan.kill_count = 1
locale.yeonnahwan.event_item = gameforge[get_language()].locale.yeonnahwan.event_item
locale.yeonnahwan.find_yeonnahwan_label = gameforge[get_language()].locale.yeonnahwan.find_yeonnahwan_label
locale.yeonnahwan.find_yeonnahwan_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.yeonnahwan.find_yeonnahwan_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.yeonnahwan.find_yeonnahwan_text_2
locale.yeonnahwan.find_eulduji_label = gameforge[get_language()].locale.yeonnahwan.find_eulduji_label
locale.yeonnahwan.find_eulduji_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.yeonnahwan.find_eulduji_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.yeonnahwan.find_eulduji_text_2
locale.yeonnahwan.report_label = gameforge[get_language()].locale.yeonnahwan.report_label
locale.yeonnahwan.report_text = gameforge[get_language()].locale.yeonnahwan.report_text
locale.yeonnahwan.kill_unggwi_label = gameforge[get_language()].locale.yeonnahwan.kill_unggwi_label
locale.yeonnahwan.kill_unggwi_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.yeonnahwan.kill_unggwi_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.yeonnahwan.kill_unggwi_text_2

locale.huanso = {}
locale.huanso.start_level_begin = 32
locale.huanso.start_level_end = 35
locale.huanso.start_probability = 3
locale.huanso.end_level = 38
locale.huanso.kill_count = 3
locale.huanso.event_item = 30102
locale.huanso.order_label = gameforge[get_language()].locale.huanso.order_label
locale.huanso.order_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.huanso.order_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.huanso.order_text_2
locale.huanso.too_late = gameforge[get_language()].locale.huanso.too_late
locale.huanso.find_label = gameforge[get_language()].locale.huanso.find_label
locale.huanso.find_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.huanso.find_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.huanso.find_text_2
locale.huanso.kill_label = gameforge[get_language()].locale.huanso.kill_label
locale.huanso.kill_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.huanso.kill_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.huanso.kill_text_2
locale.huanso.make_label = gameforge[get_language()].locale.huanso.make_label
locale.huanso.make_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.huanso.make_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.huanso.make_text_2
locale.huanso.deliver_label = gameforge[get_language()].locale.huanso.deliver_label
locale.huanso.deliver_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.huanso.deliver_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.huanso.deliver_text_2
locale.huanso.success_label = gameforge[get_language()].locale.huanso.success_label
locale.huanso.success_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.huanso.success_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.huanso.success_text_2
locale.huanso.failure_label = gameforge[get_language()].locale.huanso.failure_label
locale.huanso.failure_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.huanso.failure_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.huanso.failure_text_2

locale.yuhwan = {}
locale.yuhwan.start_level_begin = 40
locale.yuhwan.start_level_end = 43
locale.yuhwan.start_probability = 3
locale.yuhwan.end_level = 45
locale.yuhwan.kill_count = 3
locale.yuhwan.event_item = 30102
locale.yuhwan.find_label = gameforge[get_language()].locale.yuhwan.find_label
locale.yuhwan.find_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.yuhwan.find_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.yuhwan.find_text_2
locale.yuhwan.too_late = gameforge[get_language()].locale.yuhwan.too_late
locale.yuhwan.kill_label = gameforge[get_language()].locale.yuhwan.kill_label
locale.yuhwan.kill_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.yuhwan.kill_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.yuhwan.kill_text_2
locale.yuhwan.success_info_label = gameforge[get_language()].locale.yuhwan.success_info_label
locale.yuhwan.success_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.yuhwan.success_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.yuhwan.success_info_text_2
locale.yuhwan.failure_info_label = gameforge[get_language()].locale.yuhwan.failure_info_label
locale.yuhwan.failure_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.yuhwan.failure_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.yuhwan.failure_info_text_2

locale.deokbae = {}
locale.deokbae.start_level_begin = 80
locale.deokbae.start_level_end = 80
locale.deokbae.start_probability = 3
locale.deokbae.end_level = 40
locale.deokbae.kill_count = 3
locale.deokbae.event_item = 30102
locale.deokbae.find_deokbae_label = gameforge[get_language()].locale.deokbae.find_deokbae_label
locale.deokbae.find_deokbae_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.deokbae.find_deokbae_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.deokbae.find_deokbae_text_2
locale.deokbae.too_late = gameforge[get_language()].locale.deokbae.too_late
locale.deokbae.kill_label = gameforge[get_language()].locale.deokbae.kill_label
locale.deokbae.kill_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.deokbae.kill_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.deokbae.kill_text_2
locale.deokbae.success_info_label = gameforge[get_language()].locale.deokbae.success_info_label
locale.deokbae.success_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.deokbae.success_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.deokbae.success_info_text_2
locale.deokbae.failure_info_label = gameforge[get_language()].locale.deokbae.failure_info_label
locale.deokbae.failure_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.deokbae.failure_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.deokbae.failure_info_text_2

locale.bookworm = {}
locale.bookworm.start_level_begin = 28
locale.bookworm.start_level_end = 31
locale.bookworm.start_probability = 3
locale.bookworm.end_level = 34
locale.bookworm.kill_count = 3
locale.bookworm.talk = gameforge[get_language()].locale.bookworm.talk
locale.bookworm.aranyeo_talk = gameforge[get_language()].locale.bookworm.aranyeo_talk
locale.bookworm.etc_shop_talk_about_bookworm = gameforge[get_language()].locale.bookworm.etc_shop_talk_about_bookworm
locale.bookworm.talk_about_milgyo_book = gameforge[get_language()].locale.bookworm.talk_about_milgyo_book
locale.bookworm.do_you_find_the_book = gameforge[get_language()].locale.bookworm.do_you_find_the_book
locale.bookworm.do_you_mean_this_book = gameforge[get_language()].locale.bookworm.do_you_mean_this_book
locale.bookworm.START_say = gameforge[get_language()].locale.bookworm.start_say
locale.bookworm.START_say2 = gameforge[get_language()].locale.bookworm.start_say2
locale.bookworm.aranyeo_START_say = gameforge[get_language()].locale.bookworm.aranyeo_start_say
locale.bookworm.aranyeo_START_say2 = gameforge[get_language()].locale.bookworm.aranyeo_start_say2
locale.bookworm.etc_shop_START_say = gameforge[get_language()].locale.bookworm.etc_shop_start_say
locale.bookworm.etc_shop_START_say2 = gameforge[get_language()].locale.bookworm.etc_shop_start_say2
locale.bookworm.START_find_bookworm_label = gameforge[get_language()].locale.bookworm.start_find_bookworm_label
locale.bookworm.START_find_bookworm_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.bookworm.start_find_bookworm_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.bookworm.start_find_bookworm_text_2
locale.bookworm.ORDER_say1 = gameforge[get_language()].locale.bookworm.order_say1
locale.bookworm.ORDER_say2 = gameforge[get_language()].locale.bookworm.order_say2
locale.bookworm.ORDER_accept = gameforge[get_language()].locale.bookworm.order_accept
locale.bookworm.ORDER_refuse = gameforge[get_language()].locale.bookworm.order_refuse
locale.bookworm.ORDER_accept_answer = gameforge[get_language()].locale.bookworm.order_accept_answer
locale.bookworm.ORDER_refuse_answer = gameforge[get_language()].locale.bookworm.order_refuse_answer
locale.bookworm.ORDER_find_book_label = gameforge[get_language()].locale.bookworm.order_find_book_label
locale.bookworm.ORDER_find_book_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.bookworm.order_find_book_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.bookworm.order_find_book_text_2
locale.bookworm.ORDER_too_late = gameforge[get_language()].locale.bookworm.order_too_late
locale.bookworm.ACCEPT_success_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.bookworm.accept_success_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.bookworm.accept_success_say_2
locale.bookworm.ACCEPT_failure_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.bookworm.accept_failure_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.bookworm.accept_failure_say_2
locale.bookworm.ACCEPT_ask = gameforge[get_language()].locale.bookworm.accept_ask
locale.bookworm.ACCEPT_success_info_label = gameforge[get_language()].locale.bookworm.accept_success_info_label
locale.bookworm.ACCEPT_success_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.bookworm.accept_success_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.bookworm.accept_success_info_text_2
locale.bookworm.ACCEPT_failure_info_label = gameforge[get_language()].locale.bookworm.accept_failure_info_label
locale.bookworm.ACCEPT_failure_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.bookworm.accept_failure_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.bookworm.accept_failure_info_text_2
locale.bookworm.SUCCESS_thanks = gameforge[get_language()].locale.bookworm.success_thanks
locale.bookworm.COMPLETE_say = gameforge[get_language()].locale.bookworm.complete_say
locale.bookworm.aranyeo_COMPLETE_say = gameforge[get_language()].locale.bookworm.aranyeo_complete_say
locale.bookworm.aranyeo_COMPLETE_say2 = gameforge[get_language()].locale.bookworm.aranyeo_complete_say2

locale.old_pirate = {}
locale.old_pirate.start_level_begin = 48
locale.old_pirate.start_level_end = 51
locale.old_pirate.start_probability = 3
locale.old_pirate.end_level = 54
locale.old_pirate.kill_count = 3
locale.old_pirate.talk = gameforge[get_language()].locale.old_pirate.talk
locale.old_pirate.baekgo_talk = gameforge[get_language()].locale.old_pirate.baekgo_talk
locale.old_pirate.etc_shop_talk_about_old_pirate = gameforge[get_language()].locale.old_pirate.etc_shop_talk_about_old_pirate
locale.old_pirate.talk_about_medicine = gameforge[get_language()].locale.old_pirate.talk_about_medicine
locale.old_pirate.do_you_get_the_medicine = gameforge[get_language()].locale.old_pirate.do_you_get_the_medicine
locale.old_pirate.do_you_mean_this_medicine = gameforge[get_language()].locale.old_pirate.do_you_mean_this_medicine
locale.old_pirate.baekgo_talk_about_old_pirate = gameforge[get_language()].locale.old_pirate.baekgo_talk_about_old_pirate
locale.old_pirate.baekgo_do_you_get_the_virus = gameforge[get_language()].locale.old_pirate.baekgo_do_you_get_the_virus
locale.old_pirate.baekgo_iv_got_the_virus = gameforge[get_language()].locale.old_pirate.baekgo_iv_got_the_virus
locale.old_pirate.START_say = gameforge[get_language()].locale.old_pirate.start_say
locale.old_pirate.etc_shop_START_say = gameforge[get_language()].locale.old_pirate.etc_shop_start_say
locale.old_pirate.etc_shop_START_say2 = gameforge[get_language()].locale.old_pirate.etc_shop_start_say2
locale.old_pirate.START_find_old_pirate_label = gameforge[get_language()].locale.old_pirate.start_find_old_pirate_label
locale.old_pirate.START_find_old_pirate_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.start_find_old_pirate_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.start_find_old_pirate_text_2
locale.old_pirate.ORDER_say1 = gameforge[get_language()].locale.old_pirate.order_say1
locale.old_pirate.ORDER_say2 = gameforge[get_language()].locale.old_pirate.order_say2
locale.old_pirate.ORDER_accept = gameforge[get_language()].locale.old_pirate.order_accept
locale.old_pirate.ORDER_refuse = gameforge[get_language()].locale.old_pirate.order_refuse
locale.old_pirate.ORDER_accept_answer = gameforge[get_language()].locale.old_pirate.order_accept_answer
locale.old_pirate.ORDER_refuse_answer = gameforge[get_language()].locale.old_pirate.order_refuse_answer
locale.old_pirate.ORDER_find_medicine_label = gameforge[get_language()].locale.old_pirate.order_find_medicine_label
locale.old_pirate.ORDER_find_medicine_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.order_find_medicine_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.order_find_medicine_text_2
locale.old_pirate.ORDER_too_late = gameforge[get_language()].locale.old_pirate.order_too_late
locale.old_pirate.ACCEPT_success_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.accept_success_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.accept_success_say_2
locale.old_pirate.ACCEPT_failure_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.accept_failure_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.accept_failure_say_2
locale.old_pirate.ACCEPT_ask = gameforge[get_language()].locale.old_pirate.accept_ask
locale.old_pirate.ACCEPT_success_info_label = gameforge[get_language()].locale.old_pirate.accept_success_info_label
locale.old_pirate.ACCEPT_success_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.accept_success_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.accept_success_info_text_2
locale.old_pirate.ACCEPT_failure_info_label = gameforge[get_language()].locale.old_pirate.accept_failure_info_label
locale.old_pirate.ACCEPT_failure_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.accept_failure_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.accept_failure_info_text_2
locale.old_pirate.BAEKGO_START_say = gameforge[get_language()].locale.old_pirate.baekgo_start_say
locale.old_pirate.BAEKGO_START_say2 = gameforge[get_language()].locale.old_pirate.baekgo_start_say2
locale.old_pirate.BAEKGO_START_say3 = gameforge[get_language()].locale.old_pirate.baekgo_start_say3
locale.old_pirate.BAEKGO_ORDER_find_virus_label = gameforge[get_language()].locale.old_pirate.baekgo_order_find_virus_label
locale.old_pirate.BAEKGO_ORDER_find_virus_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_order_find_virus_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_order_find_virus_text_2
locale.old_pirate.BAEKGO_ORDER_too_late = gameforge[get_language()].locale.old_pirate.baekgo_order_too_late
locale.old_pirate.BAEKGO_ACCEPT_success_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_accept_success_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_accept_success_say_2
locale.old_pirate.BAEKGO_ACCEPT_failure_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_accept_failure_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_accept_failure_say_2
locale.old_pirate.BAEKGO_ACCEPT_ask = gameforge[get_language()].locale.old_pirate.baekgo_accept_ask
locale.old_pirate.BAEKGO_ACCEPT_success_info_label = gameforge[get_language()].locale.old_pirate.baekgo_accept_success_info_label
locale.old_pirate.BAEKGO_ACCEPT_success_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_accept_success_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_accept_success_info_text_2
locale.old_pirate.BAEKGO_ACCEPT_failure_info_label = gameforge[get_language()].locale.old_pirate.baekgo_accept_failure_info_label
locale.old_pirate.BAEKGO_ACCEPT_failure_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_accept_failure_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.old_pirate.baekgo_accept_failure_info_text_2
locale.old_pirate.BAEKGO_SUCCESS_say = gameforge[get_language()].locale.old_pirate.baekgo_success_say
locale.old_pirate.SUCCESS_thanks = gameforge[get_language()].locale.old_pirate.success_thanks
locale.old_pirate.COMPLETE_say = gameforge[get_language()].locale.old_pirate.complete_say

locale.stamina_food = {}
locale.stamina_food.butcher = {}
locale.stamina_food.food_manager = {}
locale.stamina_food.start_probability = 3
locale.stamina_food.start_level_begin = 90
locale.stamina_food.start_level_end = 90
locale.stamina_food.end_level = 59
locale.stamina_food.kill_count = 3
locale.stamina_food.butcher.talk = gameforge[get_language()].locale.stamina_food.butcher.talk
locale.stamina_food.food_manager.talk = gameforge[get_language()].locale.stamina_food.food_manager.talk
locale.stamina_food.food_manager.talk_about_greeenfrog_soup = gameforge[get_language()].locale.stamina_food.food_manager.talk_about_greeenfrog_soup
locale.stamina_food.i_dont_have_the_greeenfrog_meat_yet = gameforge[get_language()].locale.stamina_food.i_dont_have_the_greeenfrog_meat_yet
locale.stamina_food.i_have_the_greenfrog_meat = gameforge[get_language()].locale.stamina_food.i_have_the_greenfrog_meat
locale.stamina_food.butcher.START_say = gameforge[get_language()].locale.stamina_food.butcher.start_say
locale.stamina_food.butcher.START_say2 = gameforge[get_language()].locale.stamina_food.butcher.start_say2
locale.stamina_food.food_manager.ORDER_say = gameforge[get_language()].locale.stamina_food.food_manager.order_say
locale.stamina_food.food_manager.ORDER_say2 = gameforge[get_language()].locale.stamina_food.food_manager.order_say2
locale.stamina_food.ORDER_accept = gameforge[get_language()].locale.stamina_food.order_accept
locale.stamina_food.ORDER_refuse = gameforge[get_language()].locale.stamina_food.order_refuse
locale.stamina_food.ORDER_accept_answer = gameforge[get_language()].locale.stamina_food.order_accept_answer
locale.stamina_food.ORDER_refuse_answer = gameforge[get_language()].locale.stamina_food.order_refuse_answer
locale.stamina_food.ORDER_get_greenfrog_general_meat_label = gameforge[get_language()].locale.stamina_food.order_get_greenfrog_general_meat_label
locale.stamina_food.ORDER_get_greenfrog_general_meat_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.stamina_food.order_get_greenfrog_general_meat_text
locale.stamina_food.ORDER_too_late = gameforge[get_language()].locale.stamina_food.order_too_late
locale.stamina_food.ACCEPT_success_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.stamina_food.accept_success_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.stamina_food.accept_success_say_2
locale.stamina_food.ACCEPT_failure_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.stamina_food.accept_failure_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.stamina_food.accept_failure_say_2
locale.stamina_food.ACCEPT_ask = gameforge[get_language()].locale.stamina_food.accept_ask
locale.stamina_food.ACCEPT_success_info_label = gameforge[get_language()].locale.stamina_food.accept_success_info_label
locale.stamina_food.ACCEPT_success_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.stamina_food.accept_success_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.stamina_food.accept_success_info_text_2
locale.stamina_food.BAEKGO_ACCEPT_failure_info_label = gameforge[get_language()].locale.stamina_food.baekgo_accept_failure_info_label
locale.stamina_food.BAEKGO_ACCEPT_failure_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.stamina_food.baekgo_accept_failure_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.stamina_food.baekgo_accept_failure_info_text_2
locale.stamina_food.SUCCESS_say = gameforge[get_language()].locale.stamina_food.success_say
locale.stamina_food.COMPLETE_say = gameforge[get_language()].locale.stamina_food.complete_say

locale.skeleton_gem = {}
locale.skeleton_gem.start_probability = 3
locale.skeleton_gem.start_level_begin = 55
locale.skeleton_gem.start_level_end = 57
locale.skeleton_gem.end_level = 60
locale.skeleton_gem.kill_count = 3
locale.skeleton_gem.talk_about_skeleton_gem = gameforge[get_language()].locale.skeleton_gem.talk_about_skeleton_gem
locale.skeleton_gem.i_dont_have_the_skeleton_gem_yet = gameforge[get_language()].locale.skeleton_gem.i_dont_have_the_skeleton_gem_yet
locale.skeleton_gem.i_have_the_skeleton_gem = gameforge[get_language()].locale.skeleton_gem.i_have_the_skeleton_gem
locale.skeleton_gem.START_say = gameforge[get_language()].locale.skeleton_gem.start_say
locale.skeleton_gem.START_find_peddler_label = gameforge[get_language()].locale.skeleton_gem.start_find_peddler_label
locale.skeleton_gem.START_find_peddler_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.skeleton_gem.start_find_peddler_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.skeleton_gem.start_find_peddler_text_2
locale.skeleton_gem.ORDER_say = gameforge[get_language()].locale.skeleton_gem.order_say
locale.skeleton_gem.ORDER_say2 = gameforge[get_language()].locale.skeleton_gem.order_say2
locale.skeleton_gem.ORDER_accept = gameforge[get_language()].locale.skeleton_gem.order_accept
locale.skeleton_gem.ORDER_refuse = gameforge[get_language()].locale.skeleton_gem.order_refuse
locale.skeleton_gem.ORDER_accept_answer = gameforge[get_language()].locale.skeleton_gem.order_accept_answer
locale.skeleton_gem.ORDER_refuse_answer = gameforge[get_language()].locale.skeleton_gem.order_refuse_answer
locale.skeleton_gem.ORDER_get_skeleton_gem_ = gameforge[get_language()].locale.skeleton_gem.order_get_skeleton_gem_
locale.skeleton_gem.ORDER_get_skeleton_gem_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.skeleton_gem.order_get_skeleton_gem_text
locale.skeleton_gem.ORDER_too_late = gameforge[get_language()].locale.skeleton_gem.order_too_late
locale.skeleton_gem.ACCEPT_success_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.skeleton_gem.accept_success_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.skeleton_gem.accept_success_say_2
locale.skeleton_gem.ACCEPT_failure_say = locale.NOTICE_COLOR .. gameforge[get_language()].locale.skeleton_gem.accept_failure_say_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.skeleton_gem.accept_failure_say_2
locale.skeleton_gem.ACCEPT_ask = gameforge[get_language()].locale.skeleton_gem.accept_ask
locale.skeleton_gem.ACCEPT_success_info_label = gameforge[get_language()].locale.skeleton_gem.accept_success_info_label
locale.skeleton_gem.ACCEPT_success_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.skeleton_gem.accept_success_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.skeleton_gem.accept_success_info_text_2
locale.skeleton_gem.ACCEPT_failure_info_label = gameforge[get_language()].locale.skeleton_gem.accept_failure_info_label
locale.skeleton_gem.ACCEPT_failure_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.skeleton_gem.accept_failure_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.skeleton_gem.accept_failure_info_text_2
locale.skeleton_gem.SUCCESS_say = gameforge[get_language()].locale.skeleton_gem.success_say

locale.ariyeong = {}
locale.ariyeong.start_probability = 3
locale.ariyeong.start_level_begin = 25
locale.ariyeong.start_level_end = 27
locale.ariyeong.end_level = 30
locale.ariyeong.kill_count = 2
locale.ariyeong.event_item = 30101
locale.ariyeong.find_ariyeong_label = gameforge[get_language()].locale.ariyeong.find_ariyeong_label
locale.ariyeong.find_ariyeong_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.ariyeong.find_ariyeong_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.ariyeong.find_ariyeong_text_2
locale.ariyeong.kill_label = gameforge[get_language()].locale.ariyeong.kill_label
locale.ariyeong.kill_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.ariyeong.kill_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.ariyeong.kill_text_2
locale.ariyeong.too_late = gameforge[get_language()].locale.ariyeong.too_late
locale.ariyeong.success_info_label = gameforge[get_language()].locale.ariyeong.success_info_label
locale.ariyeong.success_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.ariyeong.success_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.ariyeong.success_info_text_2
locale.ariyeong.failure_info_label = gameforge[get_language()].locale.ariyeong.failure_info_label
locale.ariyeong.failure_info_text = locale.NOTICE_COLOR .. gameforge[get_language()].locale.ariyeong.failure_info_text_1 .. locale.NORMAL_COLOR .. gameforge[get_language()].locale.ariyeong.failure_info_text_2

locale.levelup = {}
locale.levelup.choice1 = gameforge[get_language()].locale.levelup.choice1
locale.levelup.choice2 = gameforge[get_language()].locale.levelup.choice2
locale.levelup.slay_them1 = gameforge[get_language()].locale.levelup.slay_them1
locale.levelup.slay_them2 = gameforge[get_language()].locale.levelup.slay_them2
locale.levelup.slay_target_is = gameforge[get_language()].locale.levelup.slay_target_is 
locale.levelup.slay_target_count = gameforge[get_language()].locale.levelup.slay_target_count
locale.levelup.slayed_them = gameforge[get_language()].locale.levelup.slayed_them
locale.levelup.remain_count = gameforge[get_language()].locale.levelup.remain_count
locale.levelup.cause_of_levelup = gameforge[get_language()].locale.levelup.cause_of_levelup
locale.levelup.receive_direct = gameforge[get_language()].locale.levelup.receive_direct
locale.levelup.levelup_quest_fail = gameforge[get_language()].locale.levelup.levelup_quest_fail
locale.levelup.lets_go = gameforge[get_language()].locale.levelup.lets_go
locale.levelup.kill_count = gameforge[get_language()].locale.levelup.kill_count
locale.levelup.prev_quest1 = gameforge[get_language()].locale.levelup.prev_quest1
locale.levelup.prev_quest2 = gameforge[get_language()].locale.levelup.prev_quest2
locale.levelup.prev_quest_info = gameforge[get_language()].locale.levelup.prev_quest_info
locale.levelup.prev_quest_go = gameforge[get_language()].locale.levelup.prev_quest_go
locale.levelup.random_item = gameforge[get_language()].locale.levelup.random_item

locale.stash = {}
locale.stash.buy_silver_and_gold_bar = gameforge[get_language()].locale.stash.buy_silver_and_gold_bar
locale.stash.gold_bar_beginner_info = gameforge[get_language()].locale.stash.gold_bar_beginner_info
locale.stash.enlarge_first1_cannot = gameforge[get_language()].locale.stash.enlarge_first1_cannot
locale.stash.greet1 = gameforge[get_language()].locale.stash.greet1
locale.stash.not_enough_money = gameforge[get_language()].locale.stash.not_enough_money
locale.stash.pay_ok = gameforge[get_language()].locale.stash.pay_ok
locale.stash.pay_no = gameforge[get_language()].locale.stash.pay_no
locale.stash.first_open = gameforge[get_language()].locale.stash.first_open
locale.stash.dont_open = gameforge[get_language()].locale.stash.dont_open
locale.stash.greet2 = gameforge[get_language()].locale.stash.greet2
locale.stash.beginner_info = gameforge[get_language()].locale.stash.beginner_info
locale.stash.enlarge = gameforge[get_language()].locale.stash.enlarge
locale.stash.nomatter = gameforge[get_language()].locale.stash.nomatter
locale.stash.enlarge_first1 = gameforge[get_language()].locale.stash.enlarge_first1
locale.stash.enlarge_item1 = 50
locale.stash.enlarge_item2 = 5030
locale.stash.enlarge_first2 = gameforge[get_language()].locale.stash.enlarge_first2
locale.stash.enlarge_first3 = gameforge[get_language()].locale.stash.enlarge_first3
locale.stash.enlarge_try_ok = gameforge[get_language()].locale.stash.enlarge_try_ok
locale.stash.enlarge_try_no = gameforge[get_language()].locale.stash.enlarge_try_no
locale.stash.enlarge_try_ok_answer = gameforge[get_language()].locale.stash.enlarge_try_ok_answer
locale.stash.enlarge_1_title = gameforge[get_language()].locale.stash.enlarge_1_title
locale.stash.enlarge_1_counter = gameforge[get_language()].locale.stash.enlarge_1_counter
locale.stash.enlarge_1_item = gameforge[get_language()].locale.stash.enlarge_1_item
locale.stash.enlarge_1_timer = gameforge[get_language()].locale.stash.enlarge_1_timer
locale.stash.enlarge_no_need = gameforge[get_language()].locale.stash.enlarge_no_need
locale.stash.greet3 = gameforge[get_language()].locale.stash.greet3
locale.stash.enlarge_2_no_mark = gameforge[get_language()].locale.stash.enlarge_2_no_mark
locale.stash.enlarge_2_again = gameforge[get_language()].locale.stash.enlarge_2_again
locale.stash.enlarge_2_title = gameforge[get_language()].locale.stash.enlarge_2_title
locale.stash.enlarge_2_item = 60002
locale.stash.enlarge_2_mark_item = 60003
locale.stash.enlarge_2_have_mark = c_item_name(locale.stash.enlarge_2_mark_item .. gameforge[get_language()].locale.stash.enlarge_2_have_mark)
locale.stash.enlarge_2_no_mark2 = gameforge[get_language()].locale.stash.enlarge_2_no_mark2
locale.stash.enlarge_2_have_mark2 = gameforge[get_language()].locale.stash.enlarge_2_have_mark2
locale.stash.enlarge_2_have_mark3 = gameforge[get_language()].locale.stash.enlarge_2_have_mark3
locale.stash.enlarge_2_msg1 = gameforge[get_language()].locale.stash.enlarge_2_msg1
locale.stash.enlarge_2_msg2 = gameforge[get_language()].locale.stash.enlarge_2_msg2
locale.stash.greet4 = gameforge[get_language()].locale.stash.greet4
locale.stash.enlarge_3_msg1 = gameforge[get_language()].locale.stash.enlarge_3_msg1
locale.stash.enlarge_3_title = gameforge[get_language()].locale.stash.enlarge_3_title
locale.stash.enlarge_3_counter = gameforge[get_language()].locale.stash.enlarge_3_counter
locale.stash.enlarge_3_timer = gameforge[get_language()].locale.stash.enlarge_3_timer
locale.stash.enlarge_4_msg = gameforge[get_language()].locale.stash.enlarge_4_msg
locale.stash.enlarge_2_recommendation = gameforge[get_language()].locale.stash.enlarge_2_recommendation
locale.stash.enlarge_2_oldwoman_greet = gameforge[get_language()].locale.stash.enlarge_2_oldwoman_greet
locale.stash.enlarge_2_oldwoman_reject = gameforge[get_language()].locale.stash.enlarge_2_oldwoman_reject
locale.stash.enlarge_2_oldwoman_title1 = gameforge[get_language()].locale.stash.enlarge_2_oldwoman_title1
locale.stash.enlarge_2_oldwoman_title2 = gameforge[get_language()].locale.stash.enlarge_2_oldwoman_title2
locale.stash.enlarge_2_oldwoman_accept = gameforge[get_language()].locale.stash.enlarge_2_oldwoman_accept
locale.stash.enlarge_1_info1 = gameforge[get_language()].locale.stash.enlarge_1_info1
locale.stash.enlarge_1_info2 = gameforge[get_language()].locale.stash.enlarge_1_info2
locale.stash.enlarge_1_take_bear = gameforge[get_language()].locale.stash.enlarge_1_take_bear
locale.stash.enlarge_1_success = gameforge[get_language()].locale.stash.enlarge_1_success
locale.stash.enlarge_1_notyet = gameforge[get_language()].locale.stash.enlarge_1_notyet
locale.stash.enlarge_1_getone = gameforge[get_language()].locale.stash.enlarge_1_getone
locale.stash.enlarge_1_complete = gameforge[get_language()].locale.stash.enlarge_1_complete
locale.stash.enlarge_1_fail_info = gameforge[get_language()].locale.stash.enlarge_1_fail_info
locale.stash.enlarge_1_fail_msg = gameforge[get_language()].locale.stash.enlarge_1_fail_msg
locale.stash.enlarge_3_complete = gameforge[get_language()].locale.stash.enlarge_3_complete
locale.stash.enlarge_3_success = gameforge[get_language()].locale.stash.enlarge_3_success
locale.stash.enlarge_3_notyet = gameforge[get_language()].locale.stash.enlarge_3_notyet
locale.stash.open_mall = gameforge[get_language()].locale.stash.open_mall

locale.guild = {}
locale.guild.guild_master_greet = gameforge[get_language()].locale.guild.guild_master_greet
locale.guild.disband = gameforge[get_language()].locale.guild.disband
locale.guild.cancel = gameforge[get_language()].locale.guild.cancel
locale.guild.yes = gameforge[get_language()].locale.guild.yes
locale.guild.no = gameforge[get_language()].locale.guild.no
locale.guild.disband_confirm = gameforge[get_language()].locale.guild.disband_confirm
locale.guild.disband_msg = gameforge[get_language()].locale.guild.disband_msg
locale.guild.guild_member_greet = gameforge[get_language()].locale.guild.guild_member_greet
locale.guild.withdraw = gameforge[get_language()].locale.guild.withdraw
locale.guild.withdraw_confirm = gameforge[get_language()].locale.guild.withdraw_confirm
locale.guild.withdraw_msg = gameforge[get_language()].locale.guild.withdraw_msg
locale.guild.noguild_greet = gameforge[get_language()].locale.guild.noguild_greet
locale.guild.create = gameforge[get_language()].locale.guild.create
locale.guild.create_confirm = gameforge[get_language()].locale.guild.create_confirm
locale.guild.create_not_enough_money = gameforge[get_language()].locale.guild.create_not_enough_money
locale.guild.not_enough_leadership = gameforge[get_language()].locale.guild.not_enough_leadership
locale.guild.no_guild_create_item = gameforge[get_language()].locale.guild.no_guild_create_item
locale.guild.create_confirm_for_china = gameforge[get_language()].locale.guild.create_confirm_for_china
locale.guild.cannot_create_guild_withdraw_delay = gameforge[get_language()].locale.guild.cannot_create_guild_withdraw_delay
locale.guild.cannot_create_guild_disband_delay = gameforge[get_language()].locale.guild.cannot_create_guild_disband_delay
locale.guild.war_entry_ask_head = gameforge[get_language()].locale.guild.war_entry_ask_head
locale.guild.war_entry_ask_tail = gameforge[get_language()].locale.guild.war_entry_ask_tail
locale.guild.war_list_button = gameforge[get_language()].locale.guild.war_list_button
locale.guild.war_list_none = gameforge[get_language()].locale.guild.war_list_none
locale.guild.war_list_choose = gameforge[get_language()].locale.guild.war_list_choose
locale.guild.war_join_request = gameforge[get_language()].locale.guild.war_join_request
locale.guild.war_over = gameforge[get_language()].locale.guild.war_over
locale.guild.war_bet_list_button = gameforge[get_language()].locale.guild.war_bet_list_button
locale.guild.war_bet_info = gameforge[get_language()].locale.guild.war_bet_info
locale.guild.war_bet_no_money = gameforge[get_language()].locale.guild.war_bet_no_money
locale.guild.war_bet_price = gameforge[get_language()].locale.guild.war_bet_price
locale.guild.war_bet_done = gameforge[get_language()].locale.guild.war_bet_done
locale.guild.war_bet_list_none = gameforge[get_language()].locale.guild.war_bet_list_none
locale.guild.war_bet_list_choose = gameforge[get_language()].locale.guild.war_bet_list_choose
locale.guild.war_bet_already = gameforge[get_language()].locale.guild.war_bet_already
locale.guild.war_bet_assume1 = gameforge[get_language()].locale.guild.war_bet_assume1
locale.guild.war_bet_assume2 = gameforge[get_language()].locale.guild.war_bet_assume2
locale.guild.war_bet_assume3 = gameforge[get_language()].locale.guild.war_bet_assume3

locale.oldwoman = {}
locale.oldwoman.no_matter = gameforge[get_language()].locale.oldwoman.no_matter
locale.oldwoman.skill_reset1 = gameforge[get_language()].locale.oldwoman.skill_reset1
locale.oldwoman.skill_reset2 = gameforge[get_language()].locale.oldwoman.skill_reset2
locale.oldwoman.skill_reset_ok = gameforge[get_language()].locale.oldwoman.skill_reset_ok
locale.oldwoman.skill_reset_no = gameforge[get_language()].locale.oldwoman.skill_reset_no
locale.oldwoman.not_enough_money = gameforge[get_language()].locale.oldwoman.not_enough_money
 
locale.skill_group = {}
locale.skill_group.lets_join_skill_group = {
	gameforge[get_language()].locale.skill_group.lets_join_skill_group_1,
	gameforge[get_language()].locale.skill_group.lets_join_skill_group_2,
	gameforge[get_language()].locale.skill_group.lets_join_skill_group_3,
	gameforge[get_language()].locale.skill_group.lets_join_skill_group_4
}
locale.skill_group.invite = gameforge[get_language()].locale.skill_group.invite
locale.skill_group.board = gameforge[get_language()].locale.skill_group.board
locale.skill_group.dialog = {{
	[WARRIOR] = {
		{
			gameforge[get_language()].locale.skill_group.dialog_warrior_1,
			gameforge[get_language()].locale.skill_group.dialog_warrior_2,
		},
		{
			gameforge[get_language()].locale.skill_group.dialog_warrior_3,
			gameforge[get_language()].locale.skill_group.dialog_warrior_4,
		},
		gameforge[get_language()].locale.skill_group.dialog_warrior_5,
	},
	[ASSASSIN] = {
		{
			gameforge[get_language()].locale.skill_group.dialog_assassin_1,
			gameforge[get_language()].locale.skill_group.dialog_assassin_2,
		},
		{
			gameforge[get_language()].locale.skill_group.dialog_assassin_3,
			gameforge[get_language()].locale.skill_group.dialog_assassin_4,
		},
		gameforge[get_language()].locale.skill_group.dialog_assassin_5,
	},
	[SURA] = {
		{
			gameforge[get_language()].locale.skill_group.dialog_sura_1,
			gameforge[get_language()].locale.skill_group.dialog_sura_2,
		},
		{
			gameforge[get_language()].locale.skill_group.dialog_sura_3,
			gameforge[get_language()].locale.skill_group.dialog_sura_4,
		},
		gameforge[get_language()].locale.skill_group.dialog_sura_5,
	},
	[SHAMAN] = {
		{
			gameforge[get_language()].locale.skill_group.dialog_shaman_1,
			gameforge[get_language()].locale.skill_group.dialog_shaman_2,
		},
		{
			gameforge[get_language()].locale.skill_group.dialog_shaman_3,
			gameforge[get_language()].locale.skill_group.dialog_shaman_4,
		},
		gameforge[get_language()].locale.skill_group.dialog_shaman_5,
	}
}}

locale.neutral_warp = {}
locale.neutral_warp.greet = gameforge[get_language()].locale.neutral_warp.greet 
locale.neutral_warp.go = gameforge[get_language()].locale.neutral_warp.go
locale.neutral_warp.not_go = gameforge[get_language()].locale.neutral_warp.not_go
locale.neutral_warp.where_to_go = gameforge[get_language()].locale.neutral_warp.where_to_go
locale.neutral_warp.money_need1 = gameforge[get_language()].locale.neutral_warp.money_need1
locale.neutral_warp.money_need2 = gameforge[get_language()].locale.neutral_warp.money_need2
locale.neutral_warp.cannot_go_yet = gameforge[get_language()].locale.neutral_warp.cannot_go_yet

locale.blacksmith = {}
locale.blacksmith.refine_info = gameforge[get_language()].locale.blacksmith.refine_info

dofile(get_locale_base_path() .. "/monster_texts_de.lua")
dofile(get_locale_base_path() .. "/monster_texts_en.lua")
dofile(get_locale_base_path() .. "/monster_texts_tr.lua")
dofile(get_locale_base_path() .. "/monster_texts_ru.lua")

special.questscroll = {
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_1_text,
		gameforge[get_language()].locale.questscroll_1_mis,
		gameforge[get_language()].locale.questscroll_1_hunt,
		25,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_2_text,
		gameforge[get_language()].locale.questscroll_2_mis,
		gameforge[get_language()].locale.questscroll_2_hunt,
		20,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_3_text,
		gameforge[get_language()].locale.questscroll_3_mis,
		gameforge[get_language()].locale.questscroll_3_hunt,
		1,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_4_text,
		gameforge[get_language()].locale.questscroll_4_mis,
		gameforge[get_language()].locale.questscroll_4_hunt,
		1,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_5_text,
		gameforge[get_language()].locale.questscroll_5_mis,
		gameforge[get_language()].locale.questscroll_5_hunt,
		1,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_6_text,
		gameforge[get_language()].locale.questscroll_6_mis,
		gameforge[get_language()].locale.questscroll_6_hunt,
		1,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_7_text,
		gameforge[get_language()].locale.questscroll_7_mis,
		gameforge[get_language()].locale.questscroll_7_hunt,
		20,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_8_text,
		gameforge[get_language()].locale.questscroll_8_mis,
		gameforge[get_language()].locale.questscroll_8_hunt,
		20,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_9_text,
		gameforge[get_language()].locale.questscroll_9_mis,
		gameforge[get_language()].locale.questscroll_9_hunt,
		25,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_10_text,
		gameforge[get_language()].locale.questscroll_10_mis,
		gameforge[get_language()].locale.questscroll_10_hunt,
		20,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_11_text,
		gameforge[get_language()].locale.questscroll_11_mis,
		gameforge[get_language()].locale.questscroll_11_hunt,
		20,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_12_text,
		gameforge[get_language()].locale.questscroll_12_mis,
		gameforge[get_language()].locale.questscroll_12_hunt,
		12,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_13_text,
		gameforge[get_language()].locale.questscroll_13_mis,
		gameforge[get_language()].locale.questscroll_13_hunt,
		20,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_14_text,
		gameforge[get_language()].locale.questscroll_14_mis,
		gameforge[get_language()].locale.questscroll_14_hunt,
		20,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_15_text,
		gameforge[get_language()].locale.questscroll_15_mis,
		gameforge[get_language()].locale.questscroll_15_hunt,
		13,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_16_text,
		gameforge[get_language()].locale.questscroll_16_mis,
		gameforge[get_language()].locale.questscroll_16_hunt,
		25,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_17_text,
		gameforge[get_language()].locale.questscroll_17_mis,
		gameforge[get_language()].locale.questscroll_17_hunt,
		20,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_18_text,
		gameforge[get_language()].locale.questscroll_18_mis,
		gameforge[get_language()].locale.questscroll_18_hunt,
		25,
	},
	{ 
		QUEST_SCROLL_TYPE_KILL_MOB, 
		gameforge[get_language()].locale.questscroll_19_text,
		gameforge[get_language()].locale.questscroll_19_mis,
		gameforge[get_language()].locale.questscroll_19_hunt,
		25,
	},	
	{ 
		QUEST_SCROLL_TYPE_KILL_ANOTHER_EMPIRE, 
		gameforge[get_language()].locale.questscroll_20_text,
		gameforge[get_language()].locale.questscroll_20_mis,
		gameforge[get_language()].locale.questscroll_20_hunt,
		4,
	},
}

locale.questscroll = {}
locale.questscroll.exist = gameforge[get_language()].locale.questscroll.exist
locale.questscroll.finish = gameforge[get_language()].locale.questscroll.finish
locale.questscroll.finish_button = gameforge[get_language()].locale.questscroll.finish_button

locale.remove_polymorph_chat = gameforge[get_language()].locale.remove_polymorph_chat
locale.remove_polymorph_msg = gameforge[get_language()].locale.remove_polymorph_msg

locale.fortune_words = {
	{
		gameforge[get_language()].locale.fortune_words_1_title,
		gameforge[get_language()].locale.fortune_words_1_body
	},
	{
		gameforge[get_language()].locale.fortune_words_2_title,
		gameforge[get_language()].locale.fortune_words_2_body
	},
	{
		gameforge[get_language()].locale.fortune_words_3_title,
		gameforge[get_language()].locale.fortune_words_3_body
	},
	{
		gameforge[get_language()].locale.fortune_words_4_title,
		gameforge[get_language()].locale.fortune_words_4_body
	},
	{
		gameforge[get_language()].locale.fortune_words_5_title,
		gameforge[get_language()].locale.fortune_words_5_body
	},
	{
		gameforge[get_language()].locale.fortune_words_6_title,
		gameforge[get_language()].locale.fortune_words_6_body
	},
	{
		gameforge[get_language()].locale.fortune_words_7_title,
		gameforge[get_language()].locale.fortune_words_7_body
	},
}

locale.christmas_tree = {}
locale.christmas_tree.greet = gameforge[get_language()].locale.christmas_tree.greet
locale.christmas_tree.sel_put_sock = gameforge[get_language()].locale.christmas_tree.sel_put_sock
locale.christmas_tree.sel_no_need = gameforge[get_language()].locale.christmas_tree.sel_no_need
locale.christmas_tree.sel_intro_event = gameforge[get_language()].locale.christmas_tree.sel_intro_event
locale.christmas_tree.no_more_sock = gameforge[get_language()].locale.christmas_tree.no_more_sock
locale.christmas_tree.gain_item_msg = gameforge[get_language()].locale.christmas_tree.gain_item_msg
locale.christmas_tree.no_sock = gameforge[get_language()].locale.christmas_tree.no_sock
locale.christmas_tree.not_sock_time = gameforge[get_language()].locale.christmas_tree.not_sock_time
locale.christmas_tree.greet2 = gameforge[get_language()].locale.christmas_tree.greet2
locale.christmas_tree.intro_msg = gameforge[get_language()].locale.christmas_tree.intro_msg
locale.christmas_tree.under_level_10 = gameforge[get_language()].locale.christmas_tree.under_level_10
locale.christmas_tree.christmas_say_title = gameforge[get_language()].locale.christmas_tree.christmas_say_title

locale.christmas_santa = {}
locale.christmas_santa.intro_msg = gameforge[get_language()].locale.christmas_santa.intro_msg
locale.christmas_santa.skill_book_buy_cost = 10000
locale.christmas_santa.skill_book_msg = locale.christmas_santa.skill_book_buy_cost .. gameforge[get_language()].locale.christmas_santa.skill_book_msg
locale.christmas_santa.skill_book_sold_out_msg = gameforge[get_language()].locale.christmas_santa.skill_book_sold_out_msg
locale.christmas_santa.hairdye_buy_cost = 10000
locale.christmas_santa.hairdye_msg = locale.christmas_santa.hairdye_buy_cost .. gameforge[get_language()].locale.christmas_santa.hairdye_msg
locale.christmas_santa.hairdye_sold_out_msg = gameforge[get_language()].locale.christmas_santa.hairdye_sold_out_msg
locale.christmas_santa.not_enough_money = gameforge[get_language()].locale.christmas_santa.want_skillbook
locale.christmas_santa.want_skillbook = gameforge[get_language()].locale.christmas_santa.want_skillbook
locale.christmas_santa.want_hairdye = gameforge[get_language()].locale.christmas_santa.want_hairdye
locale.christmas_santa.no_need = gameforge[get_language()].locale.christmas_santa.no_need
locale.christmas_santa.bye_msg = gameforge[get_language()].locale.christmas_santa.bye_msg
locale.christmas_santa.select_buy = gameforge[get_language()].locale.christmas_santa.select_buy
locale.christmas_santa.select_stop = gameforge[get_language()].locale.christmas_santa.select_stop

locale.years_greetings = {}
locale.years_greetings.chat_greet = gameforge[get_language()].locale.years_greetings.chat_greet
locale.years_greetings.greet_msg = gameforge[get_language()].locale.years_greetings.greet_msg
locale.years_greetings.select_1 = gameforge[get_language()].locale.years_greetings.select_1
locale.years_greetings.select_2 = gameforge[get_language()].locale.years_greetings.select_2
locale.years_greetings.select_3 = gameforge[get_language()].locale.years_greetings.select_3
locale.years_greetings.under_level_15 = gameforge[get_language()].locale.years_greetings.under_level_15
locale.years_greetings.give_msg = gameforge[get_language()].locale.years_greetings.give_msg
locale.years_greetings.not_enoguh_inventory = gameforge[get_language()].locale.years_greetings.not_enoguh_inventory
locale.years_greetings.no_money_this_time = gameforge[get_language()].locale.years_greetings.no_money_this_time
locale.years_greetings.bless_msg = gameforge[get_language()].locale.years_greetings.bless_msg
locale.years_greetings.event_info = gameforge[get_language()].locale.years_greetings.event_info 

locale.make_wonso = {}
locale.make_wonso.want_wonso1 = gameforge[get_language()].locale.make_wonso.want_wonso1
locale.make_wonso.how_make = gameforge[get_language()].locale.make_wonso.how_make
locale.make_wonso.how_make_detail = gameforge[get_language()].locale.make_wonso.how_make_detail
locale.make_wonso.make_msg1 = gameforge[get_language()].locale.make_wonso.make_msg1
locale.make_wonso.make_msg2 = gameforge[get_language()].locale.make_wonso.make_msg2
locale.make_wonso.make_msg3 = gameforge[get_language()].locale.make_wonso.make_msg3

locale.horse_menu = {}
locale.horse_menu.menu = gameforge[get_language()].locale.horse_menu.menu
locale.horse_menu.show_state = gameforge[get_language()].locale.horse_menu.show_state
locale.horse_menu.revive = gameforge[get_language()].locale.horse_menu.revive
locale.horse_menu.feed = gameforge[get_language()].locale.horse_menu.feed
locale.horse_menu.ride = gameforge[get_language()].locale.horse_menu.ride
locale.horse_menu.unsummon = gameforge[get_language()].locale.horse_menu.unsummon
locale.horse_menu.close = gameforge[get_language()].locale.horse_menu.close

locale.monkey_dungeon = {}
locale.monkey_dungeon.button = gameforge[get_language()].locale.monkey_dungeon.button
locale.monkey_dungeon.curse_of_monkey_button = gameforge[get_language()].locale.monkey_dungeon.curse_of_monkey_button
locale.monkey_dungeon.curse_of_monkey = gameforge[get_language()].locale.monkey_dungeon.curse_of_monkey
locale.monkey_dungeon.cannot_ENTER_yet = gameforge[get_language()].locale.monkey_dungeon.cannot_ENTER_yet
locale.monkey_dungeon.low_entrance = gameforge[get_language()].locale.monkey_dungeon.low_entrance
locale.monkey_dungeon.middle_entrance = gameforge[get_language()].locale.monkey_dungeon.middle_entrance
locale.monkey_dungeon.notice = gameforge[get_language()].locale.monkey_dungeon.notice
locale.monkey_dungeon.quest_title = gameforge[get_language()].locale.monkey_dungeon.quest_title
locale.monkey_dungeon.quest_rest_time = gameforge[get_language()].locale.monkey_dungeon.quest_rest_time
locale.monkey_dungeon.ENTER = gameforge[get_language()].locale.monkey_dungeon.ENTER
locale.monkey_dungeon.no_ENTER = gameforge[get_language()].locale.monkey_dungeon.no_ENTER

locale.questscroll5 = {}
locale.questscroll5.mission = {
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Aa",
		gameforge[get_language()].locale.questscroll5.mission_1_hunt,
		gameforge[get_language()].locale.questscroll5.mission_1_text,
		gameforge[get_language()].locale.questscroll5.mission_1_mis,
		"8002",
		3
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Aa",
		gameforge[get_language()].locale.questscroll5.mission_2_hunt,
		gameforge[get_language()].locale.questscroll5.mission_2_text,
		gameforge[get_language()].locale.questscroll5.mission_2_mis,
		"8001",
		2
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Aa",
		gameforge[get_language()].locale.questscroll5.mission_3_hunt,
		gameforge[get_language()].locale.questscroll5.mission_3_text,
		gameforge[get_language()].locale.questscroll5.mission_3_mis,
		"107",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Aa",
		gameforge[get_language()].locale.questscroll5.mission_4_hunt,
		gameforge[get_language()].locale.questscroll5.mission_4_text,
		gameforge[get_language()].locale.questscroll5.mission_4_mis,
		"106",
		35
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Aa",
		gameforge[get_language()].locale.questscroll5.mission_5_hunt,
		gameforge[get_language()].locale.questscroll5.mission_5_text,
		gameforge[get_language()].locale.questscroll5.mission_5_mis,
		"108",
		40
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Aa",
		gameforge[get_language()].locale.questscroll5.mission_6_hunt,
		gameforge[get_language()].locale.questscroll5.mission_6_text,
		gameforge[get_language()].locale.questscroll5.mission_6_mis,
		"114"	,
		25,
		"110",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Ab",
		gameforge[get_language()].locale.questscroll5.mission_7_hunt,
		gameforge[get_language()].locale.questscroll5.mission_7_text,
		gameforge[get_language()].locale.questscroll5.mission_7_mis,
		"8004",
		2
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Ab",
		gameforge[get_language()].locale.questscroll5.mission_8_hunt,
		gameforge[get_language()].locale.questscroll5.mission_8_text,
		gameforge[get_language()].locale.questscroll5.mission_8_mis,
		"8003",
		2
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Ab",
		gameforge[get_language()].locale.questscroll5.mission_9_hunt,
		gameforge[get_language()].locale.questscroll5.mission_9_text,
		gameforge[get_language()].locale.questscroll5.mission_9_mis,
		"109",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Ab",
		gameforge[get_language()].locale.questscroll5.mission_10_hunt,
		gameforge[get_language()].locale.questscroll5.mission_10_text,
		gameforge[get_language()].locale.questscroll5.mission_10_mis,
		"111",
		25,
		"112",
		25
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Ab",
		gameforge[get_language()].locale.questscroll5.mission_11_hunt,
		gameforge[get_language()].locale.questscroll5.mission_11_text,
		gameforge[get_language()].locale.questscroll5.mission_11_mis,
		"104",
		35,
		"105",
		25
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Ba",
		gameforge[get_language()].locale.questscroll5.mission_12_hunt,
		gameforge[get_language()].locale.questscroll5.mission_12_text,
		gameforge[get_language()].locale.questscroll5.mission_12_mis,
		"304",
		20
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Ba",
		gameforge[get_language()].locale.questscroll5.mission_13_hunt,
		gameforge[get_language()].locale.questscroll5.mission_13_text,
		gameforge[get_language()].locale.questscroll5.mission_13_mis,
		"404",
		25,
		"405",
		25
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Ba",
		gameforge[get_language()].locale.questscroll5.mission_14_hunt,
		gameforge[get_language()].locale.questscroll5.mission_14_text,
		gameforge[get_language()].locale.questscroll5.mission_14_mis,
		"631",
		30,
		"632",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Ba",
		gameforge[get_language()].locale.questscroll5.mission_15_hunt,
		gameforge[get_language()].locale.questscroll5.mission_15_text,
		gameforge[get_language()].locale.questscroll5.mission_15_mis,
		"501",
		30,
		"502",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Bb",
		gameforge[get_language()].locale.questscroll5.mission_16_hunt,
		gameforge[get_language()].locale.questscroll5.mission_16_text,
		gameforge[get_language()].locale.questscroll5.mission_16_mis,
		"8006",
		3
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Bb",
		gameforge[get_language()].locale.questscroll5.mission_17_hunt,
		gameforge[get_language()].locale.questscroll5.mission_17_text,
		gameforge[get_language()].locale.questscroll5.mission_17_mis,
		"8005",
		2
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Bb",
		gameforge[get_language()].locale.questscroll5.mission_18_hunt,
		gameforge[get_language()].locale.questscroll5.mission_18_text,
		gameforge[get_language()].locale.questscroll5.mission_18_mis,
		"393",
		10
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Bb",
		gameforge[get_language()].locale.questscroll5.mission_19_hunt,
		gameforge[get_language()].locale.questscroll5.mission_19_text,
		gameforge[get_language()].locale.questscroll5.mission_19_mis,
		"633",
		20,
		"634",
		15
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Bb",
		gameforge[get_language()].locale.questscroll5.mission_20_hunt,
		gameforge[get_language()].locale.questscroll5.mission_20_text,
		gameforge[get_language()].locale.questscroll5.mission_20_mis,
		"5111",
		30,
		"5112",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Bb",
		gameforge[get_language()].locale.questscroll5.mission_21_hunt,
		gameforge[get_language()].locale.questscroll5.mission_21_text,
		gameforge[get_language()].locale.questscroll5.mission_21_mis,
		"5101",
		30,
		"5102",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Bc",
		gameforge[get_language()].locale.questscroll5.mission_22_hunt,
		gameforge[get_language()].locale.questscroll5.mission_22_text,
		gameforge[get_language()].locale.questscroll5.mission_22_mis,
		"494",
		4
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Bc",
		gameforge[get_language()].locale.questscroll5.mission_23_hunt,
		gameforge[get_language()].locale.questscroll5.mission_23_text,
		gameforge[get_language()].locale.questscroll5.mission_23_mis,
		"8007",
		2
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Bc",
		gameforge[get_language()].locale.questscroll5.mission_24_hunt,
		gameforge[get_language()].locale.questscroll5.mission_24_text,
		gameforge[get_language()].locale.questscroll5.mission_24_mis,
		"5113",
		15,
		"5114",
		15
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Bc",
		gameforge[get_language()].locale.questscroll5.mission_25_hunt,
		gameforge[get_language()].locale.questscroll5.mission_25_text,
		gameforge[get_language()].locale.questscroll5.mission_25_mis,
		"5103",
		15,
		"5104",
		15
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Ca",
		gameforge[get_language()].locale.questscroll5.mission_26_hunt,
		gameforge[get_language()].locale.questscroll5.mission_26_text,
		gameforge[get_language()].locale.questscroll5.mission_26_mis,
		"8008",
		2
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Ca",
		gameforge[get_language()].locale.questscroll5.mission_27_hunt,
		gameforge[get_language()].locale.questscroll5.mission_27_text,
		gameforge[get_language()].locale.questscroll5.mission_27_mis,
		"2001",
		40
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Ca",
		gameforge[get_language()].locale.questscroll5.mission_28_hunt,
		gameforge[get_language()].locale.questscroll5.mission_28_text,
		gameforge[get_language()].locale.questscroll5.mission_28_mis,
		"2002",
		40
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Ca",
		gameforge[get_language()].locale.questscroll5.mission_29_hunt,
		gameforge[get_language()].locale.questscroll5.mission_29_text,
		gameforge[get_language()].locale.questscroll5.mission_29_mis,
		"703",
		20,
		"704",
		25
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Ca",
		gameforge[get_language()].locale.questscroll5.mission_30_hunt,
		gameforge[get_language()].locale.questscroll5.mission_30_text,
		gameforge[get_language()].locale.questscroll5.mission_30_mis,
		"701",
		30,
		"702",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Ca",
		gameforge[get_language()].locale.questscroll5.mission_31_hunt,
		gameforge[get_language()].locale.questscroll5.mission_31_text,
		gameforge[get_language()].locale.questscroll5.mission_31_mis,
		"706",
		40,
		"707",
		40
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Cb",
		gameforge[get_language()].locale.questscroll5.mission_32_hunt,
		gameforge[get_language()].locale.questscroll5.mission_32_text,
		gameforge[get_language()].locale.questscroll5.mission_32_mis,
		"8009",
		2
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cb",
		gameforge[get_language()].locale.questscroll5.mission_33_hunt,
		gameforge[get_language()].locale.questscroll5.mission_33_text,
		gameforge[get_language()].locale.questscroll5.mission_33_mis,
		"2031",
		35,
		"2032",
		35
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cb",
		gameforge[get_language()].locale.questscroll5.mission_34_hunt,
		gameforge[get_language()].locale.questscroll5.mission_34_text,
		gameforge[get_language()].locale.questscroll5.mission_34_mis,
		"2031",
		35,
		"2032",
		35
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cb",
		gameforge[get_language()].locale.questscroll5.mission_35_hunt,
		gameforge[get_language()].locale.questscroll5.mission_35_text,
		gameforge[get_language()].locale.questscroll5.mission_35_mis,
		"2033",
		35,
		"2034",
		35
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Cb",
		gameforge[get_language()].locale.questscroll5.mission_36_hunt,
		gameforge[get_language()].locale.questscroll5.mission_36_text,
		gameforge[get_language()].locale.questscroll5.mission_36_mis,
		"2035",
		40
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Cc",
		gameforge[get_language()].locale.questscroll5.mission_37_hunt,
		gameforge[get_language()].locale.questscroll5.mission_37_text,
		gameforge[get_language()].locale.questscroll5.mission_37_mis,
		"8010",
		2
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cc",
		gameforge[get_language()].locale.questscroll5.mission_38_hunt,
		gameforge[get_language()].locale.questscroll5.mission_38_text,
		gameforge[get_language()].locale.questscroll5.mission_38_mis,
		"2103",
		30,
		"2104",
		20
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cc",
		gameforge[get_language()].locale.questscroll5.mission_39_hunt,
		gameforge[get_language()].locale.questscroll5.mission_39_text,
		gameforge[get_language()].locale.questscroll5.mission_39_mis,
		"1001",
		30,
		"1002",
		20
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cc",
		gameforge[get_language()].locale.questscroll5.mission_40_hunt,
		gameforge[get_language()].locale.questscroll5.mission_40_text,
		gameforge[get_language()].locale.questscroll5.mission_40_mis,
		"1003",
		30,
		"1004",
		25
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cd",
		gameforge[get_language()].locale.questscroll5.mission_41_hunt,
		gameforge[get_language()].locale.questscroll5.mission_41_text,
		gameforge[get_language()].locale.questscroll5.mission_41_mis,
		"5123",
		15,
		"5124",
		15
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Cd",
		gameforge[get_language()].locale.questscroll5.mission_42_hunt,
		gameforge[get_language()].locale.questscroll5.mission_42_text,
		gameforge[get_language()].locale.questscroll5.mission_42_mis,
		"1107",
		25
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cd",
		gameforge[get_language()].locale.questscroll5.mission_43_hunt,
		gameforge[get_language()].locale.questscroll5.mission_43_text,
		gameforge[get_language()].locale.questscroll5.mission_43_mis,
		"5121",
		30,
		"5122",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Cd",
		gameforge[get_language()].locale.questscroll5.mission_44_hunt,
		gameforge[get_language()].locale.questscroll5.mission_44_text,
		gameforge[get_language()].locale.questscroll5.mission_44_mis,
		"1305",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cd",
		gameforge[get_language()].locale.questscroll5.mission_45_hunt,
		gameforge[get_language()].locale.questscroll5.mission_45_text,
		gameforge[get_language()].locale.questscroll5.mission_45_mis,
		"1105",
		35,
		"1106",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Cd",
		gameforge[get_language()].locale.questscroll5.mission_46_hunt,
		gameforge[get_language()].locale.questscroll5.mission_46_text,
		gameforge[get_language()].locale.questscroll5.mission_46_mis,
		"1301",
		45,
		"1302",
		35
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Cd",
		gameforge[get_language()].locale.questscroll5.mission_47_hunt,
		gameforge[get_language()].locale.questscroll5.mission_47_text,
		gameforge[get_language()].locale.questscroll5.mission_47_mis,
		"1101",
		45
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Da",
		gameforge[get_language()].locale.questscroll5.mission_48_hunt,
		gameforge[get_language()].locale.questscroll5.mission_48_text,
		gameforge[get_language()].locale.questscroll5.mission_48_mis,
		"1063",
		45
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Da",
		gameforge[get_language()].locale.questscroll5.mission_49_hunt,
		gameforge[get_language()].locale.questscroll5.mission_49_text,
		gameforge[get_language()].locale.questscroll5.mission_49_mis,
		"1064",
		60
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Da",
		gameforge[get_language()].locale.questscroll5.mission_50_hunt,
		gameforge[get_language()].locale.questscroll5.mission_50_text,
		gameforge[get_language()].locale.questscroll5.mission_50_mis,
		"2201",
		45
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Db",
		gameforge[get_language()].locale.questscroll5.mission_51_hunt,
		gameforge[get_language()].locale.questscroll5.mission_51_text,
		gameforge[get_language()].locale.questscroll5.mission_51_mis,
		"2202",
		45
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Db",
		gameforge[get_language()].locale.questscroll5.mission_52_hunt,
		gameforge[get_language()].locale.questscroll5.mission_52_text,
		gameforge[get_language()].locale.questscroll5.mission_52_mis,
		"2201",
		60,
		"2203",
		40
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Db",
		gameforge[get_language()].locale.questscroll5.mission_53_hunt,
		gameforge[get_language()].locale.questscroll5.mission_53_text,
		gameforge[get_language()].locale.questscroll5.mission_53_mis,
		"2204",
		40
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Db",
		gameforge[get_language()].locale.questscroll5.mission_54_hunt,
		gameforge[get_language()].locale.questscroll5.mission_54_text,
		gameforge[get_language()].locale.questscroll5.mission_54_mis,
		"2205",
		60
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB,
		"Dc",
		gameforge[get_language()].locale.questscroll5.mission_55_hunt,
		gameforge[get_language()].locale.questscroll5.mission_55_text,
		gameforge[get_language()].locale.questscroll5.mission_55_mis,
		"2301",
		30
	},
	{
		QUEST_SCROLL_TYPE_KILL_MOB2,
		"Dc",
		gameforge[get_language()].locale.questscroll5.mission_56_hunt,
		gameforge[get_language()].locale.questscroll5.mission_56_text,
		gameforge[get_language()].locale.questscroll5.mission_56_mis,
		"2302",
		40,
		"2303",
		30
	},
}

locale.questscroll5.reward_exp = {
	["Aa"] = {
		{10000, 30},
		{20000, 40},
		{30000, 25},
		{50000,  3},
		{80000,  2},
	},
	["Ab"] = {
		{10000, 20},
		{20000, 30},
		{30000, 35},
		{50000, 10},
		{80000,  5},
	},
	["Ba"] = {
		{20000, 25},
		{30000, 35},
		{50000, 25},
		{80000, 10},
		{100000,  5},
	},
	["Bb"] = {
		{20000, 10},
		{30000, 25},
		{50000, 35},
		{80000, 20},
		{100000, 10},
	},
	["Bc"] = {
		{20000,  5},
		{30000, 15},
		{50000, 35},
		{80000, 30},
		{100000, 15},
	},
	["Ca"] = {
		{30000, 20},
		{50000, 40},
		{100000, 30},
		{150000,  8},
		{200000,  2},
	},
	["Cb"] = {
		{30000, 15},
		{50000, 30},
		{100000, 35},
		{150000, 10},
		{200000, 10},
	},
	["Cc"] = {
		{30000, 10},
		{50000, 15},
		{100000, 35},
		{150000, 25},
		{200000, 15},
	},
	["Cd"] = {
		{30000,  5},
		{50000, 10},
		{100000, 30},
		{150000, 35},
		{200000, 20},
	},
	["Da"] = {
		{30000, 20},
		{50000, 40},
		{100000, 30},
		{150000,  8},
		{200000,  2},
	},
	["Db"] = {
		{30000, 15},
		{50000, 30},
		{100000, 35},
		{150000, 10},
		{200000, 10},
	},
	["Dc"] = {
		{30000, 10},
		{50000, 15},
		{100000, 35},
		{150000, 25},
		{200000, 15},
	},
}
locale.questscroll5.reward_money = {
	["Aa"] = {
		{5000, 30},
		{10000, 40},
		{20000, 25},
		{50000, 3},
		{100000, 2},
	},
	["Ab"] = {
		{5000, 20},
		{10000, 30},
		{20000, 35},
		{50000, 10},
		{100000, 5},
	},
	["Ba"] = {
		{10000, 30},
		{30000, 40},
		{50000, 25},
		{80000, 3},
		{100000, 2},
	},
	["Bb"] = {
		{10000, 20},
		{30000, 30},
		{50000, 35},
		{80000, 10},
		{100000, 5},
	},
	["Bc"] = {
		{10000, 10},
		{30000, 20},
		{50000, 35},
		{80000, 30},
		{100000, 5},
	},
	["Ca"] = {
		{30000, 20},
		{50000, 40},
		{80000, 30},
		{100000, 8},
		{150000, 2},
	},
	["Cb"] = {
		{30000, 15},
		{50000, 30},
		{80000, 35},
		{100000, 10},
		{150000, 10},
	},
	["Cc"] = {
		{30000, 10},
		{50000, 15},
		{80000, 35},
		{100000, 25},
		{150000, 10},
	},
	["Cd"] = {
		{30000, 5},
		{50000, 10},
		{80000, 30},
		{100000, 35},
		{150000, 20},
	},
	["Da"] = {
		{30000, 20},
		{50000, 40},
		{80000, 30},
		{100000, 8},
		{150000, 2},
	},
	["Db"] = {
		{30000, 15},
		{50000, 30},
		{80000, 35},
		{100000, 10},
		{150000, 10},
	},
	["Dc"] = {
		{30000, 10},
		{50000, 15},
		{80000, 35},
		{100000, 25},
		{150000, 10},
	},
}
locale.questscroll5.reward_item = {
	["Aa"] = {
		{30053, 1},
		{30072, 1},
		{30071, 1},
		{30003, 1},
		{30023, 1},
		{30038, 1},
	},
	["Ab"] = {
		{30037, 1},
		{30010, 1},
		{30004, 1},
		{30028, 1},
		{30069, 1},
		{30027, 1},
		{30070, 1},
	},
	["Ba"] = {
		{30032, 1},
		{30034, 1},
		{30073, 1},
		{30035, 1},
		{30008, 1},
		{30005, 1},
		{30021, 1},
		{30033, 1},
		{30041, 1},
		{30092, 1},
	},
	["Bb"] = {
		{30074, 1},
		{30076, 1},
		{30056, 1},
		{30057, 1},
		{30006, 1},
		{30077, 1},
		{30030, 1},
		{30058, 1},
		{30025, 1},
		{30055, 1},
	},
	["Bc"] = {
		{30046, 1},
		{30045, 1},
		{30018, 1},
		{30007, 1},
		{30052, 1},
		{30081, 1},
		{30031, 1},
		{30017, 1},
		{30011, 1},
	},
	["Ca"] = {
		{30085, 1},
		{30088, 1},
		{30016, 1},
		{30061, 1},
		{30040, 1},
		{30091, 1},
		{30059, 1},
	},
	["Cb"] = {
		{30060, 1},
		{30039, 1},
		{30042, 1},
		{30009, 1},
		{30079, 1},
		{30075, 1},
		{30022, 1},
		{30087, 1},
	},
	["Cc"] = {
		{30015, 1},
		{30019, 1},
		{30014, 1},
		{30048, 1},
		{30078, 1},
		{30083, 1},
		{30086, 1},
		{30090, 1},
		{30089, 1},
	},
	["Cd"] = {
		{30049, 1},
		{30047, 1},
		{30067, 1},
		{30080, 1},
		{30051, 1},
		{30050, 1},
	},
	["Da"] = {
		{30045, 1},
		{30051, 1},
		{30038, 1},
		{30070, 1},
		{30023, 1},
		{30033, 1},
		{30011, 1},
		{30027, 1},
		{30082, 1},
	},
	["Db"] = {
		{30035, 1},
		{30010, 1},
		{30055, 1},
		{30006, 1},
		{30003, 1},
		{30017, 1},
		{30058, 1},
		{30086, 1},
	},
	["Dc"] = {
		{70048, 15},
		{70050, 15},
		{70051, 15},
		{70102, 5},
		{50513, 5},
		{50301, 20},
		{50302, 15},
		{50303, 10},
	},

}

locale.quiz = {
	{
		gameforge[get_language()].locale.quiz_1_0_question,
		gameforge[get_language()].locale.quiz_1_1_choice,
		gameforge[get_language()].locale.quiz_1_2_choice,
		gameforge[get_language()].locale.quiz_1_3_choice,
		gameforge[get_language()].locale.quiz_1_4_choice,
		gameforge[get_language()].locale.quiz_1_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_2_0_question,
		gameforge[get_language()].locale.quiz_2_1_choice,
		gameforge[get_language()].locale.quiz_2_2_choice,
		gameforge[get_language()].locale.quiz_2_3_choice,
		gameforge[get_language()].locale.quiz_2_4_choice,
		gameforge[get_language()].locale.quiz_2_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_3_0_question,
		gameforge[get_language()].locale.quiz_3_1_choice,
		gameforge[get_language()].locale.quiz_3_2_choice,
		gameforge[get_language()].locale.quiz_3_3_choice,
		gameforge[get_language()].locale.quiz_3_4_choice,
		gameforge[get_language()].locale.quiz_3_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_4_0_question,
		gameforge[get_language()].locale.quiz_4_1_choice,
		gameforge[get_language()].locale.quiz_4_2_choice,
		gameforge[get_language()].locale.quiz_4_3_choice,
		gameforge[get_language()].locale.quiz_4_4_choice,
		gameforge[get_language()].locale.quiz_4_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_5_0_question,
		gameforge[get_language()].locale.quiz_5_1_choice,
		gameforge[get_language()].locale.quiz_5_2_choice,
		gameforge[get_language()].locale.quiz_5_3_choice,
		gameforge[get_language()].locale.quiz_5_4_choice,
		gameforge[get_language()].locale.quiz_5_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_6_0_question,
		gameforge[get_language()].locale.quiz_6_1_choice,
		gameforge[get_language()].locale.quiz_6_2_choice,
		gameforge[get_language()].locale.quiz_6_3_choice,
		gameforge[get_language()].locale.quiz_6_4_choice,
		gameforge[get_language()].locale.quiz_6_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_7_0_question,
		gameforge[get_language()].locale.quiz_7_1_choice,
		gameforge[get_language()].locale.quiz_7_2_choice,
		gameforge[get_language()].locale.quiz_7_3_choice,
		gameforge[get_language()].locale.quiz_7_4_choice,
		gameforge[get_language()].locale.quiz_7_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_8_0_question,
		gameforge[get_language()].locale.quiz_8_1_choice,
		gameforge[get_language()].locale.quiz_8_2_choice,
		gameforge[get_language()].locale.quiz_8_3_choice,
		gameforge[get_language()].locale.quiz_8_4_choice,
		gameforge[get_language()].locale.quiz_8_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_9_0_question,
		gameforge[get_language()].locale.quiz_9_1_choice,
		gameforge[get_language()].locale.quiz_9_2_choice,
		gameforge[get_language()].locale.quiz_9_3_choice,
		gameforge[get_language()].locale.quiz_9_4_choice,
		gameforge[get_language()].locale.quiz_9_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_10_0_question,
		gameforge[get_language()].locale.quiz_10_1_choice,
		gameforge[get_language()].locale.quiz_10_2_choice,
		gameforge[get_language()].locale.quiz_10_3_choice,
		gameforge[get_language()].locale.quiz_10_4_choice,
		gameforge[get_language()].locale.quiz_10_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_11_0_question,
		gameforge[get_language()].locale.quiz_11_1_choice,
		gameforge[get_language()].locale.quiz_11_2_choice,
		gameforge[get_language()].locale.quiz_11_3_choice,
		gameforge[get_language()].locale.quiz_11_4_choice,
		gameforge[get_language()].locale.quiz_11_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_12_0_question,
		gameforge[get_language()].locale.quiz_12_1_choice,
		gameforge[get_language()].locale.quiz_12_2_choice,
		gameforge[get_language()].locale.quiz_12_3_choice,
		gameforge[get_language()].locale.quiz_12_4_choice,
		gameforge[get_language()].locale.quiz_12_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_13_0_question,
		gameforge[get_language()].locale.quiz_13_1_choice,
		gameforge[get_language()].locale.quiz_13_2_choice,
		gameforge[get_language()].locale.quiz_13_3_choice,
		gameforge[get_language()].locale.quiz_13_4_choice,
		gameforge[get_language()].locale.quiz_13_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_14_0_question,
		gameforge[get_language()].locale.quiz_14_1_choice,
		gameforge[get_language()].locale.quiz_14_2_choice,
		gameforge[get_language()].locale.quiz_14_3_choice,
		gameforge[get_language()].locale.quiz_14_4_choice,
		gameforge[get_language()].locale.quiz_14_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_15_0_question,
		gameforge[get_language()].locale.quiz_15_1_choice,
		gameforge[get_language()].locale.quiz_15_2_choice,
		gameforge[get_language()].locale.quiz_15_3_choice,
		gameforge[get_language()].locale.quiz_15_4_choice,
		gameforge[get_language()].locale.quiz_15_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_16_0_question,
		gameforge[get_language()].locale.quiz_16_1_choice,
		gameforge[get_language()].locale.quiz_16_2_choice,
		gameforge[get_language()].locale.quiz_16_3_choice,
		gameforge[get_language()].locale.quiz_16_4_choice,
		gameforge[get_language()].locale.quiz_16_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_17_0_question,
		gameforge[get_language()].locale.quiz_17_1_choice,
		gameforge[get_language()].locale.quiz_17_2_choice,
		gameforge[get_language()].locale.quiz_17_3_choice,
		gameforge[get_language()].locale.quiz_17_4_choice,
		gameforge[get_language()].locale.quiz_17_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_18_0_question,
		gameforge[get_language()].locale.quiz_18_1_choice,
		gameforge[get_language()].locale.quiz_18_2_choice,
		gameforge[get_language()].locale.quiz_18_3_choice,
		gameforge[get_language()].locale.quiz_18_4_choice,
		gameforge[get_language()].locale.quiz_18_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_19_0_question,
		gameforge[get_language()].locale.quiz_19_1_choice,
		gameforge[get_language()].locale.quiz_19_2_choice,
		gameforge[get_language()].locale.quiz_19_3_choice,
		gameforge[get_language()].locale.quiz_19_4_choice,
		gameforge[get_language()].locale.quiz_19_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_20_0_question,
		gameforge[get_language()].locale.quiz_20_1_choice,
		gameforge[get_language()].locale.quiz_20_2_choice,
		gameforge[get_language()].locale.quiz_20_3_choice,
		gameforge[get_language()].locale.quiz_20_4_choice,
		gameforge[get_language()].locale.quiz_20_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_21_0_question,
		gameforge[get_language()].locale.quiz_21_1_choice,
		gameforge[get_language()].locale.quiz_21_2_choice,
		gameforge[get_language()].locale.quiz_21_3_choice,
		gameforge[get_language()].locale.quiz_21_4_choice,
		gameforge[get_language()].locale.quiz_21_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_22_0_question,
		gameforge[get_language()].locale.quiz_22_1_choice,
		gameforge[get_language()].locale.quiz_22_2_choice,
		gameforge[get_language()].locale.quiz_22_3_choice,
		gameforge[get_language()].locale.quiz_22_4_choice,
		gameforge[get_language()].locale.quiz_22_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_23_0_question,
		gameforge[get_language()].locale.quiz_23_1_choice,
		gameforge[get_language()].locale.quiz_23_2_choice,
		gameforge[get_language()].locale.quiz_23_3_choice,
		gameforge[get_language()].locale.quiz_23_4_choice,
		gameforge[get_language()].locale.quiz_23_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_24_0_question,
		gameforge[get_language()].locale.quiz_24_1_choice,
		gameforge[get_language()].locale.quiz_24_2_choice,
		gameforge[get_language()].locale.quiz_24_3_choice,
		gameforge[get_language()].locale.quiz_24_4_choice,
		gameforge[get_language()].locale.quiz_24_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_25_0_question,
		gameforge[get_language()].locale.quiz_25_1_choice,
		gameforge[get_language()].locale.quiz_25_2_choice,
		gameforge[get_language()].locale.quiz_25_3_choice,
		gameforge[get_language()].locale.quiz_25_4_choice,
		gameforge[get_language()].locale.quiz_25_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_26_0_question,
		gameforge[get_language()].locale.quiz_26_1_choice,
		gameforge[get_language()].locale.quiz_26_2_choice,
		gameforge[get_language()].locale.quiz_26_3_choice,
		gameforge[get_language()].locale.quiz_26_4_choice,
		gameforge[get_language()].locale.quiz_26_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_27_0_question,
		gameforge[get_language()].locale.quiz_27_1_choice,
		gameforge[get_language()].locale.quiz_27_2_choice,
		gameforge[get_language()].locale.quiz_27_3_choice,
		gameforge[get_language()].locale.quiz_27_4_choice,
		gameforge[get_language()].locale.quiz_27_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_28_0_question,
		gameforge[get_language()].locale.quiz_28_1_choice,
		gameforge[get_language()].locale.quiz_28_2_choice,
		gameforge[get_language()].locale.quiz_28_3_choice,
		gameforge[get_language()].locale.quiz_28_4_choice,
		gameforge[get_language()].locale.quiz_28_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_29_0_question,
		gameforge[get_language()].locale.quiz_29_1_choice,
		gameforge[get_language()].locale.quiz_29_2_choice,
		gameforge[get_language()].locale.quiz_29_3_choice,
		gameforge[get_language()].locale.quiz_29_4_choice,
		gameforge[get_language()].locale.quiz_29_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_30_0_question,
		gameforge[get_language()].locale.quiz_30_1_choice,
		gameforge[get_language()].locale.quiz_30_2_choice,
		gameforge[get_language()].locale.quiz_30_3_choice,
		gameforge[get_language()].locale.quiz_30_4_choice,
		gameforge[get_language()].locale.quiz_30_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_31_0_question,
		gameforge[get_language()].locale.quiz_31_1_choice,
		gameforge[get_language()].locale.quiz_31_2_choice,
		gameforge[get_language()].locale.quiz_31_3_choice,
		gameforge[get_language()].locale.quiz_31_4_choice,
		gameforge[get_language()].locale.quiz_31_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_32_0_question,
		gameforge[get_language()].locale.quiz_32_1_choice,
		gameforge[get_language()].locale.quiz_32_2_choice,
		gameforge[get_language()].locale.quiz_32_3_choice,
		gameforge[get_language()].locale.quiz_32_4_choice,
		gameforge[get_language()].locale.quiz_32_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_33_0_question,
		gameforge[get_language()].locale.quiz_33_1_choice,
		gameforge[get_language()].locale.quiz_33_2_choice,
		gameforge[get_language()].locale.quiz_33_3_choice,
		gameforge[get_language()].locale.quiz_33_4_choice,
		gameforge[get_language()].locale.quiz_33_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_34_0_question,
		gameforge[get_language()].locale.quiz_34_1_choice,
		gameforge[get_language()].locale.quiz_34_2_choice,
		gameforge[get_language()].locale.quiz_34_3_choice,
		gameforge[get_language()].locale.quiz_34_4_choice,
		gameforge[get_language()].locale.quiz_34_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_35_0_question,
		gameforge[get_language()].locale.quiz_35_1_choice,
		gameforge[get_language()].locale.quiz_35_2_choice,
		gameforge[get_language()].locale.quiz_35_3_choice,
		gameforge[get_language()].locale.quiz_35_4_choice,
		gameforge[get_language()].locale.quiz_35_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_36_0_question,
		gameforge[get_language()].locale.quiz_36_1_choice,
		gameforge[get_language()].locale.quiz_36_2_choice,
		gameforge[get_language()].locale.quiz_36_3_choice,
		gameforge[get_language()].locale.quiz_36_4_choice,
		gameforge[get_language()].locale.quiz_36_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_37_0_question,
		gameforge[get_language()].locale.quiz_37_1_choice,
		gameforge[get_language()].locale.quiz_37_2_choice,
		gameforge[get_language()].locale.quiz_37_3_choice,
		gameforge[get_language()].locale.quiz_37_4_choice,
		gameforge[get_language()].locale.quiz_37_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_38_0_question,
		gameforge[get_language()].locale.quiz_38_1_choice,
		gameforge[get_language()].locale.quiz_38_2_choice,
		gameforge[get_language()].locale.quiz_38_3_choice,
		gameforge[get_language()].locale.quiz_38_4_choice,
		gameforge[get_language()].locale.quiz_38_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_39_0_question,
		gameforge[get_language()].locale.quiz_39_1_choice,
		gameforge[get_language()].locale.quiz_39_2_choice,
		gameforge[get_language()].locale.quiz_39_3_choice,
		gameforge[get_language()].locale.quiz_39_4_choice,
		gameforge[get_language()].locale.quiz_39_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_40_0_question,
		gameforge[get_language()].locale.quiz_40_1_choice,
		gameforge[get_language()].locale.quiz_40_2_choice,
		gameforge[get_language()].locale.quiz_40_3_choice,
		gameforge[get_language()].locale.quiz_40_4_choice,
		gameforge[get_language()].locale.quiz_40_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_41_0_question,
		gameforge[get_language()].locale.quiz_41_1_choice,
		gameforge[get_language()].locale.quiz_41_2_choice,
		gameforge[get_language()].locale.quiz_41_3_choice,
		gameforge[get_language()].locale.quiz_41_4_choice,
		gameforge[get_language()].locale.quiz_41_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_42_0_question,
		gameforge[get_language()].locale.quiz_42_1_choice,
		gameforge[get_language()].locale.quiz_42_2_choice,
		gameforge[get_language()].locale.quiz_42_3_choice,
		gameforge[get_language()].locale.quiz_42_4_choice,
		gameforge[get_language()].locale.quiz_42_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_43_0_question,
		gameforge[get_language()].locale.quiz_43_1_choice,
		gameforge[get_language()].locale.quiz_43_2_choice,
		gameforge[get_language()].locale.quiz_43_3_choice,
		gameforge[get_language()].locale.quiz_43_4_choice,
		gameforge[get_language()].locale.quiz_43_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_44_0_question,
		gameforge[get_language()].locale.quiz_44_1_choice,
		gameforge[get_language()].locale.quiz_44_2_choice,
		gameforge[get_language()].locale.quiz_44_3_choice,
		gameforge[get_language()].locale.quiz_44_4_choice,
		gameforge[get_language()].locale.quiz_44_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_45_0_question,
		gameforge[get_language()].locale.quiz_45_1_choice,
		gameforge[get_language()].locale.quiz_45_2_choice,
		gameforge[get_language()].locale.quiz_45_3_choice,
		gameforge[get_language()].locale.quiz_45_4_choice,
		gameforge[get_language()].locale.quiz_45_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_46_0_question,
		gameforge[get_language()].locale.quiz_46_1_choice,
		gameforge[get_language()].locale.quiz_46_2_choice,
		gameforge[get_language()].locale.quiz_46_3_choice,
		gameforge[get_language()].locale.quiz_46_4_choice,
		gameforge[get_language()].locale.quiz_46_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_47_0_question,
		gameforge[get_language()].locale.quiz_47_1_choice,
		gameforge[get_language()].locale.quiz_47_2_choice,
		gameforge[get_language()].locale.quiz_47_3_choice,
		gameforge[get_language()].locale.quiz_47_4_choice,
		gameforge[get_language()].locale.quiz_47_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_48_0_question,
		gameforge[get_language()].locale.quiz_48_1_choice,
		gameforge[get_language()].locale.quiz_48_2_choice,
		gameforge[get_language()].locale.quiz_48_3_choice,
		gameforge[get_language()].locale.quiz_48_4_choice,
		gameforge[get_language()].locale.quiz_48_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_49_0_question,
		gameforge[get_language()].locale.quiz_49_1_choice,
		gameforge[get_language()].locale.quiz_49_2_choice,
		gameforge[get_language()].locale.quiz_49_3_choice,
		gameforge[get_language()].locale.quiz_49_4_choice,
		gameforge[get_language()].locale.quiz_49_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_50_0_question,
		gameforge[get_language()].locale.quiz_50_1_choice,
		gameforge[get_language()].locale.quiz_50_2_choice,
		gameforge[get_language()].locale.quiz_50_3_choice,
		gameforge[get_language()].locale.quiz_50_4_choice,
		gameforge[get_language()].locale.quiz_50_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_51_0_question,
		gameforge[get_language()].locale.quiz_51_1_choice,
		gameforge[get_language()].locale.quiz_51_2_choice,
		gameforge[get_language()].locale.quiz_51_3_choice,
		gameforge[get_language()].locale.quiz_51_4_choice,
		gameforge[get_language()].locale.quiz_51_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_52_0_question,
		gameforge[get_language()].locale.quiz_52_1_choice,
		gameforge[get_language()].locale.quiz_52_2_choice,
		gameforge[get_language()].locale.quiz_52_3_choice,
		gameforge[get_language()].locale.quiz_52_4_choice,
		gameforge[get_language()].locale.quiz_52_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_53_0_question,
		gameforge[get_language()].locale.quiz_53_1_choice,
		gameforge[get_language()].locale.quiz_53_2_choice,
		gameforge[get_language()].locale.quiz_53_3_choice,
		gameforge[get_language()].locale.quiz_53_4_choice,
		gameforge[get_language()].locale.quiz_53_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_54_0_question,
		gameforge[get_language()].locale.quiz_54_1_choice,
		gameforge[get_language()].locale.quiz_54_2_choice,
		gameforge[get_language()].locale.quiz_54_3_choice,
		gameforge[get_language()].locale.quiz_54_4_choice,
		gameforge[get_language()].locale.quiz_54_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_55_0_question,
		gameforge[get_language()].locale.quiz_55_1_choice,
		gameforge[get_language()].locale.quiz_55_2_choice,
		gameforge[get_language()].locale.quiz_55_3_choice,
		gameforge[get_language()].locale.quiz_55_4_choice,
		gameforge[get_language()].locale.quiz_55_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_56_0_question,
		gameforge[get_language()].locale.quiz_56_1_choice,
		gameforge[get_language()].locale.quiz_56_2_choice,
		gameforge[get_language()].locale.quiz_56_3_choice,
		gameforge[get_language()].locale.quiz_56_4_choice,
		gameforge[get_language()].locale.quiz_56_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_57_0_question,
		gameforge[get_language()].locale.quiz_57_1_choice,
		gameforge[get_language()].locale.quiz_57_2_choice,
		gameforge[get_language()].locale.quiz_57_3_choice,
		gameforge[get_language()].locale.quiz_57_4_choice,
		gameforge[get_language()].locale.quiz_57_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_58_0_question,
		gameforge[get_language()].locale.quiz_58_1_choice,
		gameforge[get_language()].locale.quiz_58_2_choice,
		gameforge[get_language()].locale.quiz_58_3_choice,
		gameforge[get_language()].locale.quiz_58_4_choice,
		gameforge[get_language()].locale.quiz_58_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_59_0_question,
		gameforge[get_language()].locale.quiz_59_1_choice,
		gameforge[get_language()].locale.quiz_59_2_choice,
		gameforge[get_language()].locale.quiz_59_3_choice,
		gameforge[get_language()].locale.quiz_59_4_choice,
		gameforge[get_language()].locale.quiz_59_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_60_0_question,
		gameforge[get_language()].locale.quiz_60_1_choice,
		gameforge[get_language()].locale.quiz_60_2_choice,
		gameforge[get_language()].locale.quiz_60_3_choice,
		gameforge[get_language()].locale.quiz_60_4_choice,
		gameforge[get_language()].locale.quiz_60_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_61_0_question,
		gameforge[get_language()].locale.quiz_61_1_choice,
		gameforge[get_language()].locale.quiz_61_2_choice,
		gameforge[get_language()].locale.quiz_61_3_choice,
		gameforge[get_language()].locale.quiz_61_4_choice,
		gameforge[get_language()].locale.quiz_61_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_62_0_question,
		gameforge[get_language()].locale.quiz_62_1_choice,
		gameforge[get_language()].locale.quiz_62_2_choice,
		gameforge[get_language()].locale.quiz_62_3_choice,
		gameforge[get_language()].locale.quiz_62_4_choice,
		gameforge[get_language()].locale.quiz_62_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_63_0_question,
		gameforge[get_language()].locale.quiz_63_1_choice,
		gameforge[get_language()].locale.quiz_63_2_choice,
		gameforge[get_language()].locale.quiz_63_3_choice,
		gameforge[get_language()].locale.quiz_63_4_choice,
		gameforge[get_language()].locale.quiz_63_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_64_0_question,
		gameforge[get_language()].locale.quiz_64_1_choice,
		gameforge[get_language()].locale.quiz_64_2_choice,
		gameforge[get_language()].locale.quiz_64_3_choice,
		gameforge[get_language()].locale.quiz_64_4_choice,
		gameforge[get_language()].locale.quiz_64_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_65_0_question,
		gameforge[get_language()].locale.quiz_65_1_choice,
		gameforge[get_language()].locale.quiz_65_2_choice,
		gameforge[get_language()].locale.quiz_65_3_choice,
		gameforge[get_language()].locale.quiz_65_4_choice,
		gameforge[get_language()].locale.quiz_65_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_66_0_question,
		gameforge[get_language()].locale.quiz_66_1_choice,
		gameforge[get_language()].locale.quiz_66_2_choice,
		gameforge[get_language()].locale.quiz_66_3_choice,
		gameforge[get_language()].locale.quiz_66_4_choice,
		gameforge[get_language()].locale.quiz_66_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_67_0_question,
		gameforge[get_language()].locale.quiz_67_1_choice,
		gameforge[get_language()].locale.quiz_67_2_choice,
		gameforge[get_language()].locale.quiz_67_3_choice,
		gameforge[get_language()].locale.quiz_67_4_choice,
		gameforge[get_language()].locale.quiz_67_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_68_0_question,
		gameforge[get_language()].locale.quiz_68_1_choice,
		gameforge[get_language()].locale.quiz_68_2_choice,
		gameforge[get_language()].locale.quiz_68_3_choice,
		gameforge[get_language()].locale.quiz_68_4_choice,
		gameforge[get_language()].locale.quiz_68_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_69_0_question,
		gameforge[get_language()].locale.quiz_69_1_choice,
		gameforge[get_language()].locale.quiz_69_2_choice,
		gameforge[get_language()].locale.quiz_69_3_choice,
		gameforge[get_language()].locale.quiz_69_4_choice,
		gameforge[get_language()].locale.quiz_69_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_70_0_question,
		gameforge[get_language()].locale.quiz_70_1_choice,
		gameforge[get_language()].locale.quiz_70_2_choice,
		gameforge[get_language()].locale.quiz_70_3_choice,
		gameforge[get_language()].locale.quiz_70_4_choice,
		gameforge[get_language()].locale.quiz_70_5_answer
	},
	{
		gameforge[get_language()].locale.quiz_71_0_question,
		gameforge[get_language()].locale.quiz_71_1_choice,
		gameforge[get_language()].locale.quiz_71_2_choice,
		gameforge[get_language()].locale.quiz_71_3_choice,
		gameforge[get_language()].locale.quiz_71_4_choice,
		gameforge[get_language()].locale.quiz_71_5_answer
	},
}

locale.GM_SKILL_NAME_DICT = {
	[1] = gameforge[get_language()].locale.gm_skill_name_1,
	[2] = gameforge[get_language()].locale.gm_skill_name_2,
	[3] = gameforge[get_language()].locale.gm_skill_name_3,
	[4] = gameforge[get_language()].locale.gm_skill_name_4,
	[5] = gameforge[get_language()].locale.gm_skill_name_5,
	[16] = gameforge[get_language()].locale.gm_skill_name_6,
	[17] = gameforge[get_language()].locale.gm_skill_name_7,
	[18] = gameforge[get_language()].locale.gm_skill_name_8,
	[19] = gameforge[get_language()].locale.gm_skill_name_9,
	[20] = gameforge[get_language()].locale.gm_skill_name_10,
	[31] = gameforge[get_language()].locale.gm_skill_name_11,
	[32] = gameforge[get_language()].locale.gm_skill_name_12,
	[33] = gameforge[get_language()].locale.gm_skill_name_13,
	[34] = gameforge[get_language()].locale.gm_skill_name_14,
	[35] = gameforge[get_language()].locale.gm_skill_name_15,
	[46] = gameforge[get_language()].locale.gm_skill_name_16,
	[47] = gameforge[get_language()].locale.gm_skill_name_17,
	[48] = gameforge[get_language()].locale.gm_skill_name_18,
	[49] = gameforge[get_language()].locale.gm_skill_name_19,
	[50] = gameforge[get_language()].locale.gm_skill_name_20,
	[61] = gameforge[get_language()].locale.gm_skill_name_21,
	[62] = gameforge[get_language()].locale.gm_skill_name_22,
	[63] = gameforge[get_language()].locale.gm_skill_name_23,
	[64] = gameforge[get_language()].locale.gm_skill_name_24,
	[65] = gameforge[get_language()].locale.gm_skill_name_25,
	[66] = gameforge[get_language()].locale.gm_skill_name_26,
	[76] = gameforge[get_language()].locale.gm_skill_name_27,
	[77] = gameforge[get_language()].locale.gm_skill_name_28,
	[78] = gameforge[get_language()].locale.gm_skill_name_29,
	[79] = gameforge[get_language()].locale.gm_skill_name_30,
	[80] = gameforge[get_language()].locale.gm_skill_name_31,
	[81] = gameforge[get_language()].locale.gm_skill_name_32,
	[91] = gameforge[get_language()].locale.gm_skill_name_33,
	[92] = gameforge[get_language()].locale.gm_skill_name_34,
	[93] = gameforge[get_language()].locale.gm_skill_name_35,
	[94] = gameforge[get_language()].locale.gm_skill_name_36,
	[95] = gameforge[get_language()].locale.gm_skill_name_37,
	[96] = gameforge[get_language()].locale.gm_skill_name_38,
	[106] = gameforge[get_language()].locale.gm_skill_name_39,
	[107] = gameforge[get_language()].locale.gm_skill_name_40,
	[108] = gameforge[get_language()].locale.gm_skill_name_41,
	[109] = gameforge[get_language()].locale.gm_skill_name_42,
	[110] = gameforge[get_language()].locale.gm_skill_name_43,
	[111] = gameforge[get_language()].locale.gm_skill_name_44,
}
locale.dungeon = {}
locale.dungeon.time_limit_party = "Das Dungeon-Party sosokwon nicht verstrichene Zeit ist begrenzt, da die Position wurde vom Platz gestellt."
locale.dungeon.time_limit = "Dungeon Position Grenzen wurden ausgeschaltet, weil die Zeit noch nicht abgelaufen ist, geschickt."
locale.dungeon.no_ticket_party = "Rote Karten haben keinen Pass Zertifikat der Partei waren sosokwon."
locale.dungeon.no_ticket = "Verhandelbar Zertifikate wurden nicht abgeschickt."
locale.dungeon.level_limit_party = "Parteien nicht erreichen sosokwon %d Lv geschickt wurde."
locale.dungeon.level_limit = "%d Lv nicht erreicht wurden abgeschickt."
locale.dungeon.leader_can_go = "Der F�hrer der Partei, aber Sie k�nnen gehen."
locale.dungeon.enter_yes = "Gib."
locale.dungeon.enter_no = "Geben Sie nicht."
locale.dungeon.leader_can_enter = "Der F�hrer der Partei, kann aber f�r die Zulassung beantragen."
locale.dungeon.party_can_enter = "Das Verlies Eingang ist eine Partei an den Staat."

locale.flame_dungeon = {}
locale.flame_dungeon.say_1 = "Yamacheon yeomwang eine Position zu bestrafen sicher?"
locale.flame_dungeon.say_2 = "Position"
locale.flame_dungeon.say_3 = "schlie�en"
locale.flame_dungeon.say_4 = "Partei Kapitel 103Lv nicht f�llen Sie alle Quests, sind weitere Fortschritte nicht m�glich."
locale.flame_dungeon.say_5 = "Das Dungeon-Party sosokwon nicht verstrichene Zeit ist begrenzt, da die Position wurde vom Platz gestellt."
locale.flame_dungeon.say_6 = "Dungeon Position Grenzen wurden ausgeschaltet, weil die Zeit noch nicht abgelaufen ist, geschickt."
locale.flame_dungeon.say_7 = "Diese Stelle kann nicht sosokwon Partei Zertifizierung wurde abgeschickt."
locale.flame_dungeon.say_8 = "Verhandelbar Zertifikate wurden nicht abgeschickt."
locale.flame_dungeon.say_9 = "Sosokwon beiden Parteien nicht erreichen 100lv geschickt wurde."
locale.flame_dungeon.say_10 = "Noch nicht erreicht wurde, beenden 100lv."
locale.flame_dungeon.say_11 = "Jeokryong Schloss"
locale.flame_dungeon.say_12 = "Wollen Sie zum Schloss wirklich jeokryong gehen?"
locale.flame_dungeon.say_13 = "Gib"
locale.flame_dungeon.say_14 = "Geben Sie nicht."
locale.flame_dungeon.say_15 = "Der F�hrer der Partei, kann aber f�r die Zulassung beantragen."
locale.flame_dungeon.say_16 = "Das Verlies Eingang ist eine Partei an den Staat."
locale.flame_dungeon.say_17 = "Sowohl die Verweilzeit abgelaufen ist, wird der Eintrag jeokryong gehen aus der Stadt."
locale.flame_dungeon.say_18 = "Retentionszeit jeokryong sex position %d Minuten."
locale.flame_dungeon.say_19 = "Alle Sex-Stellungen jeokryong Verweilzeit abgelaufen."
locale.flame_dungeon.say_20 = "Jeokryong wird aus der Stadt etwa 10 Sekunden bewegt."
locale.flame_dungeon.say_21 = "Jeokryong Geschlecht Verhalten."
locale.flame_dungeon.say_22 = "Der F�hrer der Partei, aber Sie k�nnen gehen."
locale.flame_dungeon.say_23 = "Jeokryong daegeon ausgeschaltet ist."
locale.flame_dungeon.say_24 = "Jeokryong sex position wird 1 Stunde, vollst�ndig oder in Entwicklung w�hrend jeokryong Stern wurde 30 Minuten gesendet aufrechterhalten werden, wenn die Position ist begrenzt."
locale.flame_dungeon.say_25 = "Jeokryong Stunde Sex-Stellungen zu halten �berlassen."
locale.flame_dungeon.say_26 = "Daegeon jeokryong ausgeschaltet ist, einen Platz zum alles B�se zu besiegen."
locale.flame_dungeon.say_27 = "Alles B�se wird nicht besiegt noch."
locale.flame_dungeon.say_28 = "T�tet die restlichen: "
locale.flame_dungeon.say_29 = "Daegeon jeokryong ausgeschaltet ist, um einen Platz f�r alle entsiegeln finden."
locale.flame_dungeon.say_30 = "Erforderlich, um die b�sen Z�hne erhalten lassen, wenn die Behandlung ist m�glich."
locale.flame_dungeon.say_31 = "Jean Ritzel Dichtung kann nur off ausgeschaltet werden."
locale.flame_dungeon.say_32 = "Daegeon jeokryong freigegeben wird, um herauszufinden, wo die geheimnisvolle Jean Verliehen Incinerator."
locale.flame_dungeon.say_33 = "Jin lebt Incinerator Bars, jeokryong sex Dichtung ist fest."
locale.flame_dungeon.say_34 = "Verliehen Jean Incinerator finden Bars."
locale.flame_dungeon.say_35 = "Daegeon jeokryong freigegeben worden, um herauszufinden, wo man entsiegeln."
locale.flame_dungeon.say_36 = "Sealing Stone Church an der Wende jeokryong B�se erhalten wird."
locale.flame_dungeon.say_37 = "Sealing Stein wurde nicht beide entlassen."
locale.flame_dungeon.say_38 = "Jeokryong daegeon Di hearthstone ausgeschaltet ist, einen Ort zu zerst�ren finden."
locale.flame_dungeon.say_39 = "Ich glaube nicht, Ruhestein Di zerst�rt werden, einer nach dem anderen, und sie sind b�se."
locale.flame_dungeon.say_40 = "Di zu finden und zerst�ren den Ruhestein."
locale.flame_dungeon.say_41 = "Halten yamacheon Beat"
locale.flame_dungeon.say_42 = "Alle Monster besiegt wurden."
locale.flame_dungeon.say_43 = "Jeokryong Verh�ltnis im Laufe des n�chsten jeokryong daegeon freizugeben."
locale.flame_dungeon.say_44 = "Beide wurden abgeriegelt."
locale.flame_dungeon.say_45 = "Der eigentliche Schl�ssel ist nicht"
locale.flame_dungeon.say_46 = "Bullion wurde von Jin Incinerator besiegt."
locale.flame_dungeon.say_47 = "Bitte zerlegen Sie das zweite Verzauberung"
locale.flame_dungeon.say_48 = "Bitte bauen Sie die dritte Chains."
locale.flame_dungeon.say_49 = "Falsche Reihenfolge."
locale.flame_dungeon.say_50 = "Bitte bauen Sie die vierte Chains."
locale.flame_dungeon.say_51 = "Ketten von vier oder f�nf ersten Besuch demontieren."
locale.flame_dungeon.say_52 = "Ketten von vier oder f�nf ersten Besuch demontieren."
locale.flame_dungeon.say_53 = "Ketten von vier oder f�nf ersten Besuch demontieren."
locale.flame_dungeon.say_54 = "Di hearthstone besiegt wurde."
locale.flame_dungeon.say_55 = "Yeomwang yamacheon besiegt wurde."
locale.flame_dungeon.say_56 = "Sind aus der Stadt nach einer Minute jeokryong bewegt."
locale.flame_dungeon.say_57 = "Parteien nicht erreichen Kapitel 104Lv weitere Fortschritte ist nicht m�glich."
locale.flame_dungeon.say_58 = "Partei kann nicht weiter vorgehen Behinderung verschwinden [ENTER]"
locale.flame_dungeon.say_59 = "Re-entry Zeit ist mehr als f�nf Minuten ist nicht erlaubt. [ENTER]"
locale.flame_dungeon.say_60 = "Partei nicht mit Dungeon hayeotgeona starten."

locale.main_quest_flame_lv99 = {}
locale.main_quest_flame_lv99.say_1 = "�ٽ� ���۵Ǵ� ����"
locale.main_quest_flame_lv99.say_2 = "��ȯ(20377)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]��ȯ(20377)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv99.say_3 = "� ���Գ�.[ENTER]�������� �ʸ����� ������ �����ϴ��� ����� ���Ҿ���.[ENTER]���� �ʸ����� �и� �̴�� �������� ���� ���̶� �����ϰ� �־��ٳ�.[ENTER]�׷��� ���� ������ �� �ִ� ��� �������� �����ؼ�, ������ ����ϰ� �־��ٳ�.[ENTER]"
locale.main_quest_flame_lv99.say_4 = "��. �̷��� �θ������� ���� ���� ���̱���?[ENTER]"
locale.main_quest_flame_lv99.say_5 = "�׷���.[ENTER]�׷��� �� �״�� ������ �� ���� Ȯ���� ������ ���� ���¶��.[ENTER]�׷��� �ڳװ� �� ���� ���ͼ� Ȯ���� ���־����� �Ѵٳ�.[ENTER]"
locale.main_quest_flame_lv99.say_6 = "�ֱٵ� ����ȭ���� �ɻ�ġ �ʴٴ� ������ ���� �鸮�� ������ ����, ���ϸ� ���� Ȯ���� �� ���� �ߴٳ�.[ENTER]������ ������ �����ӿ��� �ұ��ϰ� ���ƿ��� �ʰ� �ִٳ�.[ENTER]����ȭ���� �������� ������ ��¼�� ���ϴ� �༮�ε�, �и� ���� ���� ���� �� ���ٳ�.[ENTER]�ڳװ� ����ȭ���ΰ���, �������� ���� ������ ���� ���ְԳ�.[ENTER]���ϳ༮�� ã�ŵ� ���� ��ȯ�϶�� ���� �����ְ� ���̾�.[ENTER]"
locale.main_quest_flame_lv99.say_7 = "��. �˰ڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv99.say_8 = "���Ͽ� �������� ������ �ְ� �޴� ��, �뷫���� ��ġ�� �ľ��� �� ���´� ���� ������ ǥ������ ������ ������ �� ���ϼ�.[ENTER]�ٳ� ���Գ�.[ENTER]"
locale.main_quest_flame_lv99.say_9 = "��ȯ(20377)�� ����ȭ�� ������ ǥ�ø� ���־����ϴ�.[ENTER]Ȯ���� ������ (%d,%d) �Դϴ�."
locale.main_quest_flame_lv99.say_10 = "����ȭ���� ��������!"
locale.main_quest_flame_lv99.say_11 = "��ȯ(20377)�� �˷� �� ���� �����ϵ��� ����.[ENTER]"
locale.main_quest_flame_lv99.say_12 = "���� ������ ǥ������ ���� �и� ���� ���� ���̳�.[ENTER]�ڼ��� ���ƺ��� �� ���� �´°�?[ENTER]�ñ��� ������ ���̴� � �ٳ�� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv99.say_13 = "��ȯ(20377)�� �˷��� ������ �����Ͽ����ϴ�.[ENTER]��ȯ(20377)���� ���ư� �����Ͻʽÿ�."
locale.main_quest_flame_lv99.say_14 = "�Ƿ決������ ��ȯ(20377)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv99.say_15 = "��! ���� �Ա� �׷�.[ENTER]���� �� ���Դ°�?[ENTER]"
locale.main_quest_flame_lv99.say_16 = "������ ǥ�����ֽ� ���� ����������, �ƽ��Ե� ���Ϻ��� ����� ã�� ���Ͽ����ϴ�.[ENTER]�ֺ��� ���캻 ��� �������� �Ҹ��� �췷���� �鸮��, �����⽺���� ������ �ϳ� �߰��Ͽ����ϴ�.[ENTER]"
locale.main_quest_flame_lv99.say_17 = "�׷���.[ENTER]�ƹ����� ���� �Ҿ��ϱ� �׷�.[ENTER]�ڳװ� ���� ������ ���ؼ� �� �����ϰ� �ٽ� �θ����� �ϰڳ�.[ENTER]"
locale.main_quest_flame_lv99.say_18 = "����1-1"
locale.main_quest_flame_lv99.say_19 = "�ڳװ� ������ �˷��� �� ������ ���ؼ� �˾� ������ �Ȱ����� ������, ���� ���Ǹ� ���� ���ϰ� �ִٳ�.[ENTER]�ƹ����� ����(20380)�� ������ ������ �ʿ� �� �� ���� �׷�.[ENTER]���� �ڳ׿��� ������ �� ���̴� ����(20380)���� ���� �ְԳ�.[ENTER]����(20380)�� �� ������ ���� �˾ƺ��� ������ �� ���̾�.[ENTER]"
locale.main_quest_flame_lv99.say_20 = "�Ƿ決������ ����(20380)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv99.say_21 = "(�߾� �߾�)[ENTER]��¦�̾ߡ��� ��� �Ź� ����� �Ű�� ������[ENTER]���� �Դٰ� �⺰�� �ؾ� �� ���� �ƴѰ�?[ENTER]�׷�. ���� �Ϸ� �Դ°�?[ENTER]"
locale.main_quest_flame_lv99.say_22 = "��ȯ(20377)�Բ��� �� ������ ���� �ֶ� �ϼ̽��ϴ�.[ENTER]"
locale.main_quest_flame_lv99.say_23 = "������ȯ(20377)���� ������ ����, � ���� ����Ͻô� �� �� �� ���� �׷�.[ENTER]�����̵� Ȯ���� ���� ������, ���� �� ���� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv99.say_24 = "�ڳװ� �ٳ�� �� ���� �α��� ������ ���ƾ� �� �� ����.[ENTER]�ֺ� ���� ������ ���� ���� ���� ���̳�. �Ժη� �����ٰ��� ���� �׸�ġ�� �Ǵ� ���ϼ�.[ENTER]�������� �����⽺���� �Ҹ��� ���Դٰ� �ϴ�, �ֺ� �������� ������ ���� ������ �ͳ�.[ENTER]�� ���̸� �����̴�, ������ ���� �ֺ� ������ óġ�� �ְԳ�.[ENTER]Ź���� ������ ū ������ óġ�ϸ� �˰� ���� ���̳�.[ENTER]"
locale.main_quest_flame_lv99.say_25 = "��ȯ(20377)���� �����Ͽ��� ���� �ֺ� ������ óġ����."
locale.main_quest_flame_lv99.say_26 = "���� �ֺ��� ������ óġ����."
locale.main_quest_flame_lv99.say_27 = "��ȯ(20377)���� �����Ͽ��� ���� �ֺ��� ������ óġ ����.[ENTER]"
locale.main_quest_flame_lv99.say_28 = "�����и� �ֺ��� Ź���� ������ �޾��� ���ε�.[ENTER]���� Ȯ���ϰ� �� ���� �´°�?[ENTER]�ٽ� �ѹ� �ٳ�� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv99.say_29 = "����(20380)�� �� ���̰� �˰� ���Ͽ���. ����(20380)���� ��������."
locale.main_quest_flame_lv99.say_30 = "�Ա��׷�.[ENTER]�������� Ź���� ������ ���� �������� ������ ���� �ִ� ���̱���.[ENTER]�� ���̿� ����� Ź�⸦ ���縦 �غ��ƾ� �ϴ� �ϴ� ���ư��� ���� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv99.say_31 = "����1-2"
locale.main_quest_flame_lv99.say_32 = "����(20380)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]����(20380)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv99.say_33 = "����Գ�.[ENTER]�ڳװ� ������ Ź�Ⱑ ����� ���̸� ������ ���� �ִ� ���� ����.[ENTER]Ź��� �Ϲ����� �����ϸ� ������ Ź������ ������, ���� �ǿ�� �����Ͽ��� �Ѵٳ�.[ENTER]�׷��� �̹��� ���縦 �ϴ� �߿� ���� ��� ���ʰ� ��� �����Ǿ ���̾�.[ENTER]"
locale.main_quest_flame_lv99.say_34 = "�׷�����. �ɻ�ġ ���� ���°� ���̴� ���� � ���ʸ� ���� ������ �ϰڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv99.say_35 = "����.[ENTER]�ڳ״� �� �׸� ��ġ�� ����������[ENTER]���ʴ� ���⸦ ������ �ϴ� �߿��� ������ �Ѵٳ�.[ENTER]�׷��ٺ��� ��Ⱑ ��ġ�� ���� �ڻ��� �Ѵٳ�.[ENTER]����ȭ���� �� ���̰�, �� ���ʿ� ������ �ڳװ� �ٳ���Գ�.[ENTER]�� ������ ���� ���� �� ���̾�.[ENTER]���� ���� ����� ���������ؼ� ��Ȯ���� �ʴٳ�.[ENTER]"
locale.main_quest_flame_lv99.say_36 = "��. �˰ڽ��ϴ�.[ENTER]��� �ٳ� ������ �ϰڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv99.say_37 = "����(20380)�� ������ ǥ������ ������ �¾���(31076)�� ���ؿ���"
locale.main_quest_flame_lv99.say_38 = "�¾���(31076)�� ������."
locale.main_quest_flame_lv99.say_39 = "����(20380)�� �� ������ ��ġ���� ���ʸ� ���ؿ���.[ENTER]"
locale.main_quest_flame_lv99.say_40 = "�̺���[ENTER]����̸� ��¼�ڴ� ���ΰհ�?[ENTER]�� �¾���(31076)�� ������ �� �̻� ���簡 ��ƴ� ���ϼ�.[ENTER]�ٽ� �ٳ�� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv99.say_41 = "����(20380)�� ���ϴ� �¾���(31076)�� �߰��Ͽ���. ����(20380)���� ��������."
locale.main_quest_flame_lv99.say_42 = "�׷�. �ٷ� �� ���� �ϼ�.[ENTER]���� ���縦 ������ �� �� �ְ� �Ǿ��� �׷�.[ENTER]���簡 �Ϸ�ǰŵ� ��ȯ(20377)�Կ��� �Ϸ� �����̴� ���߿� �������� �ϰԳ�.[ENTER]"

locale.main_quest_flame_lv100 = {}
locale.main_quest_flame_lv100.say_1 = "Ź���� ��ü"
locale.main_quest_flame_lv100.say_2 = "��ȯ(20377)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]��ȯ(20377)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv100.say_3 = "� ���Գ�.[ENTER]�ڳװ� ����(20380)�� ���� �������� ���п� ��Ȱ�ϰ� ���簡 ������ �Ǿ��ٳ�.[ENTER]�ϴ� ������ ����� �ڳ׿��� �˷� �ֵ��� �ϰڳ�.[ENTER]"
locale.main_quest_flame_lv100.say_4 = "����(20380)�� ���� ���ϸ�, �ڳ׿� ������ �� ���� �α��� ������ ���������� �ٸ� �� ���Ͽ�[ENTER]������ �� ���̶� �ϴ�����.[ENTER]�� ������ ������ �Ǹ� �������� ���� �������� ���̵Ǹ�, ���� ������ ������ ���̰� �ȴٴ±�.[ENTER]�ϴ� Ź�Ⱑ ������ �ͺ��� ���ƾ�, �ֺ��� ���ذ� �� �� ������ ���̴±� �׷�.[ENTER]"
locale.main_quest_flame_lv100.say_5 = "�׷��ٸ�, Ź�Ⱑ ������ ���� ���� ���ؼ��� ��� �Ͽ��� �մϱ�?[ENTER]"
locale.main_quest_flame_lv100.say_6 = "�׷��� �ʾƵ�, Ź���� ������ ���� ���ؼ� ���ݼ���(20001)�� �ǰ��� ������ ���Ҵٳ�.[ENTER]���ݼ���(20001)�� �� ���� �浵�� �������̴�, �� �̻� ������ �ʵ��� ������ óġ�� �ְԳ�.[ENTER]���� ��ó ������ ������ �ʰ� 300�������� óġ�ϸ� �� ���� �� �ϳ�.[ENTER]"
locale.main_quest_flame_lv100.say_7 = "��. ���� ��� ��� �ϰڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv100.say_8 = "����. ���� ������ ����ϰ� �ְڳ�.[ENTER]"
locale.main_quest_flame_lv100.say_9 = "��ȯ(20377)�� �����Ͽ��� ���� �ֺ� ������ óġ����."
locale.main_quest_flame_lv100.say_10 = "����ȭ�� ������ óġ����!"
locale.main_quest_flame_lv100.say_11 = "��ȯ(20377)�� �����Ͽ��� ���� �ֺ� ������ óġ����.[ENTER]"
locale.main_quest_flame_lv100.say_12 = "������ ����� óġ�� �ϰ� �� ���ΰ�?[ENTER]���ϵ� ����δ� ���� ���ġ �ʾ� ���̳׸�.[ENTER]��� ������ óġ�ϰ� ���ְԳ�.[ENTER]"
locale.main_quest_flame_lv100.say_13 = "�ֺ� ������ ����� óġ�Ͽ���.[ENTER]��ȯ(20377)���� �����ϵ��� ����."
locale.main_quest_flame_lv100.say_14 = "�Ƿ決������ ��ȯ(20377)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv100.say_15 = "���������̸� ����ϰ� ������ óġ�� �� ��������[ENTER]���ݼ���(20001)���Դ� ���� �ֺ� ������ óġ�� ���� �˸� ���̴� ���� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv100.say_16 = "Ź���� ����1-1"
locale.main_quest_flame_lv100.say_17 = "���ݼ���(20001)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]���ݼ���(20001)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv100.say_18 = "�̷� ���桦[ENTER]��ȯ(20377)�Բ� �׸� �����ϰ� �ൿ�� �޶�� ��Ź�� �߰Ǹ�, ���� Ŀ����� ���ұ� �׷�.[ENTER]Ź��� ������ �����鼭 Ư�� �� ���������� ������ �ִµ� 300������ �Ǵ� ������[ENTER]������ �������� ū���̳�.[ENTER]"
locale.main_quest_flame_lv100.say_19 = "���� ��Ȳ�� ������ ��ȭ�� �Ǿ� �ִ� �����̳�.[ENTER]�Դٰ� ���� Ź�⸦ �����Ϸ��� ������� ���(31084)�� ���ڶ�� �Ǿ� ���ȴٳ�.[ENTER]�� ���� ������ �ٸ��� ������ óġ�ϰ� �Ǹ�, Ź�Ⱑ ������ ���� ���� �� �ִٳ�.[ENTER]���ڶ�� �Ǿ� �������� �ڳװ� ��Ḧ �� ������ �־�� �� ���̾�.[ENTER]"
locale.main_quest_flame_lv100.say_20 = "��. �˰ڽ��ϴ�. ��ᰡ �����Դϱ�?[ENTER]"
locale.main_quest_flame_lv100.say_21 = "�ڳװ� �� ���� �� �������� �ǹ��̱�����[ENTER]��ü ���ϱⰡ ���� ���� �͵��̶󼭡�[ENTER]�ϴ� �˷��ֵ��� ����!![ENTER]���(31084)�� ����� ���ؼ��� �ʼ�(90010)10��, ���� ����(30010) 50��, �Ź��� ���ָӴ�(30025)10��, Ȱ��(51001) 200���� �ʿ��ϴٳ�.[ENTER]��� �ڳ����� �Ǵ� �����̶�� ��� ���� �� �ִ����� �����̴� ������ �����ϰڳ�.[ENTER]"
locale.main_quest_flame_lv100.say_22 = "���� ���� �� �ִ� ���� �ƴϱ���. �ٳ������ �ϰڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv100.say_23 = "�˰ڳ�. �츮�� �̷��� ���� �ϴ� ���߿��� Ź�Ⱑ ���������� ������ ���ѷ� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv100.say_24 = "���ݼ���(20001)�� ���� ���(31084)�� �ϼ��ϵ��� ����."
locale.main_quest_flame_lv100.say_25 = "���� ���"
locale.main_quest_flame_lv100.say_26 = "���(31084)�� ���� ���Ḧ ������."
locale.main_quest_flame_lv100.say_27 = "���ݼ���(20001)�� �Ϸ��� ���Ḧ ���ϵ��� ����.[ENTER]"
locale.main_quest_flame_lv100.say_28 = "��~������ ���� ���� ��ῴ�� ���ε�.[ENTER]���ɵ� ���� �Ա� �׷�.[ENTER]���(31084)�� ����� �θ� ���̴� �����Գ�.[ENTER]"
locale.main_quest_flame_lv100.say_29 = "�̺�. ���� ���ڵ� �ؾƸ��� ���ϴ� ������� ���̴� �հ�?[ENTER]� ��� ���Ḧ Ȯ���� �ְԳ�.[ENTER]���� �� �ð����� Ź��� â���ϰ� �ִٳ�.[ENTER]"
locale.main_quest_flame_lv100.say_30 = "���(31084)�� ���� ��Ḧ ��� Ȯ���Ͽ���. ���ݼ���(20001)���� �����ֵ��� ����."
locale.main_quest_flame_lv100.say_31 = "�Ƿ決������ ���ݼ���(20001)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv100.say_32 = "Ź���� ����1-2"
locale.main_quest_flame_lv100.say_33 = "�̷��̷���[ENTER]������ ���� ���� ��ÿ� ��������(20016)���� ���� �ŷȴ���, �ʼ�(90010)�� ����� ����� ���� �ʴ� ���׷���[ENTER]�ʼ�(90010)�� ����� ����� �ٸ� ���� �Բ� �����Ͽ� ���� �ϼ��ϴµ� ���̾ߡ�[ENTER]�����ɻ� ���� ���� �׷���, �ڳװ� �̰� ����� �ʼ�(90010)�� ����� ���� ������ �ְڳ�?[ENTER]"
locale.main_quest_flame_lv100.say_34 = "��� �ϼ̱⿡��[ENTER]�ϴ� �˰ڽ��ϴ�. �ʼ�(90010)�� �� �ٱ��ϸ� �ֽ�����.[ENTER]"
locale.main_quest_flame_lv100.say_35 = "����. ��ٸ��� �ְڳ�.[ENTER]"
locale.main_quest_flame_lv100.say_36 = "��������(20016)���� �ٳ����."
locale.main_quest_flame_lv100.say_37 = "��������(20016)���� �ʼ�(90010)�� ����� ����� ����.[ENTER]"
locale.main_quest_flame_lv100.say_38 = "�ʼ�(90010)����: 1��[ENTER]"
locale.main_quest_flame_lv100.say_39 = "���̱� ������ ���� ���̽ʴϱ�?[ENTER]�� ���� ������ �緯 ���� �شϱ�?[ENTER]"
locale.main_quest_flame_lv100.say_40 = "��~�ٸ��� �ƴ϶� ���ݼ���(20001)�Բ� �̾߱�� ������ϴ�.[ENTER]�ñ��� �ñ��� ��ŭ ������ û�Ϸ� �Խ��ϴ�.[ENTER]���ݼ���(20001)�Բ��� ���� ã�ư� ������� ������ �̾��ϰ� �����ϸ�, �� ���� �ٱ��ϸ� �����̽��ϴ�.[ENTER]"
locale.main_quest_flame_lv100.say_41 = "�졦���� ���Ƽ� ���ְ� ���� ��������[ENTER]�����Բ��� ���� �̷��� ã���ֽð�, ����� ǥ���� �Ͽ����� �ʼ�(90010)�� ���Ƶ帮����.[ENTER]��ø� ��ٸ��ʽÿ�.[ENTER]"
locale.main_quest_flame_lv100.say_42 = "��. �����մϴ�.[ENTER]"
locale.main_quest_flame_lv100.say_43 = "�ڳ�. ��տ� �ʼ�(90010)�� �ٱ��ϰ� �״������ ��������[ENTER]� �ٳ�� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv100.say_44 = "�ʼ�(90010)�� ��� ���Ҵ�. ���ݼ���(20001)���� ��������.[ENTER]"
locale.main_quest_flame_lv100.say_45 = "��~��������(20016)�� ����� �޾��� ����̱� �׷�.[ENTER]���� ���� ���ϰ� ��ƾ�������[ENTER]����� ���� �ʼ�(90010)�� ������ �ְ� ���� �ְԳ�.[ENTER]���� �ϼ��� �Ǹ� �θ����� �ϰڳ�.[ENTER]"

locale.main_quest_flame_lv101 = {}
locale.main_quest_flame_lv101.say_1 = "������ ��ü"
locale.main_quest_flame_lv101.say_2 = "��ȯ(20377)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]��ȯ(20377)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv101.say_3 = "� ���Գ�.[ENTER]���ݼ���(20001)���Դ� �ڳ��� ��� ���ؼ� ���� ����ٳ�.[ENTER]���� ���� ���� ������ �ڳװ� ����� �� �� ������ �׷�.[ENTER]�̾��ϰ� �����Ѵٳ�.[ENTER]"
locale.main_quest_flame_lv101.say_4 = "�̾��� ���� �̾��� ���̰�, �ñ��� �� �޹��ϰ� �Ǿ����� ��Ǹ� ������ �ϵ��� �ϰڳ�.[ENTER]���ݼ���(20001)���� ���(31084)�� ���� �ǳ��� �޾Ҵٳ�.[ENTER]�� ���� ������ �ٸ��� óġ�� ������ Ź�Ⱑ ������ ���� �����Ͽ� �شٳ�.[ENTER]"
locale.main_quest_flame_lv101.say_5 = "�࿡ ���� ������ �� ������ �ϰ�, �ڳװ� ���־�� �� ���� �˷� �ְڳ�.[ENTER]���� ������ �غ� �Ǿ���, �츮�� �߰��� �� ������ ���� �ڼ��� �˾� �� �ʿ䰡 �ִٳ�.[ENTER]Ź�Ⱑ ������ �͵� �׷���, �и� �����Ͽ� �������� óġ�ϴٺ���, ���� �ܼ��� ���� �� �ϳ�.[ENTER]�ڳװ� ���� ������ �����Ͽ�, Ȯ���� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv101.say_6 = "�ơ��࿩ �������� ���ϰ� �߰��� �ǰŵ� �� ��Ƽ� ��ȯ�϶�� ���� �ְԳ�.[ENTER]������ ���ο� ���ϸ�, �� ���ϰ� ������ ���� �� �� ���Ƽ� ���̾�.[ENTER]"
locale.main_quest_flame_lv101.say_7 = "��. ���� ��� ��� �ϰڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv101.say_8 = "����. ���� ������ ����ϰ� �ְڳ�.[ENTER]"
locale.main_quest_flame_lv101.say_9 = "�������� ������ óġ�Ͽ� �ܼ��� ��ȯ�� ����(20393) ���縦 Ȯ������."
locale.main_quest_flame_lv101.say_10 = "����ȭ�� ������ óġ����!"
locale.main_quest_flame_lv101.say_11 = "��ȯ(20377)�� �����Ͽ��� ���� �ֺ� ������ óġ����.[ENTER]"
locale.main_quest_flame_lv101.say_12 = "���ش� ������ ���������� �Ұ��մϴ�.[ENTER]   ��Ƽ�� �ξ� �����Ͻñ� �ٶ��ϴ�.[ENTER]�����޵� �������� ��߱� ���� �ʽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv101.say_13 = "�̺�. ���� �Ѱ��ؼ� �ڳ׿��� ��Ź�� �߰ڳ�?[ENTER]�и� �������� ���� �ܼ��� ã�� �� ���� ���̾�.[ENTER]� �ٳ�� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv101.say_14 = "���ϴ� �׾��ִ�. �㸮�㿡�� ������ ������ ��ȯ(20377)���� ��������.[ENTER]"
locale.main_quest_flame_lv101.say_15 = "��ȯ(20377)�� ���� ����(20393)�� ����� Ȯ�� �Ͽ���."
locale.main_quest_flame_lv101.say_16 = "���ϴ� ����� ��Ѱ�?[ENTER]"
locale.main_quest_flame_lv101.say_17 = "���ƽ��Ե� ���Ϻ��� ���� �ŵ� �ڿ����ϴ�.[ENTER]�㸮�㿡�� ������ �߰��Ͽ����� ��������.[ENTER]"
locale.main_quest_flame_lv101.say_18 = "������ ���߿� ������ �ϰڳ�.[ENTER]�ܼ��� ������ �� ������ ��� �ܼ����� Ȯ���Ͽ� ���ƿ� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv101.say_19 = "��ȯ(20377)�� ���� �ܼ��� Ȯ�� �Ͽ���."
locale.main_quest_flame_lv101.say_20 = "�������� �ܼ��� ������ �� �׷�.[ENTER]������ ����� �����ΰ� ������.[ENTER]�� ���ϴ� �и� �� ������ ���� ���̾�. ��� Ȯ���� �ٽ� �� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv101.say_21 = "��ȯ(20377)�� ���� �ܼ��� ����(20393)�� ����� ��� Ȯ�� �Ͽ���.[ENTER]��ȯ(20377)���� �����ϵ��� ����."
locale.main_quest_flame_lv101.say_22 = "�Ƿ決������ ��ȯ(20377)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv101.say_23 = "��~�ٳ�Ա� �׷�.[ENTER]�ܼ��� ������ ���ϰ� �ݴ��� �տ� ��� �ִ� ���� �����ΰ�?[ENTER]"
locale.main_quest_flame_lv101.say_24 = "�ơ��̰��� ���Ϻ��� ����� ��ǰ���� ���Դϴ�.[ENTER]�߰��Ͽ��� ������ �̹� ���� �޸��ϼ̰�, ǰ���� �̰��� �߰� �Ͽ����ϴ�.[ENTER]"
locale.main_quest_flame_lv101.say_25 = "�׷����������� �Ƴ��� ���Ͽ��µ� ���ϼ� ������ Ȯ���ϰ�, ���̳� �ø��� ���־�� �ڳס�[ENTER]�ϴ� ������ ���� �ѹ� ������ �ϼ���.[ENTER]"
locale.main_quest_flame_lv101.say_26 = "��ȯ ����(20393)"
locale.main_quest_flame_lv101.say_27 = "�� ������ ������ �ڴ� �Ƿ決�� ������� �ִ� ��ȯ(20377)�Բ� �ε� �����ֱ� �ٶ�ס�(�߷�)[ENTER]��ȯ(20377)�� ����ȭ������ ������ �����ϴ� ��, ������ ������ �߰��Ͽ� �����Ͽ�����.[ENTER]�̷��� ��ȯ���� ���ϰ�, ������ ����ϴ�.(�߷�)[ENTER]�� ������ ���� ���� �������� ����� ���ϰ�, ȭ���ϸ� ���� ��Ű�� �� �������ϴ�.[ENTER]���� ������ ���� �� ���� ���¢�� �Ҹ��� ���Ͽ����ϴ�.[ENTER]�и� ���� ���� ���̴�, �� ������ ���ðŵ� ������ �ڸ� ���Ͽ� �����Ͻñ� ���ϴ�.[ENTER]���� �ϼ����� ������ ���� �帳�ϴ�.[ENTER]"
locale.main_quest_flame_lv101.say_28 = "������ ���Ͽ��µ�, �ٽ� �� ������ ���� �� �׷�.[ENTER]�� ������ �и� ������ ���� �ڸ��� ���̴�, ������ �� ����ϰ� ���縦 �� ���ƾ� �ڱ� �׷�.[ENTER]�� ���д� �ڳ׵� ������ ���Ҵ� ���� �ʸ����� �����ϼ�.[ENTER]����(20380)���� �ǳ��� ���̴� ����(20380)�� ã�ŵ� �������� �ϰԳ�.[ENTER]"
locale.main_quest_flame_lv101.say_29 = "�ʸ����� ���� �ص�"
locale.main_quest_flame_lv101.say_30 = "����(20380)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]����(20380)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv101.say_31 = "����Գ�.[ENTER]��ٸ��� �־��ٳ�.[ENTER]��ȯ(20377)���� �����ֽ� ���и� ���� �ٽñ� ����� ���� ���� �����ٳ�.[ENTER]��ȯ(20377)�Բ��� �̸��⸦ �� ���и� �ص��ϸ� �������� �������� ���� �� �� ���� �� ���� �ϼ̴ٳ�.[ENTER]�׷��� ���̴� �ڳװ� ���� ���� �� ���и� �ص��ϴ� ���� �����ְԳ�.[ENTER]"
locale.main_quest_flame_lv101.say_32 = "��. ���ΰ� �ְڽ��ϱ�![ENTER]"
locale.main_quest_flame_lv101.say_33 = "���� �ڼ��α� �׷�.[ENTER]�ǳ� ���� ���ķ� ���и� ����ϰ� ���캸�� ���縦 �غ� ��� �� ���п��� ��� ���� ���� �ִ� ���� Ȯ�� �Ͽ��ٳ�.[ENTER]�� �� ��� �ص��Ͽ� �˷��ְ� ������, ���� �߿� �Ѽ��� �Ǽ����� �˾� �� ���� ������ �׷�.[ENTER]�� ���и� �����ϱ� ���ؼ��� �Ҳɺ��� �̰߰� Ÿ������ �ǰ� �ʿ��ϴٳ�.[ENTER]���� ���ϸ� ȭ������ ��(31080)�� �ʿ��� ���ε�.[ENTER]���� �� ���� �����̴� ȭ����(2206)�� óġ�ϰ� ���⿡ ȭ������ ��(31080)�� �޾ƿ� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv101.say_34 = "��. �˰ڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv101.say_35 = "���ϰŵ� ��� ���ƿ��Գ�. �� �Ե� ��ð� ȭ������ ��(31080)�� �ߵ��� ���� ���̾�.[ENTER]"
locale.main_quest_flame_lv101.say_36 = "����ȭ���� �ִ� ȭ����(2206)�� óġ�ϰ� �Ǹ� �Կ� �޾ƿ���."
locale.main_quest_flame_lv101.say_37 = "���и� �ص��ϰ� ���� ���� �հ�?[ENTER]����� ȭ������ ��(31080)�� �������� ���ϼ�.[ENTER]"
locale.main_quest_flame_lv101.say_38 = "ȭ����(2206)���Լ� �Ǹ� Ȯ���Ͽ���. ����(20380)���� ���ư���."
locale.main_quest_flame_lv101.say_39 = "�Ƿ決������ ����(20380)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv101.say_40 = "����ȭ������ ��(31080)�� �±� �׷�.[ENTER]�����ϴµ� �ð��� �ټ� �ɸ��� ���� �ٽ� ���Գ�.[ENTER]���� ���� ���ְ� ������ ��¿ �� ���ٳ�.[ENTER]"
locale.main_quest_flame_lv101.say_41 = "�ܿ��ð� : %d�ð� %d��"
locale.main_quest_flame_lv101.say_42 = "���� �ð��� ���� �ʾ��� �ʴ°�?[ENTER]���߿� �ٽ� ���Գ�.[ENTER]"
locale.main_quest_flame_lv101.say_43 = "������ ����"
locale.main_quest_flame_lv101.say_44 = "�Ա� �׷�.[ENTER]���а� �ص��� �Ǿ���.[ENTER]�ص��� �ϸ鼭 ���� ���� �о� ���Ҵµ�, �̰� �� ���������� ������ ��� �ִ��� �׷�.[ENTER]���� ������ �˷� �ֵ��� ����.[ENTER]"
locale.main_quest_flame_lv101.say_45 = "���д� �ʸ����� ���� �и��ϳ�.[ENTER]�ڳװ� óġ �߿� ���и� ���ϰ� �� ������ � ���������� �𸣰�����,[ENTER]�ʸ����� 6���� ������ �� ���� ������ ������ ������, ������ ���� �Ϸ� �Ѵٴ� ���̳�.[ENTER]�� �Ӹ� �ƴ϶�, ��ÿ� ���Ͽ��� ����� �Ǿ� �ִٳ�.[ENTER]�ڼ��� ������ �� ���ſ� ����ξ����� ��ȯ(20377)�Բ� ���� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv101.say_46 = "����. �ڼ��� ���� ��ȯ(20377)���� �˷��ֽ� ���̾�.[ENTER]"
locale.main_quest_flame_lv101.say_47 = "����(20380)���� ���� ������ ��ȯ(20377)���� ��������."
locale.main_quest_flame_lv101.say_48 = "��ȯ(20377)���� ������ ������!"
locale.main_quest_flame_lv101.say_49 = "��ȯ(20377)���� ����(20380)�� �� ������ ������.[ENTER]"
locale.main_quest_flame_lv101.say_50 = "�����. ����(20380)���Դ� ���� ����ٳ�.[ENTER]������ �ְԳ�.[ENTER]"
locale.main_quest_flame_lv101.say_51 =  "�����̰� �������� �ɰ��ϱ� �׷�.[ENTER]6���� ���ε� ���� �ʸ����� ������ ������ ������ �����Ϸ� �Ѵٴ� ���� ����� ���̰�,[ENTER]��ÿ� ���ؼ� �˷��ְڳ�.[ENTER]����� ����(20380)�� ���� ������, 6���� �����ϰ� �̿��ϴ� ���ذ��谡 �ִ� ������ ���Ѵٳ�.[ENTER]�ʸ��ܵ� �ʸ��������� ���� ���󼭴� ���� �ʰ� ���� �� �� �ִ� ��������.[ENTER]"
locale.main_quest_flame_lv101.say_52 = "����ȭ���� ȭ����(2206)�� óġ�ϰ� �Ǹ� �޾ƿ���.[ENTER]"
locale.main_quest_flame_lv101.say_53 = "����� ���ذ� ���� �ʴ� ����� �� ������ ���� ���� ���� ������, ���� �츮�� ������ �ξ�� �� ����[ENTER]�ʸ����� 6�濡�� ������ ���´ٴ� ���̳�.[ENTER]�Դٰ� ����ȭ���� �Ͱ� 6���� ���� ���� �̷�� �� �ÿ� �� ������ ���漺(zone1)�� ������ ���̳�.[ENTER]�ƹ����� ���漺(zone1) ���ʿ� �����Ͽ� �����ϰ� �˾ƺ� �ʿ䰡 ���� �� ����.[ENTER]�浵�� �����ϰ� �ٽ� �⺰�� ���� ���̴� ���� ���� �ְԳ�.[ENTER]"

locale.main_quest_flame_lv102 = {}
locale.main_quest_flame_lv102.say_1 = "����"
locale.main_quest_flame_lv102.say_2 = "��ȯ(20377)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]��ȯ(20377)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv102.say_3 = "������ �̾߱��� �� ���漺(zone1)�� ���� ������ �̷��� �θ��� �Ǿ��ٳ�.[ENTER]������ ���� ���� ���ϰ� ������ �׾��ٴ� ��, �װ��� 6���� �ϳ��� ������ ���� �� ������ �����Ǵ� �� ��[ENTER]���Կ��� �Ű��� �� ���� �� �ΰ����� �ƴϳ�.[ENTER]"
locale.main_quest_flame_lv102.say_4 = "�ڳװ� ���� ���� ���漺(zone1) �α� ������ óġ�Ͽ� Ź�Ⱑ ������ ������ ���п� �� ���ϵ��� ���� �ֺ��� �����Ͽ��ٳ�.[ENTER]��� �ܺη� ���ذ� ������ ���� ���� �� ���� ���̳�.[ENTER]���� �ڳװ� ���� ���� ���漺(zone1)�� �����Ͽ� ��� �������� �ִ���, ������ ���� �� ���� �´��� Ȯ���� ���־����� �Ѵٳ�.[ENTER]"
locale.main_quest_flame_lv102.say_5 = "��. �˰ڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv102.say_6 = "����.[ENTER]�ѹ� �ο����� �� �� ���� �븩�̴�, �ȿ� �ִ� �������� óġ�ϰ� �� ���Ÿ� ������ 30���� ������ �ְԳ�.[ENTER]�׷� ��Ź �ϰڳ�.[ENTER]"
locale.main_quest_flame_lv102.say_7 = "���漺(zone1)�� ������ óġ�ϰ� ���Ÿ� ��������."
locale.main_quest_flame_lv102.say_8 = "���漺(zone1)�� ��������!"
locale.main_quest_flame_lv102.say_9 = "��ȯ(20377)�� ���ɿ� ���� ���漺(zone1)�� �����Ͽ�, ô�ĸ� ������.[ENTER]"
locale.main_quest_flame_lv102.say_10 = "%s�� ����: %d�� %s�� ����: %d��"
locale.main_quest_flame_lv102.say_11 = "%s�� ���� ����: %d�� %s�� ���� ����: %d��"
locale.main_quest_flame_lv102.say_12 = "����������� óġ�� ���ƾ� ������� ������ ������ �ľ��ϰ� ������ ������ �� �ִٳ�.[ENTER]� �����Ͽ� ���Ÿ� ��� ������ �ְԳ�.[ENTER]"
locale.main_quest_flame_lv102.say_13 = "���漺(zone1)�� ������ óġ�� ���Ÿ� ��� Ȯ���Ͽ���.[ENTER]��ȯ(20377)���� �����ϵ��� ����."
locale.main_quest_flame_lv102.say_14 = "�Ƿ決������ ��ȯ(20377)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv102.say_15 = "��~�Ա� �׷�.[ENTER]�����ϴ� ���Ŵ� ��� ���� �� �� ���� �׷�.[ENTER]�ڳװ� ���� ü���� ������ ��Ѱ�?[ENTER]"
locale.main_quest_flame_lv102.say_16 = "����ȭ���� �ִ� �����鵵 ��������, ���漺(zone1) ���� ������ �޸� �ټ� ���Ͽ����ϴ�.[ENTER]�� �ۿ��� ó�� ���� ������ �������� ����Ͽ� �����ϸ� ���� ��ȯ���� ���� �� �߽��ϴ�.[ENTER]������ �غ� ��� ������ ���������� ����� ���漺(zone1)�� ��Ű�� �ִ� ���� �߸�õ(6091)�̶�� ������ Ȯ�� �� �� �־����ϴ�.[ENTER]"
locale.main_quest_flame_lv102.say_17 = "�׷���. Ź���� ���⸸�� ������ �ƴϾ���.[ENTER]�ʸ��� �༮�� �̹��� �ܴ��� �����ϰ� �����ϰ� ����������.[ENTER]�ٽ� �θ����� �� ���̴� �����Գ�.[ENTER]"
locale.main_quest_flame_lv102.say_18 = "���� �߸�õ(6091)?!"
locale.main_quest_flame_lv102.say_19 = "����(20380)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]����(20380)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv102.say_20 = "��ȯ(20377)�Կ��� ���� �����.[ENTER]���漺(zone1)���� ���� �߸�õ(6091)�� �˰� �Ǿ��ٰ� �����.[ENTER]�����̸� �� �� �༮���� ����[ENTER]"
locale.main_quest_flame_lv102.say_21 = "���� �����󵵡�[ENTER]"
locale.main_quest_flame_lv102.say_22 = "���� ���̶�� �� �����!![ENTER]���� �߸�õ(6091)�� ���� �Ѹ���(6191)�� ���Ҿ �����ϰ� �ǵ��� �����߿� �ϳ����.[ENTER]�� ������ ��� �Կ� �־ ���� ū �ɸ� ���� �� �� �ִ� �༮�̶��.[ENTER]"
locale.main_quest_flame_lv102.say_23 = "�ϴ��� ���� �� ����� ǳ���� ���ؼ� �˰Ե� ���̱� ������, ���� ��Ȯ�� ������ �˾ƾ߸� ��ȯ(20377)�Բ� ������ �帱 �� ���� ������ ���̳�.[ENTER]�ڳװ� ���� ���ͼ� �߸�õ(6091)�� ���� ������ Ȯ���� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv102.say_24 = "� ���� ���͵帮�� �˴ϱ�?[ENTER]"
locale.main_quest_flame_lv102.say_25 = "���� �߸�õ(6091)�� Ź�⸦ �۶߸��� �ֹ����� �ƴ����� Ȯ������ ���� ���¿���[ENTER]�߸�õ(6091)�� �ٷ� ����ϴ� ���� ������ ������ �����ϳ�.[ENTER]�ϴ��� ���漺(zone1) ���� ������ ������ �ְԳ�.[ENTER]Ź�Ⱑ ����� ������ �и� Ź�� ����� �����Ͽ� ���ȿ� ���ϰ� ���� ���̳�.[ENTER]Ź�⸦ ��ȭ��ų �浵�� �����ϰ� �߸�õ(6091)�� ����ص� ���� ���� ���̴� Ź�� ����ü(31081)�� �� 10���� ���ش� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv102.say_26 = "�˰ڳ�. �׷� ��ٸ��� �ְڳ�.[ENTER]"
locale.main_quest_flame_lv102.say_27 = "���漺(zone1)�� ������ óġ�ϰ� Ź�� ����ü(31081)�� ��������."
locale.main_quest_flame_lv102.say_28 = "Ź�� ����ü(31081)�� ������!"
locale.main_quest_flame_lv102.say_29 = "���漺(zone1)�� �����Ͽ�, Ź�� ����ü(31081)�� ������.[ENTER]"
locale.main_quest_flame_lv102.say_30 = "�����޵� �������� ��߱� ���� �ʽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv102.say_31 = "�̺� ������ ��� ������ ���Ͽ���?[ENTER]�ڳ׶�� ���� �� ���� �س� �� ���� ���̶� �Ǵ��Ͽ��Ŵá�[ENTER]�ٽ� �ٳ�� �ְԳ�![ENTER]"
locale.main_quest_flame_lv102.say_32 = "���漺(zone1) ������ óġ�ϰ� Ź�� ����ü(31081)�� ��� ���Ͽ���. [ENTER]����(20380)���� ��������."
locale.main_quest_flame_lv102.say_33 = "����~���⸸�ص� Ź�Ⱑ ���� ���� �� �� ������.[ENTER]�ڳװ� ������ ���ϱ� �Ѱ� ������.[ENTER]�����ϰ� Ź�� ����ü(31081)�� ���� ���� ���� �ʾҴµ� ��������[ENTER]���� ���� ��ȭ�� �浵�� ã�� �ڳ׸� �θ����� �ϰڳ�.[ENTER]�����Գ�.[ENTER]"
locale.main_quest_flame_lv102.say_34 = "(���� �����ؾ� �� �� �� ���١�)[ENTER]"
locale.main_quest_flame_lv102.say_35 = "Ź���� ��ȭ"
locale.main_quest_flame_lv102.say_36 = "�߿Գ�.[ENTER]�������� Ź�⸦ ��ȭ ��ų �浵�� ã�ҳ�.[ENTER]Ź�⸦ ��ȭ ��ų �� �־�߸�, ���漺(zone1)�� �����Ͽ��� ��ƿ ���� ���� ���̴� ���ϼ�.[ENTER]�ڳ� ȥ�� ������ óġ�Ѵٸ�� ����� ������, �װ� ������ ��ȯ(20377)���� ���ϵ�� �Բ� �����Ͽ���[ENTER]�ټ� �����ϰ� ����� ���� �� ���� ���̳�.[ENTER]"
locale.main_quest_flame_lv102.say_37 = "�� �浵�� � ���Դϱ�?[ENTER]"
locale.main_quest_flame_lv102.say_38 = "�������� ���Գ�.[ENTER]�׷��� �ʾƵ� ���� �����̴� ���ϼ�.[ENTER]������ ���� Ź�⸦ ���� �Ҷ� ������ ��ȭ�� ���ؼ� �˰� �Ǿ��� ���̴� �ڼ��� ���� �����ϰڳ�.[ENTER]�Ұ� ��, ���� ��� ���� ����� ������ �ִ� ��!![ENTER]Ź�� ���� ���� ������ ��ȭ ��ų �� �ִٳ�.[ENTER]���� ������ ũ�� �ᱹ ��ȭ�� ����.[ENTER]"
locale.main_quest_flame_lv102.say_39 = "�ڳ� ����ȯ��(50819)�̶�� ���� �� ���̳�. ����ȯ��(50819)�� Ȱ��(51001)�� ���̸� ���� ������ ��� ���� �ȴٳ�.[ENTER]�̰��� ������ ���¿��� ���漺(zone1)�� ������ ����Ҷ� ū ȿ���� �����ϰ� �� �� ���� ���̾�.[ENTER]���� ���������� ���縮 �ϼ��� ���� �ʱ⶧����, ����ȯ��(50819) 50���� Ȱ��(51001) 100������ ���ؼ� �ǻ� ��ȯ(20017)���� ������ �ְԳ�.[ENTER]"
locale.main_quest_flame_lv102.say_40 = "�˰ڳ�. ������ ���ڳ�.[ENTER]"
locale.main_quest_flame_lv102.say_41 = "����ȯ��(50819)�� Ȱ��(51001)�� ���� �ǻ� ��ȯ(20017)���� ����������."
locale.main_quest_flame_lv102.say_42 = "Ź�� ��ȭ ���Ḧ ������!"
locale.main_quest_flame_lv102.say_43 = "����ȯ��(50819)�� Ȱ��(51001)�� ������.[ENTER]"
locale.main_quest_flame_lv102.say_44 = "�� ģ�� ��ó���� ������ �׷�.[ENTER]�������� ������ �ñ⵵�� �ϰ�, �Ƿθ� �� Ǯ�� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv102.say_45 = "����(20380)�Բ� ���� ���� �ͺ��� ���ٳ�.[ENTER]������ ����� ���ؿ��� ���� ���̷� ����.[ENTER]� ������ ��ᵵ ����� ���ش� �ְ�.[ENTER]"
locale.main_quest_flame_lv102.say_46 = "����ȯ��(50819)�� Ȱ��(51001)�� ����� ���ߴ�. �ǻ� ��ȯ(20017)���� ����������."
locale.main_quest_flame_lv102.say_47 = "�ǻ� ��ȯ(20017)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv102.say_48 = "��ȭ�� �� ����"
locale.main_quest_flame_lv102.say_49 = "�ǻ� ��ȯ(20017)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]��ȯ(20017)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv102.say_50 = "�����.[ENTER]�ڳװ� ������ ����� ��ȭ�� ���� ������ٳ�.[ENTER]������ζ�� ������ �� ���;� ������, �Ϻδ� ���� �߿� �����Ͽ� ������ �� �ٱ� �Ͽ���.[ENTER]�׷��� ����� ������ ��������, ��ȯ(20377)�Բ� �����ְԳ�.[ENTER]"
locale.main_quest_flame_lv102.say_51 = "�׷��� ���̶� �Ͽ��µ� �� ȯ��� ���� �ܴ��մϱ�?[ENTER]"
locale.main_quest_flame_lv102.say_52 = "�� ģ�� �׷� ����� ���� �Ű� ���� ���Գ�.[ENTER]�� ��ŭ �����Ͽ� �׸� �� ���̳�.[ENTER]"
locale.main_quest_flame_lv102.say_53 = "�׷� ��Ź �Լ�.[ENTER]"
locale.main_quest_flame_lv102.say_54 = "�ǻ� ��ȯ(20017)���� ���� ��ȭ�� ���� ��ȯ(20377)���� ��������."
locale.main_quest_flame_lv102.say_55 = "�� �տ� ���� ��ȭ�� ���� �ִ� ���ΰ�?[ENTER]� ��ȯ(20377)�Բ� ��ȭ�� ���� �����ְԳ�.[ENTER]"
locale.main_quest_flame_lv102.say_56 = "��~����Գ�.[ENTER]������ ��ٸ��� �־��ٳ�.[ENTER]��ȯ(20017)���Ե� ���� �̹� ���� ����� ���̾�.[ENTER]��ȭ�� ���� ������ �Դ°�?[ENTER]"
locale.main_quest_flame_lv102.say_57 = "��. �����Ͽ� ���� ȯ�� �Ǿ����ϴ�.[ENTER]���漺(zone1) ���� �ÿ� �����ϰ� ����� �� �� �����ϴ�.[ENTER]"
locale.main_quest_flame_lv102.say_58 = "�׷�. ����Ͽ���.[ENTER]���ϵ�� �Բ� ���� �غ� �Ͽ����ϰ� ��ȭ�� ���� �ΰ� ���Գ�.[ENTER]�׸��� �ϳ��� �ڳװ� ������ ����.[ENTER]�ƹ����� �ڳװ� ū ���� ���� �� �� ���Ƽ� ���̾�.[ENTER]���߿� ���� ���� �ÿ� �θ����� �ϰڳ�.[ENTER]"

locale.main_quest_flame_lv103 = {}
locale.main_quest_flame_lv103.say_1 = "���漺(zone1)�� ����"
locale.main_quest_flame_lv103.say_2 = "��ȯ(20377)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]��ȯ(20377)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv103.say_3 = "�����.[ENTER]å���� ���Ǹ� �Ͽ�, ������ ���縦 �߷� ��ȭ�� ���� ���� ���� ���ð� �Ͽ��ٳ�.[ENTER]ȿ���� ����ϴ��� �׷�.[ENTER]�¸��� û���� ����� ���� ������ �Ƿ�������, ����� �ö󰡴�����.[ENTER]�׷��� ���漺(zone1)�� �İ��� �Ͽ��ٳ�.[ENTER]"
locale.main_quest_flame_lv103.say_4 = "���ϵ��� ���� ��� �Ͽ����� �ڳװ� ���� �ڵ��� ���� ���� �� �� ���� ���̾�.[ENTER]�� ���ϵ�� �Բ� ���漺(zone1)�� ���������, �����ϴٸ� �߸�õ(6091)���� óġ ��Ź�ϳ�.[ENTER]�� �켱������ ������ ���Ͽ� ���� �� ���ϸ� ã�� �ٶ��.[ENTER]�ڳװ� �� ���� �Ϸ� �� ���̳�.[ENTER]"
locale.main_quest_flame_lv103.say_5 = "��. �˰ڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv103.say_6 = "�׷� ��Ź �Լ�.[ENTER]"
locale.main_quest_flame_lv103.say_7 = "���漺(zone1)���� ��ȯ�� ����(20393)�� ã��."
locale.main_quest_flame_lv103.say_8 = "��ȯ�� ����(20393)�� ã��."
locale.main_quest_flame_lv103.say_9 = "���漺(zone1)�� ������ ��ȯ�� ����(20393)�� ã��.[ENTER]"
locale.main_quest_flame_lv103.say_10 = "�̺�. �Ȱ��� �� �ٽ� �°Ծ�.[ENTER]� ���漺(zone1)���� ����ϰԳ�.[ENTER]"
locale.main_quest_flame_lv103.say_11 = "�롦���ԡ�����ϴ١�[ENTER]�������� �����ϰ� ������ �Ͽ�����, �ᱹ �߸�õ(6091)�� �е����� �� �տ�[ENTER]���� ���ϰ� ���ҽ��ϴ�.[ENTER]ȥ�ڼ� �ذ� �� �� �ִ� �κ��� �ƴϴ� ��ȯ(20377)�Բ� ���� �����ֽ�����.[ENTER]"
locale.main_quest_flame_lv103.say_12 = "�Ƿ決������ ��ȯ(20377)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv103.say_13 = "�������� ���� ���� �� �׷�.[ENTER]���漺(zone1)�� �ذ��ϰ� ���� ���ΰ�?[ENTER]"
locale.main_quest_flame_lv103.say_14 = "�ơ������װԡ�[ENTER]"
locale.main_quest_flame_lv103.say_15 = "�����̱⿡ �׸� ���� �帮�� �հ�?[ENTER]���� ���̶� �־���?[ENTER]"
locale.main_quest_flame_lv103.say_16 = "��ȭ�� ���� ���� ������� �����ϰ� ��ȭ�Ͽ� ���漺(zone1)�� ������ �Ͽ�����, ���� �߸�õ(6091)���� ������ ���Ͽ����ϴ�.[ENTER]�� ���뵵 �������� ���� ���簡 �ܿ� ���� ���ϰ� ���� �޸� �Ͽ����ϴ�.[ENTER]�ټ� �����ϰ� ������ �� ���� ȭ���� �� �����ϴ�.[ENTER]"
locale.main_quest_flame_lv103.say_17 = "������ �׾������[ENTER]���� ������ �Ǵ����� ���ϵ��� ������ ������ �� ���̷α�����[ENTER]������ ���ٵ��� �ڳ�.[ENTER]�⺰�� ���� ���̴� ����ϰ� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv103.say_18 = "������ ����"
locale.main_quest_flame_lv103.say_19 = "���� ���°հ�?[ENTER]������ ���� ������ ���Ͽ�, ���� ������ ����� ����.[ENTER]�ʸ����� ���� �����Ͽ����ϴ� �߿��� �ñ��̱⿡ ���⼭ ���� �� �� �����ٳ�.[ENTER]�׸��Ͽ�, ���� ���� �ڳ׸� �������� �ϴ� å���� �غ��Ͽ���.[ENTER]"
locale.main_quest_flame_lv103.say_20 = "�ϴ� �ڳװ� ������ ���� ���� ����̱⿡ �׿� �´� å���̴� �ʹ� ����������� ���Գ�.[ENTER]������ ��ȭ�� ���� ������� ���� ������ ����� �Ǿ���.[ENTER]�̹����� ��ȭ�� ���� ����Ͽ� ���縦 ��ȭ�� ���̳�.[ENTER]�׷��� ���� �߸�õ(6091)�� óġ�� �츮�ʿ����� ����� ������ ����, �츮 ������� �ܺη�[ENTER]â���Ϸ��ϴ� ������ ������ �����̳�.[ENTER]"
locale.main_quest_flame_lv103.say_21 = "�� ���� �ڳ״� ���漺(zone1)�� �����Ͽ�, ������ 1õ���� ������ �ʰ� ������ �ְԳ�.[ENTER]������ �����ؼ� �� ���� ������ ���� �����Ѵٸ� �߸�õ(6091)�� ������ ���̰�, �����ϴ� ƴ��[ENTER]��ȸ�� �и� ���� �� ���̾�.[ENTER]��Ź�ϰڳ�.[ENTER]"
locale.main_quest_flame_lv103.say_22 = "��. �˰ڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv103.say_23 = "���漺(zone1)�� �����Ͽ� ���漺(zone1)�� ������ óġ����."
locale.main_quest_flame_lv103.say_24 = "������ ��������."
locale.main_quest_flame_lv103.say_25 = "���漺(zone1)�� �����Ͽ�, ������ 1000���� ��������.[ENTER]"
locale.main_quest_flame_lv103.say_26 = "�����޵� �������� ��߱� ���� �ʽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv103.say_27 = "���� ��� �������� ���� �� ���� �׷�.[ENTER]���漺(zone1)�� ������ ������ ������ â���ϰ� ������ ���̾�.[ENTER]����ǿ� �������� ����, � �ٳ���Գ�.[ENTER]"
locale.main_quest_flame_lv103.say_28 = "���漺(zone1)�� ������ 1000���� ��� �����Ͽ���.[ENTER]��ȯ(20377)���� ��������."
locale.main_quest_flame_lv103.say_29 = "���ϵ��� ���� ������ ���漺(zone1)���� â���Ͽ� �ܺη� ������ ������ ���� ���� ������ٰ� �ϴ±�.[ENTER]���װ� ����� �������� �� ���� �׷�.[ENTER]����Ͽ���.[ENTER]���� ��ȹ�� ����(20380)�� ���� ���̴� ��ø� ��ٸ��� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv103.say_30 = "���漺(zone1)�� ��ĩ�Ÿ�"
locale.main_quest_flame_lv103.say_31 = "�߿Գ�.[ENTER]�ڳװ� ������ �������� ���п� ������ ���������� �;�����, ô�Ŀ� ���ϸ� ���� ����� �� ������ �׷�.[ENTER]�ƹ����� ������ ���� ������ óġ�ؼ��� ���Կ� ������ �� �� ������ �ʳ�.[ENTER]�׷��� ô���� ������ ���� �����η� ���̴� �༮���� �켱������ óġ�Ͽ��� �� �� ���ٳ�.[ENTER]"
locale.main_quest_flame_lv103.say_32 = "�� �༮���� ȭ��(6005),����(6007),ȭ��(6006),����,�ʿ���(6009) �� 5�༮���̶��.[ENTER]�� �༮���� ���漺(zone1)������ ��� �����̱⵵ ������, ���� �߸�õ(6091)�� ������ �����η� �Ǵ��Ͽ���.[ENTER]���� �Ӹ��� �ڸ��� �����ο� ������ ���ظ� �ָ� �츮�� ��ȹ�� �����Ӱ� ������ �� ���̳�.[ENTER]�׷��� ���̴�, 5�༮���� �� 50������ óġ�� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv103.say_33 = "���漺(zone1)�� �����Ͽ� ������ ������ ��������."
locale.main_quest_flame_lv103.say_34 = "���漺(zone1) �����θ� �����϶�."
locale.main_quest_flame_lv103.say_35 = "���漺(zone1)�� �����Ͽ�, ������ ������ óġ����.[ENTER]"
locale.main_quest_flame_lv103.say_36 = "���� �����θ� ����� �������� ���� �� ���� �׷�.[ENTER]�츮�� ��ȹ�� ���� �� �ʿ��� �����̴� �ٽ� �ٳ���Գ�.[ENTER]"
locale.main_quest_flame_lv103.say_37 = "���漺(zone1)�� ������ ������ ��� óġ�Ͽ���.[ENTER]��ȯ(20377)���� �����ϵ��� ����."
locale.main_quest_flame_lv103.say_38 = "���� �츮�� ���漺(zone1)�� �����Ͽ� �ʸ����� ���� ������ �� �ְڱ� �׷�.[ENTER]���� ���ݸ� �� ���ư��� �Ǵ� ���ݸ� �� ���� �ְԳ�.[ENTER]����Ͽ���.[ENTER]"
locale.main_quest_flame_lv103.say_39 = "�߸�õ(6091) ���1-1"
locale.main_quest_flame_lv103.say_40 = "�ڳװ� �����θ� �������� ���п� �� ���ϵ��� ��ǳ�� ���� ��ó�� ���漺(zone1)�� ���������� ������ ���ư��� �ִٳ�.[ENTER]���� �ڳ��� ���� ũ�ٳ�.[ENTER]�ٽñ� ���縦 ǥ����.[ENTER]���� ���漺(zone1)�� ���Ŀ� �Բ� �ʸ����� ���� ������ �� ���� �Ͱ�����.[ENTER]�ڳ׸� �θ� ���� ��Ȳ�� �˷��ִ� �Ͱ� ���縦 ǥ�ϱ� ���ؼ� ����.[ENTER]����(20380)�� å���� ������ �� ���� ������ ���� ����(20380)���� �����Գ�.[ENTER]"
locale.main_quest_flame_lv103.say_41 = "����(20380)���� å���� ������ ����."
locale.main_quest_flame_lv103.say_42 = "����(20380)�� ã�ư���.[ENTER]"
locale.main_quest_flame_lv103.say_43 = "�����. ��ٸ��� �־��ٳ�.[ENTER]��ȯ(20377)�Բ� �ڳ��� ������ ������ ��� ���ϰ� �־��ٳ�.[ENTER]�ϴ� �װ� �װŰ�, �ʸ����� ���� ���� ������ ũ�� å������ ������ �ְڳ�.[ENTER]"
locale.main_quest_flame_lv103.say_44 = "��ȯ(20377)���� �������� ������ �پ ���縦 �����Ͽ�, ���� �߸�õ(6091)�� ���Ͽ� ���縦 �Ͽ���.[ENTER]�� ��� ū �ҵ��� ����ٳ�.[ENTER]���� �߸�õ(6091)�� �������� ��ǰŸ��� ���� ���ܵ� ȭ����(8057)���� ���� ��� �� ������.[ENTER]�� ȭ����(8057)�� �����Ѵٸ� �߸�õ(6091)�� óġ�� �ξ� �����ϰ� �� ���̾�.[ENTER]"
locale.main_quest_flame_lv103.say_45 = "�׷��� ���� �� ȭ����(8057)�� �����ϰ� ���� �Ǵ� �̴ϱ�?[ENTER]"
locale.main_quest_flame_lv103.say_46 = "�׷��ٳ�.[ENTER]�ڳ׵� �˴ٽ��� ȭ����(8057)�� �����ϸ� �������� ��û���� ����� �ϰԵ���.[ENTER]�װ��� �����Ͽ� ���ɽ�����鼭 �����ϰ� ���� ���� �ְԳ�.[ENTER]ȭ����(8057)�� ��������� ã�� ������ �������̴� �� ������ �ϰԳ�.[ENTER]"
locale.main_quest_flame_lv103.say_47 = "�߸�õ(6091)�� ����Ͽ��� �� ������ ��ȯ(20377)���� �Ϸ��ֽ� ���̾�.[ENTER]�׷��� �ڳ״� ���� ���漺(zone1)���� ����Ͽ�, ȭ����(8057)�� 1�� �����ϰ� ��ȯ(20377)�Բ� ������ �ְԳ�.[ENTER]"
locale.main_quest_flame_lv103.say_48 = "���漺(zone1)���� ȭ����(8057)�� ��������."
locale.main_quest_flame_lv103.say_49 = "ȭ����(8057)�� ��������."
locale.main_quest_flame_lv103.say_50 = "���漺(zone1)�� �ִ� ȭ����(8057)�� ��������.[ENTER]"
locale.main_quest_flame_lv103.say_51 = "����  �ı���"
locale.main_quest_flame_lv103.say_52 = "�� ���ϰ� �߸�õ(6091)�� ����ϱ�� ����쳪, ��� ô�ĸ� �Կ��� ������ ���ٳ�.[ENTER]�ƹ��� ���� �ľ��� �ϴ���, ���� ���̷� ��� �հ�?[ENTER]ȭ����(8057)�� �����Ͽ��� ���� å���� ������ �� ������ � �����ϰ� ���ƿ��Գ�.[ENTER]"
locale.main_quest_flame_lv103.say_53 = "���漺(zone1)�� �ִ� ȭ����(8057)�� ��� �����Ͽ���.[ENTER]��ȯ(20377)���� ���ϵ��� ����."
locale.main_quest_flame_lv103.say_54 = "ȭ����(8057)�� ��� �����Ͽ��ٴ� ���� �޾ҳ�.[ENTER]�ڳװ� �� ���̶�� �͵� �˰� �־��� ���̾�.[ENTER]����Ͽ���. ���� å���� �ڳ׵� ��ġ�� ������ �˰��̳�.[ENTER]�ٷ� ���� �߸�õ(6091)�� �����̳�.[ENTER]�غ� �ð��� �ɸ��⵵�ϴ�, ���߿� ���� �θ��ŵ� ���� �ǳ��� ��[ENTER]��ȭ�� �׵� �Բ� ì�� ������ �ϰԳ�.[ENTER]"

locale.main_quest_flame_lv104 = {}
locale.main_quest_flame_lv104.say_1 = "�߸�õ(6091) ��� 1-2"
locale.main_quest_flame_lv104.say_2 = "��ȯ(20377)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]��ȯ(20377)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv104.say_3 = "���� ��ٷȳ�.[ENTER]�ڳװ� ȭ����(8057)�� �����Ͽ��� ������ �߸�õ(6091)�� ���ĵ� ���� ������ ���ٳ�.[ENTER]���� �� �ñⰡ �°��̾�.[ENTER]�ʸ����� ���� �����ϰ� ���� �߸�õ(6091)�� ���ĸ� ���� �������� ���� ����� �־�����[ENTER]�̹����� ������ �ϼ��� ����߸� �Ѵٳ�.[ENTER]"
locale.main_quest_flame_lv104.say_4 = "�ڳ� ������ �־��� ������ ������ ���� ���̳�.[ENTER]���ϵ鿡�Դ� �����Ͽ� �־����� �ڳ��� ���� ������ ���̱⿡ ȿ���� ������.[ENTER]�װ��� �����ϰ� �߸�õ(6091)�� �������ְԳ�.[ENTER]�ƹ��� ������ ���̶� 1�ð��̻� ����ϱ� ������ ������ �ñ⿡ �� �����ϰԳ�.[ENTER]�׷��� ������ �߸�õ(6091)�� ����Ҷ� ū �ַλ����� ���ʰ��̳�.[ENTER]"
locale.main_quest_flame_lv104.say_5 = "��. �˰ڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv104.say_6 = "���漺(zone1)���� ���� �߸�õ(6091)�� ��������."
locale.main_quest_flame_lv104.say_7 = "���� �߸�õ(6091)�� �����϶�."
locale.main_quest_flame_lv104.say_8 = "���漺(zone1)�� �����Ͽ� ���� �߸�õ(6091)�� ��������.[ENTER]"
locale.main_quest_flame_lv104.say_9 = "�����޵� �������� ��߱� ���� �ʽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv104.say_10 = "���� �߸�õ(6091)�� ���� ��밡 �ƴ���.[ENTER]�׷��� �츮�� �ʸ����� ���� �����ϰ� ���ʿ��� ����� ������ ���ؼ���[ENTER]�� �����Ͽ��߸� �Ѵٳ�.[ENTER]�ٽñ� ���� ���� �ٳ�� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv104.say_11 = "���� ���ݸ� ���ϸ� ������ ������ Ǯ �� �־��µ���[ENTER]���� �����ϴٴϡ�[ENTER]���浵 ���ٰ� �;��Ͽ� ���� �״�� �װ����� ���� ���̴�.[ENTER]���� �и��� �ٽ� ���� �� ���̴�.[ENTER]"
locale.main_quest_flame_lv104.say_12 = "���漺(zone1)�� ���� �߸�õ(6091)�� �����Ͽ���.[ENTER]��ȯ(20377)���� ���ϵ��� ����."
locale.main_quest_flame_lv104.say_13 = "�Ƿ決������ ��ȯ(20377)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv104.say_14 = "�����. ���� �����.[ENTER]�ڳװ� ����ġ ���� �ι��� ���� �˾�����, �̷��� �߸�õ(6091)���� �����Ͽ��� ���̾�.[ENTER]����Ͽ��� �����Գ�.[ENTER]"
locale.main_quest_flame_lv104.say_15 = "��ȯ(20377)�� �׷��� ���� �߸�õ(6091)�� �����鼭, �̷� ���� �Ͽ����ϴ�.[ENTER]������ ���ٰ� �;��Ͽ� ���� �״�� �װ����� ���� ���̰�, �и� ���� �ٽ� ���� �� ���̴�. ��� �߽��ϴ�.[ENTER]�ƹ����� �̰� ���� �ƴ� ������ ���Դϴ�.[ENTER]"
locale.main_quest_flame_lv104.say_16 = "�˰ڳ�.[ENTER]���� ���� �� �˾Ҵµ� �װ� �ƴϾ��� �׷�.[ENTER]���� �� �˾ƺ� �Ŀ� �θ����� �ϰڳ�.[ENTER]"
locale.main_quest_flame_lv104.say_17 = "������ ����1-1"
locale.main_quest_flame_lv104.say_18 = "�����.[ENTER]�ڳװ� �߸�õ(6091)�� óġ�ϰ� �� �༮�� ���� ���� ���� �پ��ϰ� ���縦 �� ���ҳ�.[ENTER]ô�ĸ� ������ Ȯ�ε� �Ͽ��� ���̾�.[ENTER]�ڳ� ��ó�� �߸�õ(6091)�� ��Ȱ�Ͽ� �־���.[ENTER]�ű�ٰ� ���漺(zone1)���� �վ��������� Ź��� ������ �� �������ٳ�.[ENTER]"
locale.main_quest_flame_lv104.say_19 = "�ƹ����� ���� �߸�õ(6091)�� �ٽ� �����ϸ鼭 ������ ���Ͽ��߸� �Ƚ��� �� �� ���� ������ ���̳�.[ENTER]�� �������� �༮�� ������ڸ� �������� ����� ���� ������ ���̳�.[ENTER]������������ �̺κп� ���ؼ��� ����(20380)���Ե� �Ϸ� �ξ�����, ����(20380)���� ���� �ڼ��� ����� ������ �ϰԳ�.[ENTER]"
locale.main_quest_flame_lv104.say_20 = "����(20380)���� ���� å���� �赵�� ����."
locale.main_quest_flame_lv104.say_21 = "����(20380)���� ����."
locale.main_quest_flame_lv104.say_22 = "����(20380)���� ���� å���� ����.[ENTER]"
locale.main_quest_flame_lv104.say_23 = "����(20380)���� ������ϱ� �� �ٽÿ��� �Ծߡ�[ENTER]� �����Գ�.[ENTER]"
locale.main_quest_flame_lv104.say_24 = "�����. ��ٸ��� �־��ٳ�.[ENTER]�������� ���� �߸�õ(6091)�� �����ƴ���?[ENTER]����ġ ���� ����� ǰ�� �־�, �� �س����� ���������� ����ϳ� �׷�.[ENTER]�ϴ� å���� ������ �ֵ��� �ϰڳ�.[ENTER]"
locale.main_quest_flame_lv104.say_25 = "�߸�õ(6091)�� ������ ������� �ǻ�� �� ���� ����̳�.[ENTER]�� ���� �����ϱ⿡�� ���濡�� �������� ������ ���Ͽ��� ȿ������ ���̳�.[ENTER]�׷��⶧���� ������ ���� ��å�� ���Ͽ����� �ڳװ� ���� ���� ������ ���ָ� �ȴٳ�.[ENTER]"
locale.main_quest_flame_lv104.say_26 = "�˰ڽ��ϴ�. �׷� ���� �������� � ���Դϱ�?[ENTER]"
locale.main_quest_flame_lv104.say_27 = "������ ��������� ��ġ�� ������ �˷��ָ鼭 ���� �翡 ���ؼ� �˰� �Ǿ��� ���̳�.[ENTER]�׷��� ��� �����̵� ���� �޼��� ���Ŀ����� �� �̻� ���� �����ϴ� ���� �ƴ϶� ������ �� �� ���Եȴٳ�.[ENTER]�׷��� ������ ����� ���� ������ �����ϴ� ��å�� �����ٳ�.[ENTER]�� ��å�� �����ϱ� ���ؼ��� ���� ������ ���� ������ ���� ���Ͽ��� �Ѵٳ�.[ENTER]�˾ƺ� ��� ������ ���� ���ϱ� ���ؼ��� ȭ��(6005),����(6007),ȭ��(6006),����,�ʿ���(6009) �� �������� óġ�ϰ� ���� ���� �;� �� ���̳�.[ENTER]�� ���� �� ����� �ڳ� ���̴� �ε� ��5���� ���ش� �ְ�.[ENTER]"
locale.main_quest_flame_lv104.say_28 = "������ �ʿ��� ��Ḧ ������."
locale.main_quest_flame_lv104.say_29 = "������ �ʿ��� ��Ḧ ���ؼ� ����(20380)���� ��������..[ENTER]"
locale.main_quest_flame_lv104.say_30 = "��~�������� ����ϱ�.[ENTER]���� %d���� �� ���ؿ��� �ǰڱ� �׷�.[ENTER]���� �����Գ�.[ENTER]"
locale.main_quest_flame_lv104.say_31 = "���� ���� ��� ��ұ� �׷�.[ENTER]������ �̰� ���� �ʿ��� ���� �� �ִٳ�.[ENTER]�ϴ� �� �ٵ��� ������ �Ŀ� �⺰�� ���� ���̴� ���� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv104.say_32 = "�����ڳװ� ����Ͽ� ���ؿ�����, �� ���� �ʹ� ���Ⱑ ���� ����ϱ� ����� �� �����׷�.[ENTER]�ٸ��� ���ش� �ְڳ�?[ENTER]"
locale.main_quest_flame_lv104.say_33 = "������ ����1-2"
locale.main_quest_flame_lv104.say_34 = "����(20380)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]����(20380)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv104.say_35 = "�߰ſ� ��(31082)�� ���� ���� ������ �� �ִ� ���¶��.[ENTER]�ʹ� �߰ſ��� ������ ���� ������ ����(20380)���η��̴� ���� ����� �ƴ϶��.[ENTER]�� ���� �տ� ȭ�� �԰� ���̾�.[ENTER]��Ȳ�� ��Ȳ�̴� ��ŭ ���� ��Ḧ �˷��ְڳ�.[ENTER]�ڳװ� �̹��� ������ �� ���� �ǵ���(50814)�̶��.[ENTER]"
locale.main_quest_flame_lv104.say_36 = "�ǵ���(50814)�� ������ ���� ���� �ø��� ����� �쿩 �����ϴµ� ���δٳ�.[ENTER]�װ� �ϼ��� �ǰ� ����, ������ ���� �� �� ���� ���̳�.[ENTER]����� ���߿� ��ȯ(20377)�Բ� �赵�� �ϰ�, �ǵ���(50814)�� �� ���� �ʿ��ϴ� 100������ ���ش� �ְԳ�.[ENTER]�׷� ��ٸ��� �ְڳ�.[ENTER]"
locale.main_quest_flame_lv104.say_37 = "�ǵ���(50814)�� ���� ����(20380)���� ��������."
locale.main_quest_flame_lv104.say_38 = "�ǵ���(50814)�� ���� ����(20380)���� ��������.[ENTER]"
locale.main_quest_flame_lv104.say_39 = "�����Ա� �׷�.[ENTER]���� ����� �쿩���� ���� �ϼ��� �ȴٳ�.[ENTER]����Ͽ���.[ENTER]"
locale.main_quest_flame_lv104.say_40 = "���� �ϼ��̶�?[ENTER]���� ���� ���Դϱ�?[ENTER]"
locale.main_quest_flame_lv104.say_41 = "�������� ���� �Ͽ���.[ENTER]�ϴ� �쿩���µ� ������ ���ؾ��ϴ� ���߿� �ٽ� �θ����� �ϰڳ�.[ENTER]"
locale.main_quest_flame_lv104.say_42 = "�ڳ� ���� ���ڸ� �ؾƸ��� ���ϴ� ���ΰ�?[ENTER]�ƹ��� �����̶����� 100������ �ؾƷ�����������[ENTER]����� ������ �ǵ���(50814)���� ���� �ٽÿ��Գ�.[ENTER]"
locale.main_quest_flame_lv104.say_43 = "�ǵ���(50814)�� ��� ���Ͽ���. ����(20380)���� ��������."
locale.main_quest_flame_lv104.say_44 = "�Ƿ決������ ����(20380)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv104.say_45 = "������ ����1-3"
locale.main_quest_flame_lv104.say_46 = "�ڳװ� ���� ������ ���п� �غ� ���� �Ǿ�� �ֳ�.[ENTER]���� �������� �޸��� ������ ���ݸ� �� �����ְԳ�.[ENTER]������ �ܰ��̳�.[ENTER]"
locale.main_quest_flame_lv104.say_47 = "���� �������� �� �������� �����ϰ� ����� ��⸦ ����� ���̳�.[ENTER]���� ������ ���� ����� �����귯 ���� ���°� �Ҿ����� ���¶��.[ENTER]�� ��ŭ ȿ���� ���������� ���̾�.[ENTER]�����ϰ� �ڳ� ������ �ʸ����� �����ϸ鼭 �������� ����� ���� ���� ���̳�.[ENTER]������ �߿����� ���� ����(3291)���Լ� ������ ���ش� �ְԳ�.[ENTER]����� �����ž�� �ϴ�, 5�常 ���ش� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv104.say_48 = "�� ���� ������ ���� ����(20380)���� ��������."
locale.main_quest_flame_lv104.say_49 = "�������� ����(31024)�� ���� ����(20380)���� ��������.[ENTER]"
locale.main_quest_flame_lv104.say_50 = "���� �������ε� �й��ؼ� ��� ���ش� �ְ�.[ENTER]�ʸ��ܵ� ���浵 ��� �����ؾ߸��ϳ�.[ENTER]�׷� ��ٸ��� �ְڳ�.[ENTER]"
locale.main_quest_flame_lv104.say_51 = "��~���� ��� ��ᰡ ����������.[ENTER]��ø� ��ٸ���.[ENTER]�� ó���Ͽ� �����̴� ���߿� ��ȯ(20377)���� �θ��ðŵ� ������ ���Գ�.[ENTER]"
locale.main_quest_flame_lv104.say_52 = "������ ��� ���Ͽ���. ����(20380)���� ��������."

locale.main_quest_flame_lv105 = {}
locale.main_quest_flame_lv105.say_1 = "������ ����"
locale.main_quest_flame_lv105.say_2 = "��ȯ(20377)�� ����� ���ϰ� ã�� �ֽ��ϴ�.[ENTER]��ȯ(20377)���� �ڼ��� �̾߱⸦ ������ �Ͻʽÿ�.[ENTER]"
locale.main_quest_flame_lv105.say_3 = "�������̳�.[ENTER]����(20380)�� ���� ������ �ʿ��� ������ ������ٰ� �����.[ENTER]���� �ָӴ�(31083)�� ���� �Դ°�?[ENTER]"
locale.main_quest_flame_lv105.say_4 = "���� �ֽ��ϴ�. �� 3���Դϴ�.[ENTER]"
locale.main_quest_flame_lv105.say_5 = "���� �ָӴ�(31083)�� ������ ���߿� �˷��ְڳ�.[ENTER]�ϴ� �ڳװ� ���־�� �� ���� �˷��ֵ��� ����.[ENTER]���� �ָӴ�(31083)�� �ϼ��� �Ǿ�����, �ڳ׵� �˴ٽ��� ������ �������� ���� �߸�õ(6091)���� ��� �ǻ�Ƴ� �����̳�.[ENTER]��ô�̳� �ַλ����� ���Ǵ� ��Ȳ����.[ENTER]�̹����� �� ������ �긶���� 5���� ������ ������ ���̳�.[ENTER]"
locale.main_quest_flame_lv105.say_6 = "���漺(zone1)�� �ִ� ������ �� ����� ������� ���� �� ���� �ִٳ�.[ENTER]�׷��� ������ �������� ���� �߸�õ(6091)������ ���� �� ������� �����ϱ⿡�� �ʹ��� [ENTER]ū �庮���� ����.[ENTER]�ϴ� ������ ������ ȭ��(6005),����(6007),ȭ��(6006),����,�ʿ���(6009)�� 10������ ó���ϰ� ���ƿ� �ְԳ�.[ENTER]"
locale.main_quest_flame_lv105.say_7 = "��. �˰ڽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv105.say_8 = "���漺(zone1)�� �����Ͽ� ������ ������ ��������."
locale.main_quest_flame_lv105.say_9 = "�����θ� ��������."
locale.main_quest_flame_lv105.say_10 = "���漺(zone1)�� �����Ͽ�, ������ ������ óġ����.[ENTER]"
locale.main_quest_flame_lv105.say_11 = "�����޵� �������� ��߱� ���� �ʽ��ϴ�.[ENTER]"
locale.main_quest_flame_lv105.say_12 = "���� �����θ� ����� �������� ���� �� ���� �׷�.[ENTER]�����θ� �������� ���ϸ� ������ ������ �ʸ����̰� ��� ������ �浵�� �������ٳ�.[ENTER]� �ٳ����.[ENTER]"
locale.main_quest_flame_lv105.say_13 = "���漺(zone1)�� ������ ������ ��� óġ�Ͽ���.[ENTER]��ȯ(20377)���� �����ϵ��� ����."
locale.main_quest_flame_lv105.say_14 = "�Ƿ決������ ��ȯ(20377)�� ã�� ���� �ɵ��� ����.[ENTER]"
locale.main_quest_flame_lv105.say_15 = "���� �츮�� ���漺(zone1)�� �����Ͽ� �ʸ����� ���� ������ �� �ְڱ� �׷�.[ENTER]���� ������ �����ϴ� �͸� ���ұ� �׷�.[ENTER]����Ͽ���.[ENTER]"
locale.main_quest_flame_lv105.say_16 = "����"
locale.main_quest_flame_lv105.say_17 = "�ڳװ� �����θ� �����ϰ� ������ ���� �߸�õ(6091)�� óġ�߾�������, ��Ȱ�� �߸�õ(6091)�� ����� ���Ѱ� ������.[ENTER]������ ���漺(zone1)�� ¼��¼�� �ϴٴ� ���� ��� �Գ�.[ENTER]�� �߸�õ(6091)�� �ڳ׿��� ������ �� ���̴� �׷���������.[ENTER]�׷��ٰ� ũ�� �޸������� �ʰ����� ���̾�.[ENTER]"
locale.main_quest_flame_lv105.say_18 = "�̹��� �ڳװ� ���� ���� ��ġ�� ������ �˰�����, �ٷ� ���� �߸�õ(6091)�� óġ�̳�.[ENTER]������ óġ�� �̷��� ������, ���濡 ���ؼ� �ٽ� ��Ȱ�Ͽ��� �ڳ׿��� �ӽ��� ǰ�� ������[ENTER]�����ϰԳ�.[ENTER]�ƹ��� ������ �س����� �ϵ� ����ϸ� �׸�ġ�� �Ǵ� ����ϰ� �ٳ����.[ENTER]"
locale.main_quest_flame_lv105.say_19 = "���漺(zone1)���� ���� �߸�õ(6091)�� ��������."
locale.main_quest_flame_lv105.say_20 = "���� �߸�õ(6091)�� ó������."
locale.main_quest_flame_lv105.say_21 = "���漺(zone1)�� �����Ͽ�, ���� �߸�õ(6091)�� óġ����.[ENTER]"
locale.main_quest_flame_lv105.say_22 = "���� �߸�õ(6091)�� �������� �հ�?[ENTER]����� �߸�õ(6091)�� óġ�ϰ� ���ְԳ�.[ENTER]�ڳ׶�� ���� �س� �� ���� ���̾�.[ENTER]"
locale.main_quest_flame_lv105.say_23 = "���漺(zone1)�� ���� �߸�õ(6091)�� �����Ͽ���.[ENTER]��ȯ(20377)���� ���ϵ��� ����."
locale.main_quest_flame_lv105.say_24 = "����!!���� �����.[ENTER]����Ͽ���.[ENTER]���Ϸκ��� ���� ������ �޾Ҵٳ�.[ENTER]���� ���濡�� �������� ������ ���ϱ⸸�ϸ� ������� �������� �� �� ������.[ENTER]����鸦 �����ϰ� �ٽ� �θ����� �ϰڳ�.[ENTER]"
locale.main_quest_flame_lv105.say_25 = "������ ����"
locale.main_quest_flame_lv105.say_26 = "���� ���� �Ǿ���.[ENTER]���濡�� ������ ���ϰ� �ʸ����� ���� ������ų �ð��̸��̾�.[ENTER]���� ���� �ָӴ�(31083)�� ������ �ؾ��� �ൿ�� �����ϵ��� �ϰڳ�.[ENTER]"
locale.main_quest_flame_lv105.say_27 = "���� ������ ������ �����ָӴ�(31083)�� �� ���ϵ��� ���Ͽ� 2���� ������ �ѷ��� ���� ��ġ�� �ξ��ٳ�.[ENTER]���� �ָӴ�(31083)�� ��� �ִ� ������ ���� ��ġ�� �� �ְ�, ��뿡 ���� ���� �������� �Ǳ⵵����.[ENTER]�ڳװ� �� ���� �ٷ� ������ �Ͼ �� �ֵ��� �ϴ� ���̳�.[ENTER]���� �߸�õ(6091)�� óġ�� ������ ������ ���ε� ���� ���� ���̳�.[ENTER]�ű⿡ �� ���� �ָӴ�(31083)�� ���ϰ� ������.[ENTER]�ָӴϼ��� �Ҿ����ϱ� ������ ������ �Ͼ ���̰� �� ���ϵ��� ��ġ�� �������� ���Ͽ�[ENTER]������ �ߵ� �� ���̳�.[ENTER]"
locale.main_quest_flame_lv105.say_28 = "���漺(zone1)�� �����Ͽ� ���濡�� ������ ������."
locale.main_quest_flame_lv105.say_29 = "���� ��������"
locale.main_quest_flame_lv105.say_30 = "���濡�� ������ ������."
locale.main_quest_flame_lv105.say_31 = "���漺(zone1)�� �����Ͽ�, ������μ��� �����ָӴ�(31083)�� �������.[ENTER]"
locale.main_quest_flame_lv105.say_32 = "���� ���μ�(20390): 1��"
locale.main_quest_flame_lv105.say_33 = "���� ȭ��"
locale.main_quest_flame_lv105.say_34 = "ũ��������..�� �ܿ� �������ΰ�!! ũ������[ENTER]����ġ ���Ͽ� ���� ���� �Ҿ�����, �� �����δ� ������ ������ ���� �� ����.[ENTER]���� ���� �߸�õ(6091)�� ��Ȱ�ϰ� ������ Ǯ�� �� ���̴�.[ENTER]ũ��������[ENTER]"
locale.main_quest_flame_lv105.say_35 = "���濡�� ������ ���Ϸ� �õ��Ͽ�����, �����Ͽ���.[ENTER]��ȯ(20377)���� ��������."
locale.main_quest_flame_lv105.say_36 = "����Գ�. ���� ���� ���� �Ͽ�����, �һ��� ������ ������ �ְ�.[ENTER]"
locale.main_quest_flame_lv105.say_37 = "��.[ENTER]������ �۵��� ������ ��Ȯ�ϰ� �Ͼ� �����ϴ�.[ENTER]���� ������ �õ��� �Ǿ��� ���Դϴ�.[ENTER]�׷��� ������ �Ŵ��� ���� ������ �����Ͽ����ϴ�.[ENTER]������ ���� �߸�õ(6091)�� ��Ȱ�� ���̰� �ڽŵ� ������ Ǯ�Ե� ���̶� �߽��ϴ�.[ENTER]�㳪, �̹� ���� �õ��� �������� ���Ͽ����� ū ���ظ� ������� �Ͽ����ϴ�.[ENTER]"
locale.main_quest_flame_lv105.say_38 = "�׷���.[ENTER]����Ͽ���. �ڳ� ���п� ������� �� �س����̴ϱ� ���̾�.[ENTER]���� �ް���� å��� ����(20380) ��θ� �ҷ� �̷� ��츦 ����Ϸ� �ߴٳ�.[ENTER]������ �� ���ϵ��� ���� ���������� �����ϸ鼭 �������� ������ ���� �浵�� ã�ƾ� �ϴ� �����̶��.[ENTER]���濡�� ������ ���ϰ� �Ϻ��ϰ� ������ ����� ã�ŵ� �ڳ׸� �ٽ� �θ����� �ϰڳ�.[ENTER]����Ͽ���.[ENTER]"

locale.snow_dungeon = {}
locale.snow_dungeon.say_1 = "Black Dragon Start Intellekt"
locale.snow_dungeon.say_2 = "Pass this one abgelaufen ist. [ENTER] Black Dragon Intelligenz Position f�r 1 Stunde gehalten, und wurde in der Mitte des wei�en Drachen intellektuellen Fortschritt gesendet oder abgeschlossen, wenn die Position auf 30 Minuten begrenzt ist."
locale.snow_dungeon.say_3 = "nicht passieren das Verlies wird raus."
locale.snow_dungeon.say_4 = "10 Sekunden sp�ter mit dem Chef Zimmer gehen"
locale.snow_dungeon.say_5 = "White Dragon von Intelligenz"
locale.snow_dungeon.say_6 = "Wollen Sie wirklich in Black Dragon Intelligenz?"
locale.snow_dungeon.say_7 = "10 Sekunden bis in den zweiten Stock zu bewegen"
locale.snow_dungeon.say_8 = "10 Sekunden bis in den vierst�ckigen gehen"
locale.snow_dungeon.say_9 = "10 Sekunden bis in den f�nfst�ckigen gehen"
locale.snow_dungeon.say_10 = "Metin Steine ??gefunden"
locale.snow_dungeon.say_11 = "10 Sekunden bis in den dritten Stock zu bewegen"
locale.snow_dungeon.say_12 = "ist nicht der eigentliche Schl�ssel"
locale.snow_dungeon.say_13 = "Bitte zerlegen Sie das zweite Verzauberung"
locale.snow_dungeon.say_14 = "Bitte zerlegen Sie das dritte Verzauberung"
locale.snow_dungeon.say_15 = "falsche Reihenfolge"
locale.snow_dungeon.say_16 = "Bitte bauen Sie die vierte Chains"
locale.snow_dungeon.say_17 = "Bitte bauen Sie die f�nfte Chains"
locale.snow_dungeon.say_18 = "10 Sekunden bis in das sechsst�ckige gehen"
locale.snow_dungeon.say_19 = "10 Sekunden bis in die sieben Stockwerke zu gehen"
locale.snow_dungeon.say_20 = "false verschwindet"
locale.snow_dungeon.say_21 = "10 Sekunden bis in den acht-Geschichte gehen"
locale.snow_dungeon.say_22 = "10 Sekunden bis in den neun-st�ckigen gehen"
locale.snow_dungeon.say_23 = "Boss besiegt"
locale.snow_dungeon.say_24 = "1 Minuten nach dem Black Dragon Intelligenz bewegt sich aus."
locale.snow_dungeon.say_25 = "Position die ganze Zeit verstrichen ist, wird die Wartung der White Dragon Verstand bewegt werden."
locale.snow_dungeon.say_26 = "Black Dragon Intelligenz Verweilzeit Eintrag% d Minuten."
locale.snow_dungeon.say_27 = "Black Dragon Intelligenz Positionen wurden halten die Zeit abgelaufen ist."
locale.snow_dungeon.say_28 = "10 Sekunden erlischt die Black Dragon Intelligenz."
locale.snow_dungeon.say_29 = "re-entry Zeit ist mehr als f�nf Minuten ist nicht erlaubt. [ENTER]"
locale.snow_dungeon.say_30 = "eine Partei kann nicht weiter vorgehen Behinderung verschwinden [ENTER]"
locale.snow_dungeon.say_31 = "Parteien nicht erreichen Kapitel 104Lv weitere Fortschritte ist unm�glich."
locale.snow_dungeon.say_32 = "Party Kapitel 103Lv nicht f�llen Sie alle Quests, sind weitere Fortschritte unm�glich."
locale.snow_dungeon.say_33 = "Hanma Entscheidung der Position du das wollen?"
locale.snow_dungeon.say_34 = "position"
locale.snow_dungeon.say_35 = "Schlie�en"
locale.snow_dungeon.say_36 = "Boss Room Entry"
locale.snow_dungeon.say_37 = "um alles B�se zu besiegen."
locale.snow_dungeon.say_38 = "den Schl�ssel, mit dem Eis von dem B�sen."
locale.snow_dungeon.say_39 = "all das B�se zu besiegen die jincho naenggoe vergeben."
locale.snow_dungeon.say_40 = "all das Siegel zu brechen."
locale.snow_dungeon.say_41 = "Abbruch notwendigen Elemente f�r das B�se kann bezogen werden."
locale.snow_dungeon.say_42 = "Bing Manastein durch den Sieg �ber alle Monster zu zerst�ren."
locale.snow_dungeon.say_43 = "jincho Verliehen naenggoe."
locale.snow_dungeon.say_44 = "B�se aus der Nutzung jigeon White Dragon erhalten."
locale.snow_dungeon.say_45 = "White Dragon Wheel, um zu zerst�ren."
locale.snow_dungeon.say_46 = "Hanma Verliehen f�r."
locale.snow_dungeon.say_47 = "vers�umt, das Verlies mit Partei hayeotgeona starten"

locale.event_flame_dungeon_open = {}
locale.event_flame_dungeon_open.say_1 = "����ȭ���� ��"
locale.event_flame_dungeon_open.say_2 = "��.. �̾߱⸦ ����°�..[ENTER]����ȭ���� ū ������ �߰ߵƴٰ� �ϴ±���...[ENTER]���� �ڳ�ó�� ��翴����....[ENTER]�� ������ �������� ������ ���� �������� �����ѵ� ����..."
locale.event_flame_dungeon_open.say_3 = "��.... ��� �Ŀ� �ٽ� ����...[ENTER]�� ����ȭ�� �������� ��ǥ�� ���� �̵����� �ϳ� �ְڳ�...[ENTER]�װ����� �ٳ�ͼ� ������ �������� �ʰڴ°�?![ENTER]���� �ñ��ϱ���.... ����" 
locale.event_flame_dungeon_open.say_4 = "�̵����� �ּ���~!"
locale.event_flame_dungeon_open.say_5 = "��ȣ~!![ENTER]��Ⱑ �ִ� ���� ����̷α���...[ENTER]���� ô���ϸ�, ������ ���ĳ��� ����ȭ���� �̷��� ���ڴٴ�[ENTER]�������� �������� �ƴϸ� �Ұ�������..[ENTER]�����...."
locale.event_flame_dungeon_open.say_6 = "��~!!![ENTER]���� �ֳ�~!! ����ȭ�� �������� ��ǥ�� ��ϵ� �̵����ϼ�[ENTER]�׸��� ������ ������� ���ʹ� �� ���캸�� ���߿� �ٳ�� �̾߱⳪ ���ְԳ�~![ENTER]�׷� ������ �ϰԳ�~!!"
locale.event_flame_dungeon_open.say_7 = "����~!!![ENTER]�̻����~!! �ƹ��� ���� �̵����� ����µ��� �Ѱ谡 �ֳ�...[ENTER]�Ϸ翡 �ѹ��� �� �� ������ ���� ���Գ�..."
