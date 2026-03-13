# lex-ssh: SSH Remote Command Extension for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that executes remote SSH commands and checks server state. Provides runners for running commands on remote hosts and verifying SSH connectivity via Net::SSH.

**GitHub**: https://github.com/LegionIO/lex-ssh
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

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/ssh.rb` | Entry point, extension registration |
| `lib/legion/extensions/ssh/runners/command.rb` | Remote command execution |
| `lib/legion/extensions/ssh/runners/state.rb` | SSH reachability check |
| `lib/legion/extensions/ssh/helpers/connection.rb` | Net::SSH connection helper |

## Dependencies

| Gem | Purpose |
|-----|---------|
| `net-ssh` (>= 7.0) | SSH client |
| `ed25519` | Ed25519 key support |
| `bcrypt_pbkdf` | Bcrypt key derivation (OpenSSH private key format) |

## Development

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
