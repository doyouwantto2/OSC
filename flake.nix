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

    quickshell = {
      url = "git+https://git.outfoxxed.me/outfoxxed/quickshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, fenix, quickshell, stylix, noctalia, ... }@inputs:

    let
      user = rec {
        name = "emiya2467";
        system = "x86_64-linux";
      };

      pkgs = nixpkgs.legacyPackages.${user.system};
      rustPkgs = fenix.packages.${pkgs.stdenv.hostPlatform.system}.stable;
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        modules = [
          stylix.nixosModules.stylix
          ./nixos/system/zone.nix
          { nixpkgs.hostPlatform = pkgs.stdenv.hostPlatform.system; }
        ];
        specialArgs = {
          inherit rustPkgs quickshell inputs;
        };
      };

      homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          inputs.stylix.homeModules.stylix
          ./nixos/user/user.nix
        ];
        extraSpecialArgs = {
          inherit user inputs;
        };
      };
    };
}
