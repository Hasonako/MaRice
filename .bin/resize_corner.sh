#!/bin/bash

# Получим координаты курсора
eval $(xdotool getmouselocation --shell)

# Получим размеры экрана (монитора)
SCREEN_WIDTH=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d'x' -f1)
SCREEN_HEIGHT=$(xdpyinfo | awk '/dimensions:/ {print $2}' | cut -d'x' -f2)

# Пороговое значение для определения "угла"
threshold=50

# Проверим, находится ли курсор в верхнем левом углу
if [ "$X" -lt "$threshold" ] && [ "$Y" -lt "$threshold" ]; then
    bspc node -z left -200 0
    bspc node -z up 0 -200
elif [ "$X" -gt "$((SCREEN_WIDTH - threshold))" ] && [ "$Y" -lt "$threshold" ]; then
    bspc node -z right -200 0
    bspc node -z up 0 -200
elif [ "$X" -lt "$threshold" ] && [ "$Y" -gt "$((SCREEN_HEIGHT - threshold))" ]; then
    bspc node -z left -200 0
    bspc node -z down 0 -200
elif [ "$X" -gt "$((SCREEN_WIDTH - threshold))" ] && [ "$Y" -gt "$((SCREEN_HEIGHT - threshold))" ]; then
    bspc node -z right -200 0
    bspc node -z down 0 -200
fi
