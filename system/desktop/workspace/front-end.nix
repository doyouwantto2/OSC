{ config, pkg, user, ags, astal, ... }:

{
  programs.hyprland.enable = true;
  programs.hyprlock.enable = true;

  environment.systemPackages = with user; [
    ags.packages.${user.system}.agsFull
    astal.packages.${user.system}.io
    astal.packages.${user.system}.astal3
    astal.packages.${user.system}.astal4

    hyprcursor
    hyprpaper
  ];
}

