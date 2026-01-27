# SOPS Key Management

This directory contains SOPS encryption keys for secure secret management.

## Key Types

### Age Keys
- Recommended for modern systems
- Store in `~/.config/sops/age/keys.txt`
- Generate with: `age-keygen -o ~/.config/sops/age/keys.txt`

### PGP Keys  
- Traditional option
- Store in GPG keyring
- Generate with: `gpg --full-generate-key`

## Key Locations

### System Keys (for NixOS)
- Age: `/etc/sops/age/keys.txt`
- PGP: System GPG keyring

### User Keys (for manual decryption)
- Age: `~/.config/sops/age/keys.txt`
- PGP: User GPG keyring

## Usage

1. Generate your keys
2. Update `.sops.yaml` with your key fingerprints
3. Encrypt secrets: `sops --encrypt --in-place presets/database/postgresql.yaml`
4. Decrypt secrets: `sops --decrypt presets/database/postgresql.yaml`

## Security Notes

- Never commit private keys to version control
- Back up keys securely (password manager, secure storage)
- Use different keys for different environments
