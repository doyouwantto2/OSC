{ config, pkgs, ... }:

{
  imports = [
    ./art.nix
    ./music.nix
    ./theory.nix
  ];
}
