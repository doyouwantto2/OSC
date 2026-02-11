{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Basic network configuration
  networking.networkmanager.enable = true;

  # Network utilities
  environment.systemPackages = with pkgs; [
    nmap
    dnsutils
    iperf3
    wireshark-cli
    protonvpn-gui
  ];

  # Network monitoring and debugging tools
  programs.mtr.enable = true;

  # Optional: Enable specific network services for development
  services.avahi.enable = lib.mkForce false;
  services.openssh.enable = lib.mkDefault true;
}
