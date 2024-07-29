{ config, lib, pkgs, ... }:

{
  imports = [
    # Common modules
    ../../modules/flags
    ../../modules/nix-on-droid

    # System-specific modules
    ./secrets.nix
  ];

  user.shell = "${pkgs.zsh}/bin/zsh";

  environment.packages = with pkgs; [];

  environment.etcBackupExtension = ".bak";

  environment.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  time.timeZone = "Asia/Shanghai";

  system.stateVersion = "24.05";
}
