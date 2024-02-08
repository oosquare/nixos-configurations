{ config, lib, pkgs, ... }:

let
  rules = [
    # QQ
    { field = "title"; pattern = "^图片查看器$"; rules = [ "float" "center" ]; }
    { field = "title"; pattern = "^QQ$"; rules = [ "float" "center" "maximize" ]; }

    # VS Code
    { field = "title"; pattern = ".*Visual Studio Code$"; rules = [ "opacity 0.85" ]; }

    # Calculators
    { field = "title"; pattern = "^([Cc]alculator|计算器)$"; rules = [ "float" ]; }
  ];

  buildRules = { field, pattern, rules }: builtins.map
    (rule: "${rule}, ${field}:${pattern}")
    rules;
in {
  windowrulev2 = builtins.concatMap buildRules rules;
}
