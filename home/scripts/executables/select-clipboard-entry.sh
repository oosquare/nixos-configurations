ENTRYS=$(cliphist list)
# Remove the indices given by cliphist and show tofi to select an entry
SELECTION=$(echo $ENTRYS | awk -F '\t' '{print $2}' | tofi --prompt-text 'clipboard:')

if [[ $? != 0 ]]; then
    exit 0
fi

# Find the index and print the whole line
TARGET=$(echo $ENTRYS | awk "/^[0-9]+\\t$SELECTION/ {print \$0}")
echo $TARGET | cliphist decode | wl-copy
