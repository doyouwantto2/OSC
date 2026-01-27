{ config, pkgs, ... }:

{
  programs.bash = {
    enable = true;

    initExtra = ''
      eval "$(starship init bash)"
      eval "$(fzf --bash)"
      eval "$(zoxide init bash)"
      eval "$(direnv hook bash)"
    '';
  };

  programs.fish = {
    enable = true;
    preferAbbrs = true;

    generateCompletions = true;

    shellInit = ''
      set -g fish_greeting
      starship init fish | source
      fzf --fish | source
      zoxide init fish | source
    '';

    interactiveShellInit = ''
      if status is-interactive; and not set -q __STARTUP_SHOWN
        set -g __STARTUP_SHOWN 1

        set _user (whoami)
        set _date (date +"%Y-%m-%d")
        set _weekday (date +"(%a)")

        echo -e \
          (set_color --bold magenta)"Welcome,"(set_color normal)" " \
          (set_color --bold white)$_user \
          (set_color --bold magenta)"!"(set_color normal)" - " \
          (set_color --bold green)$_date(set_color normal)" " \
          (set_color --bold yellow)$_weekday(set_color normal)

        fastfetch
      end
    '';
  };
}
