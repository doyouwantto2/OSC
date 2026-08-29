{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    nodejs
    bun
    deno
    prettier
    netlify-cli
    typescript
    tslib
    typescript-language-server
    vscode-langservers-extracted
    astro-language-server
    vue-language-server
    vtsls
    tailwindcss
    tailwindcss-language-server
  ];
}
