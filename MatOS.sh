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

sudo add-apt-repository ppa:deadsnakes/ppa -y
sudo add-apt-repository ppa:papirus/papirus -y
sudo add-apt-repository ppa:kubuntu-ppa/backports -y

sudo nala upgrade -y

# Shit ton of apt packages that are mostly dependencies.
sudo nala install neofetch htop wget curl flatpak qt5-style-kvantum qt5-style-kvantum-themes -y
sudo nala install build-essential libvulkan-dev plasma-workspace-dev gstreamer1.0-libav \
liblz4-dev libmpv-dev python3-websockets qtbase5-private-dev \
libqt5x11extras5-dev \
qml-module-qtwebchannel qml-module-qtwebsockets cmake -y
sudo nala install libncursesw5-dev libssl-dev \
libsqlite3-dev tk-dev libgdbm-dev libc6-dev libbz2-dev libffi-dev zlib1g-dev python3.11 -y
sudo nala install extra-cmake-modules qtdeclarative5-dev libqt5x11extras5-dev libkf5iconthemes-dev libkf5plasma-dev libkf5windowsystem-dev libkf5declarative-dev libkf5xmlgui-dev libkf5activities-dev build-essential libxcb-util-dev libkf5wayland-dev git gettext libkf5archive-dev libkf5notifications-dev libxcb-util0-dev libsm-dev libkf5crash-dev libkf5newstuff-dev libxcb-shape0-dev libxcb-randr0-dev libx11-dev libx11-xcb-dev kirigami2-dev libwayland-dev libwayland-client0 plasma-wayland-protocols libqt5waylandclient5-dev qtwayland5-dev-tools -y


sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo -y
sudo snap remove firefox -y
sudo flatpak install app/com.raggesilver.BlackBox/x86_64/stable Discordapp Discord-screen Bottles pupgui2 flatseal com.opera.Opera app/org.mozilla.firefox/x86_64/stable -y --noninteractive

curl -O https://raw.githubusercontent.com/bb010g/betterdiscordctl/master/betterdiscordctl
chmod +x betterdiscordctl
sudo mv betterdiscordctl /usr/local/bin
betterdiscordctl --d-install flatpak install

xdg-settings set default-web-browser opera.desktop


# Wallpaper Engine Plugin (https://github.com/catsout/wallpaper-engine-kde-plugin)
cd
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


# Latte Dock
cd
git clone https://github.com/KDE/latte-dock
cd ~/latte-dock/
bash install

cd ~/Desktop
wget https://github.com/Mato1111/KubuntuInstallScript/blob/main/Latte-Layout.latte
xdg-open https://store.steampowered.com/about/
xdg-open https://store.kde.org/p/1325246/

clear
neofetch
echo "
"
echo "Set-up complete! Please restart the computer. Start Latte Dock after. Remember to install the widgets before applying the layout."
