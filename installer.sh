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
sudo pacman -S --noconfirm --needed rofi feh xorg xorg-xinit xorg-xinput $DRI xmonad
fc-cache -f
clear

# install main packeges
sudo pacman -S --noconfirm --needed \
	bspwm sxhkd picom polybar micro papirus-icon-theme thunar gvfs xsettingsd gnome-themes-extra \
  	lxappearance kitty flameshot ttf-jetbrains-mono-nerd noto-fonts-cjk noto-fonts-emoji xclip clipmenu dunst \
  	pipewire pipewire-alsa pipewire-pulse pipewire-jack \
  	wireplumber alsa-utils pavucontrol || echo "Ошибка установки пакетов"

if ! command -v aur &> /dev/null
then
    echo "It seems that you don't have aur installed, I'll install that for you before continuing."
	git clone https://aur.archlinux.org/aur.git ~/.config/aur
	(cd ~/.config/aur/ && makepkg -si )
fi

# AUR пакеты
yay -S --needed --noconfirm --answerdiff=None --answerclean=None --answeredit=None --answerupgrade=None \
 librewolf spotify i3lock-color bibata-cursor-theme || echo "Ошибка установки AUR пакетов"

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
