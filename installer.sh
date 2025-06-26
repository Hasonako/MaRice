#!/bin/env bash
set -e

echo "Welcome!" && sleep 2

echo "Doing a system update.."
sudo pacman --noconfirm -Syu

# install base-devel if not installed
sudo pacman -S --noconfirm --needed base-devel wget git

# choose video driver
echo "1) xf86-video-intel 	2) xf86-video-amdgpu 3) nvidia 4) Skip"
read -r -p "Choose you video card driver(default 4)(will not re-install): " vid

case $vid in 
[1])
	DRI='xf86-video-intel'
	;;

[2])
	DRI='xf86-video-amdgpu'
	;;

[3])
    DRI='nvidia nvidia-settings nvidia-utils'
    ;;

[4])
	DRI=""
	;;
[*])
	DRI=""
	;;
esac

# install xorg if not installed
sudo pacman -S --noconfirm --needed rofi feh xorg xorg-xinit xorg-xinput $DRI
fc-cache -f
clear

# install main packeges
sudo pacman -S --noconfirm --needed $(cat packages.txt) || echo "Ошибка установки пакетов"

if ! command -v yay &> /dev/null; then
    echo "Installing yay..."
    git clone https://aur.archlinux.org/yay.git /tmp/yay
    cd /tmp/yay && makepkg -si --noconfirm
    cd -
fi

# AUR пакеты
yay -S --needed --noconfirm --answerdiff=None --answerclean=None --answeredit=None --answerupgrade=None \
 $(cat packages.txt) || echo "Ошибка установки AUR пакетов"

mkdir -p ~/.config ~/.bin ~/Pictures
cp -r .config ~/ || echo "Ошибка копирования конфига"
cp -r Wallpapers ~/Pictures/ || echo "Ошибка копирования обоев"

chmod +x ~/.config/bspwm/bspwmrc || echo "Ошибка назначения прав bspwmrc"
chmod +x ~/.config/polybar/launch.sh || echo "Ошибка назначения прав polybar launch.sh"
chmod +x ~/.config/polybar/spotify_status.sh || echo "Ошибка назначения прав polybar spotify_status.sh"

cp .xinitrc .xprofile .Xresources ~/
chmod +x ~/.xinitrc
chmod +x ~/.xprofile
chmod +x ~/.Xresources

cp -r .bin ~/ || echo "Ошибка копирования bin"
chmod +x ~/.bin/*.sh || echo "Ошибка назначения прав в bin"
echo "✅ Rice installed!"
