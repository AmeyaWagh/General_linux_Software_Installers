#!/bin/bash
# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'

. ./setupFiles/setup.sh
. ./setupFiles/docker_installer
# ----------------------------------
# Step t#2: User defined function
# ----------------------------------
usage="
-----------------------------------------------
		Installer
-----------------------------------------------
1. 	Install sublime text 3
2. 	Install terminator
3. 	Install Oh_my_zsh
4. 	Install gparted
5. 	Install google chrome
6. 	Install vlc
7. 	Set utilities path
8. 	Install htop
9. 	Install docker-ce
10. 	Install portainer
11.	Install slack
12. 	Install spotify
13.	Install grub-customizer
14. 	Install virtual environment
15.	Install java se9
16.	Install powerline

0. 	Exit
-----------------------------------------------
created by - Ameya Wagh
"
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}


read_options(){
	local choice
	read -p "Enter choice [ number ] " choice
	case $choice in
		1) install_sublime ;;
		2) install_terminator ;;
		3) install_oh_my_zsh;;
		4) install_gparted ;;
		5) install_chrome ;;
		6) install_vlc ;;
		7) set_util_path ;;
		8) install_htop ;;
		9) install_docker_ce ;;
		10) install_portainer ;;
		11) install_slack ;;
		12) install_spotify ;;
		13) install_grub_customizer ;;
		14) install_virtualenv ;;
		15) install_java ;;
		16) install_powerline ;;
		0) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	#show_menus
	clear
	echo "$usage"
	read_options
done
