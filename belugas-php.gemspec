# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'belugas/php/version'

Gem::Specification.new do |spec|
  spec.name          = 'belugas-php'
  spec.version       = Belugas::Php::VERSION
  spec.authors       = %w(Cejas Mayra)
  spec.email         = ['weare@icalialabs.com']

  spec.summary       = 'A Ruby CLI for PHP feature detection'
  spec.description   = 'A Ruby CLI for PHP feature detection using awesome Belugas'
  spec.homepage      = 'https://github.com/icalialabs/belugas-php'
  spec.license       = 'MIT'

  spec.bindir        = 'bin'
  spec.executables   = ['belugas-php']
  spec.require_paths = ['lib']

  spec.add_dependency 'thor', '~> 0.19'
  spec.add_dependency 'bundler', '~> 1.13'

  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
