{
  config,
  pkgs,
  ...
}:

{
  imports = [
    # Module-specific configurations
    ./api/api.nix
    ./basis/basis.nix
    ./container/container.nix
    ./network/network.nix

    ./origin/configuration.nix
  ];

}
