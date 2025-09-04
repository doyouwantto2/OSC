{ config, pkgs, quickShell, caelestica-shell, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with pkgs; [
    waypaper

    (quickShell.withModules [ qt6.full ])
    qt6.full
    caelestica-shell

    hyprcursor
    hyprpaper
  ];
}

