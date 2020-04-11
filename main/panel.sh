#!/bin/sh
#### @martysama0134 start scripts ####
v_base=$PWD
v_mt2f=$v_base
v_bakf=$v_base/baks
v_dbf=$v_bakf/db
v_fsf=$v_bakf/fs
v_srcpath=/usr/home/src
v_gamesrcpath=$v_srcpath/Server/game/src
v_dbsrcpath=$v_srcpath/Server/db/src
v_foldername=srv1
v_localename=germany
v_bin=python2.7

fecho () { echo -e "\033[35m$1\033[0m"; }
_fecho () { echo -e "\033[4;35m$1\033[0m"; }
f_echo () { echo -e "\033[1;35m$1\033[0m"; }
becho () { echo -e "\033[34m$1\033[0m"; }
yecho () { echo -e "\033[33m$1\033[0m"; }
_yecho () { echo -e "\033[4;33m$1\033[0m"; }
y_echo () { echo -e "\033[1;33m$1\033[0m"; }
gecho () { echo -e "\033[32m$1\033[0m"; }
recho () { echo -e "\033[31m$1\033[0m"; }
_recho () { echo -e "\033[4;31m$1\033[0m"; }
r_echo () { echo -e "\033[1;31m$1\033[0m"; }
cecho () { echo -e "\033[36m$1\033[0m"; }
ruecho () { echo -e "\033[1;4;33;41m$1\033[0m"; }
bnecho () {  echo -e "\033[1;4;30;47m$1\033[0m"; }
rnecho () {  echo -e "\033[1;4;30;41m$1\033[0m"; }
abio () { echo -e "\033[31m$1\033[32m$1\033[33m$1\033[34m$1\033[35m$1\033[36m$1\033[37m$1\033[0m"; }

r_echo ".:. AdminPanel .:."
gecho "What do you want to do?"
recho "1. Start (start)
1c. Restart (restart and clean)
1i. Start Interactive (starti)
2. Stop (stop|close)
2i. Stop Interactive (stopi|closei)
3. Clean (clean|clear)
33. Clean All (cleanall|clearall)
4. Backup mysql/db (bak1|db|db_backup)
5. Backup game/fs (bak2|fs|fs_backup)
11. Compile game (compile_game)
12. Clean and Compile game (clean_and_compile_game)
13. Compile db (compile_db)
14. Clean and Compile db (clean_and_compile_db)
666. Generate (gen)
777. Compile Quests (quest)
888. Game Symlink (symlink)
999. Search (search)"
_yecho "1a. Start+Daemon (startall)"
_yecho "2a. Stop+Daemon (stopall|closeall)"
_recho "0. Quit (quit)"

if [ -z $1 ]; then
	read phase
else
	phase=$1
fi

case  $phase in
1|start)
	cd $v_mt2f
	$v_bin start.py
	cd $v_base
	cecho "start completed"
;;
1c|restartandclean)
	cd $v_mt2f
	$v_bin stop.py
	cd $v_base
	cecho "stop completed"

	cd $v_mt2f
	$v_bin clear.py
	cd $v_base
	make -C $v_dbf clean
	make -C $v_fsf clean
	cecho "cleanall completed"

	cd $v_mt2f
	$v_bin start.py
	cd $v_base
	cecho "start completed"
;;
1i|starti)
	cd $v_mt2f
	$v_bin start.py --prompt
	cd $v_base
	cecho "starti completed"
;;
1a|startall)
	cd $v_mt2f
	sh daemon.sh &
	cd $v_base
	cecho "startall completed"
;;
2|stop|close)
	cd $v_mt2f
	$v_bin stop.py
	cd $v_base
	cecho "stop completed"
;;
2i|stopi|closei)
	cd $v_mt2f
	$v_bin stop.py --prompt
	cd $v_base
	cecho "stopi completed"
;;
2a|stopall|closeall)
	ps afx | grep 'sh daemon.sh' | grep -v grep | awk '{print $1}' | xargs kill -9
	cd $v_mt2f
	$v_bin stop.py
	cd $v_base
	cecho "stopall completed"
;;
3|clean|clear)
	cd $v_mt2f
	$v_bin clear.py
	cd $v_base
	cecho "clean completed"
;;
33|cleanall|clearall)
	cd $v_mt2f
	$v_bin clear.py
	cd $v_base
	make -C $v_dbf clean
	make -C $v_fsf clean
	cecho "cleanall completed"
;;
4|bak1|db|db_backup)
	make -C $v_dbf dump
	cecho "bak db completed"
;;
5|bak2|fs|fs_backup)
	make -C $v_fsf dump
	cecho "bak fs completed"
;;
11|compile_game)
	cd $v_gamesrcpath
	gmake -j13
	cecho "game src compiled"
;;
12|clean_and_compile_game)
	cd $v_gamesrcpath
	gmake clean
	gmake -j13
	cecho "game src clean compiled"
;;
13|compile_db)
	cd $v_dbsrcpath
	gmake -j13
	cecho "db src compiled"
;;
14|clean_and_compile_db)
	cd $v_dbsrcpath
	gmake clean
	gmake -j13
	cecho "db src clean compiled"
;;
666|gen)
	cd $v_mt2f
	# rm -rf $v_foldername/logs $v_foldername/auth $v_foldername/chan $v_foldername/db
	$v_bin gen.py
	cd $v_base
	cecho "gen completed"
;;
777|quest)
	cd $v_mt2f/$v_foldername/share/locale/$v_localename/quest
	chmod u+x qc
	$v_bin pre_qc.py -ac
	cd $v_base
	cecho "quest completed"
;;
888|symlink)
	cd $v_mt2f/$v_foldername/share/bin
	rm -f game db
	ln -s /usr/home/src/Server/game/game_symlink game
	ln -s /usr/home/src/Server/db/db_symlink db
	cecho "symlink completed"
;;
999|search)
	find $v_base -name "CONFIG" -print -exec cat {} \; | grep -e PORT -e HOSTNAME
;;
0|quit)
	abio ".:|:."
;;
*)
	cecho "$phase not found"
esac



