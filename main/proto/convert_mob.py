#!/usr/bin/env python
#-*- coding" utf-8 -*-
#Modified by Deucalion
import MySQLdb
host_mysql = 'localhost'
user_mysql = 'root'
passwd_mysql = '6cSpj35kXdYC6yf8'
def mob_proto():
	rank = {
		1: "S_PAWN",
		2: "KNIGHT",
		3: "S_KNIGHT",
		4: "BOSS",
		5: "KING",
	}
	
	typeee = {
		1: "NPC",
		2: "STONE",
		3: "WARP",
		4: "DOOR",
		5: "BUILDING",
		7: "POLYMORPH_PC",
		8: "HORSE",
		9: "GOTO",
	}
	
	battletype = {
		2: "RANGE",
		3: "MAGIC",
		4: "SPECIAL",
		5: "POWER",
		6: "TANKER",
	}
	
	def get_rank(level):
		if level in rank:
			return rank[level]
		else:
			return "PAWN"
	
	def get_type(typee):
		if typee in typeee:
			return typeee[typee]
		else:
			return "MONSTER"
			
	def get_battletype(battle):
		if battle in battletype:
			return battletype[battle]
		else:
			return "MELEE"
			
	def get_flag(flag):
		if flag == "":
			return flag
		else:
			return flag
			
	def get_race(race):
		if race == "":
			return race
		else:
			return race
			
	def get_immune(immune):
		if immune == "":
			return immune
		else:
			return immune
			
	def get_folder(folder):
		if folder == "":
			return "\"wolf\""
		else:
			return folder
	
	print "Connecting to database proto..."
	data = "player"
	db = MySQLdb.connect(host_mysql,user_mysql,passwd_mysql,data)
	cur = db.cursor()
	print "Connected."
	cur.execute("select * from mob_proto")
	rows = cur.fetchall()
	out_file_mobproto = open("proto/mob_proto.txt", "w")
	out_file_mobnames_de = open("proto/mob_names_de.txt", "w")
	print "Converting mob_proto..."
	mob_proto_firstline = "VNUM	NAME\tRANK\tTYPE\tBATTLE_TYPE\tLEVEL\tSIZE\tAI_FLAG\tMOUNT_CAPACITY\tRACE_FLAG\tIMMUNE_FLAG	EMPIRE\tFOLDER\tON_CLICK\tST\tDX\tHT\tIQ\tDAMAGE_MIN\tDAMAGE_MAX\tMAX_HP\tREGEN_CYCLE\tREGEN_PERCENT\tGOLD_MIN\tGOLD_MAX\tEXP\tDEF\tATTACK_SPEED\tMOVE_SPEED\tAGGRESSIVE_HP_PCT\tAGGRESSIVE_SIGHT\tATTACK_RANGE\tDROP_ITEM\tRESURRECTION_VNUM\tENCHANT_CURSE\tENCHANT_SLOW\tENCHANT_POISON\tENCHANT_STUN\tENCHANT_CRITICAL\tENCHANT_PENETRATE\tRESIST_SWORD\tRESIST_TWOHAND\tRESIST_DAGGER\tRESIST_BELL\tRESIST_FAN\tRESIST_BOW\tRESIST_FIRE\tRESIST_ELECT\tRESIST_MAGIC\tRESIST_WIND\tRESIST_POISON\tDAM_MULTIPLY\tSUMMON\tDRAIN_SP\tMOB_COLOR\tPOLYMORPH_ITEM\tSKILL_LEVEL0\tSKILL_VNUM0\tSKILL_LEVEL1\tSKILL_VNUM1\tSKILL_LEVEL2\tSKILL_VNUM2\tSKILL_LEVEL3\tSKILL_VNUM3\tSKILL_LEVEL4\tSKILL_VNUM4\tSP_BERSERK\tSP_STONESKIN\tSP_GODSPEED\tSP_DEATHBLOW\tSP_REVIVE"
	out_file_mobproto.write(mob_proto_firstline + "\r\n")
	mob_names_firstline = "VNUM\tLOCALE_NAME"
	out_file_mobnames_de.write(mob_names_firstline + "\r\n")
	for row in rows:
		mob_proto_line = "%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s\t%s" % (row[0], row[1], get_rank(row[4]), get_type(row[5]), get_battletype(row[6]), row[7], row[8], get_flag(row[9]), row[10], get_race(row[11]), get_immune(row[12]), row[13], get_folder(row[14]), row[15], row[16], row[17], row[18], row[19], row[20], row[21], row[22], row[23], row[24], row[25], row[26], row[27], row[28], row[29], row[30], row[31], row[32], row[33], row[34], row[35], row[36], row[37], row[38], row[39], row[40], row[41], row[42], row[43], row[44], row[45], row[46], row[47], row[48], row[49], row[50], row[51], row[52], row[53], row[54], row[55], row[56], row[57], row[58], row[59], row[60], row[61], row[62], row[63], row[64], row[65], row[66], row[67], row[68], row[69], row[70], row[71], row[72])
		mob_names_line_de = "%s\t%s" % (row[0], row[2])
		mob_names_line_en = "%s\t%s" % (row[0], row[3])
		out_file_mobproto.write(mob_proto_line + "\r\n")
		out_file_mobnames_de.write(mob_names_line_de + "\r\n")
	out_file_mobproto.close()
	return "Mob proto converted!"
	
print mob_proto()