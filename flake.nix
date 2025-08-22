{
  description = "My super machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    fenix.url = "github:nix-community/fenix";
  };

  outputs = { nixpkgs, home-manager, fenix, ... }@inputs:
    let
      user = rec {
        name = "emiya2467";
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ fenix.overlays.default ];
        };
      };

      rust = fenix.packages.${user.system}.stable.default.override {
        targets = [ "wasm32-unknown-unknown" ];
        extensions = [ "rustc" "cargo" "clippy" "rustfmt" "rust-analyzer" ];
      };

    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = user.system;
        modules = [ ./system/configuration.nix ];
        specialArgs = { inherit rust; };
      };

      homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
        pkgs = user.pkgs;
        extraSpecialArgs = { inherit user; };
        modules = [ ./home/home.nix ];
      };
    };
}

