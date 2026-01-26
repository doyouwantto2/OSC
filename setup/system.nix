{ inputs, self, ... }:
let
  shared = import ./shared.nix;
in
{
  flake.nixosConfigurations = builtins.listToAttrs (
    map (system: {
      name = "nixos-${system}";
      value = inputs.nixpkgs.lib.nixosSystem {
        inherit system;

        modules = [
          inputs.disko.nixosModules.disko
          ./../nixos/system/system.nix
          { 
            nixpkgs.config.allowUnfree = true;
            nixpkgs.config.nvidia.acceptLicense = true;
            # Apply system-specific graphics configuration with force to override Steam
            hardware.graphics = shared.systemConfigs.${system}.graphics // {
              enable32Bit = inputs.nixpkgs.lib.mkForce shared.systemConfigs.${system}.graphics.enable32Bit;
            };
          }
        ];

        specialArgs = {
          inherit inputs self;
          user = {
            name = shared.userName;
            inherit system;
          };
          rustPkgs = inputs.fenix.packages.${system}.latest;
        };
      };
    }) shared.supportedSystems
  );
}
