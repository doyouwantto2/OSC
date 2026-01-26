{
  config,
  pkgs,
  ...
}:

{
  environment.systemPackages = with pkgs; [
    gnat
    gnumake
    cmake
    ccls
    clang-tools
    nasm
    lldb
  ];
}
