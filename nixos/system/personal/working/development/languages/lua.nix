{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    lua-language-server
    luarocks
    luajit
    stylua
    lua
  ];
}
