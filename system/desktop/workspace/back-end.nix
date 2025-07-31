{ config, pkgs, ... }:

{

  environment.systemPackages = with pkgs; [
    brightnessctl
    hypridle
    hyprshade
    hyprshot
    hyprland-protocols

    swww

    rose-pine-hyprcursor
  ]; 
}

