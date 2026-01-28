{
  config,
  pkgs,
  currentName,
  ...
}:

{
  imports = [
    ./aliases.nix
    ./shell.nix
    ./cloud.nix
  ];
}
