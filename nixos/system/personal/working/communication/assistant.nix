{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    claude-code
    koboldcpp
    ollama
    logseq
    syncthing
  ];

  services.ollama.enable = true;
}
