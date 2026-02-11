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
  # Uncomment and configure based on your VPN provider
  services.openvpn.servers = {
    # Example for a single VPN connection
    # Replace "myvpn" with your desired service name
    # myvpn = {
    #   config = ''config /etc/openvpn/your-config-file.ovpn'';
    #   autoStart = false;  # Set to true if you want it to start automatically
    #   updateResolvConf = true;  # Update DNS when connecting
    # };
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