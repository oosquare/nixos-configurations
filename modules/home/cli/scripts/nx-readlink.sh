# /usr/bin/env -S zsh --no-rcs

FILE=$1

[[ -L $FILE ]] || exit 1

while [[ -L $FILE ]]; do
  FILE=$(readlink $FILE)
done

echo $FILE
