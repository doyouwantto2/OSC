{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    playerctl
    hypridle
    hyprshade
    hyprshot
    hyprland-protocols

    swww

    rose-pine-hyprcursor
  ]; 
}

