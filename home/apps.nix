{ config, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
    };
  };

  
  wayland.windowManager.hyprland.plugins = with pkgs.hyprlandPlugins; [
    hyprspace
    hyprexpo
    hyprgrass
  ];
  
}
