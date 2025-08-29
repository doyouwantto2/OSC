{
  description = "My super machine";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    fenix = {
      url = "github:nix-community/fenix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "github:hyprwm/Hyprland";

    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
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

      rustPkgs = fenix.packages.${user.system};
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

