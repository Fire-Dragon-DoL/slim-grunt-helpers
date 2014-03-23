# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'slim-grunt-helpers/version'

Gem::Specification.new do |spec|
  spec.name          = "slim-grunt-helpers"
  spec.version       = SlimGruntHelpers::VERSION
  spec.authors       = ["Fire-Dragon-DoL"]
  spec.email         = ["francesco.belladonna@gmail.com"]
  spec.description   = %q{Small set of helpers that can be used in slim templates}
  spec.summary       = %q{Small set of helpers that can be used in slim templates}
  spec.homepage      = "https://github.com/Fire-Dragon-DoL/slim-grunt-helpers"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end
