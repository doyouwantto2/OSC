{ config, pkgs, ... }:

{
  imports = [
    ./forward/forward.nix

    ./origin/configuration.nix

    ./development/development.nix

    ./security/security.nix

    ./desktop/desktop.nix
  ];
}
