{
  # User configuration
  userName = "emiya2467";
  currentName = "emiya2467";  # For backward compatibility with user modules
  
  # Current system (for default configurations)
  currentSystem = "x86_64-linux";
  
  # Supported systems
  supportedSystems = [
    "x86_64-linux"
    "aarch64-linux"
  ];

  # System-specific configurations
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

  # Helper functions to eliminate duplication
  lib = {
    # Create system configuration for a specific system
    mkSystemConfig = systemConfigs: system: {
      inherit system;
      config = systemConfigs.${system} or {};
    };

    # Create user object for specialArgs
    mkUser = userName: system: {
      name = userName;
      inherit system;
    };

    # Common NixOS modules
    nixosModules = [
      # Add common NixOS modules here
    ];

    # Common Home Manager modules  
    homeModules = [
      # Add common Home Manager modules here
    ];

    # Common NixOS configuration
    nixosConfig = {
      nixpkgs.config.allowUnfree = true;
      nixpkgs.config.nvidia.acceptLicense = true;
    };

    # Create graphics configuration for a system (requires inputs.nixpkgs.lib)
    mkGraphicsConfig = pkgs: systemConfigs: system: {
      hardware.graphics = systemConfigs.${system}.graphics // {
        enable32Bit = pkgs.lib.mkForce (systemConfigs.${system}.graphics.enable32Bit or false);
      };
    };
  };
}
