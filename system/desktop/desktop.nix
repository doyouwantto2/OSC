{ config, pkgs, ... }:

{
  imports = [ 
    ./basic.nix
    ./apps.nix
  ]; 

  programs.hyprland.enable = true;
  programs.hyprpanel.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    hypridle
    hyprdim
    hyprshot
    hyprspace
    hyprkeys
    hyprshade
    hyprpaper
    hyprcursor
    hyprsysteminfo
    hyprland-protocols

    waypaper
    swww
  ];
 
}
