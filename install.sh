#!/bin/bash

# Install Gnome-Tweaks & Gnome-Extensions
sudo dnf install gnome-tweaks -y
sudo dnf install gnome-extensions-app -y
sudo dnf install gnome-shell-extension-appindicator -y
sudo dnf install gnome-shell-extension-material-shell -y
sudo dnf install gnome-shell-extension-dash-to-dock -y

# Add Minimize and Maximize buttons to application windows
gsettings set org.gnome.desktop.wm.preferences button-layout 'appmenu:minimize,maximize,close'

# Get Prof-Gnome 40.1 Dark
wget -O gtk-theme.zip https://github.com/paullinuxthemer/Prof-Gnome/archive/refs/heads/master.zip
unzip -d gtk-theme gtk-theme.zip
sudo cp -r gtk-theme/Prof-Gnome-master/gnome-professional-40.1-dark /usr/share/themes/
gsettings set org.gnome.desktop.interface gtk-theme 'gnome-professional-40.1-dark'
gsettings set org.gnome.desktop.wm.preferences theme 'gnome-professional-40.1-dark'

# Fix theme for FlatPaks
sudo dnf install ostree libappstream-glib
wget -O pakitheme.zip https://github.com/refi64/stylepak/archive/refs/heads/master.zip
unzip -d pakitheme pakitheme.zip
sudo pakitheme/stylepak install-system

# Get Papirus Icon Theme Grey
wget -O icons.zip https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/archive/refs/heads/master.zip 
unzip -d icons icons.zip
sh icons/papirus-icon-theme-master/install.sh
gsettings set org.gnome.desktop.interface icon-theme 'Papirus-Dark'

# Get Oh-My-Posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O /usr/local/bin/oh-my-posh/poshthemes/themes.zip
sudo unzip /usr/local/bin/oh-my-posh/poshthemes/themes.zip -d /usr/local/bin/oh-my-posh/poshthemes/themes/
sudo chmod u+rw /usr/local/bin/oh-my-posh/poshthemes/themes/*.json
sudo rm /usr/local/bin/oh-my-posh/poshthemes/themes.zip
sudo cp fedora-bliss.omp.json /usr/local/bin/oh-my-posh/poshthemes/themes/
echo 'eval "$(oh-my-posh --init --shell bash --config /usr/local/bin/oh-my-posh/poshthemes/themes/fedora-bliss.omp.json)"' >> ~/.bashrc
sudo echo 'eval "$(oh-my-posh --init --shell bash --config /usr/local/bin/oh-my-posh/poshthemes/themes/fedora-bliss.omp.json)"' >> /root/.bashrc
. ~/.bashrc
