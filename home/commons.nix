{ config, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "exa --long --all --icons";
      l = "exa --long --icons";
      ls = "exa --icons";
      tree = "exa --icons --tree";
    };

    initExtra = ''
      eval "$(starship init bash)"
      eval "$(fzf --bash)"
      eval "$(zoxide init bash)"
    '';
  };
}
