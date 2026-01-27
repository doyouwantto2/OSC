{ inputs, self, ... }:
let
  shared = import ./shared.nix;
  inherit (shared) userName currentSystem supportedSystems;

  # Helper function to create Home Manager configuration
  mkHomeConfig = system: inputs.home-manager.lib.homeManagerConfiguration {
    pkgs = inputs.nixpkgs.legacyPackages.${system};

    modules = [
      inputs.stylix.homeModules.stylix
      ./../nixos/user/user.nix
    ];

    extraSpecialArgs = {
      inherit inputs shared;
      user = shared.lib.mkUser userName system;
    };
  };
in
{
  flake.homeConfigurations = 
    # Create configurations for all supported systems
    builtins.listToAttrs (
      map (system: {
        name = "${userName}@${system}";
        value = mkHomeConfig system;
      }) supportedSystems
    )
    // {
      # Default configuration for current system
      ${userName} = mkHomeConfig currentSystem;
    };
}
