{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    lua-language-server
    norgolith
    tree-sitter-grammars.tree-sitter-norg
    luarocks
    lua5_1
    luajit
    stylua
    lua
  ];
}
