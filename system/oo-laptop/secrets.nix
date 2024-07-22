{ config, lib, pkgs, constants, ... }:

{
  imports = [ ../../secrets ];

  age.rekey = {
    hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOQ/ul2tvJ0nTL+c9dYubT7fbeAw6ju7IbieF0nbWox4";
    masterIdentities = [ ../../secrets/identities/master-identity.age ];
    storageMode = "local";
    localStorageDir = ../../secrets/rekeyed/${constants.hostname};
  };
}
