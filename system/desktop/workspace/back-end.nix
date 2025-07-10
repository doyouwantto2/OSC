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
    swww

    (astal.withPackages (ps:
      with ps; [
        io
        gjs
        tray
        cava
        auth
        apps
        river
        mpris
        greet
        source
        notifd
        astal4
        astal3
        wireplumber
        powerprofiles
        network
        hyprland
        bluetooth
        battery
        ags
    ]))

    rose-pine-hyprcursor

  ]; 
}

