{ config, pkgs, user, ... }:

{
  imports = [ ./apps.nix ];

  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  home.file = {
    ".config/hypr".source = ./dotfiles/hypr;
    ".config/nvim".source = ./dotfiles/nvim;
  };

  nixpkgs.config.allowUnfree = true;

  home.stateVersion = "25.05"; # Please read the comment before changing.

}
