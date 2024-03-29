#! /usr/bin/env -S zsh --no-rcs

# This script will take a slice of a string which contains information of 
# a song played now based on the current position.
# Usage: ./get-song-info.sh <COMMAND>
# <COMMAND> can be `metadata` or `progress`

function query_metadata() {
    METADATA=$1
    DEFAULT=$2
    VALUE=$(playerctl metadata --format "{{$METADATA}}" || echo '')

    if [[ -n $VALUE ]]; then
        echo -E "$VALUE"
    elif [[ -n $DEFAULT ]]; then
        echo -E "$DEFAULT"
    else
        echo "N/A"
    fi
}

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
    TITLE=$3
    ARTIST=$4
    ALBUM=$5
    PROGRESS=$6

    SONG_INFO='Title: '"$TITLE"'\nArtist: '"$ARTIST"'\nAlbum: '"$ALBUM"'\nPosition: '"$PROGRESS"
    echo -E 'Player: '"$PLAYER"'\nStatus: '"$STATUS"'\n\n'"$SONG_INFO"
}

# Take a slice of the metadata string
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
    COMMAND=$1
    STATUS=$(playerctl status)
    PLAYER=$(query_metadata "playerName" "None")
    
    # Check if the player is stopped
    if [[ $STATUS != 'Playing' && $STATUS != 'Paused' ]]; then
        echo -E $(generate_json 'Stopped' 'stopped' 'Player: '$PLAYER'\nStatus: Stopped')
        exit 0
    fi

    ARTIST=$(query_metadata "artist")
    TITLE=$(query_metadata "title")
    ALBUM=$(query_metadata "album")
    POSITION=$(query_metadata "duration(position)")
    LENGTH=$(query_metadata "duration(mpris:length)" "Stream")

    if [[ $POSITION == "0:00" && $LENGTH == "Stream" ]]; then
        PROGRESS="Stream"
    else
        PROGRESS="$POSITION/$LENGTH"
    fi

    RAW_TEXT="$ARTIST - $TITLE"
    ALT=$(generate_alt $STATUS)
    TOOLTIP=$(generate_tooltip "$PLAYER" "$STATUS" "$TITLE" "$ARTIST" "$ALBUM" "$PROGRESS")

    case $COMMAND in
        "metadata")
            POS=$(printf '%0.f' $(playerctl position))
            TEXT=$(get_slice "$RAW_TEXT" "$POS")
        ;;
        "progress")
            TEXT="$PROGRESS"
        ;;
        *)
            echo "Error: unknown command: \`$COMMAND\`"
            exit 1
        ;;
    esac

    echo -E "$(generate_json "$TEXT" "$ALT" "$TOOLTIP")"
}

main $1
