{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    jdk
    gradle
    google-java-format
    jdt-language-server
  ];
}
