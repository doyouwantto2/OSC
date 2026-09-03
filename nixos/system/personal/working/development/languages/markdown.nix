{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    typst
    typst-live
    texliveFull
    typstyle
    tinymist
    marksman
    plantuml
    mermaid-cli
  ];
}
