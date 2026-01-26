{ config, pkgs, ... }:

{
  home.file = {
    "${config.xdg.configHome}/nvim".source =
      config.lib.file.mkOutOfStoreSymlink ./storage/dotfiles/nvim;
    "${config.xdg.configHome}/cava".source =
      config.lib.file.mkOutOfStoreSymlink ./storage/dotfiles/cava;
    "${config.xdg.configHome}/wezterm".source =
      config.lib.file.mkOutOfStoreSymlink ./storage/dotfiles/wezterm;
    "${config.xdg.configHome}/rofi".source =
      config.lib.file.mkOutOfStoreSymlink ./storage/dotfiles/rofi;
    "${config.xdg.configHome}/swappy".source =
      config.lib.file.mkOutOfStoreSymlink ./storage/dotfiles/swappy;

    "${config.xdg.configHome}/hypr".source =
      config.lib.file.mkOutOfStoreSymlink ./storage/dotfiles/hypr;
    "${config.xdg.configHome}/starship.toml".source =
      config.lib.file.mkOutOfStoreSymlink ./storage/dotfiles/starship.toml;
  };
}
