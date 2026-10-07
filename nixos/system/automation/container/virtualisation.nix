{
  config,
  pkgs,
  lib,
  user,
  ...
}:

{
  virtualisation.docker.enable = false;

  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;

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
    qemu_full
    buildah   
  ];

  users.users.${user.name}.extraGroups = [
    "podman" 
    "render" 
    "libvirtd"
  ];
}
