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
    hyprshade
    hyprpaper
    hyprcursor
    hyprsysteminfo
    hyprland-protocols

    mpvpaper
    swww
    waybar
    hyprnotify

    rose-pine-hyprcursor
  ];
 
}
