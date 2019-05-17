#!/bin/sh



VERBOSE=1


#-------------------------------------------------------------------#
# debugger
d_log(){
if [ $verbose=1 ];then
	echo "$@"
fi
}
#-------------------------------------------------------------------#

set_util_path(){
	echo "PATH=$PATH:~/utilities" >> ~/.bashrc
	echo "PATH=$PATH:~/utilities" >> ~/.zshrc
	source ~/.bashrc
	source ~/.zshrc
	echo "done"
}


test_script(){
	echo "script works"
}



install_sublime(){
	# install key
	wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -

	#add apt repository
	echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list

	#install sublime
	sudo apt-get update
	sudo apt-get install sublime-text
	echo "sublime installed"
	read -p "Press [Enter] key to continue"
}



install_terminator(){
	sudo apt-get install terminator
	echo "Terminator installed"
	read -p "Press [Enter] key to continue" 
}



install_oh_my_zsh(){
	# install zsh
	sudo apt-get install zsh
	sudo apt-get install git-core

	# install oh my zsh
	wget https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | zsh

	# MAKE ZSH DEFAULT SHELL
	chsh -s `which zsh`
	echo "oh my zsh installed"
	read -p "Press [Enter] key to continue"
}



install_gparted(){
	sudo apt-get install gparted
	read -p "Press [Enter] key to continue"
}

install_chrome(){
	# add key
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

	# set repository
	echo 'deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list

	# install google-chrome stable
	sudo apt-get update 
	sudo apt-get install google-chrome-stable
	read -p "Press [Enter] key to continue"
}

install_vlc(){
	sudo apt-get install vlc
	read -p "Press [Enter] key to continue"	
}

install_htop(){
	sudo apt-get install htop
	read -p "Press [Enter] key to continue"
}

install_slack(){
	sudo apt-get install libappindicator1
	echo "Downloading slack"
	wget https://downloads.slack-edge.com/linux_releases/slack-desktop-3.0.2-amd64.deb
	echo "installing - $(ls | grep slack)"
	sudo dpkg -i "$((ls | grep -e "slack") | grep deb)"
	rm -rf "$((ls | grep -e "slack") | grep deb)"
	read -p "Press [Enter] key to continue"
}

install_spotify(){
	echo "adding keys"
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0DF731E45CE24F27EEEB1450EFDC8610341D9410
	
	echo "adding repository"
	echo deb http://repository.spotify.com stable non-free | sudo tee /etc/apt/sources.list.d/spotify.list

	sudo apt-get update
	sudo apt-get install spotify-client
	read -p "Press [Enter] key to continue"
}

install_grub_customizer(){
	sudo add-apt-repository ppa:danielrichter2007/grub-customizer
	sudo apt-get update
	sudo apt-get install grub-customizer
	read -p "Press [Enter] key to continue"
}

install_virtualenv(){
	sudo pip install virtualenv virtualenvwrapper
	echo "export WORKON_HOME=$HOME/.virtualenvs" >> ~/.bashrc
	echo "export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3" >> ~/.bashrc
	echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.bashrc
	echo "source /usr/local/bin/virtualenvwrapper.sh" >> ~/.zshrc
	source ~/.bashrc
	source ~/.zshrc
	read -p "Press [Enter] key to continue"
}

install_java(){
	sudo add-apt-repository ppa:webupd8team/java
	
	sudo apt-get update
	sudo apt install oracle-java9-installer
	sudo apt install oracle-java9-set-default
	javac -version
	read -p "Press any key to Continue"

}

uninstall_gedit(){
	d_log "removing gedit"
	sudo apt-get remove gedit
	read -p "Press [Enter] key to continue"
}

install_powerline(){
	sudo pip install powerline-status
	git clone https://github.com/powerline/fonts.git && cd fonts && sh ./install.sh
	echo "set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/" >> ~/.vimrc
	echo "\" Always show statusline" >> ~/.vimrc
	echo "set laststatus=2" >> ~/.vimrc
	echo"\" Use 256 colours (Use this setting only if your terminal supports 256 colours)" >> ~/.vimrc
	echo "set t_Co=256" >> ~/.vimrc


	# Set bashrc
	echo "if [ -f /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh ]; then
		source /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
	fi" >> ~/.bashrc

	# Set zshrc
	echo "f [[ -r /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
	source /usr/local/lib/python2.7/site-packages/powerline/bindings/zsh/powerline.zsh
fi" >> ~/.zshrc
}
#-------------------------------------------------------------------#
#test_script
#install_sublime
#install_terminator
#install_oh_my_zsh
#install_gparted
#uninstall_gedit

