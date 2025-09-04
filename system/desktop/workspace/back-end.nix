{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprshade
    hyprshot
    hyprland-protocols

    with-shell

    swww

    rose-pine-hyprcursor
  ];
}

