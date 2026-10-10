#!/bin/sh
set -eu


config_file="${XDG_CONFIG_HOME:-$HOME/.config}/wmoji/wmoji.conf"

[ -f "$config_file" ] && . "$config_file"

DATA_SEPARATOR="${DATA_SEPARATOR:-;;}"
DISPLAY_SEPARATOR="${DISPLAY_SEPARATOR:-}"



notify-send "Wmoji $DISPLAY_SEPARATOR Building Items" "Almost done..."

config_dir="${XDG_CONFIG_HOME:-$HOME/.config}/wmoji"
cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/wmoji"

custom_file="$config_dir/custom-items.txt"
emoji_file="$cache_dir/emojis.txt"
items_file="$cache_dir/items.txt"

mkdir -p "$config_dir" "$cache_dir"
touch "$custom_file"

output_tmp=$(mktemp "$cache_dir/items.XXXXXX")

cleanup() {
    rm -f "$output_tmp"
}

trap cleanup 0
trap 'exit 1' HUP INT TERM

{
    printf '%s\n' \
        "Custom Items $DATA_SEPARATOR WMOJI: Edit Custom Items" \
        "Update Emojis $DATA_SEPARATOR WMOJI: Update from database"
    cat "$custom_file"

    if [ -f "$emoji_file" ]; then
        cat "$emoji_file"
    fi
} > "$output_tmp"

mv "$output_tmp" "$items_file"

notify-send "Wmoji $DISPLAY_SEPARATOR Building Items" "Done! ^_^ "
