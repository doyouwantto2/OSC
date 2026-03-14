{
  config,
  pkgs,
  lib,
  ...
}:

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

  # Optional: Enable local Kubernetes cluster (commented by default)
  # Uncomment when you need a full local cluster
  # services.kubernetes = {
  #   roles = [ "master" "node" ];
  #   masterAddress = "localhost";
  #   clusterCidr = "10.244.0.0/16";
  # };
}
