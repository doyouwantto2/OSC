{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./work/work.nix
    ./learn/learn.nix
    ./entertain/entertain.nix
  ];
}
