#!/bin/bash
# Установка необходимых пакетов
sudo pacman -Syu --needed --noconfirm \
  bspwm sxhkd picom polybar rofi feh xorg xorg-xinit micro\
  lxappearance kitty librewolf spotify flameshot volantes-cursors \
  ttf-font-awesome noto-fonts-cjk xclip clipmenu dunst

# Создание структуры конфигов
mkdir -p ~/.config/{bspwm,kitty,sxhkd,polybar,picom,rofi}

# bspwmrc
cp -r wallpapers ~/Pictures/
cp .config/bspwm/bspwmrc ~/.config/bspwm/bspwmrc
chmod +x ~/.config/bspwm/bspwmrc

#kitty config
cp .config/kitty/kitty.conf ~/.config/kitty/kitty.conf

# picom.conf
cp .config/picom/picom.conf ~/.config/picom/picom.conf

# polybar launch
cp -r .config/polybar ~/.config/
chmod +x ~/.config/polybar/launch.sh
chmod +x ~/.config/polybar/spotify_status.sh

# rofi config
cp -r .config/rofi ~/.config/

# sxhkdrc
cp .config/sxhkd/sxhkdrc ~/.config/sxhkd/sxhkdrc

# scrypt change layout
cp /.config/change_layout.sh ~/.config/change_layout.sh
chmod +x ~/.config/change_layout.sh

echo "✅ Райс установлен! Перезайди в bspwm, чтобы увидеть результат."