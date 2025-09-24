{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprshade
    hyprshot
    hyprpaper
    hyprcursor
    hyprland-protocols

    with-shell

    swww

    rose-pine-hyprcursor
  ];
}

