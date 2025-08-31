{ config, pkgs, user, ... }:

{
  imports = [ ./commons.nix ];

  home.file = {
    # For dotfiles
    #".config/nvim".source = ./dotfiles/nvim;
    ".config/cava".source = ./dotfiles/cava;
    ".config/wezterm".source = ./dotfiles/wezterm;
    ".config/starship".source = ./dotfiles/starship;
    ".config/assets".source = ./dotfiles/assets;
    #".config/hypr".source = ./dotfiles/hypr;
    #".config/eww".source = ./dotfiles/eww;

    # For extra things
    "Documents/books".source = ./extra/books;
    "Pictures/assets".source = ./extra/assets;
  };


  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
