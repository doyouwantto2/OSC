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

    zsh = {
      enable = true;

      enableCompletion = true;
      autosuggestion.enable = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
        systemSync = "sudo nixos-rebuild switch --flake .";
        userSync = "nix run home-manager -- switch --flake .";
      };

      oh-my-zsh = {
        enable = true;

        plugins = [
          "git"
          "sudo"
          "zoxide"
          "fzf"
          "eza"
          "direnv"
        ];
      };

      initContent = ''
        eval "$(starship init zsh)"
        eval "$(fzf --zsh)"
        eval "$(zoxide init zsh)"
        eval "$(direnv hook zsh)"
      '';
    };
  };
}
