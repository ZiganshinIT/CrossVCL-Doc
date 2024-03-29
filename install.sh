#!/bin/bash

echo "Updating the local package directory"
sudo apt update 
echo "Upgrading any outdated pacakges"
sudo apt full-upgrade -y
echo "Install new packages necessary for Delphi & FMXLinux"
sudo apt install joe python3 libpython3-dev wget p7zip-full curl libgtk-3-dev openssh-server build-essential zlib1g-dev libgtk-3-dev libcurl4-gnutls-dev libncurses5 xorg libgl1-mesa-dev libosmesa-dev libgtk-3-bin -y
echo "Install Open GL necessary packages"
sudo apt-get install freeglut3-dev libx11-dev libxmu-dev libxi-dev libgl1-mesa-glx libglu1-mesa libglu1-mesa-dev libglfw3-dev libgles2-mesa-dev
echo "Clean-up unused packages"
sudo apt autoremove -y
cd ~
echo "Downloading Linux PAServer for Alexandria 11.3 (22.0)"
wget https://altd.embarcadero.com/releases/studio/22.0/1131/LinuxPAServer22.0.tar.gz 
echo "Setting up directories to extract PA Server into"
mkdir PAServer
mkdir PAServer/22.0
rm PAServer/22.0/*
tar xvf LinuxPAServer22.0.tar.gz -C PAServer/22.0 --strip-components=1
# This fixes the Python 3.6 dependency
ln -sf `ls -1 /usr/lib/x86_64-linux-gnu/libpython3.*.so.1.0 | tail -1` ~/PAServer/22.0/lldb/lib/libpython3.so
rm LinuxPAServer22.0.tar.gz
echo \#\!\/bin\/bash >pa22.sh
echo # https://docwiki.embarcadero.com/RADStudio/en/Setting_Options_for_the_Platform_Assistant >>pa22.sh
echo ~/PAServer/22.0/paserver >>pa22.sh
chmod +x pa22.sh
echo "-----------------------------------"
echo " To launch PAServer type ~/pa22.sh"
echo "-----------------------------------"
# ~/pa22.sh

exit