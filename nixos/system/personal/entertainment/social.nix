{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    librewolf
    brave

    vesktop
    slack
    telegram-desktop
    teams-for-linux

    yt-dlp
    amberol
    obs-studio
  ];
}
