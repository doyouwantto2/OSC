{
  description = "A very basic flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs: 
  let
    user = rec {
       name = "emiya2467";
       system = "x86_64-linux";
       pkgs = nixpkgs.legacyPackages.${system};
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
       system = user.system;
       modules = [ ./config/configuration.nix ];
    };

          homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
        pkgs = user.pkgs;
        extraSpecialArgs = {
          inherit user;
        };

        modules = [ ./home/home.nix ];
      };
  };
}
