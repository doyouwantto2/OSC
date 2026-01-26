{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    nixel
    nixf
    nixd
    nixfmt
    devenv
    cachix
  ];
}
