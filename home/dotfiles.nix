{ config, pkgs, user, ... }:

{
  home.file = {
    #".config/nvim".source = ./dotfiles/nvim;
    ".config/cava".source = ./dotfiles/cava;
    ".config/wezterm".source = ./dotfiles/wezterm;
    ".config/starship".source = ./dotfiles/starship;
    ".config/assets".source = ./dotfiles/assets;
    #".config/hypr".source = ./dotfiles/hypr;
    #".config/eww".source = ./dotfiles/eww;
  };
}
