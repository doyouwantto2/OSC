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
        set hour (date +"%H")

        if test $hour -ge 5 -a $hour -lt 11
          set _greeting "おはようございます"
        else if test $hour -ge 11 -a $hour -lt 17
          set _greeting "こんにちは"
        else if test $hour -ge 17 -a $hour -lt 22
          set _greeting "こんばんは"
        else
          set _greeting "おやすみなさい"
        end

        set fish_greeting \
          (set_color --bold cyan)"$_greeting、"(set_color --bold green)(whoami)(set_color cyan)" さん！"(set_color normal) \
          "\n"(set_color yellow)"今日は "(set_color magenta)(date +"%Y年%m月%d日 (%A)") \
          (set_color yellow)" です！"(set_color normal)
      '';

      shellAliases = {
        systemSync = "sudo nixos-rebuild switch --flake .";
        userSync = "nix run home-manager -- switch --flake .";
      };

    };
  };
}
