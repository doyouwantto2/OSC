{ config, pkgs, ags, astal, ... }:

{
  environment.systemPackages = [
    ags.packages.${pkgs.stdenv.hostPlatform.system}.agsFull
    astal.packages.${pkgs.stdenv.hostPlatform.system}.io
    astal.packages.${pkgs.stdenv.hostPlatform.system}.astal3
    astal.packages.${pkgs.stdenv.hostPlatform.system}.astal4
  ];
}

