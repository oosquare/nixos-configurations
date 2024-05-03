{ config, lib, pkgs, ... }:

final: prev: {
  lx-music-desktop = prev.lx-music-desktop.override {
    commandLineArgs = "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime";
  };
}
