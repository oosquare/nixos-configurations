#! /usr/bin/env -S zsh --no-rcs

# Usage: ./capture-screen.sh <COMMAND> <DIR>
# <COMMAND> can be `fullscreen`, `active`, `selection`.
# Screenshots are stored in <DIR>.

COMMAND=$1
SCREENSHOT_DIR=$2

function notify_result() {
    FULL_PATH=$1
    notify-send "Screenshot" "Copied and saved as $FULL_PATH" || true
}

function capture_fullscreen() {
    FILENAME="$(date +'%F-%H-%M-%S').png"
    grim "$SCREENSHOT_DIR/$FILENAME"
    cat "$SCREENSHOT_DIR/$FILENAME" | wl-copy
    notify_result "$SCREENSHOT_DIR/$FILENAME"
}

function capture_active() {
    case $XDG_CURRENT_DESKTOP in
        "Hyprland")
            POSITION=$(hyprctl -j activewindow | jq -r '"\(.at[0]),\(.at[1]) \(.size[0])x\(.size[1])"')
        ;;
        *)
            echo "$XDG_CURRENT_DESKTOP not supported yet"
            exit 1
        ;;
    esac
    FILENAME="$(date +'%F-%H-%M-%S').png"
    grim -g "$POSITION" "$SCREENSHOT_DIR/$FILENAME"
    cat "$SCREENSHOT_DIR/$FILENAME" | wl-copy
    notify_result "$SCREENSHOT_DIR/$FILENAME"
}

function capture_selection() {
    POSITION=$(slurp 2> /dev/null)

    if [[ $? != 0 ]]; then
        echo "Operation canceled"
        exit 0
    fi

    FILENAME="$(date +'%F-%H-%M-%S').png"
    grim -g "$POSITION" "$SCREENSHOT_DIR/$FILENAME"
    cat "$SCREENSHOT_DIR/$FILENAME" | wl-copy
    notify_result "$SCREENSHOT_DIR/$FILENAME"
}

function main() {
    if [[ ! -e $SCREENSHOT_DIR ]]; then
        mkdir $SCREENSHOT_DIR
    fi

    case $COMMAND in
        "fullscreen")
            capture_fullscreen
        ;;
        "active")
            capture_active
        ;;
        "selection")
            capture_selection
        ;;
        *)
            echo "Error: unknown command: \`$COMMAND\`"
            exit 1
        ;;
    esac
}

main
