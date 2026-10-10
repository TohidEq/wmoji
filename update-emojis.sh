#!/bin/sh
set -eu


config_file="${XDG_CONFIG_HOME:-$HOME/.config}/wmoji/wmoji.conf"

[ -f "$config_file" ] && . "$config_file"

DATA_SEPARATOR="${DATA_SEPARATOR:-;;}"
DISPLAY_SEPARATOR="${DISPLAY_SEPARATOR:-}"






notify-send "Wmoji $DISPLAY_SEPARATOR Update Emojies" "Almost done..."

cache_dir="${XDG_CACHE_HOME:-$HOME/.cache}/wmoji"
url="https://raw.githubusercontent.com/muan/emojilib/v3.0.12/dist/emoji-en-US.json"

mkdir -p "$cache_dir"

json_tmp=$(mktemp)
output_tmp=$(mktemp "$cache_dir/emojis.XXXXXX")

cleanup() {
    rm -f "$json_tmp" "$output_tmp"
}

trap cleanup 0
trap 'exit 1' HUP INT TERM

if ! curl -fsSL "$url" -o "$json_tmp"; then
    notify-send -u critical "Wmoji $DISPLAY_SEPARATOR Update Emojies" \
        "Failed to download emoji database. Check your internet connection."
    exit 1
fi

jq -r --arg sep "$DATA_SEPARATOR" '
    to_entries[]
    | "\(.key) \($sep) \(.value | join(" ") | gsub("_"; " "))"
' "$json_tmp" > "$output_tmp"

mv "$output_tmp" "$cache_dir/emojis.txt"

#printf '%s\n' "wmoji: Emoji database updated." >&2
notify-send "Wmoji $DISPLAY_SEPARATOR Update Emojies" "Emoji database updated."
