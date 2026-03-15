# lex-ssh

SSH remote command execution for [LegionIO](https://github.com/LegionIO/LegionIO). Run commands on remote servers and trigger reboot or shutdown via Net::SSH from within task chains.

## Installation

```bash
gem install lex-ssh
```

Or add to your Gemfile:

```ruby
gem 'lex-ssh'
```

## Runners

### Command

| Method | Parameters | Description |
|--------|-----------|-------------|
| `run` | `command:`, `server:`, `user:` (default: `'root'`) | Execute a single command via SSH |
| `run_multiple` | `commands:`, `server:`, `user:` (default: `'root'`) | Execute multiple commands sequentially |

Returns `{ success:, results:, server: }` per command.

### State

| Method | Parameters | Description |
|--------|-----------|-------------|
| `reboot` | `server:`, `user:` (default: `'root'`), `delay:` (default: `0`) | Reboot the server via `shutdown -r` |
| `shutdown` | `server:`, `user:` (default: `'root'`), `delay:` (default: `0`) | Halt the server via `shutdown -h` |

`delay` is the number of minutes to wait (0 = immediate).

### Authentication

Pass authentication kwargs alongside other parameters:

| Parameter | Description |
|-----------|-------------|
| `password` | Password authentication |
| `key_data` | Inline key data |
| `keys` | Array of key file paths |
| `passphrase` | Key passphrase |
| `timeout` | Connection timeout in seconds (default: 5) |

## Standalone Client

Use `Legion::Extensions::Ssh::Client` outside the full LegionIO framework.

```ruby
require 'legion/extensions/ssh'
client = Legion::Extensions::Ssh::Client.new(host: 'server.example.com', user: 'deploy', keys: ['~/.ssh/id_ed25519'])
result = client.run(command: 'uptime')
```

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- SSH server access
- `net-ssh` >= 7.0
- `ed25519` — Ed25519 key support
- `bcrypt_pbkdf` — OpenSSH private key format support

## Changelog

### v0.2.0

- Added standalone `Client` class.
- Fixed `opts.key?(:timeout)` in `Helpers::Connection` — the previous `opts.key(:timeout)` always returned a truthy key object, so the `timeout` option was never read from task kwargs.

## License

MIT
