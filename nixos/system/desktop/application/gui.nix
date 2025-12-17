{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave

    vesktop
    slack
    telegram-desktop
    caprine

    libreoffice
    koodo-reader
    inkscape

    osu-lazer

    mars-mips
  ];
}
