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
    hongdown
    mdbook
    mdbook-mermaid
    plantuml
    mermaid-cli
  ];
}
