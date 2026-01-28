{ inputs, self, ... }:
let
  shared = import ./shared.nix;
  inherit (shared) currentName currentSystem supportedSystems;

  # Helper function to create Home Manager configuration
  mkHomeConfig =
    system:
    inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages.${system};

      modules = [
        inputs.stylix.homeModules.stylix
        ./../nixos/user/user.nix
      ];

      extraSpecialArgs = {
        inherit inputs shared;
        user = shared.lib.mkUser currentName system;
      };
    };
in
{
  flake.homeConfigurations =
    # Create configurations for all supported systems
    builtins.listToAttrs (
      map (system: {
        name = "${currentName}@${system}";
        value = mkHomeConfig system;
      }) supportedSystems
    )
    // {
      # Default configuration for current system
      ${currentName} = mkHomeConfig currentSystem;
    };
}
