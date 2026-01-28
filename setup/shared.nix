{
  currentName = "emiya2467";
  currentSystem = "x86_64-linux";

  supportedSystems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  systemConfigs = {
    x86_64-linux = {
      graphics = {
        enable32Bit = true;
      };
    };
    aarch64-linux = {
      graphics = {
        enable32Bit = false;
      };
    };
  };

  lib = {
    mkSystemConfig = systemConfigs: system: {
      inherit system;
      config = systemConfigs.${system} or { };
    };

    mkUser = currentName: system: {
      name = currentName;
      inherit system;
    };

    nixosModules = [
    ];

    homeModules = [
    ];

    nixosConfig = {
      nixpkgs.config.allowUnfree = true;
      nixpkgs.config.nvidia.acceptLicense = true;
    };

    mkGraphicsConfig = pkgs: systemConfigs: system: {
      hardware.graphics = systemConfigs.${system}.graphics // {
        enable32Bit = pkgs.lib.mkForce (systemConfigs.${system}.graphics.enable32Bit or false);
      };
    };
  };
}
