lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'globelabs_sms_logger/version'

Gem::Specification.new do |spec|
  spec.name          = 'globelabs_sms_logger'
  spec.version       = GlobelabsSmsLogger::VERSION
  spec.authors       = ['Nujian Den Mark Meralpis']
  spec.email         = ['denmarkmeralpis@gmail.com']

  spec.summary       = "It's a logger for Globelabs Dashboard"
  spec.description   = 'Consuming Globelabs SMS Dashboards API'
  spec.homepage      = 'https://github.com/denmarkmeralpis/globelabs_sms_logger'

  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org/gems/globelabs_sms_logger'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/denmarkmeralpis/globelabs_sms_logger'
    spec.metadata['changelog_uri'] = 'https://github.com/denmarkmeralpis/globelabs_sms_logger/blob/master/README.md'
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features)/})
    end
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.17'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
