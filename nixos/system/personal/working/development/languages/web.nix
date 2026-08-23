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
    typescript
    tslib
    typescript-language-server
    vscode-langservers-extracted
    astro-language-server
    tailwindcss
    tailwindcss-language-server
  ];
}
