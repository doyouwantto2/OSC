{ config, pkgs, ... }:

{
  imports = [
    ./application/application.nix

    ./workflow/workflow.nix
  ];
}
