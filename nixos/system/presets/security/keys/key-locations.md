# SOPS Key Storage Locations

## DO NOT STORE KEYS IN presets/
The `presets/` directory is for **encrypted secret files only**, not encryption keys.

## Proper Key Storage Locations

### 1. System Keys (for NixOS automatic decryption)
- **Age keys**: `/etc/sops/age/keys.txt`
- **PGP keys**: System GPG keyring (`/root/.gnupg/`)
- Used by NixOS when the system boots

### 2. User Keys (for manual decryption)
- **Age keys**: `~/.config/sops/age/keys.txt`
- **PGP keys**: User GPG keyring (`~/.gnupg/`)
- Used when you run `sops --decrypt` manually

### 3. Backup Keys (secure storage)
- Password manager
- Encrypted USB drive
- Secure cloud storage (encrypted)

## File Structure
```
/home/emiya2467/Projects/OSC/nixos/system/
├── presets/
│   ├── database/
│   │   ├── postgresql.yaml     # ← ENCRYPTED secrets
│   │   └── mysql.yaml          # ← ENCRYPTED secrets
│   ├── api/                    # ← Future API secrets
│   └── security/
│       └── keys/
│           ├── README.md       # ← Documentation only
│           └── key-locations.md # ← This file
├── security/
│   └── sops.nix                # ← SOPS configuration
└── automation/
    └── container/
        └── database.nix        # ← Database containers
```

## How It Works
1. **Keys** are stored in system/user directories
2. **Secret files** in `presets/database/` are encrypted with those keys
3. NixOS uses the keys to decrypt secrets at boot time
4. You can use the keys to manually decrypt/encrypt secrets

## Security Rule
- **Keys** = Private, never commit to git
- **Secret files** = Encrypted, safe to commit to git
