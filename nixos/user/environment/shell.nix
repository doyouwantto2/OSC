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
      starship init fish | source
      fzf --fish | source
      zoxide init fish | source
    '';

    interactiveShellInit = ''
      # Get username and date
      set _user (whoami)
      set _date (date +"%Y-%m-%d")
      set _weekday (date +"(%a)")

      # Build the greeting with colors
      set fish_greeting \
        (set_color --bold magenta)"Welcome,"(set_color normal)" " \
        (set_color --bold white)$_user \
        (set_color --bold magenta)"!"(set_color normal) \
        " - " \
        (set_color --bold green)$_date(set_color normal)" " \
        (set_color --bold yellow)$_weekday(set_color normal)

      # Run fastfetch AFTER greeting
      fastfetch
    '';
  };
}
