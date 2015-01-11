# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'nikeplus/version'

Gem::Specification.new do |spec|
  spec.name          = "nikeplus"
  spec.version       = NikePlus::VERSION
  spec.authors       = ["julien michot"]
  spec.email         = ["ju.michot@gmail.com"]
  spec.summary       = %q{nike+ ruby api wrapper}
  spec.description   = %q{nike+ client to retrieve activities}
  spec.homepage      = "https://github.com/jumichot/nikeplus"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.1.0"
  spec.add_development_dependency "guard"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "codeclimate-test-reporter"
  spec.add_development_dependency "vcr"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "terminal-notifier-guard"

  spec.add_runtime_dependency "excon", "~> 0.43"
  spec.add_runtime_dependency "virtus"
end
