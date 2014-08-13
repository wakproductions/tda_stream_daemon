# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'tda_stream_daemon/version'

Gem::Specification.new do |spec|
  spec.name          = "tda_stream_daemon"
  spec.version       = TDAStreamDaemon::VERSION
  spec.authors       = ["Winston Kotzan"]
  spec.email         = ["wak@wakproductions.com"]
  spec.summary       = %q{An alerts system which uses the TD Ameritrade Stream API}
  spec.description   = %q{An alerts system which uses the TD Ameritrade Stream API}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec", "~> 2.14"
end
