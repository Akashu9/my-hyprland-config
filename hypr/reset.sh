#!/bin/bash

killall -9 waybar
pkill hypridle
pkill hyprpaper

sleep 1

hyprctl reload

waybar &
hypridle &
hyprpaper &
