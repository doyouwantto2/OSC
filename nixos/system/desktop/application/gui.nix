{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave

    rofi
    blueman
    waypaper

    vesktop
    slack

    libreoffice
    koodo-reader
    inkscape
    carla

    osu-lazer

    mars-mips
  ];
}
