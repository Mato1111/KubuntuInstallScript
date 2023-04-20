#!/bin/bash
clear
echo "This is the MatOS Post-Install script for Kubuntu!"
echo "Please install Black Box first, then continue the script."
echo "If the system restarts, just run the script again."
sudo apt install nala -y
sudo nala fetch --auto --fetches 4 -c US -c CA --https-only -y
sudo nala upgrade -y
sudo nala install neofetch htop latte-dock wget curl flatpak -y
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo snap remove Firefox
sudo flatpak install Discordapp Discord-screen Bottles com.opera.Opera app/org.mozilla.firefox/x86_64/stable app/com.valvesoftware.Steam/x86_64/stable -y --noninteractive

curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin
betterdiscordctl --d-install flatpak install
latte-dock
cd ~/Desktop
wget https://raw.githubusercontent.com/Mato1111/KubuntuInstallScript/main/Default_-_2.layout.latte
mv main/Default_-_2.layout.latte.1 main/Default_-_2.layout.latte

clear
neofetch
echo "



"
echo "Set-up complete!"
