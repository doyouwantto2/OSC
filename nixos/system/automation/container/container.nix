{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./kubernetes.nix
    ./virtualisation.nix
    ./database.nix
  ];
}
