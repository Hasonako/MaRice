#!/bin/bash

# Цвета и изображение
fg="#ffffff"
verify="#88c0d0"
wrong="#bf616a"
date="#d8dee9"

# Запуск i3lock
i3lock -n --force-clock \
  --indicator \
  --radius=20 \
  --ring-width=40 \
  --line-uses-inside \
  --pointer=default \
  --refresh-rate=0 \
  --pass-media-keys \
  --pass-volume-keys \
  \
  # Цвета круга
  --inside-color="$fg" \
  --ring-color="$fg" \
  --insidever-color="$verify" \
  --ringver-color="$verify" \
  --insidewrong-color="$wrong" \
  --ringwrong-color="$wrong" \
  --keyhl-color="$verify" \
  --separator-color="$verify" \
  --bshl-color="$verify" \
  \
  # Тексты и позиции
  --time-str="%H:%M" \
  --time-size=140 \
  --time-font="Fira Code:style=Bold" \
  --time-pos="650:540" \
  --time-color="$date" \
  \
  --date-str="%a, %d %b" \
  --date-size=45 \
  --date-font="Fira Code" \
  --date-pos="650:600" \
  --date-color="$date" \
  \
  --greeter-text="Type the password to Unlock" \
  --greeter-font="Fira Code" \
  --greeter-size=23 \
  --greeter-pos="650:930" \
  --greeter-color="$fg" \
  \
  --verif-text="Verifying Password..." \
  --verif-font="Fira Code" \
  --verif-size=23 \
  --verif-pos="650:970" \
  --verif-color="$verify" \
  \
  --wrong-text="Wrong Password!" \
  --wrong-font="Fira Code" \
  --wrong-size=23 \
  --wrong-pos="650:970" \
  --wrong-color="$wrong" \
  \
  --noinput-text="" \
  \
  # Позиция индикатора
  --ind-pos="650:760"
