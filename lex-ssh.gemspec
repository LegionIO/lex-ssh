require_relative 'lib/legion/extensions/ssh/version'

Gem::Specification.new do |spec|
  spec.name          = 'lex-ssh'
  spec.version       = Legion::Extensions::Ssh::VERSION
  spec.authors       = ['Esity']
  spec.email         = ['matthewdiverson@gmail.com']

  spec.summary       = 'LEX::SSH'
  spec.description   = 'LEX::SSH'
  spec.homepage      = 'https://bitbucket.org/legion-io/lex-ssh'
  spec.license       = 'MIT'
  spec.required_ruby_version = Gem::Requirement.new('>= 2.5.0')

  spec.metadata['homepage_uri'] = spec.homepage
  spec.metadata['source_code_uri'] = 'https://bitbucket.org/legion-io/lex-ssh'
  spec.metadata['documentation_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/614891551'
  spec.metadata['changelog_uri'] = 'https://legionio.atlassian.net/wiki/spaces/LEX/pages/612270160'
  spec.metadata['bug_tracker_uri'] = 'https://bitbucket.org/legion-io/lex-ssh/issues'
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end

  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '>= 2'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rubocop'

  spec.add_dependency 'bcrypt_pbkdf'
  spec.add_dependency 'ed25519'
  spec.add_dependency 'net-ssh'
end
