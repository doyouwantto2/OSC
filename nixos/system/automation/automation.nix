{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./basis/basis.nix
    ./container/container.nix
    ./network/network.nix

    ./origin/configuration.nix
  ];

}
