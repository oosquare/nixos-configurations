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

  time.timeZone = "Asia/Shanghai";

  nix.extraOptions = ''
    experimental-features = nix-command flakes
  '';

  system.stateVersion = "24.05";
}
