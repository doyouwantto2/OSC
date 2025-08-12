{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    legcord
    spotify
    slack
    teams-for-linux
    zoom-us
    foliate
    neohtop
    blueman

    rofi-wayland
  ];

}

