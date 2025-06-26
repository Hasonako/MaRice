#!/bin/bash

# Сделать окно плавающим
bspc node -t floating

# Получить координаты курсора
eval $(xdotool getmouselocation --shell)

# Сделать окно маленьким
bspc node -v -400 -300

# Переместить его к месту курсора
bspc node -v $((X - 200)) $((Y - 150))

# Запустить перетаскивание
xdotool windowmove $(xdotool getactivewindow) $X $Y
