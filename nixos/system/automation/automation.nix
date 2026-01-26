{
  config,
  pkgs,
  ...
}:

{
  imports = [
    ./api/api.nix
    ./basis/basis.nix
    ./container/container.nix
    ./disk/disk.nix
    ./network/network.nix
    ./origin/configuration.nix
  ];

}
