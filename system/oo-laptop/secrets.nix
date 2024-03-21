{ config, lib, pkgs, constants, ... }:

{
  imports = [ ../../secrets ];

  age.rekey = {
    hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIGPaMiGeNhvVD9X5a+myu+IAk6pVULoV5UloRg/5dpeU";
    masterIdentities = [ ../../secrets/identities/master-identity.age ];
    storageMode = "local";
    localStorageDir = ../../secrets/rekeyed/${constants.hostname};
  };
}
