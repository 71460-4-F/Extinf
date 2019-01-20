#!/bin/bash
#By Tiago A. Fontenele

function art () {
P=$(echo -e "\033[0;34m((\033[00;37m")
A=$(echo -e "\033[0;32m>_Tiago-A-F\033[0;37m")
C="\033[1;30m"
echo -e "\033[0;33m
                                                              \033[0;34m                                      /
                                                                             \\\\                    //
                                                                              \\\\\\\\                 //
                                                                               \\\\\\\\              ///
                                                                                \\\\\\\\\\\          ////
                                                                                 \\\\\\\\\\\\\\\\      /////
                                                                                  \\\\\\\\\\\\\\\\\  //////
                                                                                   \\\\\\\\\\\\\\\\\//////     \033[00;37m
 $C      ▄████████ ▀████    ▐████▀     ███      ▄█  ███▄▄▄▄      ▄████████\033[0;34m          /    ///////_///  \033[00;37m
 $C      ███    ███   ███▌   ████▀  ▀█████████▄ ███  ███▀▀▀██▄   ███    ███\033[0;34m        /,)/ \ _\\\\\\\\\\\\\===\\\\\\  \033[00;37m
 $C      ███    █▀     ███  ▐███       ▀███▀▀██ ███▌ ███   ███   ███    █▀\033[0;34m         (/   \\\\\  //   \033[00;37m
 $C     ▄███▄▄▄        ▀███▄███▀        ███   ▀ ███▌ ███   ███  ▄███▄▄▄   \033[0;34m              // //       \033[00;37m
     ▀▀███▀▀▀        ████▀██▄         ███     ███▌ ███   ███ ▀▀███▀▀▀   \033[0;0m        ====$P==$P====    \033[00;37m
       ███    █▄    ▐███  ▀███        ███     ███  ███   ███   ███      \033[0;0m       ||$A ||      \033[00;37m
       ███    ███  ▄███     ███▄      ███     ███  ███   ███   ███      \033[0;0m       ||            ||     \033[00;37m
        ██████████ ████       ███▄    ▄████▀   █▀    ▀█   █▀    ███  1.0\033[0;0m       ||____________||    \033[00;37m
                                                                        \033[0;0m       |______0_______|    \033[00;37m
                                                                      \033[0;0m        //#############//    \033[00;37m
                                                                    \033[0;0m         //#############//     \033[00;37m
                                                                   \033[0;0m         /_____/__/______/     \033[00;37m

\033[00;37m
 "
}
clear
echo "Verificando atualisações..."

wget http://dontpad.com/extinf-database-2019.txt 1> /dev/null 2> /dev/stdout

clear

mv extinf-database-2019.txt db_online.txt

if [ $(du -b db_online.txt | awk '{print $1}') -ne $(du -b db.txt | awk '{print $1}') ]; then
   echo "Atualizando banco de dados... "
   cat db_online.txt > db.txt
   sleep 3
   clear
   echo "Banco de dados atualisado com sucesso!"
   sleep 2
   clear
else
   if [ ${1} ]; then
      EXT=$(echo "${1}" | grep -o  "[^.]*$" | tr [:upper:] [:lower:])
      CAT=$(cat db.txt | grep -i "^$EXT[:]" | cut -d: -f 2)
      CRI=$(cat db.txt | grep -i "^$EXT[:]" | cut -d: -f 3)
      DES=$(cat db.txt | grep -i "^$EXT[:]" | cut -d: -f 4)
      ABR=$(cat db.txt | grep -i "^$EXT[:]" | cut -d: -f 5)

      clear
      echo ""
      art
      echo -e "        File: \033[01;31m${1}\033[00;37m                                                                                                  "
      echo -e "                                                                                                                                             "
      echo -e "        Extension: \033[01;96m$EXT\033[00;37m                                                                                                 "
      echo -e "                                                                                                                                             "
      echo -e "        Category: \033[01;96m$CAT\033[00;37m                                                                                                "
      echo -e "                                                                                                                                             "
      echo -e "        Creator: \033[01;96m$CRI\033[00;37m                                                                                                  "
      echo -e "                                                                                                                                             "
      echo -e "        Description: \033[01;96m$DES\033[00;37m                                                                                                "
      echo -e "                                                                                                                                             "
      echo -e "        Opens with: \033[01;96m$ABR\033[00;37m                                                                                                 "
      echo -e "                                                                                                                                             "
   else
      echo "use: ${0} [name_file.extension]"
   fi
fi
