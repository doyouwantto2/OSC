{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Basic network configuration
  networking.networkmanager.enable = true;

  # Enable firewall with proper configuration
  networking.firewall.enable = true;

  # Network utilities
  environment.systemPackages = with pkgs; [
    nmap
    dnsutils
    iperf3
    wireshark-cli
  ];

  # All allowed TCP ports (merged from all modules)
  networking.firewall.allowedTCPPorts = [
    # Local development ports
    80 # HTTP - local web dev
    443 # HTTPS - local web dev
    3000 # Common frontend dev port
    8080 # Common backend dev port
    5432 # PostgreSQL (if needed locally)
    3306 # MySQL (if needed locally)
    6379 # Redis (if needed locally)
    8000 # Alternative dev server port
    9000 # Alternative dev server port
    44462 # Spotube
    59048 # Spotube
    58012 # Spotube

    # Development tools ports
    5173 # Vite default port
    4173 # Vite preview port
    1024 # Alternative low port for development
    2049 # NFS (if needed for development)

    # AI service ports
    11434 # Ollama API server
    5001 # KoboldCPP default port
    5002 # Alternative KoboldCPP port
    7860 # Stable Diffusion WebUI
    8899 # Text Generation WebUI

    # AI monitoring and management
    3000 # AI dashboard/monitoring
    9090 # AI metrics/prometheus
  ];

  # UDP ports for development
  networking.firewall.allowedUDPPorts = [
    53 # DNS
    67 # DHCP
    68 # DHCP
    123 # NTP
  ];

  # Network optimization for development
  networking.useDHCP = lib.mkDefault true;
  networking.useNetworkd = lib.mkDefault false;

  # Hosts file for local development
  networking.extraHosts = ''
    127.0.0.1 localhost.localdev
    127.0.0.1 api.localdev
    127.0.0.1 app.localdev
    127.0.0.1 db.localdev
    127.0.0.1 ollama.localdev
    127.0.0.1 kobold.localdev
    127.0.0.1 ai.localdev
    127.0.0.1 llm.localdev
    127.0.0.1 stable.localdev
    127.0.0.1 textgen.localdev
  '';

  # Network monitoring and debugging tools
  programs.mtr.enable = true;

  # Optional: Enable specific network services for development
  # services.avahi.enable = lib.mkDefault false;  # Uncomment if needed for local discovery
  # services.openssh.enable = lib.mkDefault true;  # Uncomment for SSH access
}
