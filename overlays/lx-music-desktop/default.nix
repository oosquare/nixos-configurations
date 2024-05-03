{ config, lib, pkgs, ... }:

final: prev: {
  lx-music-desktop = prev.lx-music-desktop.override {
    commandLineArgs = "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --disable-features=WaylandFractionalScaleV1 --enable-wayland-ime";
  };
}
