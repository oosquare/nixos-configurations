{ config, lib, pkgs, ... }:

final: prev: {
  vscode = prev.vscode.override {
    commandLineArgs = "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --disable-features=WaylandFractionalScaleV1 --enable-webrtc-pipewire-capturer --enable-wayland-ime --disable-gpu";
  };
}
