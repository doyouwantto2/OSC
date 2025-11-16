{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    rofi
    vesktop
    slack
    waypaper
    osu-lazer
    libreoffice
    veloren
    vlc
    koodo-reader
    mars-mips
  ];
}
