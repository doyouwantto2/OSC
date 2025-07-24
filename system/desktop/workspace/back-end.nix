{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprshade
    hyprdim
    hyprshot
    hyprland-protocols

    hyprpaper
    swww

    astal.io
    astal.gjs
    astal.tray
    astal.cava
    astal.auth
    astal.apps
    astal.river
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

    gobject-introspection
    gtk3
    gtk-layer-shell
    libnotify
    libappindicator-gtk3
    glib
    gjs

    rose-pine-hyprcursor

  ]; 
}

