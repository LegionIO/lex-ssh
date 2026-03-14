# lex-ssh: SSH Remote Command Extension for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that executes remote SSH commands and controls remote server state. Provides runners for running arbitrary commands on remote hosts and triggering reboot/shutdown via Net::SSH.

**GitHub**: https://github.com/LegionIO/lex-ssh
**License**: MIT

## Architecture

```
Legion::Extensions::Ssh
├── Runners/
│   ├── Command            # run, run_multiple - execute commands via SSH exec!
│   └── State              # reboot, shutdown - system state via SSH
└── Helpers/
    └── Connection         # Net::SSH session factory (password, key_data, keys, passphrase auth)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/ssh.rb` | Entry point, extension registration |
| `lib/legion/extensions/ssh/runners/command.rb` | `run(command:, server:, user:)`, `run_multiple(commands:, server:, user:)` |
| `lib/legion/extensions/ssh/runners/state.rb` | `reboot(server:, user:, delay:)`, `shutdown(server:, user:, delay:)` |
| `lib/legion/extensions/ssh/helpers/connection.rb` | `session(server:, user:, **opts)` — Net::SSH.start wrapper |

## Runner Methods

**Command**
- `run(command:, server:, user: 'root')` — execute a single command, returns exit status + output
- `run_multiple(commands:, server:, user: 'root')` — execute multiple commands sequentially

**State**
- `reboot(server:, user: 'root', delay: 0)` — reboot via `shutdown -r`; `delay` adds minutes
- `shutdown(server:, user: 'root', delay: 0)` — halt via `shutdown -h`; `delay` adds minutes

**Connection auth** (pass as task kwargs): `password:`, `key_data:`, `keys:`, `passphrase:`, `non_interactive:`, `timeout:` (default: 5s)

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
