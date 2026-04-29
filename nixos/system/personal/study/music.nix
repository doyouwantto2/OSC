{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    reco
  ];
}
