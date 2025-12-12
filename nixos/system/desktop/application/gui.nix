{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave

    rofi-wayland
    blueman
    waypaper

    vesktop
    slack

    libreoffice
    koodo-reader
    inkscape

    osu-lazer

    mars-mips
  ];
}
