{
  description = "My super machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { nixpkgs, home-manager, ... }@inputs:
    let
      user = rec {
        name = "emiya2467";
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ ];
        };
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = user.system;
        modules = [ ./system/configuration.nix ];
        specialArgs = { };
      };

      homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
        pkgs = user.pkgs;
        extraSpecialArgs = { inherit user; };
        modules = [ ./home/home.nix ];
      };
    };
}

