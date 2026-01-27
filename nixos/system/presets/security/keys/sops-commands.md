# SOPS Command Aliases

These aliases are now available in your shell (both Bash and Fish) for SOPS key management.

## Key Management Commands

### `sops-genkey`
Generate a new Age key in user directory:
```bash
sops-genkey
```

### `sops-pubkey`
Display your public key:
```bash
sops-pubkey
```

### `sops-setup`
Complete setup - generate key and copy to system location:
```bash
sops-setup
```

### `sops-update-config`
Update .sops.yaml with your public key:
```bash
sops-update-config
```

## Secret Management Commands

### `sops-encrypt`
Encrypt all database secrets:
```bash
sops-encrypt
```

### `sops-decrypt`
Decrypt all database secrets (for viewing/editing):
```bash
sops-decrypt
```

### `sops-edit-postgres`
Edit PostgreSQL secrets (will decrypt, open in editor, then encrypt):
```bash
sops-edit-postgres
```

### `sops-edit-mysql`
Edit MySQL secrets (will decrypt, open in editor, then encrypt):
```bash
sops-edit-mysql
```

## Usage Workflow

1. **Initial Setup**:
   ```bash
   sops-setup          # Generate keys and setup system
   sops-update-config  # Update .sops.yaml with your public key
   sops-encrypt        # Encrypt your secrets
   ```

2. **Daily Usage**:
   ```bash
   sops-edit-postgres  # Edit PostgreSQL secrets
   sops-edit-mysql     # Edit MySQL secrets
   ```

3. **Maintenance**:
   ```bash
   sops-pubkey         # Show your public key
   sops-decrypt        # View secrets (temporarily decrypts)
   sops-encrypt        # Re-encrypt after manual edits
   ```

## Benefits Over Shell Scripts

- **Shell-agnostic**: Works in both Bash and Fish
- **No conflicts**: Uses NixOS alias system, no external scripts
- **Integrated**: Part of your existing alias system
- **Flexible**: Easy to modify and extend
- **Consistent**: Follows your existing naming conventions
