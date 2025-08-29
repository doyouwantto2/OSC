{
  description = "My super machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, rust-overlay, ... }@inputs:
    let
      user = rec {
        name = "emiya2467";
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ rust-overlay.overlays.default ];
        };
      };

      rustPkgs = user.pkgs.rust-bin.nightly.latest.default.override {
        targets = [ "wasm32-unknown-unknown" ];
      };
    in
    {
      nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
        system = user.system;
        modules = [ ./system/configuration.nix ];
        specialArgs = { inherit rustPkgs; };
      };

      homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
        pkgs = user.pkgs;
        extraSpecialArgs = { inherit user; };
        modules = [ ./home/home.nix ];
      };
    };
}

