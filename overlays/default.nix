{ config, lib, pkgs, ... }@args:

let
  files = builtins.attrNames (builtins.readDir ./.);
  overlays = builtins.filter (f: f != "default.nix") files;
in
  builtins.map (f: (import (./. + "/${f}") args)) overlays
