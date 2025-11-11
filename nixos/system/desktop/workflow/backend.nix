{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    hyprland-protocols
    hyprshade
    swww
    hyprpaper
    brightnessctl
    starship
  ];
}

