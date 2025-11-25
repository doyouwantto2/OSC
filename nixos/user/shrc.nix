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

      interactiveShellInit = ''
        # Get date components
        set _hour (date +"%H")
        set _min  (date +"%M")
        set _sec  (date +"%S")
        set _year (date +"%Y")
        set _month (date +"%m")
        set _day   (date +"%d")
        set _weekday (date +"%a")

        # Choose color based on hour
        if test $_hour -ge 6 -a $_hour -lt 12
          set _color (set_color yellow)
        else if test $_hour -ge 12 -a $_hour -lt 18
          set _color (set_color green)
        else if test $_hour -ge 18 -a $_hour -lt 22
          set _color (set_color magenta)
        else
          set _color (set_color cyan)
        end

        # Set greeting
        set fish_greeting \
          $_color"$_hour:$_min:$_sec  $_year-$_month-$_day ($_weekday)"(set_color normal)
      '';

      shellAliases = {
        systemSync = "sudo nixos-rebuild switch --flake .";
        userSync = "nix run home-manager -- switch --flake .";
      };

    };
  };
}
