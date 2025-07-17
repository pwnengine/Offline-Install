#!/bin/bash
#
# tFLPCp-install.sh
# Installs lots of useful FOSS packages & flatpaks after installing Linux Mint
# the FREE Linux PC project
# Noah Cooley, Lee McKenna
# Version 2025-07-13 3:04pm - Lee categorized pakages, added flatpak installs, removed unecessary code,
#                             changed apt cleanup routine.
# Version 2025-07-12 6:51pm - Noah created first install.sh draft
#
# Exit on critical errors
set -e

packages=(
    # Accessories
    "gnome-calculator"
    "plank"
    "shutter"

    # Education
    "klavaro"
    "scratch"
    "stellarium"
    "tuxmath"
    "tuxpaint"
    "tuxtype"
    
    # Games
    "amoebax"
    "armagetronad"
    "blockout2"
    "burgerspace"
    "cuyo"
    "enigma"
    "epiphany"
    "extremetuxracer"
    "flight-of-the-amazon-queen"
    "flobopuyo"
    "frogatto"
    "frozen-bubble"
    "gnome-mahjongg"
    "gnome-mines"
    "gnome-sudoku"
    "gnubg"
    "gtetrinet"
    "gweled"
    "hedgewars"
    "kapman"
    "kbounce"
    "kmines"
    "kpat"
    "ksudoku"
    "ktuberling"
    "maelstrom"
    "neverball"
    "neverputt"
    "palapeli"
    "pinball"
    "pingus"
    "pychess"
    "pysolfc"
    "quadrapassel"
    "ri-li"
    "stella"
    "supertux"
    "supertuxkart"

    # Graphics
    "blender"
    "darktable"
    "gimp"
    "gimp-help-en"
    "inkscape"
    "shotwell"
 
    # Internet
    "google-earth-pro-stable"
  
    # Office
    "calibre"
    "gnucash"
    "libreoffice-base"
    "okular"
    "pdfarranger"
    "vym"

    # Programming
    "scratch"
    "sublime-text"
    
    # Science
    "avogadro"
    "libreoffice-math"
   
    # Sound & Video
    "handbrake"
    "audacity"
    "cheese"
    "handbrake"
    "vlc"
)

flatpaks=(
    #Discord, Telegram, Shortwave, Bitwig Studio, OBS Studio, 0 A.D
    "com.discordapp.Discord"
    "org.telegram.desktop"
    "de.haeckerfelix.Shortwave"
    "com.bitwig.BitwigStudio"
    "com.obsproject.Studio"
    "com.play0ad.zeroad"
)

# Update package list
echo "Updating package list..."
sudo apt update

# Install packages via apt
for package in "${packages[@]}"; do
    echo "Attempting to install $package via apt..."
    if sudo apt install -y "$package"; then
        echo "$package installed successfully."
    else
        echo "Failed to install $package via apt."
    fi
done

for flatpak in "${flatpaks[@]}"; do
    echo "Attempting to install $flatpak via flatpak..."
    if sudo flatpak install -y "$flatpak"; then
        echo "$flatpak installed successfully."
    else
        echo "Failed to install $flatpak via flatpak."
    fi
done

# Clean up apt cache to save space
echo "Cleaning up apt cache..."
sudo apt autoremove && sudo apt clean

echo "Installation process completed. Check above for any errors."
