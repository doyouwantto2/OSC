{ config, pkgs, ... }:

{
  programs = {
    bash = {
      enable = true;

      shellAliases = {
        systemSync = "sudo nixos-rebuild switch --flake .";
        userSync = "nix run home-manager -- switch --flake .";
      };

      initExtra = ''
        eval "$(starship init bash)"
        eval "$(fzf --bash)"
        eval "$(zoxide init bash)"
        eval "$(direnv hook bash)"
      '';
    };

    fish = {
      enable = true;
      preferAbbrs = true;

      generateCompletions = true;
      shellInit = ''
        starship init fish | source
        fzf --fish | source
        zoxide init fish | source
      '';

      shellAliases = {
        systemSync = "sudo nixos-rebuild switch --flake .";
        userSync = "nix run home-manager -- switch --flake .";
      };

    };
  };
}
