{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprshade
    hyprdim
    hyprshot
    hyprland-protocols

    swww

    rose-pine-hyprcursor

  ]; 
}

