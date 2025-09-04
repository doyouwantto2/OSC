{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    snixembed
    hypridle
    hyprshade
    hyprshot
    hyprland-protocols

    swww

    rose-pine-hyprcursor
  ];
}

