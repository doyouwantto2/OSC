{
  description = "My super machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Rust toolchains
    fenix.url = "github:nix-community/fenix";
  };

  outputs = { nixpkgs, home-manager, fenix, ... }:
  let
    system = "x86_64-linux";

    pkgs = import nixpkgs {
      inherit system;
      overlays = [ fenix.overlays.default ];
    };

    rust = fenix.packages.${system}.stable;

    user = "emiya2467";
  in {
    # NixOS system config
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [ ./system/configuration.nix ];
      specialArgs = { inherit pkgs rust; };
    };

    # Home Manager config
    homeConfigurations.${user} = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = { inherit user rust; };
      modules = [ ./home/home.nix ];
    };
  };
}

