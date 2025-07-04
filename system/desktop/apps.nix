{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    # Social media
    discord
    spotify
    slack
    teams-for-linux
    zoom-us

    # Creativity
    krita
    blender
    godot

    # Learning
    foliate

  ];

}
