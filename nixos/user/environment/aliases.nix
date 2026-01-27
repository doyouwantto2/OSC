{ config, pkgs, ... }:

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
    
    # SOPS key management aliases
    sops-genkey = "mkdir -p ~/.config/sops/age && age-keygen -o ~/.config/sops/age/keys.txt && echo 'Age key generated'";
    sops-pubkey = "age-keygen -y ~/.config/sops/age/keys.txt";
    sops-setup = "mkdir -p ~/.config/sops/age && age-keygen -o ~/.config/sops/age/keys.txt && sudo mkdir -p /etc/sops/age && sudo cp ~/.config/sops/age/keys.txt /etc/sops/age/keys.txt && sudo chmod 600 /etc/sops/age/keys.txt && echo 'SOPS keys setup complete'";
    sops-update-config = "PUBKEY=\$(age-keygen -y ~/.config/sops/age/keys.txt) && sed -i \"s/age1ql3z7hjy54pw3hyww5p5t0652x2flcx5z2u90g3lmq35gtl5epsq5h4w2l/\$PUBKEY/g\" /home/emiya2467/Projects/OSC/.sops.yaml && echo 'SOPS config updated with public key: '\$PUBKEY";
    sops-encrypt = "cd /home/emiya2467/Projects/OSC/nixos/system && sops --encrypt --in-place presets/database/postgresql.yaml && sops --encrypt --in-place presets/database/mysql.yaml && echo 'Database secrets encrypted'";
    sops-decrypt = "cd /home/emiya2467/Projects/OSC/nixos/system && sops --decrypt presets/database/postgresql.yaml && sops --decrypt presets/database/mysql.yaml && echo 'Database secrets decrypted'";
    sops-edit-postgres = "cd /home/emiya2467/Projects/OSC/nixos/system && sops presets/database/postgresql.yaml";
    sops-edit-mysql = "cd /home/emiya2467/Projects/OSC/nixos/system && sops presets/database/mysql.yaml";
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
    
    # SOPS key management aliases
    sops-genkey = "mkdir -p ~/.config/sops/age && age-keygen -o ~/.config/sops/age/keys.txt && echo 'Age key generated'";
    sops-pubkey = "age-keygen -y ~/.config/sops/age/keys.txt";
    sops-setup = "mkdir -p ~/.config/sops/age && age-keygen -o ~/.config/sops/age/keys.txt && sudo mkdir -p /etc/sops/age && sudo cp ~/.config/sops/age/keys.txt /etc/sops/age/keys.txt && sudo chmod 600 /etc/sops/age/keys.txt && echo 'SOPS keys setup complete'";
    sops-update-config = "set PUBKEY (age-keygen -y ~/.config/sops/age/keys.txt); sed -i \"s/age1ql3z7hjy54pw3hyww5p5t0652x2flcx5z2u90g3lmq35gtl5epsq5h4w2l/\$PUBKEY/g\" /home/emiya2467/Projects/OSC/.sops.yaml && echo 'SOPS config updated with public key: '\$PUBKEY";
    sops-encrypt = "cd /home/emiya2467/Projects/OSC/nixos/system && sops --encrypt --in-place presets/database/postgresql.yaml && sops --encrypt --in-place presets/database/mysql.yaml && echo 'Database secrets encrypted'";
    sops-decrypt = "cd /home/emiya2467/Projects/OSC/nixos/system && sops --decrypt presets/database/postgresql.yaml && sops --decrypt presets/database/mysql.yaml && echo 'Database secrets decrypted'";
    sops-edit-postgres = "cd /home/emiya2467/Projects/OSC/nixos/system && sops presets/database/postgresql.yaml";
    sops-edit-mysql = "cd /home/emiya2467/Projects/OSC/nixos/system && sops presets/database/mysql.yaml";
  };
}
