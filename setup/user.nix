{ inputs, self, ... }:
let
  shared = import ./shared.nix;
  inherit (shared) currentName currentSystem supportedSystems;

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
    builtins.listToAttrs (
      map (system: {
        name = "${currentName}@${system}";
        value = mkHomeConfig system;
      }) supportedSystems
    )
    // {
      ${currentName} = mkHomeConfig currentSystem;
    };
}
