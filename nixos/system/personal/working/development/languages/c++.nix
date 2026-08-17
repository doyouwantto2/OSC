{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    gcc
    gnumake
    cmake
    ccls
    clang-tools
    nasm
    lldb
  ];
}
