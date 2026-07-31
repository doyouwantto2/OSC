{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    librewolf
    brave
    chromium

    mastodon
    vesktop
    slack
    telegram-desktop
    teams-for-linux

    yt-dlp
    amberol
    obs-studio
  ];
}
