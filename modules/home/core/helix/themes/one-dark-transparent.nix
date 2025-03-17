{ config, lib, pkgs, ... }:

{
  inherits = "onedark";

  comment = "#939496";

  "ui.background" = { fg = "foreground"; };
  "ui.cursorline.primary" = { bg = "cursorline"; };
  "ui.cursor.match" = { fg = "foreground"; bg = "light-gray"; };
  "ui.menu" = { fg = "brighter-gray"; bg = "light-black"; };
  "ui.menu.selected" = { fg = "white"; bg = "gray"; };
  "ui.help" = { fg = "foreground"; };
  "ui.popup" = { fg = "brighter-gray"; bg = "light-black"; };
  "ui.statusline" = { fg = "foreground"; };
  "ui.statusline.inactive" = { fg = "light-gray"; };
  "ui.window" = { fg = "light-gray"; bg = "light-black"; };
  
  palette = {
    brighter-gray = "#8e98ab";
  };
}
