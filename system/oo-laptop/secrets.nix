{ config, lib, pkgs, constants, ... }:

{
  imports = [ ../../secrets ];

  age.rekey = {
    hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGXSkWOJfTAOScc9ELER7v/WmL38Ro8uNAC5NGrIbAYI";
    masterIdentities = [ ../../secrets/identities/master-identity.age ];
    storageMode = "local";
    localStorageDir = ../../secrets/rekeyed/${constants.hostname};
  };
}
