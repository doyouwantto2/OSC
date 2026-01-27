{ config, pkgs, ... }:

{
  programs.bash.shellAliases = {
    # Docker aliases
    docker-clean = "docker system prune -f && docker volume prune -f";
    docker-stop = "docker stop \$(docker ps -q) 2>/dev/null || echo 'No containers running'";
    docker-ps = "docker ps -a";
    docker-logs = "docker logs -f";
    
    # Kubernetes aliases
    k8s-start = "minikube start --driver=docker 2>/dev/null || kind create cluster";
    k8s-stop = "minikube stop 2>/dev/null || kind delete cluster";
    k8s-status = "kubectl get pods --all-namespaces";
    k8s-logs = "kubectl logs -f";
    k8s-shell = "kubectl exec -it";
    k8s-config = "kubectl config view";
    k8s-nodes = "kubectl get nodes -o wide";
    
    # Helm aliases
    helm-list = "helm list --all-namespaces";
    helm-install = "helm install";
    helm-uninstall = "helm uninstall";
    helm-upgrade = "helm upgrade";
    
    # Development workflow aliases
    dev-k8s-start = "echo 'Starting Kubernetes...' && k8s-start && echo 'Cluster ready!'";
    dev-k8s-clean = "docker-stop && docker-clean";
  };

  programs.fish.shellAliases = {
    # Docker aliases
    docker-clean = "docker system prune -f && docker volume prune -f";
    docker-stop = "docker stop (docker ps -q) 2>/dev/null; or echo 'No containers running'";
    docker-ps = "docker ps -a";
    docker-logs = "docker logs -f";
    
    # Kubernetes aliases
    k8s-start = "minikube start --driver=docker 2>/dev/null; or kind create cluster";
    k8s-stop = "minikube stop 2>/dev/null; or kind delete cluster";
    k8s-status = "kubectl get pods --all-namespaces";
    k8s-logs = "kubectl logs -f";
    k8s-shell = "kubectl exec -it";
    k8s-config = "kubectl config view";
    k8s-nodes = "kubectl get nodes -o wide";
    
    # Helm aliases
    helm-list = "helm list --all-namespaces";
    helm-install = "helm install";
    helm-uninstall = "helm uninstall";
    helm-upgrade = "helm upgrade";
    
    # Development workflow aliases
    dev-k8s-start = "echo 'Starting Kubernetes...' && k8s-start && echo 'Cluster ready!'";
    dev-k8s-clean = "docker-stop && docker-clean";
  };
}
