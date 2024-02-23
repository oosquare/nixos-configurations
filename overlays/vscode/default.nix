{ config, lib, pkgs, ... }:

final: prev: {
  vscode = prev.vscode.override {
    commandLineArgs = "--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime";
  };
}
