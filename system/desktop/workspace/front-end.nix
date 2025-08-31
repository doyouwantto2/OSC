{ config, pkgs, quickShell, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    waypaper
    quickShell

    hyprcursor
    hyprpaper
  ];
}

