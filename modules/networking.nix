{ config, lib, pkgs, ... }:

{
  # Basic network configuration
  networking.networkmanager.enable = true;

  # OpenSSH
  # services.openssh.enable = true;

  # Firewall
  # networking.firewall = {
  #   enable = true;
  #   allowedTCPPorts = [];
  #   allowedUDPPorts = [];
  # };
}
