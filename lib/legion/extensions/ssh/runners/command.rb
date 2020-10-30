module Legion
  module Extensions
    module Ssh
      module Runners
        module Command
          include Legion::Extensions::Ssh::Helpers::Connection

          def run(command:, server:, user: 'root', **opts)
            session = session(server: server, user: user, **opts)
            results = session.exec!(command)
            { success: results.exitstatus.zero?, results: results, server: server }
          end

          def run_mulitple(commands:, server:, user: 'root', **opts)
            session = session(server: server, user: user, **opts)
            final_results = []

            commands.each do |command|
              results = session.exec!(command)
              final_results.push({ success: results.exitstatus.zero?, results: results })
            end
            final_results
          end

          include Legion::Extensions::Helpers::Lex
        end
      end
    end
  end
end
