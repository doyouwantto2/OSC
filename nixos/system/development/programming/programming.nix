{ config, pkgs, ... }:

{
  imports = [
    ./editor.nix
    ./language.nix
    ./dependencies.nix
  ];
}
