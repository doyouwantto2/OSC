{
  description = "My super machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    # bring in home-manager
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # optional but recommended: rust-overlay for pinned Rust toolchains
    fenix.url = "github:nix-community/fenix";
  };

  outputs = { nixpkgs, home-manager, fenix, ... }@inputs:
  let
    user = rec {
      name = "emiya2467";
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        overlays = [ fenix.overlay ]; # use fenix overlay
      };
    };
  in
  {
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      system = user.system;
      modules = [ ./system/configuration.nix ];
    };

    homeConfigurations.${user.name} = home-manager.lib.homeManagerConfiguration {
      pkgs = user.pkgs;
      extraSpecialArgs = { inherit user; };
      modules = [ ./home/home.nix ];
    };

    # 💻 devShell for coding (Rust + Nix + Python + Dioxus)
    devShells.${user.system}.default = user.pkgs.mkShell {
      buildInputs = with user.pkgs; [
        # Rust toolchain (stable)
        fenix.stable.rustc
        fenix.stable.cargo
        fenix.stable.clippy
        fenix.stable.rustfmt
        fenix.stable.rust-analyzer

        # Dioxus CLI
        dioxus-cli

        # Nix tooling
        nixd
        nixpkgs-fmt # or alejandra if you prefer

        # Python tooling
        pyright
      ];
    };
  };
}

