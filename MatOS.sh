#!/bin/bash
clear
echo "This is the MatOS Post-Install script for Kubuntu!"
echo "Please install Black Box first, then continue the script."
echo "If the system restarts, just run the script again."
sudo apt install nala -y
sudo nala fetch --auto --fetches 4 -c US -c CA --https-only -y
sudo nala upgrade -y
sudo nala install neofetch htop latte-dock wget curl flatpak -y
sudo nala install build-essential libvulkan-dev plasma-workspace-dev gstreamer1.0-libav \
liblz4-dev libmpv-dev python3-websockets qtbase5-private-dev \
libqt5x11extras5-dev \
qml-module-qtwebchannel qml-module-qtwebsockets cmake -y
sudo nala install libncursesw5-dev libssl-dev \
libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev -y
sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt install python3.11

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo snap remove Firefox
sudo flatpak install Discordapp Discord-screen Bottles com.opera.Opera app/org.mozilla.firefox/x86_64/stable -y --noninteractive

curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin
betterdiscordctl --d-install flatpak install

cd ~/
# Download source
git clone https://github.com/catsout/wallpaper-engine-kde-plugin.git
cd wallpaper-engine-kde-plugin

# Download submodule (glslang)
git submodule update --init

# Configure
# 'USE_PLASMAPKG=ON': using plasmapkg2 tool to install plugin
mkdir build && cd build
cmake .. -DUSE_PLASMAPKG=ON

# Build
make -j$nproc

# Install package (ignore if USE_PLASMAPKG=OFF for system-wide installation)
make install_pkg
# install lib
sudo make install

cd ~/Desktop
wget https://raw.githubusercontent.com/Mato1111/KubuntuInstallScript/main/Default_-_2.layout.latte
mv main/Default_-_2.layout.latte.1 main/Default_-_2.layout.latte
latte-dock

clear
neofetch
echo "



"
echo "Set-up complete! Please restart the computer."
