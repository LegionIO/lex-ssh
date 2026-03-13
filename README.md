# lex-ssh

SSH remote command execution for [LegionIO](https://github.com/LegionIO/LegionIO). Run commands on remote servers and check SSH connectivity in an async fashion via Net::SSH.

## Installation

```bash
gem install lex-ssh
```

Or add to your Gemfile:

```ruby
gem 'lex-ssh'
```

## Runners

| Runner | Operations |
|--------|-----------|
| Command | Execute remote SSH commands |
| State | Check SSH server state/connectivity |

## Requirements

- Ruby >= 3.4
- [LegionIO](https://github.com/LegionIO/LegionIO) framework
- SSH server access

## Dependencies

- `net-ssh` (>= 7.0) - SSH client
- `ed25519` - Ed25519 key support
- `bcrypt_pbkdf` - OpenSSH private key format support

## License

MIT
