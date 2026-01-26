{ config, pkgs, ... }:

{
  imports = [
    ./game.nix
    ./social.nix
  ];
}
