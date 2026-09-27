{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    typst
    typst-live
    typstyle
    tinymist
    marksman
    mdbook
    hongdown
    mdbook-mermaid
    plantuml
    mermaid-cli
  ];
}
