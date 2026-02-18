{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    claude-code
    ollama
    koboldcpp
    logseq
  ];
}
