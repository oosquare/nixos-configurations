{ config, lib, pkgs, constants, ... }:

{
  imports = [ ../../secrets ];

  age.identityPaths = [
    "${config.services.ssh.dataPath}/ssh_host_ed25519_key"
  ];

  age.rekey = {
    hostPubkey = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIBA/zxSWaMNBUwlOQH/g290oiD8uzYHXWbfrG2r0fOmv";
    masterIdentities = [ ../../secrets/identities/master-identity.age ];
    storageMode = "local";
    localStorageDir = ../../secrets/rekeyed/${constants.hostname};
  };
}

