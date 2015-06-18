# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'onfleet/version'

Gem::Specification.new do |spec|
  spec.platform      = Gem::Platform::RUBY
  spec.name          = "onfleet"
  spec.version       = Onfleet::VERSION
  spec.authors       = ["Siddharth Sharma"]
  spec.email         = "info@vinsol.com"
  spec.summary       = %q{Onfleet is an API wrapper for Onfleet's API (http://docs.onfleet.com).}
  spec.description   = spec.summary
  spec.homepage      = 'http://vinsol.com'
  spec.license       = "MIT"
  spec.required_ruby_version = '>= 1.9.3'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "httparty"
  spec.add_dependency "multi_json"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
