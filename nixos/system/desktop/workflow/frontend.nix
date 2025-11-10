{ config, pkgs, user, ags, astal, ... }:
let
  system = pkgs.stdenv.hostPlatform.system;
in
{
  environment.systemPackages = [
    ags.packages.${system}.agsFull
    astal.packages.${system}.io
    astal.packages.${system}.astal3
    astal.packages.${system}.astal4
  ];
}

