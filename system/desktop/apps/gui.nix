{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    spotify
    slack
    teams-for-linux
    zoom-us
    readest
    neohtop
    blueman
    krita
    gaphor
    obs-studio
    rofi-wayland
  ];

}

