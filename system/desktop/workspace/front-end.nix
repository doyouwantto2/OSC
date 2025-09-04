{ config, pkgs, quickShell, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    waypaper

    (quickShell.withModules [ qt6.full ])
    qt6.full

    hyprcursor
    hyprpaper
  ];
}

