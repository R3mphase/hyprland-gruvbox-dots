#!/bin/bash

# INSTALL SCRIPT

# Variables
configDir="$HOME/.config"
iconsDir="$HOME/.icons"
themesDir="$HOME/.themes"
fontsDir="$HOME/.local/share/fonts"
workingDir=$(pwd)
# Colors
ENDCOLOR="\e[0m"
RED="\e[31m"
GREEN="\e[32m"
CYAN="\e[36m"

set -e

# Dependencies:
# rofi mako waybar fastfetch kitty hyprpaper nwg-look wlogout pavucontrol blueman-manager htop thunar zen-browser grim slurp
# JetbrainsMono Nerd Font

echo -e "${CYAN}Do you want to delete install files after installing?${ENDCOLOR} (${GREEN}Y${ENDCOLOR}/n)"
read delete

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip

# Select to move / copy the install files
if [[ -z "$delete" || "$delete" == "y" || "$delete" == "Y" ]]; then
	# ----- Move .config files -----
	if [ ! -d "$configDir" ]; then
		echo -e "${CYAN}Creating .config directory${ENDCOLOR}"
		mkdir "$configDir"
		echo -e "${GREEN}Done!${ENDCOLOR}"
	fi

	echo -e "${CYAN}Moving config files...${ENDCOLOR}"
	mv "$workingDir/config/config.zip" "$configDir/"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Unziping config files...${ENDCOLOR}"
	unzip "$configDir/config.zip" -d "$configDir"
	rm "$configDir/config.zip"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	# ----- Move .icons files -----
	if [ ! -d "$iconsDir" ]; then
		echo -e "${CYAN}Creating .icons directory${ENDCOLOR}"
		mkdir "$iconsDir"
		echo -e "${GREEN}Done!${ENDCOLOR}"
	fi

	echo -e "${CYAN}Moving icons and cursors...${ENDCOLOR}"
	mv "$workingDir/icons/capitaine-cursors.zip" "$iconsDir/"
	mv "$workingDir/icons/folders-color-chooser.sh" "$iconsDir/"
	mv "$workingDir/icons/gruvbox-plus.tar.gz" "$iconsDir/"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Unziping all icons and cursors...${ENDCOLOR}"
	unzip "$iconsDir/capitaine-cursors.zip" -d "$iconsDir"
	tar -xzf "$iconsDir/gruvbox-plus.tar.gz" -C "$iconsDir"
	rm "$iconsDir/capitaine-cursors.zip"
	rm "$iconsDir/gruvbox-plus.tar.gz"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	# ----- Move .themes files -----
	if [ ! -d "$themesDir" ]; then
		echo -e "${CYAN}Creating .themes directory${ENDCOLOR}"
		mkdir "$themesDir"
		echo -e "${GREEN}Done!${ENDCOLOR}"
	fi

	echo -e "${CYAN}Moving GTK themes...${ENDCOLOR}"
	mv "$workingDir/themes/gruvbox-dark.tar.xz" "$themesDir/"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Unziping GTK themes...${ENDCOLOR}"
	tar -xJf "$themesDir/gruvbox-dark.tar.xz" -C "$themesDir"
	rm "$themesDir/gruvbox-dark.tar.xz"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	# ----- Move fonts -----
	if [ ! -d "$fontsDir" ]; then
		echo -e "${CYAN}Creating .local/share/fonts directory${ENDCOLOR}"
		mkdir "$fontsDir"
		echo -e "${GREEN}Done!${ENDCOLOR}"
	fi

	echo -e "${CYAN}Moving fonts...${ENDCOLOR}"
	mv "$workingDir/JetBrainsMono.zip" "$fontsDir/"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Unziping fonts...${ENDCOLOR}"
	unzip "$fontsDir/JetBrainsMono.zip" -d "$fontsDir"
	rm "$fontsDir/JetBrainsMono.zip"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Everything has been ${GREEN}moved${CYAN}!${ENDCOLOR}"
else
	# ----- Copy .config files -----
	if [ ! -d "$configDir" ]; then
		echo -e "${CYAN}Creating .config directory${ENDCOLOR}"
		mkdir "$configDir"
		echo -e "${GREEN}Done!${ENDCOLOR}"
	fi

	echo -e "${CYAN}Copying config files...${ENDCOLOR}"
	cp "$workingDir/config/config.zip" "$configDir/"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Unziping config files...${ENDCOLOR}"
	unzip "$configDir/config.zip" -d "$configDir"
	rm "$configDir/config.zip"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	# ----- Copy .icons files -----
	if [ ! -d "$iconsDir" ]; then
		echo -e "${CYAN}Creating .icons directory${ENDCOLOR}"
		mkdir "$iconsDir"
		echo -e "${GREEN}Done!${ENDCOLOR}"
	fi

	echo -e "${CYAN}Copying icons and cursors...${ENDCOLOR}"
	cp "$workingDir/icons/capitaine-cursors.zip" "$iconsDir/"
	cp "$workingDir/icons/folders-color-chooser.sh" "$iconsDir/"
	cp "$workingDir/icons/gruvbox-plus.tar.gz" "$iconsDir/"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Unziping all icons and cursors...${ENDCOLOR}"
	unzip "$iconsDir/capitaine-cursors.zip" -d "$iconsDir"
	tar -xzf "$iconsDir/gruvbox-plus.tar.gz" -C "$iconsDir"
	rm "$iconsDir/capitaine-cursors.zip"
	rm "$iconsDir/gruvbox-plus.tar.gz"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	# ----- Copy .themes files -----
	if [ ! -d "$themesDir" ]; then
		echo -e "${CYAN}Creating .themes directory${ENDCOLOR}"
		mkdir "$themesDir"
		echo -e "${GREEN}Done!${ENDCOLOR}"
	fi

	echo -e "${CYAN}Copying GTK themes..."
	cp "$workingDir/themes/gruvbox-dark.tar.xz" "$themesDir/"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Unziping GTK themes...${ENDCOLOR}"
	tar -xJf "$themesDir/gruvbox-dark.tar.xz" -C "$themesDir"
	rm "$themesDir/gruvbox-dark.tar.xz"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	# ----- Copy fonts -----
	if [ ! -d "$fontsDir" ]; then
		echo -e "${CYAN}Creating .local/share/fonts directory${ENDCOLOR}"
		mkdir "$fontsDir"
		echo -e "${GREEN}Done!${ENDCOLOR}"
	fi

	echo -e "${CYAN}Copying fonts...${ENDCOLOR}"
	cp "$workingDir/JetBrainsMono.zip" "$fontsDir/"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Unziping fonts...${ENDCOLOR}"
	unzip "$fontsDir/JetBrainsMono.zip" -d "$fontsDir"
	rm "$fontsDir/JetBrainsMono.zip"
	echo -e "${GREEN}Done!${ENDCOLOR}"

	echo -e "${CYAN}Everything has been ${GREEN}copied${CYAN}!${ENDCOLOR}"
fi

echo -e "${CYAN}Starting nwg-look; Set gtk themes, cursor and icons${ENDCOLOR}"
nwg-look
echo -e "${CYAN}Please ${RED}logout${CYAN} for the theme to apply!${ENDCOLOR}"
