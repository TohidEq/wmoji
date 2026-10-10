# Wmoji

Minimal emoji picker for Wayland using `wmenu`.

Search, select, and copy emojis to your clipboard.

<img src="assets/wmoji-ss.png" alt="alt text" width="900">


## Usage

Run `wmoji`, search for an emoji, and press Enter to copy it.

## Custom Items

Edit `~/.config/wmoji/custom-items.txt`.

Each line contains a value and space-separated keywords:

```text
HIII :D ;; hello hi greetings
(T_T) ;; cry crying aaaaaa
test item blah blah ;; test item for nothing
```

## Configuration

Edit `~/.config/wmoji/wmoji.conf`.

```sh
DATA_SEPARATOR=';;'
DISPLAY_SEPARATOR=''

# wmenu appearance
WMENU_NORMAL_BG='000000ff'
WMENU_NORMAL_FG='ffffffff'
WMENU_SELECTED_FG='ffffffff'
WMENU_SELECTED_BG='000000ff'
WMENU_MATCH_BG='000000ff'
WMENU_MATCH_FG='999999ff'

# wmenu behavior
WMENU_PROMPT='wmoji >'
WMENU_LINES=39
WMENU_FONT='JetBriansMono NF 12'
WMENU_CASE_INSENSITIVE=true
```

Unspecified options use their default values.

## Dependencies

* `wmenu`
* `curl`
* `jq`
* `wl-copy`
* `notify-send`
