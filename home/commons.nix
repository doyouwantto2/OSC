{ config, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      e = "exa --icons --icons";
      el = "exa --icons --long";
      et = "exa --icons --tree";
      ea = "exa --icons --all";
      eat = "exa --icons --all --tree";
    };

    initExtra = ''
      eval "$(starship init bash)"
      eval "$(fzf --bash)"
      eval "$(zoxide init bash)"
    '';
  };
}
