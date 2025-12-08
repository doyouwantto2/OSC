{
  description = "A clean, basic flake configuration for NixOS and Home Manager.";

  inputs = {

    stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    nixpkgs.follows = "unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, fenix, ags, astal, stylix, ... }@inputs:

    let
      user = {
        name = "emiya2467";
        system = "x86_64-linux";
      };

      pkgs = import nixpkgs {
        inherit (user);
        stdenv.hostPlatform.system = user.system;
        overlays = [ fenix.overlays.default ];
      };

      rustPkgs = fenix.packages.${pkgs.stdenv.hostPlatform.system}.stable;
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = pkgs.stdenv.hostPlatform.system;
        modules = [
          stylix.nixosModules.stylix
          ./nixos/system/zone.nix
        ];
        specialArgs = {
          inherit user rustPkgs ags astal inputs;
        };
      };

      homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./nixos/user/user.nix
        ];
        extraSpecialArgs = {
          inherit user inputs;
        };
      };
    };
}
