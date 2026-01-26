{ config, pkgs, ... }:

{
  imports = [
    ./development/development.nix
    ./communication/communication.nix
  ];
}
