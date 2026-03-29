# lex-ssh: SSH Remote Command Extension for LegionIO

**Repository Level 3 Documentation**
- **Parent**: `/Users/miverso2/rubymine/legion/extensions-other/CLAUDE.md`
- **Grandparent**: `/Users/miverso2/rubymine/legion/CLAUDE.md`

## Purpose

Legion Extension that executes remote SSH commands and controls remote server state. Provides runners for running arbitrary commands on remote hosts and triggering reboot/shutdown via Net::SSH.

**Version**: 0.2.2
**GitHub**: https://github.com/LegionIO/lex-ssh
**License**: MIT

## Architecture

```
Legion::Extensions::Ssh
├── Runners/
│   ├── Command            # run, run_multiple - execute commands via SSH exec!
│   └── State              # reboot, shutdown - system state via SSH
├── Helpers/
│   └── Connection         # Net::SSH session factory (password, key_data, keys, passphrase auth)
└── Client                 # Standalone client class (includes all runners)
```

## Key Files

| Path | Purpose |
|------|---------|
| `lib/legion/extensions/ssh.rb` | Entry point, extension registration |
| `lib/legion/extensions/ssh/runners/command.rb` | `run`, `run_multiple` (and `alias run_multiple run_mulitple` for typo compat) |
| `lib/legion/extensions/ssh/runners/state.rb` | `reboot(server:, user:, delay:)`, `shutdown(server:, user:, delay:)` |
| `lib/legion/extensions/ssh/helpers/connection.rb` | `session(server:, user:, **opts)` — Net::SSH.start wrapper |
| `lib/legion/extensions/ssh/client.rb` | Standalone `Client` class: `initialize(server:, user: 'root', **extra)` |

## Runner Methods

**Command**
- `run(command:, server:, user: 'root')` — execute a single command, returns exit status + output
- `run_multiple(commands:, server:, user: 'root')` — execute multiple commands sequentially; also aliased as `run_mulitple` for backward compatibility

**State**
- `reboot(server:, user: 'root', delay: 0)` — reboot via `shutdown -r`; `delay` adds minutes
- `shutdown(server:, user: 'root', delay: 0)` — halt via `shutdown -h`; `delay` adds minutes

**Connection auth** (pass as task kwargs): `password:`, `key_data:`, `keys:`, `passphrase:`, `non_interactive:`, `timeout:` (default: 5s)

## Standalone Client

`Client.new(server:, user: 'root', **extra)` — stores opts and delegates `session` to `Helpers::Connection` with merged opts.

```ruby
client = Legion::Extensions::Ssh::Client.new(server: 'server.example.com', user: 'deploy', keys: ['~/.ssh/id_ed25519'])
result = client.run(command: 'uptime')
```

## Dependencies

| Gem | Purpose |
|-----|---------|
| `net-ssh` (>= 7.0) | SSH client |
| `ed25519` | Ed25519 key support |
| `bcrypt_pbkdf` | Bcrypt key derivation (OpenSSH private key format) |
| `logger` | Explicit dependency for Ruby 4.0 compatibility (extracted from stdlib) |

## Development

9 specs total.

```bash
bundle install
bundle exec rspec
bundle exec rubocop
```

---

**Maintained By**: Matthew Iverson (@Esity)
