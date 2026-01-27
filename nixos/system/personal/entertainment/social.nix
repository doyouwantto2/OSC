{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    librewolf
    brave

    vesktop
    slack
    telegram-desktop

    youtube-dl
    termusic
  ];
}
