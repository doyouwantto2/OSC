{ config, pkgs, ... }:

{
  import = [
    ./languages.nix
    ./text-editor.nix
    ./terminal.nix
  ];
}
