{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    amberol
    reco
  ];
}
