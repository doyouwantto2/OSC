{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprshade
    hyprdim
    hyprshot
    hyprland-protocols

    mpvpaper
    hyprpaper

    astal.io
    astal.gjs
    astal.tray
    astal.cava
    astal.auth
    astal.apps
    astal.mpris
    astal.greet
    astal.source
    astal.notifd
    astal.astal4
    astal.astal3
    astal.wireplumber
    astal.powerprofiles
    astal.network
    astal.hyprland
    astal.bluetooth
    astal.battery

    rose-pine-hyprcursor

  ]; 
}

