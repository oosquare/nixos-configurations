{ config, lib, pkgs, ... }:

{
  windowrulev2 = [
    # QQ
    "float, title:^(QQ|图片查看器)$"
    "center, title:^(QQ|图片查看器)$"
    "maximize, title:^QQ$"

    # Telegram
    "float, class:org\.telegram\.desktop"
    "center, class:org\.telegram\.desktop"
    "maximize, class:org\.telegram\.desktop"

    # VS Code
    "opacity 0.85, title:.*\ -\ Visual Studio Code$"

    # Calculators
    "float, title:.*([Cc]alculator|计算器).*"
  ];
}
