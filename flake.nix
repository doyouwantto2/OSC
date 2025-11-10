{
  description = "A clean, modern NixOS + Home Manager + AGS flake using flake-parts";

  inputs = {
    # Core
    flake-parts.url = "github:hercules-ci/flake-parts";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Stable (optional fallback)
    stable.url = "github:NixOS/nixpkgs/nixos-25.05";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Rust toolchain
    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # AGS + Astal
    astal = {
      url = "github:aylur/astal";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    ags = {
      url = "github:aylur/ags";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.astal.follows = "astal";
    };

    # Theming
    stylix = {
      url = "github:nix-community/stylix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ { flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [ "x86_64-linux" ];

      perSystem = { system, ... }:
        let
          user = {
            name = "emiya2467";
          };

          pkgs = import inputs.nixpkgs {
            inherit system;
            overlays = [ inputs.fenix.overlays.default ];
          };

          rustPkgs = inputs.fenix.packages.${system}.stable;
        in
        {
          # Export for reuse
          _module.args.pkgs = pkgs;
          _module.args.user = user;
          _module.args.rustPkgs = rustPkgs;

          # Optional: formatter & devShell
          formatter = pkgs.nixpkgs-fmt;

          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nil
              nixpkgs-fmt
              statix
              deadnix
            ];
          };
        };

      flake = { self, ... }: {
        # === NixOS Configuration ===
        nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [
            inputs.stylix.nixosModules.stylix
            ./nixos/system/zone.nix
          ];
          specialArgs = {
            inherit (self) user rustPkgs;
            inherit inputs;
            ags = inputs.ags;
            astal = inputs.astal;
          };
        };

        # === Home Manager Configuration ===
        homeConfigurations."${self.user.name}" = inputs.home-manager.lib.homeManagerConfiguration {
          pkgs = self.pkgs.x86_64-linux;
          modules = [
            ./nixos/user/user.nix
          ];
          extraSpecialArgs = {
            inherit (self) user inputs;
          };
        };
      };
    };
}
