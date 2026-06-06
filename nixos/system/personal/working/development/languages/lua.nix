{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    lua-language-server
    luarocks
    lua5_1
    luajit
    stylua
    lua
  ];
}
