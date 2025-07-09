{ config, pkgs, ... }:

{

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

