{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave
    librewolf

    vesktop
    slack
    telegram-desktop

    libreoffice
    koodo-reader
    inkscape
    vikunja

    osu-lazer

    mars-mips
  ];
}
