{
  config,
  pkgs,
  lib,
  ...
}:

{
  # OpenVPN packages and services
  environment.systemPackages = with pkgs; [
    openvpn
    networkmanager-openvpn
  ];
  
  # Enable NetworkManager for VPN management
  networking.networkmanager.enable = true;
  
  # Create OpenVPN directory
  systemd.tmpfiles.rules = [
    "d /etc/openvpn 0755 root root -"
  ];
  
  # OpenVPN service configuration
  services.openvpn.servers = {
    protonvpn = {
      config = ''config /etc/openvpn/jp-free-13.protonvpn.udp.ovpn'';
      autoStart = true;
      updateResolvConf = true;
    };
  };
  
  # Optional: Kill switch configuration
  # This prevents traffic leaks when VPN disconnects
  # networking.firewall.extraCommands = ''
  #   # Allow VPN traffic
  #   iptables -A OUTPUT -o tun0 -j ACCEPT
  #   iptables -A INPUT -i tun0 -j ACCEPT
  #   
  #   # Block all other traffic when VPN is not connected
  #   iptables -A OUTPUT ! -o tun0 -j DROP
  # '';
}