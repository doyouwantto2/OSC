{ config, pkgs, user, ... }:

{
  imports = [ ./applications.nix ];

  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  home.file = {

  };

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.05"; # Please read the comment before changing.

}
