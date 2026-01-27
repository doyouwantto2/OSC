{ config, pkgs, lib, ... }:

{
  # AI/LLM tools and packages
  environment.systemPackages = with pkgs; [
    ollama
    python3
    python3Packages.pip
    python3Packages.transformers
    python3Packages.torch
    python3Packages.numpy
    python3Packages.scipy
    
    # API testing tools
    httpie
    jq
  ];
  
  # Additional hosts for AI development
  networking.extraHosts = ''
    # AI service hosts
    127.0.0.1 ollama.localdev
    127.0.0.1 kobold.localdev
    127.0.0.1 ai.localdev
    127.0.0.1 llm.localdev
    127.0.0.1 stable.localdev
    127.0.0.1 textgen.localdev
  '';
  
  # Optional AI services (commented by default)
  # Enable when you want to run AI services as system services
  
  # Ollama AI service
  # services.ollama = {
  #   enable = true;
  #   acceleration = "rocm";  # or "cuda" for NVIDIA
  #   host = "0.0.0.0";
  #   port = 11434;
  # };
  
  # Optional: Enable GPU support
  # hardware.opengl.enable = true;
  # services.xserver.videoDrivers = [ "nvidia" ];  # For NVIDIA
}
