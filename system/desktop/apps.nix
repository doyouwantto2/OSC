{ config, pkgs, ... }:

{
  programs.steam.enable = true;

  environment.systemPackages = with pkgs; [
    # Social media
    discord
    spotify
    slack
    teams-for-linux
    zoom-us

    # Learning
    foliate

    #Menu
    rofi-wayland
    cava
    networkmanager
    networkmanagerapplet
  ];

}
