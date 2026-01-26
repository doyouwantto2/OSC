{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    carla
  ];
}
