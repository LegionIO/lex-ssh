# frozen_string_literal: true

require_relative 'lib/legion/extensions/ssh/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-ssh'
  spec.version       = Legion::Extensions::Ssh::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::SSH'
  spec.description   = 'LEX::SSH'
  spec.homepage      = 'https://github.com/LegionIO/lex-ssh'
  spec.license       = 'MIT'
  spec.required_ruby_version = '>= 3.4'

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://github.com/LegionIO/lex-ssh'
  spec.metadata['documentation_uri'] = 'https://github.com/LegionIO/lex-ssh'
  spec.metadata['changelog_uri'] = 'https://github.com/LegionIO/lex-ssh'
  spec.metadata['bug_tracker_uri'] = 'https://github.com/LegionIO/lex-ssh/issues'
  spec.metadata['rubygems_mfa_required'] = 'true'
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.add_dependency 'bcrypt_pbkdf'
  spec.add_dependency 'ed25519'
  spec.add_dependency 'net-ssh', '>= 7.0'
end
