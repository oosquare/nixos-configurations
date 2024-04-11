{ config, lib, pkgs, ... }:

final: prev: {
  logseq = prev.logseq.overrideAttrs (attrs: {
    postFixup = builtins.replaceStrings
      [ ''\''${NIXOS_OZONE_WL:+\''${WAYLAND_DISPLAY:+--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations}}'' ]
      [ ''--ozone-platform-hint=auto --enable-features=WaylandWindowDecorations --enable-wayland-ime'' ]
      attrs.postFixup;
  });
}

