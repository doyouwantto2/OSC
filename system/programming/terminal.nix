{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wezterm
    kitty
    starship
    zoxide
    fzf
    eza
  ]; 
}

