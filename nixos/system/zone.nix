{ config, pkgs, ... }:

{
  imports = [
    ./startup/startup.nix

    ./origin/configuration.nix

    ./development/development.nix

    ./security/security.nix

    ./desktop/desktop.nix
  ];
}
