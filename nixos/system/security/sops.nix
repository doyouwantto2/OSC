{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Enable SOPS for secret management
  sops = {
    defaultSopsFile = ../presets/database/postgresql.yaml;
    defaultSopsFormat = "yaml";
    
    # Age key configuration (recommended)
    age = {
      keyFile = lib.mkDefault "/etc/sops/age/keys.txt";
      generateKey = false; # Set to true to auto-generate
    };
    
    # PGP key configuration (alternative)
    gnupg = {
      home = lib.mkDefault "/root/.gnupg";
    };
  };

  # Ensure SOPS directories exist
  system.activationScripts.setupSopsDirs = {
    text = ''
      mkdir -p /etc/sops/age
      mkdir -p /root/.gnupg
      chmod 700 /root/.gnupg
    '';
  };

  # System packages for secret management
  environment.systemPackages = with pkgs; [
    sops
    age
    gnupg
  ];
}
