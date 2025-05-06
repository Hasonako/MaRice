#!/bin/bash

# Установка необходимых пакетов
sudo pacman -Syu --needed --noconfirm \
  bspwm sxhkd picom polybar rofi feh xorg xorg-xinit ttf-font-awesome \
  lxappearance kitty librewolf

# Создание структуры конфигов
mkdir -p ~/.config/{bspwm,sxhkd,picom,polybar,rofi}

# bspwmrc
cat << 'EOF' > ~/.config/bspwm/bspwmrc
#!/bin/bash
sxhkd &
picom --config ~/.config/picom/picom.conf &
~/.config/polybar/launch.sh &
feh --bg-scale ~/Pictures/wallpapers/default.jpg
bspc monitor -d I II III IV V VI VII VIII IX X
EOF
chmod +x ~/.config/bspwm/bspwmrc

# sxhkdrc
cat << 'EOF' > ~/.config/sxhkd/sxhkdrc
super + Enter
    kitty
super + Escape
    rofi -show drun
super + {1-9}
    bspc desktop -f ^{1-9}
super + b
    librewolf
super + shift + q
    bspc quit
EOF

# picom.conf
cat << 'EOF' > ~/.config/picom/picom.conf
backend = "glx";
vsync = true;

shadow = true;
shadow-radius = 10;
shadow-opacity = 0.5;
shadow-offset-x = -7;
shadow-offset-y = -7;

fading = true;
fade-delta = 4;
fade-in-step = 0.03;
fade-out-step = 0.03;

opacity-rule = [
  "90:class_g = 'Rofi'",
  "90:class_g = 'Kitty'",
  "80:class_g = 'Thunar'"
];

corner-radius = 8;
EOF

# polybar launch
cat << 'EOF' > ~/.config/polybar/launch.sh
#!/bin/bash
killall -q polybar
while pgrep -x polybar >/dev/null; do sleep 1; done
polybar example &
EOF
chmod +x ~/.config/polybar/launch.sh

# polybar config (очень базовый)
cat << 'EOF' > ~/.config/polybar/config
[bar/example]
width = 100%
height = 28
modules-left = date
[module/date]
type = internal/date
format = %Y-%m-%d %H:%M
EOF

# rofi config
mkdir -p ~/.config/rofi
cat << 'EOF' > ~/.config/rofi/config.rasi
configuration {
    modi: "drun";
    show-icons: true;
}
EOF

echo "✅ Минимальный райс установлен! Перезайди в bspwm, чтобы увидеть результат."