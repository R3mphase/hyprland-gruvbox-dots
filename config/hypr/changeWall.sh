#!/bin/bash

nohup hyprpaper  >/dev/null 2>&1 &
cd $HOME/.config/hypr/wallpapers
echo "Change the wallpaper to:"
ls
read wallpaper

if [[ -f "$HOME/.config/hypr/wallpapers/$wallpaper" ]]; then
    cp $wallpaper $HOME/.config/hypr/current.png
fi

sleep 0.2

pkill hyprpaper 2>/dev/null
nohup hyprpaper >/dev/null 2>&1 &

sleep 0.2
