#!/bin/bash
mkdir /home/$(whoami)/Fedora-Bliss
cd /home/$(whoami)/Fedora-Bliss

# Install Gnome-Tweaks & Gnome-Extensions
sudo dnf install gnome-tweaks -y
sudo dnf install gnome-extensions-app -y

# Add Minimize and Maximize buttons to application windows
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Get Prof-Gnome 40.1 Dark
wget -O gtk-theme.zip https://github.com/paullinuxthemer/Prof-Gnome/archive/refs/heads/master.zip
unzip -d gtk-theme gtk-theme.zip
cp -r gtk-theme/Prof-Gnome-master/gnome-professional-40.1-dark/ /home/$(whoami)/.themes/Prof-Gnome-master/gnome-professional-401-dark/
gsettings set org.gnome.desktop.interface gtk-theme 'gnome-professional-401-dark'
gsettings set org.gnome.desktop.wm.preferences theme 'gnome-professional-401-dark'

# Fix theme for FlatPaks
sudo dnf install ostree libappstream-glib
wget -O pakitheme.zip https://github.com/refi64/stylepak/archive/refs/heads/master.zip
unzip -d pakitheme pakitheme.zip
sudo pakitheme/stylepak-master/stylepak install-user

# Get Papirus Icon Theme Grey
# # wget -O icons.zip https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/refs/heads/master.zip 
# # unzip -d icons icons.zip
# # sh icons/papirus-icon-theme-master/install.sh
# # gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# Get Oh-My-Posh
# # sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
# # sudo chmod +x /usr/local/bin/oh-my-posh
# # sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O /home/$(whoami)/.poshthemes/themes.zip
# # sudo unzip /home/$(whoami)/.poshthemes/themes.zip -d /home/$(whoami)/.poshthemes/themes/
# # sudo chmod u+rw /home/$(whoami)/.poshthemes/themes/*.json
# # sudo rm /home/$(whoami)/.poshthemes/themes.zip
# # sudo cp fedora-bliss.omp.json /home/$(whoami)/.poshthemes/themes/
# # sudo mkdir /root/.poshthemes
# # sudo mkdir /root/.poshthemes/themes
# # sudo cp fedora-bliss.omp.json /root/.poshthemes/themes/
# # echo 'eval "$(oh-my-posh --init --shell bash --config ~/.poshthemes/themes/fedora-bliss.omp.json)"' >> ~/.bashrc
# # sudo echo 'eval "$(oh-my-posh --init --shell bash --config /root/.poshthemes/themes/fedora-bliss.omp.json)"' >> /root/.bashrc
# # . ~/.bashrc
