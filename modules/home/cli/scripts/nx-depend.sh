#! /usr/bin/env -S zsh --no-rcs

if [[ $1 == /nix/store/* ]]; then
  nix why-depends /run/current-system $1
else
  CURRENT_PATH=$PWD
  cd /nix/store
  DERIVATION="/nix/store/$(fzf)"
  RESULT=$?
  cd $CURRENT_PATH
  [[ $RESULT == 0 ]] && nix why-depends /run/current-system $DERIVATION
fi
