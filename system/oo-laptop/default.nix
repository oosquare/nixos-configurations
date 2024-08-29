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

  networking.hostName = "oo-laptop";

  time.timeZone = "Asia/Shanghai";

  users.users.${constants.username} = {
    isNormalUser = true;
    shell = pkgs.zsh;
    extraGroups = [ "wheel" "networkmanager" "dialout" ];
    openssh.authorizedKeys.keys = [
      # oo-matepad
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGsW8RQD1WfSg1N0uriuTO6B10T7LMnRUMDhQiKr//G7 nix-on-droid@localhost"
    ];
  };
 
  environment.variables = {
    EDITOR = "hx";
    VISUAL = "hx";
  };

  system.stateVersion = "24.05";
}

