{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprdim
    hyprshot
    hyprnotify
    hyprland-protocols

    mpvpaper
    swww
  ]; 
}

