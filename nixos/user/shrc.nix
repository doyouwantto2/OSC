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
        set fish_greeting \
          (set_color cyan)"Welcome, "(whoami)(set_color normal)"! Today is " \
          (set_color yellow)(date +'%A, %d %B %Y')(set_color normal)
      '';

      shellAliases = {
        systemSync = "sudo nixos-rebuild switch --flake .";
        userSync = "nix run home-manager -- switch --flake .";
      };

    };
  };
}
