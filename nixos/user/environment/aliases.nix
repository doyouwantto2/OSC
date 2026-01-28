{
  config,
  pkgs,
  currentName,
  ...
}:

{
  programs.bash.shellAliases = {
    # System management aliases
    systemSync = "sudo nixos-rebuild switch --flake .";
    userSync = "nix run home-manager -- switch --flake .";
    nix-dev = "nix-instantiate --eval --strict";

    # Basic navigation and utilities
    ll = "ls -la";
    la = "ls -la";
    grep = "grep --color=auto";
    cdup = "cd ..";
    cdup2 = "cd ../..";

    # Git aliases
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gp = "git push";
    gl = "git pull";
    gd = "git diff";

    # File management
    rm = "rm -i";
    cp = "cp -i";
    mv = "mv -i";
  };

  programs.fish.shellAliases = {
    # System management aliases
    systemSync = "sudo nixos-rebuild switch --flake .";
    userSync = "nix run home-manager -- switch --flake .";
    nix-dev = "nix-instantiate --eval --strict";

    # Basic navigation and utilities
    ll = "ls -la";
    la = "ls -la";
    grep = "grep --color=auto";

    # Git aliases
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gp = "git push";
    gl = "git pull";
    gd = "git diff";

    # File management
    rm = "rm -i";
    cp = "cp -i";
    mv = "mv -i";
  };
}
