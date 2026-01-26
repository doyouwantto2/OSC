{
  config,
  pkgs,
  rustPkgs,
  ...
}:

{
  imports = [
    ./c++.nix
    ./web.nix
    ./lua.nix
    ./python.nix
    ./rust.nix
    ./sql.nix
    ./solidity.nix
    ./hypr.nix
    ./java.nix
    ./nix.nix
    ./yaml.nix
    ./qt.nix
  ];
}
