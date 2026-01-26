{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    vesktop
    slack
    telegram-desktop
  ];
}
