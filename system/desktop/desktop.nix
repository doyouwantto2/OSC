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
    hyprkeys
    hyprshade
    hyprpaper
    hyprcursor
    hyprcursor-themes.rose-pine
    hyprsysteminfo
    hyprland-protocols

    waypaper
    waybar
    swaynotificationcenter
    swww

  ];
 
}
