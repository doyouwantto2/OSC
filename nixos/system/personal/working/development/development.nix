{ config, pkgs, rustPkgs, ... }:

{
  imports = [
    ./languages/languages.nix
    ./tools/tools.nix
  ];
}
