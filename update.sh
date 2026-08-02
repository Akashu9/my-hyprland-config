#!/bin/bash

# Type folder names that you want to copy in to ~/.config/
array=("hypr" "waybar" "kitty" "yazi") #"gtk-3.0" "gtk-4.0"
echo "Number of elements: ${#array[@]}"

for element in "${array[@]}"; do
  echo "making backup of $element in ~/.config/$element/.backup/"
  mkdir -p ~/.config/$element/.backup

  #delete older
  rm ~/.config/$element/.backup/*
  mv ~/.config/$element/*.* ~/.config/$element/.backup/

  echo "copying $element into ~/.config/$element/"
  cp ./$element/*.* ~/.config/$element/
done

echo "${array[@]}"

killall -9 waybar
pkill hypridle
pkill hyprpaper

sleep 2

hyprctl reload

waybar &
hypridle &
hyprpaper &
exit
