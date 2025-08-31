{ config, pkgs, user, ... }:

{
  imports = [
    ./commons.nix
    ./dotfiles/
    ./utilities.nix
  ];

  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.05"; # Please read the comment before changing.
}
