{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ollama
    logseq
    syncthing
  ];

  services.ollama.enable = true;
}
