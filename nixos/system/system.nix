{
  user,
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./automation/automation.nix
    ./desktop/desktop.nix
    ./personal/personal.nix
    ./security/security.nix
  ];

  nixpkgs.hostPlatform = user.system;
}
