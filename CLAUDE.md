# lex-ssh: SSH Remote Command Extension for LegionIO

**Repository Level 3 Documentation**
- **Category**: `/Users/miverso2/rubymine/legion/extensions/CLAUDE.md`

## Purpose

Legion Extension that executes remote SSH commands and checks server state. Provides runners for running commands on remote hosts and verifying SSH connectivity.

**License**: MIT

## Architecture

```
Legion::Extensions::Ssh
├── Runners/
│   ├── Command            # Execute remote SSH commands
│   └── State              # Check SSH server state/connectivity
└── Helpers/
    └── Connection         # SSH connection management (Net::SSH)
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `net-ssh` | SSH client |
| `ed25519` | Ed25519 key support |
| `bcrypt_pbkdf` | Bcrypt key derivation (OpenSSH key format) |

## Testing

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
