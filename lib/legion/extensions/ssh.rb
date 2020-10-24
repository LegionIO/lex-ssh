require 'legion/extensions/ssh/version'

module Legion
  module Extensions
    module Ssh
      extend Legion::Extensions::Core if Legion::Extensions.const_defined? :Core
    end
  end
end
