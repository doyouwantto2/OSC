{ config, pkgs, ... }:

{
  imports = [
    ./office.nix
    ./assistant.nix
  ];
}
