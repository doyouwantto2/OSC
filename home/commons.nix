{ config, pkgs, user, ... }:

{
  programs.home-manager.enable = true;

  programs.bash = {
    enable = true;
    shellAliases = {
      ll = "ls -l";
    };
    initExtra = ''
      eval "$(starship init bash)"

      if [ -z "$FASTFETCH_SHOWN" ]; then
        export FASTFETCH_SHOWN=1
        fastfetch
      fi
    '';
  };
}
