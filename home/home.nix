{ config, pkgs, user, ... }:

{
  imports = [ ./commons.nix ];

  home.file = {
    # For dotfiles
    #".config/nvim".source = ./dotfiles/nvim;
    ".config/cava".source = ./dotfiles/cava;
    ".config/wezterm".source = ./dotfiles/wezterm;
    ".config/starship".source = ./dotfiles/starship;
    #".config/hypr".source = ./dotfiles/hypr;
    #".config/eww".source = ./dotfiles/eww;

    # For extra things
    "Documents/Books".source = ./extra/books;
    "Pictures/Assets".source = ./extra/assets;
  };


  home.username = user.name;
  home.homeDirectory = "/home/${user.name}";

  nixpkgs.config.allowUnfree = true;
  home.stateVersion = "25.05"; # Please read the comment before changing.
}
