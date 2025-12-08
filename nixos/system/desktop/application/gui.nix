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
    linuxsampler

    osu-lazer

    mars-mips
  ];
}
