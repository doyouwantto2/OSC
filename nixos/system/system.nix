{
  user,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./automation/origin/configuration.nix
    ./automation/basis/essence.nix
    ./desktop/desktop.nix
    ./personal/personal.nix
    ./presets/presets.nix
    ./security/security.nix
  ];

  nixpkgs.hostPlatform = user.system;
}
