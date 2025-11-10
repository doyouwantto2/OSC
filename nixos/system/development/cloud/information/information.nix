{ config, pkgs, ... }:

{
  imports = [
    ./database.nix
    ./choice.nix
  ];
}
