{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    discord
    spotify
    slack
    teams-for-linux
    zoom-us
    foliate
    neohtop
    github-desktop

    rofi-wayland
  ];

}

