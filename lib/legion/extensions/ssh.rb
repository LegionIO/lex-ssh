# frozen_string_literal: true

require 'legion/extensions/ssh/version'
require 'legion/extensions/ssh/helpers/connection'
require 'legion/extensions/ssh/runners/command'
require 'legion/extensions/ssh/runners/state'
require 'legion/extensions/ssh/client'

module Legion
  module Extensions
    module Ssh
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
