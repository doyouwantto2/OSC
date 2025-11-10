{ config, pkgs, ... }:

{
  imports = [
    ./information/information.nix
    ./container/container.nix
  ];
}
