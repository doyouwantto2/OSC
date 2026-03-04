{
  config,
  pkgs,
  lib,
  user,
  ...
}:

{
  # Docker configuration for local development
  virtualisation.docker = {
    enable = true;
    enableOnBoot = true;
    autoPrune = {
      enable = true;
      dates = "weekly";
    };
  };

  # Podman configuration (alternative to Docker)
  virtualisation.podman = {
    enable = true;
    defaultNetwork.settings.dns_enabled = true;
  };

  # Container registry configuration (for local development)
  virtualisation.oci-containers = {
    backend = "docker";
  };

  # Container tools
  environment.systemPackages = with pkgs; [
    docker-compose
    podman-compose
    buildah
  ];

  # Ensure services are enabled and running
  systemd.services.docker = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
  };

  systemd.sockets.podman = {
    enable = true;
    wantedBy = [ "sockets.target" ];
  };

  # User configuration for container and AI development
  users.users.${user.name}.extraGroups = [
    "docker" # For containerized services
    "render" # For GPU access (AI development)
  ];
}
