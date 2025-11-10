{ config, pkg, ags, astal, system, ... }:

{
  environment.systemPackages = [
    ags.packages.${system}.agsFull
    astal.packages.${system}.io
    astal.packages.${system}.astal3
    astal.packages.${system}.astal4
  ];
}

