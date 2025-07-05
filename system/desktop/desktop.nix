{ config, pkgs, ... }:

{
  imports = [ 
    ./basic.nix
    ./apps.nix
  ]; 

  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    hypridle
    hyprdim
    hyprshot
    hyprlandPlugins.hyprspace
    hyprkeys
    hyprshade
    hyprpaper
    hyprcursor
    hyprnotify
    hyprsysteminfo
    hyprland-protocols

    waypaper
    waybar
    swww
  ];
 
}
