{ config, pkgs, ... }:

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

  # Essential container tools for local development
  environment.systemPackages = with pkgs; [
    docker-compose
    podman-compose
    buildah
    skopeo
  ];

  # Add user to docker group for local development
  users.users."emiya2467".extraGroups = [ "docker" ];

  # Container registry configuration (for local development)
  virtualisation.oci-containers = {
    backend = "docker";
  };

  # Ensure services are enabled and running
  systemd.services.docker = {
    enable = true;
    wantedBy = [ "multi-user.target" ];
  };

  systemd.sockets.podman = {
    enable = true;
    wantedBy = [ "sockets.target" ];
  };
}
