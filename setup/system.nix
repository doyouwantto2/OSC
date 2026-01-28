{ inputs, self, ... }:
let
  shared = import ./shared.nix;
  inherit (shared)
    currentName
    currentSystem
    supportedSystems
    systemConfigs
    ;
  inherit (shared.lib) nixosConfig;

  # Helper function to create NixOS configuration
  mkNixosConfig =
    system:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;

      modules = [
        inputs.sops-nix.nixosModules.sops
        inputs.impermanence.nixosModules.impermanence
        ./../nixos/system/system.nix
        (nixosConfig // shared.lib.mkGraphicsConfig inputs.nixpkgs systemConfigs system)
      ];

      specialArgs = {
        inherit inputs self shared;
        user = shared.lib.mkUser currentName system;
        rustPkgs = inputs.fenix.packages.${system}.latest;
      };
    };
in
{
  flake.nixosConfigurations =
    # Create configurations for all supported systems
    builtins.listToAttrs (
      map (system: {
        name = "nixos-${system}";
        value = mkNixosConfig system;
      }) supportedSystems
    )
    // {
      # Default configuration for current system
      nixos = mkNixosConfig currentSystem;
    };
}
