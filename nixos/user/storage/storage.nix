{ config, pkgs, ... }:

{
  home.file = {
    "${config.xdg.configHome}/nvim".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/nvim;
    "${config.xdg.configHome}/cava".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/cava;
    "${config.xdg.configHome}/wezterm".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/wezterm;
    "${config.xdg.configHome}/rofi".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/rofi;
    "${config.xdg.configHome}/swappy".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/swappy;

    "${config.xdg.configHome}/hypr".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/hypr;
    "${config.xdg.configHome}/starship.toml".source =
      config.lib.file.mkOutOfStoreSymlink ./dotfiles/starship.toml;
    "${config.xdg.configHome}/yazi".source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/yazi;
    "${config.xdg.configHome}/fastfetch".source =
      config.lib.file.mkOutOfStoreSymlink ./dotfiles/fastfetch;
  };
}
