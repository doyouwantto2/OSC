{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprshade
    hyprshot
    hyprland-protocols
    with-cli

    swww

    rose-pine-hyprcursor
  ];
}

