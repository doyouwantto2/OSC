{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    spotify
    slack
    teams-for-linux
    zoom-us
    neohtop
    koodo-reader
    blueman
    krita
    gaphor
    obs-studio
    rofi-wayland
  ];

}

