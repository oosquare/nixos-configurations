{ config, lib, pkgs, constants, ... }:

{
  imports = [
    # Common modules
    ../../modules/flags
    ../../modules/nixos

    # System-specific modules
    ./hardware.nix
    ./virtualization.nix
    ./secrets.nix
  ];

  services.xserver.enable = true;
  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  networking.hostName = "oo-laptop";

  time.timeZone = "Asia/Shanghai";

  users.users.${constants.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "dialout" ];
  };
 
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  system.stateVersion = "24.05";
}

