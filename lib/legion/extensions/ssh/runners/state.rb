# frozen_string_literal: true

module Legion
  module Extensions
    module Ssh
      module Runners
        module State
          include Legion::Extensions::Ssh::Helpers::Connection

          def reboot(server:, user: 'root', delay: 0, **)
            session = session(server: server, user: user, **)
            command = delay.zero? ? 'shutdown -r now' : "shutdown -r +#{delay}"
            results = session.exec!(command)
            { success: results.exitstatus.zero?, results: results, server: server, delay: delay }
          end

          def shutdown(server:, user: 'root', delay: 0, **)
            session = session(server: server, user: user, **)
            command = delay.zero? ? 'shutdown -h now' : "shutdown -h +#{delay}"
            results = session.exec!(command)
            { success: results.exitstatus.zero?, results: results, server: server, delay: delay }
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
