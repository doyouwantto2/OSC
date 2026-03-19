{
  config,
  pkgs,
  lib,
  ...
}:

{
  home.file = {
    "${config.xdg.configHome}/nvim" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/nvim;
    };

    "${config.xdg.configHome}/cava" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/cava;
    };

    "${config.xdg.configHome}/wezterm" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/wezterm;
    };

    "${config.xdg.configHome}/rofi" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/rofi;
    };

    "${config.xdg.configHome}/swappy" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/swappy;
    };

    "${config.xdg.configHome}/hypr" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/hypr;
    };

    "${config.xdg.configHome}/starship.toml" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/starship.toml;
    };

    "${config.xdg.configHome}/yazi" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/yazi;
    };

    "${config.xdg.configHome}/fastfetch" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/fastfetch;
    };

    ".face" = lib.mkForce {
      source = config.lib.file.mkOutOfStoreSymlink ./dotfiles/.face;
    };
  };
}
