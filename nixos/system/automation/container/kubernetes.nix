{ config, pkgs, lib, ... }:

with lib;

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
    
    # Cloud provider CLIs (for future API integration)
    awscli2
  ];

  # Keep minimal ports for local cluster communication only
  # Remove external network ports since you're not using router/stable network
  networking.firewall.allowedTCPPorts = [
    # Only needed for local Kubernetes cluster
    # 6443  # Kubernetes API - only needed if running full K8s cluster
  ];

  # Optional: Enable local Kubernetes cluster (commented by default)
  # Uncomment when you need a full local cluster
  # services.kubernetes = {
  #   roles = [ "master" "node" ];
  #   masterAddress = "localhost";
  #   clusterCidr = "10.244.0.0/16";
  # };
}
