#!/bin/sh

# Загрузка Xresources (цвета, курсор)
[[ -f ~/.Xresources ]] && xrdb -merge ~/.Xresources
[ -f ~/.xprofile ] && . ~/.xprofile

# Установка курсора на root window (рабочем столе)
xsetroot -cursor_name left_ptr &

# Задержка запуска bspwm, чтобы курсор успел примениться
sleep 0.2

# Запуск композитора (если установлен)
picom --experimental-backends &

# Запуск панели (если используешь)
polybar example &

# Старт оконного менеджера
exec bspwm