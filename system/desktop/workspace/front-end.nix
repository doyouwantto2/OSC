{ config, pkgs, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    waypaper
    eww

    hyprcursor
    hyprpaper
  ];
}

