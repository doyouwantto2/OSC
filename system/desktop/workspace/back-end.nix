{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprshade
    hyprshot
    hyprpaper
    hyprland-protocols

    with-shell

    swww

    rose-pine-hyprcursor
  ];
}

