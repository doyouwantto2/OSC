{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    brave

    rofi
    waypaper

    vesktop
    slack

    libreoffice
    koodo-reader
    inkscape

    osu-lazer

    qemu
    mars-mips
    gns3-server
    gns3-gui
  ];
}
