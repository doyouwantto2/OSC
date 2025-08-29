{ config, pkgs, user, ... }@inputs:

{
  programs.bash = {
    enable = true;
    shellAliases = {
      e = "exa --icons --icons";
      el = "exa --icons --long";
      et = "exa --icons --tree";
      ea = "exa --icons --all";
      eat = "exa --icons --all --tree";
      eal = "exa --icons --all --long";
    };

    initExtra = ''
      eval "$(starship init bash)"
      eval "$(fzf --bash)"
      eval "$(zoxide init bash)"
    '';
  };
}
