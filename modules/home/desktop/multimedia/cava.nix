{ config, lib, pkgs, ... }:

let
  flags = config.flags.packages.desktop.multimedia;
in {
  programs.cava.enable = true;

  programs.cava.settings = {
    input = {
      method = "fifo";
      source = "/tmp/mpd-visualizer-data.fifo";
    };

    output = {
      channels = "mono";
    };

    color = {
      gradient = 1;
      gradient_count = 8;
      gradient_color_1 = "'#33b8cc'";
      gradient_color_2 = "'#338fcc'";
      gradient_color_3 = "'#337dcc'";
      gradient_color_4 = "'#335ecc'";
      gradient_color_5 = "'#3340cc'";
      gradient_color_6 = "'#4233cc'";
      gradient_color_7 = "'#5e33cc'";
      gradient_color_8 = "'#6e33cc'";
    };
  };
}
