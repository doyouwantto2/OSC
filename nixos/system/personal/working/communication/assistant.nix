{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    ollama
    koboldcpp
    logseq
  ];
}
