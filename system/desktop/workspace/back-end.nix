{ config, pkgs, ... }:

{
  programs.hyprland.xwayland.enable = true;
  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprshade
    hyprdim
    hyprshot
    hyprnotify
    hyprland-protocols

    mpvpaper
    swww
  ]; 
}

