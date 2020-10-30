require 'net/ssh'

module Legion
  module Extensions
    module Ssh
      module Helpers
        module Connection
          def session(server:, user: 'root', **opts)
            hash = {}
            if opts.key? :password
              hash[:password] = opts[:password]
            elsif opts.key? :key_data
              hash[:key_data] = opts[:key_data]
            elsif opts.key? :keys
              hash[:keys] = opts[:keys]
            end
            hash[:non_interactive] = opts.key?(:non_interactive) ? opts[:non_interactive] : true
            hash[:passphrase] = opts[:passphrase] if opts.key? :passphrase
            hash[:timeout] = opts.key(:timeout) ? opts[:timeout] : 5

            Net::SSH.start(server, user, **hash)
          end

          def detect_os(session)
            session.exec!('lsb_release -a')
          end
        end
      end
    end
  end
end
