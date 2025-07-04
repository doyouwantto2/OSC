{ config, pkgs, ... }:

{
  imports = [
    ./languages.nix
    ./text-editor.nix
    ./terminal.nix
  ];
}
