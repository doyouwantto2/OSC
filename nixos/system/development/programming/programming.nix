{ config, pkgs, ... }:

{
  imports = [
    ./editor.nix
    ./language.nix
    ./dependency.nix
  ];
}
