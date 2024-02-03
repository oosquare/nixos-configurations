#! /usr/bin/env -S zsh --no-rcs

# This script will take a slice of a string which contains information of 
# a song played now based on the current position.


# Generate a JSON string expected by Waybar
# See also https://github.com/Alexays/Waybar/wiki/Module:-Custom
function generate_json() {
    TEXT=$1
    ALT=$2
    TOOLTIP=$3
    echo -E '{"text":"'$TEXT'","alt":"'$ALT'","tooltip":"'$TOOLTIP'"}'
}

# Generate the value corresponding to "alt" in the final result
function generate_alt() {
    STATUS=$1

    case $STATUS in
        'Playing') echo 'playing' ;;
        'Paused') echo 'paused' ;;
        'Stopped') echo 'stopped' ;;
    esac
}

# Generate the value corresponding to "tooltip" in the final result
function generate_tooltip() {
    PLAYER=$1
    STATUS=$2
    SONG_INFO=$(playerctl metadata --format 'Title: {{title}}\nArtist: {{artist}}\nAlbum: {{album}}\nPosition: {{duration(position)}}/{{duration(mpris:length)}}')
    echo -E 'Player: '$PLAYER'\nStatus: '$STATUS'\n\n'$SONG_INFO
}

# Take a slice of the title
function get_slice() {
    SLICE_LEN=20
    RAW_TEXT=$1
    # 0 may cause invalid index
    POSITION=$(( $2 > 0 ? $2 : 1 ))
    LEN=${#RAW_TEXT}
    # Create a buffer which is convenient for getting a slice in a ring
    SPACING=$(repeat $(( $SLICE_LEN )) echo -n ' ')
    BUFFER=$RAW_TEXT$SPACING$RAW_TEXT$SPACING$RAW_TEXT$SPACING
    INDEX=$(( ($POSITION - 1) % ($LEN + $SLICE_LEN) + 1 ))
    echo -E "${BUFFER:$INDEX:$SLICE_LEN}"
}

function main() {
    STATUS=$(playerctl status)
    PLAYER=$(playerctl metadata --format '{{playerName}}' || echo 'None')
    
    # Check if the player is stopped
    if [[ $STATUS == 'Stopped' ]]; then
        echo -E $(generate_json 'Stopped' 'stopped' 'Player: '$PLAYER'\nStatus: Stopped')
        exit 0
    fi
    
    RAW_TEXT=$(playerctl metadata --format '{{artist}} - {{title}}')
    ALT=$(generate_alt $STATUS)
    TOOLTIP=$(generate_tooltip $PLAYER $STATUS)
    POSITION=$(printf '%0.f' $(playerctl position))
    TEXT=$(get_slice $RAW_TEXT $POSITION)
    echo -E "$(generate_json $TEXT $ALT $TOOLTIP)"
}

main
