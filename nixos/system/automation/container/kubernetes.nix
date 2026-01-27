{ config, pkgs, lib, ... }:

{
  # Kubernetes tools for local development
  environment.systemPackages = with pkgs; [
    kubectl
    helm
    k9s
    stern
    minikube
    kind
    cni-plugins
    flannel
    
    # Cloud provider CLIs
    awscli2
  ];
  
  # Kubernetes configuration for local development
  # Keep minimal ports for local cluster communication only
  # Remove external network ports since you're not using router/stable network
  # Note: Firewall is now managed in network/network.nix
  
  # Optional: Enable local Kubernetes cluster (commented by default)
  # Uncomment when you need a full local cluster
  # services.kubernetes = {
  #   roles = [ "master" "node" ];
  #   masterAddress = "localhost";
  #   clusterCidr = "10.244.0.0/16";
  # };
}
