{ config, pkgs, ... }:

{
  imports = [
    ./support.nix
    ./manager.nix
  ];
}
