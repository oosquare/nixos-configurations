{ config, lib, pkgs, ... }:

{
  programs.ssh.enable = true;

  programs.ssh.matchBlocks."github.com" = {
    hostname = "github.com";
    port = 22;
    user = "git";
    proxyCommand = "nc -X 5 -x 127.0.0.1:7890 %h %p";
  };
}
