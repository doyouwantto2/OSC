{
  config,
  pkgs,
  lib,
  user,
  ...
}:

{
  virtualisation.docker.enable = false;

  virtualisation.podman = {
    enable = true;

    dockerCompat = true;

    dockerSocket.enable = true;

    defaultNetwork.settings.dns_enabled = true;

    autoPrune = {
      enable = true;
      flags = [ "--all" ];
      dates = "weekly";
    };
  };

  virtualisation.oci-containers.backend = "podman";

  environment.systemPackages = with pkgs; [
    podman-compose
    buildah   
  ];

  users.users.${user.name}.extraGroups = [
    "podman" 
    "render" 
  ];
}
