{ config, pkgs, quickShell, caelestia, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    waypaper

    (quickShell.withModules [ qt6.full ])
    qt6.full
    caelestia

    hyprcursor
    hyprpaper
  ];
}

