# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'shrift/shrift_version'

Gem::Specification.new do |spec|
  spec.name          = 'shrift'
  spec.version       = ShriftVersion::VERSION
  spec.authors       = ['Folkengine']
  spec.email         = ['gaoler@electronicpanopticon.com']

  spec.summary       = 'Ruby utility library to make short shrift of objects.'
  spec.description   = 'Custom object serializer DSL'
  spec.homepage      = 'https://github.com/folkengine/shrift'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.required_ruby_version = '>= 2.1.5'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
end
