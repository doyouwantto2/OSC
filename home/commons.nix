{ config, pkgs, user, ... }@inputs:

{
  programs.bash = {
    enable = true;
    shellAliases = { };

    initExtra = ''
      eval "$(starship init bash)"
      eval "$(fzf --bash)"
      eval "$(zoxide init bash)"
    '';
  };

}
