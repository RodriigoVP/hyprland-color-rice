#!/bin/bash
# Make and move dirs

copy_folders() {
    local f_names=(
        wal kitty fastfetch waybar wlogout wofi gtk-3.0 gtk-4.0 scripts waypaper hypr
    )

local failed=()

for folder in "${f_names[@]}"; do
    if
        rm -rf "$HOME/.config/$folder"
        mkdir -p "$HOME/.config/$folder" &&
        cp -a config/$folder "$HOME/.config";
        then
            echo "Copiado exitosamente: $folder"
    else
        echo "Fallo al instalar $folder"
    fi
done
}

#Config commands
copy_folders
wal -i wallpaper.jpg
chmod +x "$HOME/.config/scripts/lock.sh"
chmod +x "$HOME/.config/scripts/wal-hook.sh"
chmod +x "$HOME/.config/scripts/switch_colors.sh"

gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
gsettings set org.nemo.desktop show-desktop-icons false
gsettings set org.cinnamon.desktop.default-applications.terminal exec 'kitty'
