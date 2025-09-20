{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wezterm
    kitty

    # Decorate terminal
    starship

    # Better cd 
    zoxide

    # Fuzzy finding
    fzf

    # ls alternative
    pls

    # Fork of cat
    bat

    # Find text in file
    ripgrep

    # List all children directory
    fd
  ];
}

