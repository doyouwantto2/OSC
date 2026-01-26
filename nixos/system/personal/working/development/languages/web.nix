{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    nodejs
    bun
    typescript
    typescript-language-server
    vscode-langservers-extracted
    astro-language-server
    tailwindcss
    tailwindcss-language-server
  ];
}
