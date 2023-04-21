 #!/bin/bash
clear
echo "This is the MatOS Post-Install script for Kubuntu!"
echo "Please install Black Box first, then continue the script."
echo "If the system restarts, just run the script again."
echo"
Please install these Plasma widgets after the running the script, but before applying the Latte Dock layout: Latte Separator, Latte Spacer, Window Title Applet, Better Inline Clock
"

sudo apt install nala -y
sudo nala fetch --auto --fetches 4 -c US -c CA --https-only -y

sudo add-apt-repository ppa:deadsnakes/ppa
sudo add-apt-repository ppa:papirus/papirus

sudo nala upgrade -y

sudo nala install neofetch htop latte-dock wget curl flatpak qt5-style-kvantum qt5-style-kvantum-themes -y
sudo nala install build-essential libvulkan-dev plasma-workspace-dev gstreamer1.0-libav \
liblz4-dev libmpv-dev python3-websockets qtbase5-private-dev \
libqt5x11extras5-dev \
qml-module-qtwebchannel qml-module-qtwebsockets cmake -y
sudo nala install libncursesw5-dev libssl-dev \
libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev python3.11 -y

sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
sudo snap remove firefox
sudo flatpak install Discordapp Discord-screen Bottles pupgui2 flatseal com.opera.Opera app/org.mozilla.firefox/x86_64/stable -y --noninteractive

curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin
betterdiscordctl --d-install flatpak install

xdg-settings set default-web-browser opera.desktop

# Wallpaper Engine Plugin (https://github.com/catsout/wallpaper-engine-kde-plugin)
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
latte-dock
xdg-open https://store.steampowered.com/about/
xdg-open https://store.kde.org/p/1325246/

clear
neofetch
echo "
"
echo "Set-up complete! Please restart the computer."
