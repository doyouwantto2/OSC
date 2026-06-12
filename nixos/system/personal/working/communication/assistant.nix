{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ollama
    librechat
    logseq
    syncthing
  ];

  services.ollama.enable = true;
}
