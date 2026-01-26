{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./backend.nix
    ./frontend.nix
  ];
}
