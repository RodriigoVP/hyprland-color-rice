#!/bin/bash
WALLPAPER_PATH="$1"

if [ -z "$WALLPAPER_PATH" ]; then
    echo "No se proporcionó una ruta de fondo de pantalla."
    exit 1
fi

HYPRPAPER_CONF="$HOME/.config/hypr/hyprpaper.conf"

echo "Ejecutando Pywal en: $WALLPAPER_PATH" > /tmp/wal-hook.log
wal -i "$WALLPAPER_PATH" -n -q
echo "Pywal finalizado." >> /tmp/wal-hook.log

# Actualizar hyprpaper.conf
{
    echo "preload = $WALLPAPER_PATH"
    echo "wallpaper = ,$WALLPAPER_PATH"
} > "$HYPRPAPER_CONF"

echo "hyprpaper.conf actualizado con $WALLPAPER_PATH" >> /tmp/wal-hook.log

exit 0
