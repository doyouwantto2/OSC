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

  programs.caelestia = {
    enable = true;
    systemd = {
      enable = false; # if you prefer starting from your compositor
      target = "graphical-session.target";
      environment = [ ];
    };
    settings = {
      bar.status = {
        showBattery = false;
      };
      paths.wallpaperDir = "~/Images";
    };
    cli = {
      enable = true; # Also add caelestia-cli to path
      settings = {
        theme.enableGtk = false;
      };
    };
  };
}
