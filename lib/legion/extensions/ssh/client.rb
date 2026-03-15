# frozen_string_literal: true

require_relative 'helpers/connection'
require_relative 'runners/command'
require_relative 'runners/state'

module Legion
  module Extensions
    module Ssh
      class Client
        include Helpers::Connection
        include Runners::Command
        include Runners::State

        attr_reader :opts

        def initialize(server:, user: 'root', **extra)
          @opts = { server: server, user: user, **extra }
        end

        def session(**override)
          super(**@opts, **override)
        end
      end
    end
  end
end
