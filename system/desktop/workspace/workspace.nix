{ config, pkgs, ... }:

{
  imports = [
    ./back-end.nix
    ./front-end.nix
  ];
}


