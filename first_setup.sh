#!/bin/sh
echo "Setting Display"
xrandr --output DVI-I-1 --mode 1920x1080 --scale 2x2 --pos 3840x120 --rotate left --output DP-1 --off --output DP-2 --off --output HDMI-1 --primary --mode 3840x2160 --pos 0x0 --rotate normal --output DP-3 --off
echo "Display Set."
echo
echo -"Installing Software..."
echo
pamac install firefox
echo
echo "Installing Software... firefox installed"
pamac install nautilus
echo
echo "Installing Software... nautilus installed"
pamac install nautilus
echo
echo "Installing Software... nautilus installed"
pamac install texlive-most
echo
echo "Installing Software... TeX installed"
pamac install biber
echo
echo "Installing Software... BibLaTex installed"
pamac install owncloud-client
echo
echo "Installing Software... ownCloud installed"
echo
pamac install keepassxc
echo
echo "Installing Software... KeePass installed"
echo
pamac install texstudio 
echo
echo "Installing Software... TeXStudio installed"
echo
pamac install zathura-pdf-mupdf
echo
echo "Installing Software... Zathura installed"
echo


echo "Loading Xresources..."
sudo cat .Xresources > ~/.Xresources
xrdb ~/.Xresources

echo "Loading i3 Config..."
sudo cat /.i3/config > ~/.i3/config

echo
echo "Xresources Loaded. Terminal font size changed."

read -p "Reboot? (y/n)" choice
case "$choice" in 
  y|Y ) reboot;;
  n|N ) echo "Remember to reboot soon.";;
  * ) echo "invalid";;
esac



