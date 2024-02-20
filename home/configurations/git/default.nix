{ config, lib, pkgs, constants, ... }:

{
  programs.git = {
		enable = true;
    userName = constants.username;
    userEmail = constants.email;
  };
}
