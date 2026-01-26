{ inputs, self, ... }:
let
  shared = import ./shared.nix;
  currentName = shared.currentName;
in
{
  flake.homeConfigurations = builtins.listToAttrs (
    map (system: {
      name = "${shared.userName}@${system}";
      value = inputs.home-manager.lib.homeManagerConfiguration {
        pkgs = inputs.nixpkgs.legacyPackages.${system};

        modules = [
          inputs.stylix.homeModules.stylix
          ./../nixos/user/user.nix
        ];

        extraSpecialArgs = {
          inherit inputs;
          user = {
            name = shared.userName;
            inherit system;
          };
        };
      };
    }) shared.supportedSystems
  ) // {
    # Default home configuration for current system
    ${currentName} = inputs.home-manager.lib.homeManagerConfiguration {
      pkgs = inputs.nixpkgs.legacyPackages."x86_64-linux";

      modules = [
        inputs.stylix.homeModules.stylix
        ./../nixos/user/user.nix
      ];

      extraSpecialArgs = {
        inherit inputs;
        user = {
          name = currentName;
          system = "x86_64-linux";
        };
      };
    };
  };
}
