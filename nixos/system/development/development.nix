{ config, pkgs, ... }:

{
  imports = [
    ./programming/programming.nix
    ./cloud/cloud.nix
  ];
}
